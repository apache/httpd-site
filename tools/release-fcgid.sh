#!/bin/sh
#
# release-fcgid.sh : build a mod_fcgid release tarball
#
# USAGE: release-fcgid.sh VERSION [SIGNING-USER]
#
#   The version number is specified as MAJOR.MINOR.PATCH (and will be used in
#   the output tarball name). The script will then look for a tag named
#   "MAJOR.MINOR.PATCH" and export it into a subdirectory (of the current
#   directory). Next, it will run the appropriate commands to prepare and
#   construct the tarball. The subdirectory will be cleaned up upon exit.
#
#   The "signing user" is the name of the key that you'll be signing the
#   release with.
#

HASH_AND_SIGN="`echo $0 | sed 's/release-fcgid.sh$/hash-sign.sh/'`"

project=mod_fcgid

# This forces all exported releases to be on the same timezone
# when SVN props are used inside files.
TZ=UTC
export TZ

SVNHOST=svn.apache.org

if test "$#" != 1 && test "$#" != 2; then
  echo "USAGE: $0 VERSION [SIGNING-USER]" >&2
  echo "  see the comments in this script for more info." >&2
  exit 1
fi

version="$1"
user="$2"

major="`echo ${version} | sed 's/\..*$//'`"
minor="`echo ${version} | sed 's/^[0-9]*\.\([0-9]*\)\..*$/\1/'`"
patch="`echo ${version} | sed 's/^.*\.//'`"

tagname="${version}"

dirname="`echo ${project} | sed 's/-[0-9]*\.[0-9]*$//'`"
dirname="${dirname}-${version}"

split="---------------------------------------------------------------------"

echo $split
echo ""

echo "  Version: ${version}"
echo " Tag name: ${tagname}"
echo "Directory: ${dirname}"
echo ""

if test -d ${dirname}; then
  echo "ERROR: for safety, you must manually remove ${dirname}." >&2
  exit 1
fi


# make sure that the perms are good for the tarball
umask 022

echo $split
echo ""
echo "Starting SVN export of ${project} to ${dirname} ..."
echo ""

svn export https://${SVNHOST}/repos/asf/httpd/mod_fcgid/tags/${tagname} ${dirname} > /dev/null || exit 1

echo $split
echo ""

echo "Copying CHANGES file"
echo ""

cp ${dirname}/CHANGES-FCGID CHANGES-FCGID

echo $split
echo ""
echo "Building the tarball, .gz, and .bz2 files ..."
echo ""

tar cf ${dirname}.tar ${dirname}
gzip -9 --to-stdout ${dirname}.tar > ${dirname}.tar.gz
bzip2 -9 ${dirname}.tar

rm -r ${dirname}

echo $split
echo ""
echo "Re-exporting in CRLF format and creating zip file ..."
echo ""

svn export --native-eol CRLF https://${SVNHOST}/repos/asf/httpd/mod_fcgid/tags/${tagname} ${dirname} > /dev/null || exit 1

zip -r ${project}-${version}-crlf.zip ${dirname} >/dev/null || exit 1

rm -r ${dirname}

if test -n ${user}; then
  user_arg="-u ${user}"
else
  user_arg=""
fi

${HASH_AND_SIGN} ${user_arg} ${dirname}.tar.gz ${dirname}.tar.bz2 ${project}-${version}-crlf.zip
