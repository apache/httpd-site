Title: Flood
flood: nav
license: https://www.apache.org/licenses/LICENSE-2.0

# Overview  {#Overview}

This document explains how to compile and run flood.

Flood is built around [Apache Portable Runtime](http://apr.apache.org/) -
specifically apr and apr-util.

Flood has been primarily developed on Linux and Solaris. FreeBSD is also
known to work. Since flood is built around APR, any APR-supported platform
should work without too much hassle. We expect Win32 would work with some
additional magic provided someone has the time and inclination to do so.
APR has completed most of the dirty work, but none of the current flood
developers use Win32.

# Checking out flood  {#Checkout}

The current copy of flood is available via Subversion. Flood also depends
on the apr and apr-util packages available from the same Subversion
repository.

**<font color="red">Note:</font>** Flood will automatically detect and
configure APR and APR-util if they are in the appropriate subdirectories.
If you have an already installed copy of APR and APR-util (such as the ones
that come with httpd-2.0 or Subversion), you may specify --with-apr and
--with-apr-util at configure-time.

    % svn co http://svn.apache.org/repos/asf/httpd/flood/trunk flood
    % cd flood
    % svn co http://svn.apache.org/repos/asf/apr/apr/trunk apr
    % svn co http://svn.apache.org/repos/asf/apr/apr-util/trunk apr-util


# Configuring flood and its dependencies  {#Configuring}

Now that you have all of the required modules checked out, you now need to
generate the configure scripts and execute them for your platform.

### Flood and SSL support ###

**<font color="red">Note:</font>** SSL support is **not** enabled by
default in flood. If you wish to enable SSL support, you must specify
`--enable-ssl` when configuring flood.

If you attempt to run flood against a https URL without SSL support
compiled-in, you will receive an error similar to the following:

    %./flood examples/round-robin-ssl.xml
    open request failed (https://www.modssl.org/example/test.phtml).
    Error running farmer 'Joe': This function has not been implemented on this
    platform

The `--enable-ssl` option enables detection of the OpenSSL libraries. If
flood can not automatically detect OpenSSL, you will need to specify
`--with-openssl` to point at the appropriate installed version of OpenSSL.
The `--with-capath` option points at a directory that contains the
Certificate Authorities ( **CA** s) for OpenSSL. The default capath is in
`$openssl_prefix/certs`.

### Running configure from the flood directory ###

    %./buildconf
    %./configure --disable-shared


# Compiling flood and its dependencies  {#Compiling}

In this example, APR and apr-util will automatically be built with flood.
So, you only need to issue a make in the flood directory.

    % make all

# Running flood  {#Running}

By default, flood is a static executable, so the executable is relocatable.
There are some example flood profiles in the examples/ directory from CVS.

    %./flood examples/round-robin.xml > foo.out


# Analyzing flood output  {#Analysis}

The foo.out file generated above is in a simple easy-to-parse format. There
are some included shell and awk scripts in the examples directory that
provide some easy mechanisms to extract info from the flood output files.

    %./examples/analyze-relative foo.out


# Questions  {#Questions}

This should provide a quick and easy way to jumpstart your flood
installation. If you have any questions, please email the
dev@httpd.apache.org mailing list.

