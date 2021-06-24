#! /bin/sh

# Initialize parameters

echo "releasecheck: checking installation for a source release..."

#--------------------------------------------------------------------------
# autoconf 2.59 or newer
#
ac_version=`${AUTOCONF:-autoconf} --version 2>/dev/null|head -1| sed -e 's/^[^0-9]*//' -e 's/[a-z]* *$//'`
if test -z "$ac_version"; then
  echo "buildcheck: autoconf not found."
  echo "            You need autoconf version 2.59 or newer installed."
  exit 1
fi
IFS=.; set $ac_version; IFS=' '
if test "$1" = "2" -a "$2" -lt "59" || test "$1" -lt "2"; then
  echo "buildcheck: autoconf version $ac_version found."
  echo "            You need autoconf version 2.59 or newer installed."
  echo "            If you have a sufficient autoconf installed, but it"
  echo "            is not named 'autoconf', then try setting the"
  echo "            AUTOCONF environment variable.  (See the INSTALL file"
  echo "            for details.)"
  exit 1
fi

echo "releasecheck: autoconf version $ac_version (ok)"

#--------------------------------------------------------------------------
# autoheader 2.53 or newer
#
ah_version=`${AUTOHEADER:-autoheader} --version 2>/dev/null|head -1| sed -e 's/^[^0-9]*//' -e 's/[a-z]* *$//'`
if test -z "$ah_version"; then
  echo "buildcheck: autoheader not found."
  echo "            You need autoheader version 2.59 or newer installed."
  exit 1
fi
IFS=.; set $ah_version; IFS=' '
if test "$1" = "2" -a "$2" -lt "59" || test "$1" -lt "2"; then
  echo "buildcheck: autoheader version $ah_version found."
  echo "            You need autoheader version 2.59 or newer installed."
  echo "            If you have a sufficient autoheader installed, but it"
  echo "            is not named 'autoheader', then try setting the"
  echo "            AUTOHEADER environment variable.  (See the INSTALL file"
  echo "            for details.)"
  exit 1
fi

echo "releasecheck: autoheader version $ah_version (ok)"

#--------------------------------------------------------------------------
# libtool 1.4.3 or newer
#
LIBTOOL_WANTED_MAJOR=1
LIBTOOL_WANTED_MINOR=5
LIBTOOL_WANTED_PATCH=10
LIBTOOL_WANTED_VERSION=1.5.10

libtool=`which glibtool 2>/dev/null`
if test ! -x "$libtool"; then
  libtool=`which libtool`
fi
lt_pversion=`$libtool --version 2>/dev/null|head -1|sed -e 's/^[^0-9]*//' -e 's/[- ].*//'`

if test -z "$lt_pversion"; then
  echo "buildcheck: libtool not found."
  echo "            You need libtool version $LIBTOOL_WANTED_VERSION or newer installed"
  exit 1
fi
lt_version=`echo $lt_pversion|sed -e 's/\([a-z]*\)$/.\1/'`
IFS=.; set $lt_version; IFS=' '
lt_status="good"
if test "$1" = "$LIBTOOL_WANTED_MAJOR"; then
   if test "$2" -lt "$LIBTOOL_WANTED_MINOR"; then
      lt_status="bad"
   elif test ! "$2" -gt "$LIBTOOL_WANTED_MINOR" -a \
        ! -z "$LIBTOOL_WANTED_PATCH"; then
       if test "$3" -lt "$LIBTOOL_WANTED_PATCH"; then
           lt_status="bad"
       fi
   fi
fi
if test $lt_status != "good"; then
  echo "buildcheck: libtool version $lt_pversion found."
  echo "            You need libtool version $LIBTOOL_WANTED_VERSION or newer installed"
  exit 1
fi

echo "releasecheck: libtool version $lt_pversion (ok)"

#--------------------------------------------------------------------------
exit 0
