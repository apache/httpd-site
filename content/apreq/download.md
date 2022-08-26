Title: libapreq download
license: https://www.apache.org/licenses/LICENSE-2.0

# Downloading libapreq  {#Download}

Use the links below to download libapreq from one of our mirrors. You
**must**  [verify the integrity](#verify) of the downloaded files using
signatures downloaded from our main distribution directory.

If you do not see the file you need in the links below, please see the
[master distribution directory](http://downloads.apache.org/httpd/libapreq/)
or, preferably, its [mirror]([preferred]/httpd/libapreq/).

# Mirror  {#mirror}

You are currently using **[preferred]**. If you encounter a problem with
this mirror, please select another mirror. If all mirrors are failing,
there are *backup* mirrors (at the end of the mirrors list) that should be
available.

<form action="[location]" method="get" id="SelectMirror">Other
mirrors: <select name="Preferred">[if-any http] [for http]<option
value="[http]">[http]</option>[end] [end] [if-any ftp] [for ftp]<option
value="[ftp]">[ftp]</option>[end] [end] [if-any backup] [for backup]<option
value="[backup]">[backup] (backup)</option>[end] [end]</select><input
type="submit" value="Change"></input></form>

# Apache HTTP Request Library 2.17 is now available  {#v2_17}

This release works with Apache HTTP Server 2.4. Please note that this
version will not work with older 1.3.X releases of the Apache HTTP Server,
and is not tested against (unsupported) 2.0 or 2.2 releases.

[libapreq2-2.17]([preferred]/httpd/libapreq/libapreq2-2.17.tar.gz) 
[ [PGP](http://downloads.apache.org/httpd/libapreq/libapreq2-2.17.tar.gz.asc) ] [ [SHA256](http://downloads.apache.org/httpd/libapreq/libapreq2-2.17.tar.gz.sha256) ] [ [SHA512](http://downloads.apache.org/httpd/libapreq/libapreq2-2.17.tar.gz.sha512) ]

# Apache HTTP Request Library 1.34 is now available  {#v1_03}

This release works with Apache HTTP Server 1.3. Please note that this
version will not work with newer 2.X releases of the Apache HTTP Server.
Please use [libapreq2-2.17](#v2_17) for use with Apache HTTP Server 2.4.

[libapreq-1.34]([preferred]/httpd/libapreq/libapreq-1.34.tar.gz) 
[ [PGP](http://downloads.apache.org/httpd/libapreq/libapreq-1.34.tar.gz.asc) ] 
[ [MD5](http://downloads.apache.org/httpd/libapreq/libapreq-1.34.tar.gz.md5) ]

# Verify the integrity of the files  {#verify}

It is essential that you verify the integrity of the downloaded files using
the PGP or MD5 signatures.

The PGP signatures can be verified using PGP or GPG. First download the
[KEYS](http://downloads.apache.org/httpd/KEYS) as well as the `asc`
signature file for the particular distribution. Make sure you get these
files from the [main distribution
directory](http://downloads.apache.org/httpd/) , rather than from a mirror.
Then verify the signatures using:

<code>% pgpk -a KEYS<br></br>% pgpv
libapreq2-2.17.tar.gz.asc<br></br></code> *or* <br></br><code>% pgp -ka
KEYS<br></br>% pgp libapreq2-2.17.tar.gz.asc<br></br></code> *or*
<br></br><code>% gpg --import KEYS<br></br>% gpg --verify
libapreq-2.17.tar.gz.asc</code>

Alternatively, you can verify the MD5 signature on the files. A unix
program called `md5` or `md5sum` is included in many unix distributions. It
is also available as part of [GNU
Textutils](http://www.gnu.org/software/textutils/textutils.html). Windows
users can get binary md5 programs from [here](http://www.fourmilab.ch/md5/)
, [here](http://www.pc-tools.net/win32/freeware/console/) , or
[here](http://www.slavasoft.com/fsum/).

