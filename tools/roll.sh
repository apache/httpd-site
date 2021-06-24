#!/bin/sh
#
# roll.sh : build a release tarball
#
# USAGE: roll.sh SOURCE [SIGNING-USER]
#
#   The "signing user" is the name of the key that you'll be signing the
#   release with.
#

# Run tests to ensure that our requirements are met

RELEASECHECK="`echo $0 | sed 's/roll.sh$/releasecheck.sh/'`"
${RELEASECHECK} || exit 1

dirname="$1"
user="$2"
separate_deps="$3"

if test "$#" != 1 && test "$#" != 2 && test "$#" != 3; then
  echo "USAGE: $0 SOURCE [SIGNING-USER] [separate_dependencies]" >&2
  echo "  see the comments in this script for more info." >&2
  exit 1
fi


split="---------------------------------------------------------------------"

echo $split
echo ""

# make sure that the perms are good for the tarball
umask 022

echo "Eliminating unwanted files (e.g. .cvsignore) and generating initial"
echo "files via buildconf ..."
echo ""

find $dirname -name autom4te*.cache | xargs rm -rf
find $dirname -name STATUS | xargs rm -rf

(cd ${dirname} && ./buildconf) || exit 1

find $dirname -name autom4te*.cache | xargs rm -rf

echo ""
echo "Fixup the timestamps preventing remake of generated files."
if test -f "${dirname}/modules/ssl/ssl_expr_parse.y"; then
    echo "Found ssl expression parser"
    touch $dirname/modules/ssl/ssl_expr_parse.c
    touch $dirname/modules/ssl/ssl_expr_parse.h
    touch $dirname/modules/ssl/ssl_expr_scan.c
elif test -f "${dirname}/server/util_expr_parse.y"; then
    echo "Found generic expression parser"
    touch $dirname/server/util_expr_parse.c
    touch $dirname/server/util_expr_parse.h
    touch $dirname/server/util_expr_scan.c
else
    echo "Found no expression parser!"
fi
echo ""

echo $split
echo ""
echo "Removing Manual Source Files."
echo ""
find $dirname/docs/manual -name \*.xml -o -name \*.xml.\* | xargs rm -rf 
find $dirname/docs/manual -name \*.xsl -o -name \*.xsl.\* | xargs rm -rf 

if test "${separate_deps}" = 1; then
    echo $split
    echo ""
    echo "Moving dependencies to their own tarball, .gz, and .bz2 files ..."
    echo ""
    depsdir="${dirname}-deps/${dirname}"
    mkdir -p ${depsdir}/srclib
    mv "${dirname}/srclib/apr" "${depsdir}/srclib"
    mv "${dirname}/srclib/apr-util" "${depsdir}/srclib"
    tar -C "${dirname}-deps" -cf ${dirname}-deps.tar ${dirname}
    gzip -9 --to-stdout ${dirname}-deps.tar > ${dirname}-deps.tar.gz
    bzip2 -9 ${dirname}-deps.tar
fi

echo $split
echo ""
echo "Building the tarball, .gz, and .bz2 files ..."
echo ""

tar cf ${dirname}.tar ${dirname}
gzip -9 --to-stdout ${dirname}.tar > ${dirname}.tar.gz
bzip2 -9 ${dirname}.tar

echo $split
echo ""
echo "Generating MD5/SHA1/SHA256 checksum files ..."
echo ""

# check for executables
gpg2="`which gpg2 2> /dev/null | head -1`"
gpg="`which gpg 2> /dev/null | head -1`"
pgp="`which pgp 2> /dev/null | head -1`"
openssl="`which openssl 2> /dev/null | head -1`"
md5sum="`which md5sum 2> /dev/null | head -1`"
sha1sum="`which sha1sum 2> /dev/null | head -1`"
sha256sum="`which sha256sum 2> /dev/null | head -1`"
sha512sum="`which sha512sum 2> /dev/null | head -1`"
md5="`which md5 2> /dev/null | head -1`"
sha1="`which sha1 2> /dev/null | head -1`"
sha256="`which sha256 2> /dev/null | head -1`"
sha512="`which sha512 2> /dev/null | head -1`"
sed="`which gsed 2> /dev/null | head -1`"
if ! test -x "${sed}"; then
  sed="`which sed 2> /dev/null | head -1`"
fi;

set -- ${dirname}.tar.gz ${dirname}.tar.bz2 ${dirname}-deps.tar.gz ${dirname}-deps.tar.bz2
# if found we use openssl for generating the checksums
# and convert the results into machine-readable format.
if test -x "${openssl}"; then
  for file; do
    if test -f "${file}"; then
      echo "openssl: creating md5 checksum file for ${file} ..."
      ${openssl} md5 ${file} |\
          ${sed} -e 's#^MD5(\(.*\))= \([0-9a-f]*\)$#\2 *\1#' > ${file}.md5
      echo "openssl: creating sha1 checksum file for ${file} ..."
      ${openssl} sha1 ${file} |\
          ${sed} -e 's#^SHA1(\(.*\))= \([0-9a-f]*\)$#\2 *\1#' > ${file}.sha1
      echo "openssl: creating sha256 checksum file for ${file} ..."
      ${openssl} sha256 ${file} |\
          ${sed} -e 's#^SHA256(\(.*\))= \([0-9a-f]*\)$#\2 *\1#' > ${file}.sha256
      echo "openssl: creating sha512 checksum file for ${file} ..."
      ${openssl} sha512 ${file} |\
          ${sed} -e 's#^SHA512(\(.*\))= \([0-9a-f]*\)$#\2 *\1#' > ${file}.sha512
    fi
  done
# no openssl found - check if we have gpg2
elif test -x "${gpg2}"; then
  for file; do
    if test -f "${file}"; then
      echo "gpg2: creating md5 checksum file for ${file} ..."
      ${gpg2} --print-md md5 ${file} |\
          ${sed} -e '{N;s#\n##;}' |\
          ${sed} -e 's#\(.*\): \(.*\)#\2::\1#;s#[\r\n]##g;s# ##g' \
              -e 'y#ABCDEF#abcdef#;s#::# *#' > ${file}.md5
      echo "gpg2: creating sha1 checksum file for ${file} ..."
      ${gpg} --print-md sha1 ${file} |\
          ${sed} -e '{N;s#\n##;}' |\
          ${sed} -e 's#\(.*\): \(.*\)#\2::\1#;s#[\r\n]##g;s# ##g' \
              -e 'y#ABCDEF#abcdef#;s#::# *#' > ${file}.sha1
      echo "gpg2: creating sha256 checksum file for ${file} ..."
      ${gpg} --print-md sha256 ${file} |\
          ${sed} -e '{N;s#\n##;}' |\
          ${sed} -e 's#\(.*\): \(.*\)#\2::\1#;s#[\r\n]##g;s# ##g' \
              -e 'y#ABCDEF#abcdef#;s#::# *#' > ${file}.sha256
      echo "gpg2: creating sha512 checksum file for ${file} ..."
      ${gpg} --print-md sha512 ${file} |\
          ${sed} -e '{N;s#\n##;}' |\
          ${sed} -e 's#\(.*\): \(.*\)#\2::\1#;s#[\r\n]##g;s# ##g' \
              -e 'y#ABCDEF#abcdef#;s#::# *#' > ${file}.sha512
    fi
  done
# no gpg2 found - check if we have gpg
elif test -x "${gpg}"; then
  for file; do
    if test -f "${file}"; then
      echo "gpg: creating md5 checksum file for ${file} ..."
      ${gpg} --print-md md5 ${file} |\
          ${sed} -e '{N;s#\n##;}' |\
          ${sed} -e 's#\(.*\): \(.*\)#\2::\1#;s#[\r\n]##g;s# ##g' \
              -e 'y#ABCDEF#abcdef#;s#::# *#' > ${file}.md5
      echo "gpg: creating sha1 checksum file for ${file} ..."
      ${gpg} --print-md sha1 ${file} |\
          ${sed} -e '{N;s#\n##;}' |\
          ${sed} -e 's#\(.*\): \(.*\)#\2::\1#;s#[\r\n]##g;s# ##g' \
              -e 'y#ABCDEF#abcdef#;s#::# *#' > ${file}.sha1
      echo "gpg: creating sha256 checksum file for ${file} ..."
      ${gpg} --print-md sha256 ${file} |\
          ${sed} -e '{N;s#\n##;}' |\
          ${sed} -e 's#\(.*\): \(.*\)#\2::\1#;s#[\r\n]##g;s# ##g' \
              -e 'y#ABCDEF#abcdef#;s#::# *#' > ${file}.sha256
      echo "gpg: creating sha512 checksum file for ${file} ..."
      ${gpg} --print-md sha512 ${file} |\
          ${sed} -e '{N;s#\n##;}' |\
          ${sed} -e 's#\(.*\): \(.*\)#\2::\1#;s#[\r\n]##g;s# ##g' \
              -e 'y#ABCDEF#abcdef#;s#::# *#' > ${file}.sha512
    fi
  done
else
  # no openssl or gpg found - check for md5sum
  if test -x "${md5sum}"; then
    for file; do
      if test -f "${file}"; then
        echo "md5sum: creating md5 checksum file for ${file} ..."
        ${md5sum} -b ${file} > ${file}.md5
      fi
    done
  # no openssl or gpg found - check for md5
  elif test -x "${md5}"; then
    for file; do
      if test -f "${file}"; then
        echo "md5: creating md5 checksum file for ${file} ..."
        ${md5} -r ${file} | ${sed} -e 's# # *#' > ${file}.md5
      fi
    done
  fi
  # no openssl or gpg found - check for sha1sum
  if test -x "${sha1sum}"; then
    for file; do
      if test -f "${file}"; then
        echo "sha1sum: creating sha1 checksum file for ${file} ..."
        ${sha1sum} -b ${file} > ${file}.sha1
      fi
    done
  # no openssl or gpg found - check for sha1
  elif test -x "${sha1}"; then
    for file; do
      if test -f "${file}"; then
        echo "sha1: creating sha1 checksum file for ${file} ..."
        ${sha1} -r ${file} | ${sed} -e 's# # *#' > ${file}.sha1
      fi
    done
  fi
  # no openssl or gpg found - check for sha256sum
  if test -x "${sha256sum}"; then
    for file; do
      if test -f "${file}"; then
        echo "sha256sum: creating sha256 checksum file for ${file} ..."
        ${sha256sum} -b ${file} > ${file}.sha256
      fi
    done
  # no openssl or gpg found - check for sha256
  elif test -x "${sha256}"; then
    for file; do
      if test -f "${file}"; then
        echo "sha256: creating sha256 checksum file for ${file} ..."
        ${sha256} -r ${file} | ${sed} -e 's# # *#' > ${file}.sha256
      fi
    done
  fi
  # no openssl or gpg found - check for sha512sum
  if test -x "${sha512sum}"; then
    for file; do
      if test -f "${file}"; then
        echo "sha512sum: creating sha512 checksum file for ${file} ..."
        ${sha512sum} -b ${file} > ${file}.sha512
      fi
    done
  # no openssl or gpg found - check for sha512
  elif test -x "${sha512}"; then
    for file; do
      if test -f "${file}"; then
        echo "sha512: creating sha512 checksum file for ${file} ..."
        ${sha512} -r ${file} | ${sed} -e 's# # *#' > ${file}.sha512
      fi
    done
  fi
fi

echo $split
echo ""
echo "Cleaning up and signing the files ..."
echo ""

# First look for gpg2
if test -x "${gpg2}"; then
  if test -z "${user}"; then
    args="--default-key ${args}"
  else
    args="-u ${user} ${args}"
  fi
  for file; do
    if test -f "${file}"; then
      echo "gpg2: creating asc signature file for ${file} ..."
      ${gpg2} --armor ${args} --detach-sign ${file}
    fi
  done
# no gpg2 found - check for gpg
elif test -x "${gpg}"; then
  if test -z "${user}"; then
    args="--default-key ${args}"
  else
    args="-u ${user} ${args}"
  fi
  for file; do
    if test -f "${file}"; then
      echo "gpg: creating asc signature file for ${file} ..."
      ${gpg} --armor ${args} --detach-sign ${file}
    fi
  done

# ... no GnuPG? Try PGP
elif test -x "${pgp}"; then
  if test -n "${user}"; then
    args="-u ${user}"
  fi
  for file; do
    if test -f "${file}"; then
      echo "pgp: creating asc signature file for ${file} ..."
      ${pgp} -sba ${file} ${args}
    fi
  done
# no pgp found - check for gpg
else
  echo "PGP or GnuPG not found!  Not signing release!"
fi
