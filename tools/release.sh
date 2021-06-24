#!/bin/sh
#
# release.sh : build a release tarball
#
# USAGE: release.sh [--security] [--tag TAG POSTFIX] [--postfix POSTFIX]
#                   [--rev REV] [--europe] [--latestapxxx]
#                   PROJECT VERSION [SIGNING-USER]
#
#   The project is either 'httpd-2.2', 'httpd-2.4, httpd-2.5'
#
#   The version number is specified as MAJOR.MINOR.PATCH (and will be used in
#   the output tarball name). The script will then look for a CVS tag named
#   "MAJOR.MINOR.PATCH" and export it into a subdirectory (of the current
#   directory). Next, it will run the appropriate commands to prepare and
#   construct the tarball. The subdirectory will be cleaned up upon exit.
#
#   If latestapxxx is specified, the apr/apu download URL is checked with
#   curl to determine the best available version. This assumes access to
#   the Internet is available directly or via proxy (as used by curl)
#
#   The "signing user" is the name of the key that you'll be signing the
#   release with.
#

RELEASECHECK="`echo $0 | sed 's/release.sh$/releasecheck.sh/'`"
ROLL="`echo $0 | sed 's/release.sh$/roll.sh/'`"

# This forces all exported releases to be on the same timezone
# when SVN props are used inside files.
TZ=UTC
export TZ

SVNHOST=svn.apache.org

while true
do
  case "$1" in
    --security)
      security_release=1
      echo "Security Release support is broken and still uses CVS. Update release.sh"
      exit 1
      shift
      ;;

    --tag)
      tagged_release=1
      tag="$2"
      postfix="$3"
      shift 3
      ;;

    --postfix)
      postfix="$2"
      shift 2 
      ;;

    --rev)
      rev="$2"
      shift 2
      ;;

    --europe)
      SVNHOST=svn.eu.apache.org
      shift
      ;;

    --latestapxxx)
      get_latest_aprxxx=1
      shift

      if ! curl --version >/dev/null 2>&1;then
        echo "ERROR: curl must be available to use latestapxxx option."
        exit 1
      fi

      if test "`echo 'test-1.2.3' | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+'`" != "1.2.3";then
        echo "ERROR: your system must support 'grep -o' to use latestapxxx option."
        exit 1
      fi
      ;;

    --*)
     echo "Unknown option '$1'" >&2
     echo "USAGE: $0 [--security] [--tag TAG POSTFIX] [--postfix POSTFIX] [--rev REV] [--europe] PROJECT VERSION [SIGNING-USER]" >&2
     echo "  see the comments in this script for more info." >&2
     exit 1
     ;;

    *)
     # apparently there are no options left
     break
     ;;
  esac
done

if test "$#" != 2 && test "$#" != 3; then
  echo "USAGE: $0 [--security] [--tag TAG POSTFIX] [--postfix POSTFIX] [--rev REV] [--europe] PROJECT VERSION [SIGNING-USER]" >&2
  echo "  see the comments in this script for more info." >&2
  exit 1
fi

# Run tests to ensure that our requirements are met
${RELEASECHECK} || exit 1

project="$1"
version="$2"
user="$3"
separate_deps=0

case "$1" in
  httpd-2.2)
    ver_path="include/ap_release.h"
    ver_define="AP_SERVER_PATCHLEVEL"

    expected_major="2"
    expected_minor="2"

    branch="branches/2.2.x"

    apr_xxx_in_srclib=1
    apr_tag="1.5.2"
    apu_tag="1.5.4"
    ;;

  httpd-2.4)
    ver_path="include/ap_release.h"
    ver_define="AP_SERVER_PATCHLEVEL"

    expected_major="2"
    expected_minor="4"

    branch="branches/2.4.x"

    apr_xxx_in_srclib=1  # so the build of httpd completes
    apr_tag="1.6.5"      # for build
    apu_tag="1.6.1"      # for build
    separate_deps=1      # not used/released
    ;;

  httpd-2.5)
    ver_path="include/ap_release.h"
    ver_define="AP_SERVER_PATCHLEVEL"

    expected_major="2"
    expected_minor="5"

    branch="trunk"

    apr_xxx_in_srclib=1
    apr_tag="1.6.5"
    apu_tag="1.6.1"
    separate_deps=1
    ;;
  *)
    echo "ERROR: '$1' is an unknown project." >&2
    echo "  choose one of: httpd-2.2, httpd-2.4 or httpd-2.5" >&2
    exit 1
esac

if test $get_latest_aprxxx; then
  download_url="https://apr.apache.org/download.cgi"
  echo "Determining latest APR and APU versions from $download_url..."

  apr_tag=''
  apr_tag=`curl -s $download_url | grep 'APR [0-9].*is the best available version' | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+'`
  if test -z "$apr_tag"; then
    echo "ERROR: Failed to determine latest APR version from $download_url"
    exit 1
  else
    echo "  APR: $apr_tag"
  fi

  apu_tag=''
  apu_tag=`curl -s $download_url | grep 'APR-util [0-9].*is the best available version' | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+'`
  if test -z "$apu_tag"; then
    echo "ERROR: Failed to determine latest APR version from $download_url"
    exit 1
  else
    echo "  APU: $apu_tag"
  fi
fi

major="`echo ${version} | sed 's/\..*$//'`"
minor="`echo ${version} | sed 's/^[0-9]*\.\([0-9]*\)\..*$/\1/'`"
patch="`echo ${version} | sed 's/^.*\.//'`"

if test ${tagged_release}; then
  tagname="${tag}"
else
  tagname="${version}"
fi

dirname="`echo ${project} | sed 's/-[0-9]*\.[0-9]*$//'`"
dirname="${dirname}-${version}"
if test "${postfix}" != ""; then
  postfix="-${postfix}"
  dirname="${dirname}${postfix}"
elif test "${rev}" != ""; then
  postfix="-r${rev}"
  dirname="${dirname}${postfix}"
fi
if test ${security_release}; then
  dirname="${dirname}-security"
fi

if test "$rev" != ""; then
  rev="-r ${rev}"
fi

split="---------------------------------------------------------------------"

echo $split
echo ""

if test ${security_release}; then
  echo "  SECURITY RELEASE"
fi
echo "  Version: ${version}"
echo " Tag name: ${tagname}"
echo "Directory: ${dirname}"
echo ""

if test "${expected_major}" -ne "${major}" || test "${expected_minor}" -ne "${minor}"; then
  echo "ERROR: project doesn't match tag" >&2
  exit 1
fi

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

if test "${rev}" != ""; then
  svn export ${rev} https://${SVNHOST}/repos/asf/httpd/httpd/${branch} ${dirname} > /dev/null || exit 1
else
  svn export https://${SVNHOST}/repos/asf/httpd/httpd/tags/${tagname} ${dirname} > /dev/null || exit 1
fi

### Add a check to see if what was checked out matches $vsn

if test ${apr_xxx_in_srclib}; then
  echo "Starting SVN export of apr-${apr_tag} to ${dirname}/srclib ..."
  svn export https://${SVNHOST}/repos/asf/apr/apr/tags/${apr_tag} ${dirname}/srclib/apr > /dev/null || exit 1
  echo "Starting SVN export of apr-util-${apu_tag} to ${dirname}/srclib ..."
  svn export https://${SVNHOST}/repos/asf/apr/apr-util/tags/${apu_tag} ${dirname}/srclib/apr-util > /dev/null || exit 1
fi

echo $split
echo ""

if test ${tagged_release}; then
#  echo "Fixing up version define (replacing -dev with ${postfix})"
#  mv ${dirname}/${ver_path} ${dirname}/${ver_path}~
#  cat ${dirname}/${ver_path}~ | sed -e "s/\(${ver_define}.*\)-dev/\1${postfix}/" > ${dirname}/${ver_path}
#  rm ${dirname}/${ver_path}~
  echo ""

  echo $split
  echo ""

elif grep "#define.*${ver_define}.*-dev" ${dirname}/${ver_path} > /dev/null; then
  echo "ERROR: ${ver_path} still defines a development version." >&2
  echo "       This script can only produce formal releases." >&2
  exit 1
fi

if test ${security_release}; then
  patch_dir="${dirname}-patches"

  if test -d "${patch_dir}"; then
    echo "Starting CVS update of ${patch_dir}"
    echo ""
    ( cd ${patch_dir} &&
      cvs up -dP 2>/dev/null
    ) || exit 1
    echo ""
  else
    echo "Starting CVS checkout of httpd-security/patches/${version}-dev to ${patch_dir}"
    echo ""
    cvs -d cvs.apache.org:/home/cvs co -d ${patch_dir} httpd-security/patches/${version}-dev > /dev/null || exit 1
    echo ""
  fi
  
  echo "Applying patches..."
  for p in `find ${patch_dir} -type f -name '*.patch'`
  do
    ( cd ${dirname} &&
      cat ../${p} | patch -p0 --no-backup-if-mismatch
    ) || exit 1
  done
  
  echo $split
  echo ""
fi

echo "Copying CHANGES file"
echo ""

cp ${dirname}/CHANGES CHANGES_${major}.${minor}

${ROLL} ${dirname} ${user} ${separate_deps}|| exit 1
