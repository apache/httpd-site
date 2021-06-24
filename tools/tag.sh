#!/bin/sh

# Tag SVN in preparation for rolling a release candidate, verify the operator of this script
# is in the dist/KEYS file and tickle a few files post-tag
#
# USAGE: tag.sh branch tag directory [SIGNING-USER]
# EXAMPLE: tag.sh trunk 2.5.0-alpha /tmp/foo
#
# branch is one of "trunk" or a version under the branches directory
# tag is the name of the directory svn copy will create under tags/
# directory is a scratch space for obtaining files from svn and updating files
# SIGNING-USER is optional. If the default key in a GPG keyring should not be used, specify the specific key here
#
#   The "signing user" is the name of the key that you'll be signing the
#   release with.
#

#Useful for debugging
#set -x

#Bail when non-zero return codes are encountered
set -e

usage () {
  echo "USAGE: $0 BRANCH VERSION DIRECTORY [SIGNING-USER]"
  echo "WARNING: The directory will be purged if it exists"
  exit 1
}

branch=$1
version=$2
dir=$3
user=$4

first_letter=$(printf %.1s $dir)
if test $first_letter != '/';then
  echo "DIRECTORY ($dir) must be an absolute path"
  echo ""
  usage
fi
  
src_dir="$dir/release"
dist_dir="$dir/dist"
tag_dir="$dir/tag"
major=`echo $version | cut -d "." -f 1`
minor=`echo $version | cut -d "." -f 2`
#Not currently used in this script, but make it available. Support -alpha, -beta -rcX names here
patch=`echo $version | cut -d "." -f 3 | sed -e 's/-.*//'`

#Allow for environment overrides
test -z "$SVN_ROOT" && SVN_ROOT="https://svn.apache.org/repos/asf/httpd"

#This feels brittle, but I'm missing the command to just print a fingerprint...
if test -z "$user";then
  #GPG states first key is the default key
  fingerprint=`gpg --list-secret-keys --with-fingerprint 2>/dev/null | grep "Key fingerprint" | sed -e 's/.* = //g' | head -1`
else
  fingerprint=`gpg --list-secret-keys --with-fingerprint '$user' 2>/dev/null | grep "Key fingerprint" | sed -e 's/.* = //g' | head -1`
fi

if test -z "$branch";then usage
elif test -z "$version"; then usage
elif test -z "$dir"; then usage
fi

#If fingerprint is still unset, set it to empty string
test -z "$fingerprint" && fingerprint=""

#Consider any undefined variable substitution a failure from here out
set -u

#Ensure the directory exists and is empty by nuking it first
rm -rf "$dir"
mkdir -p "$dir"

if test "$branch" = "trunk";then
  SVN_BRANCH="$SVN_ROOT/httpd/trunk"
else
  SVN_BRANCH="$SVN_ROOT/httpd/branches/$branch"
fi
svn checkout "$SVN_BRANCH" "$src_dir"
svn checkout --depth=empty https://dist.apache.org/repos/dist/release/httpd "$dist_dir"
svn checkout --depth=empty "$SVN_ROOT/httpd/tags" "$tag_dir"

current_year=`date +%Y`

#Gather information we will need
cd "$src_dir"
cur_major=`grep -E '#define\sAP_SERVER_MAJORVERSION_NUMBER' include/ap_release.h | awk '{print $3}'`
cur_minor=`grep -E '#define\sAP_SERVER_MINORVERSION_NUMBER' include/ap_release.h | awk '{print $3}'`
cur_patch=`grep -E '#define\sAP_SERVER_PATCHLEVEL_NUMBER'   include/ap_release.h | awk '{print $3}'`
cur_version="$cur_major.$cur_minor.$cur_patch"
next_patch=`expr $cur_patch + 1`
next_version="$major.$minor.$next_patch"
date_string=`date '+%B %d, %Y'`


#Begin the work in earnest
#See steps from http://httpd.apache.org/dev/release.html
cd "$tag_dir"
svn up $version
if test -d "$version";then
  echo "ERROR: The tag '$version' is already present in $SVN_ROOT/httpd/tags/$version"
  exit 1
fi


#    Ensure that the RM's PGP/GPG key is in the httpd-dist/KEYS file.
cd "$dist_dir"
svn update KEYS

if test -z "$fingerprint";then
  echo "ERROR: Could not find key fingerprint. Will not verify key is in KEYS file"
else
  #Permit failure of grep here so we can gracefully exit after reprting the error
  set +e
  found=`gpg --with-fingerprint KEYS 2>/dev/null | grep -c "$fingerprint"`
  set -e
  if test "$found" = 0;then
    echo "ERROR: Key fingerprint '$fingerprint' not found in KEYS file"
    exit 1
  fi
fi


#    Ensure the Copyright date reflects the current year in the NOTICE and docs/manual/style/xsl/common.xsl files.
perl -pi -e "s/Copyright \d+ The Apache Software Foundation./Copyright $current_year The Apache Software Foundation./g" $src_dir/NOTICE $src_dir/docs/manual/style/xsl/common.xsl


#    Execute ./build.sh all convmap to ensure that the documentation transformations are up to date.
cd "$src_dir/docs/manual"
#See http://httpd.apache.org/docs-project/docsformat.html for these instructions
svn checkout https://svn.apache.org/repos/asf/httpd/docs-build/trunk build
cd build
./build.sh all convmap
./build.sh validate-xml
./build.sh validate-xhtml
cd ../
rm -rf build

# Update CHANGES file with entries from change-entries directory.
# See http://svn.apache.org/viewvc/httpd/httpd/trunk/README.CHANGES?view=co
#
# The Makefile is not available at this point, as we are on a fresh and clean
# checkout that has not run ./buildconf so far. Hence make update-changes does
# not work out of the box. We do not want to run ./buildconf here (we do later
# on the exported tag when rolling the tar ball) as it asks for APR, ....
# As the update-changes target has not much dependencies we try to use
# Makefile.in and do some little preparations such that it can run.
# We keep the check for change-entires below as make might fail if there
# are changes to Makefile.in that require further preparations.

cd "$src_dir"
touch build/rules.mk
make -f Makefile.in update-changes SVN=/usr/bin/svn top_srcdir=. top_builddir=.
rm build/rules.mk

if test "$(ls -A $src_dir/changes-entries)"; then
  echo "The 'changes-entries' directory should be empty."
  echo "Run 'make update-changes' and commit changes before using $0"
  exit 1
fi

cd "$src_dir"
#    Set AP_SERVER_DEVBUILD_BOOLEAN to 0 in include/ap_release.h.
perl -pi -e 's/(#define\s+AP_SERVER_DEVBUILD_BOOLEAN\s+)\d/${1}0/g' include/ap_release.h

#Sanity check...
if ! grep -e '^#define *AP_SERVER_DEVBUILD_BOOLEAN *0$' include/ap_release.h >/dev/null 2>&1;then
  echo "ERROR: Implementing change to set AP_SERVER_DEVBUILD_BOOLEAN to 1 failed"
  exit 1
fi

svn commit -m "Get ready to tag httpd $version"


#    Revert the change to include/ap_release.h setting AP_SERVER_DEVBUILD_BOOLEAN back to 1, and bump AP_SERVER_PATCHLEVEL_NUMBER
perl -pi -e '
  s/(#define\s+AP_SERVER_DEVBUILD_BOOLEAN\s+)\d/${1}1/g;

  if(/(#define\s+AP_SERVER_PATCHLEVEL_NUMBER\s+)(\d+)$/){
    $new = $2 + 1;
    $_ = "${1}${new}\n";
  }
  ' include/ap_release.h

#Sanity check...
if ! grep -e '^#define *AP_SERVER_DEVBUILD_BOOLEAN *1$' include/ap_release.h >/dev/null 2>&1;then
  echo "ERROR: Reverting change to AP_SERVER_DEVBUILD_BOOLEAN failed"
  exit 1
fi

#Sanity check...
if ! grep -e "^#define *AP_SERVER_PATCHLEVEL_NUMBER *$next_patch\$" include/ap_release.h >/dev/null 2>&1;then
  echo "ERROR: Bump of AP_SERVER_PATCHLEVEL_NUMBER did not return expected value of $next_patch"
  exit 1
fi


#    Bump ENTITY httpd.patch in docs/manual/style/version.ent.
perl -pi -e '
  if(/(.*ENTITY httpd.patch ")(\d+)(.*)/){
    $new=$2 + 1;
    $_="${1}${new}${3}\n";
  }
  ' docs/manual/style/version.ent

#Sanity check...
if ! grep -e "ENTITY *httpd.patch *\"$next_patch\"" docs/manual/style/version.ent >/dev/null 2>&1;then
  echo "ERROR: Bump of ENTITY httpd.patch did not return expected value of $next_patch"
  exit 1
fi


#    Add the corresponding version placeholder in CHANGES.
perl -pi -e "s{(.*coding: utf-8.*)}{\$1\nChanges with Apache $next_version\n}" CHANGES


#    Note the tag date in the STATUS file.
perl -pi -e '
  if(/^(\s+)('$cur_version'\s+):/){
    $size = length $2;
    $newline1 = sprintf("${1}%-${size}s", "'$next_version'") . ": In development\n";
    $newline2 = sprintf("${1}%-${size}s", "'$cur_version'") . ": Tagged on '"$date_string"'\n";
    $_="${newline1}${newline2}";
  }
  ' STATUS


#    Create an official X.Y.Z tag based on the candidate tree.
svn copy -m "Tag HEAD of $branch as $version" "$SVN_BRANCH" "$SVN_ROOT/httpd/tags/$version"


#    Commit our bumps and updates now that tag is done
cd "$src_dir"
svn commit -m "Post $version tag updates"

#Outside the scope of this script...
#    Run the svn.apache.org/repos/asf/httpd/site/trunk/tools/release.sh script.
#    Commit the generated release tarballs and signatures to the subversion https://dist.apache.org/repos/dist/dev/httpd/ repository.
#    Email dev@httpd.apache.org with a [VOTE] Release X.Y.Z to call for testing and votes on this candidate.
