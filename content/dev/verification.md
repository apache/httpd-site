Title: Verifying Apache HTTP Server Releases
license: https://www.apache.org/licenses/LICENSE-2.0

# Verifying Apache HTTP Server Releases

All official releases of code distributed by the Apache HTTP Server Project
are signed by the release manager for the release. PGP signatures and SHA
hashes are available along with the distribution.

You should download the PGP signatures and SHA hashes directly from the
Apache Software Foundation rather than our mirrors. This is to help ensure
the integrity of the signature files. However, you are encouraged to
download the releases from our mirrors. (Our download page points you at
the mirrors for the release and the official site for the signatures, so
this happens automatically for you.)

# Checking Signatures  {#Checking}

The following example details how signature interaction works. In this
example, you are already assumed to have downloaded `httpd-2.4.18.tar.gz`
(the release) and `httpd-2.4.18.tar.gz.asc` (the detached signature).

This example uses [The GNU Privacy Guard](http://www.gnupg.org/). Any
[OpenPGP](http://www.openpgp.org/) -compliant program should work
successfully.

First, we will check the detached signature ( `httpd-2.4.18.tar.gz.asc` )
against our release ( `httpd-2.4.18.tar.gz` ).

    % gpg --verify httpd-2.4.18.tar.gz.asc httpd-2.4.18.tar.gz
    gpg: Signature made Tue Dec  8 21:32:07 2015 CET using RSA key ID 791485A8
    gpg: Can't check signature: public key not found

We don't have the release manager's public key ( `791485A8` ) in our local
system. You now need to retrieve the public key from a key server. One
popular server is `pgpkeys.mit.edu` (which has a [web
interface](http://pgp.mit.edu/) ). The public key servers are linked
together, so you should be able to connect to any key server. You can
also obtain the keys of the httpd release managers at
<https://downloads.apache.org/httpd/KEYS>.

    % gpg --keyserver pgpkeys.mit.edu --recv-key 791485A8
    gpg: requesting key 791485A8 from HKP keyserver pgpkeys.mit.edu
    gpg: trustdb created
    gpg: key 791485A8: public key "Jim Jagielski <jim@apache.org>" imported
    gpg: key 791485A8: public key "Jim Jagielski <jim@apache.org>" imported
    gpg: Total number processed: 2
    gpg:               imported: 2  (RSA: 2)

In this example, you have now received two public keys for entities known
as 'Jim Jagielski &lt;jim@apache.org&gt;' However, you have no way of
verifying whether these keys were created by the person known as Jim
Jagielski whose email address is claimed.  In fact, one of them is
an imposter.  This doesn't mean that PGP is broken, just that you need to
look at the full 40-character key fingerprint rather than the vulnerable
8-character ID.

Anyway, let's try to verify the release signature again:

    % gpg --verify httpd-2.4.18.tar.gz.asc httpd-2.4.18.tar.gz
    gpg: Signature made Tue Dec  8 21:32:07 2015 CET using RSA key ID 791485A8
    gpg: Good signature from "Jim Jagielski <jim@apache.org>"
    gpg:		     aka "Jim Jagielski <jim@jimjag.com>"
    gpg:             aka "Jim Jagielski <jim@jaguNET.com>"
    gpg:             aka "Jim Jagielski <jimjag@gmail.com>"
    gpg: checking the trustdb
    gpg: no ultimately trusted keys found
    gpg: WARNING: This key is not certified with a trusted signature!
    gpg:	      There is no indication that the signature belongs to the
    owner.
    Fingerprint: A93D 62EC C3C8 EA12 DB22  0EC9 34EA 76E6 7914 85A8

At this point, the signature is good, but we don't trust this key. A good
signature means that the file has not been tampered. However, due to the
nature of public key cryptography, you need to additionally verify that key
A93D62ECC3C8EA12DB220EC934EA76E6791485A8 was created by the **real**
Jim Jagielski.

Any attacker can create a public key and upload it to the public key
servers. They can then create a malicious release signed by this fake key.
Then, if you tried to verify the signature of this corrupt release, it
would succeed because the key was not the 'real' key. Therefore, you need
to validate the authenticity of this key.

# Validating Authenticity of a Key  {#Validating}

The crucial step to validation is to confirm the key fingerprint of the
public key.  We saw the fingerprint when we verified the download: it's
A93D 62EC C3C8 EA12 DB22  0EC9 34EA 76E6 7914 85A8

There are two ways to validate Jim's fingerprint.  The really secure way
(described below) is using the PGP "Web of Trust", which will give
you a cryptographically-strong chain of trust to Jim's key.
However, if you are new to PGP, this takes some time and effort.
A shortcut to a reasonable level of security is to check Jim's
fingerprint (always using https, not http) against the database
maintained by the Apache foundation of Apache developers' fingerprints
at <https://downloads.apache.org/httpd/KEYS>.
Note that this shortcut fails catastrophically if the Apache website is
ever compromised, or if an imposter breaks HTTPS security by obtaining
a fake certificate and impersonates the site.  Be sure to keep an eye
on the techie press for news stories of any such event!

A good start to validating a key is by face-to-face communication with
multiple government-issued photo identification confirmations. However,
each person is free to have their own standards for determining the
authenticity of a key. Some people are satisfied by reading the key
signature over a telephone (voice verification). For more information on
determining what level of trust works best for you, please read the GNU
Privacy Handbook section on [Validating other keys on your public
keyring](http://www.gnupg.org/gph/en/manual.html#AEN335).

Most of the Apache HTTP Server developers have attempted to sign each
others' keys (usually with face-to-face validation). Therefore, in order to
enter the web of trust, you should only need to validate one person in our
web of trust. (Hint: all of our developers' keys are in the KEYS file.)

For example, the following people have signed the public key for Jim Jagielski. 
If you verify any key on this list, you will have a trust path to
the 791485A8 key. If you verify a key that verifies one of the signatories
for 791485A8, then you will have a trust path. (So on, and so on.)

    % gpg --list-sigs 
    pub   4096R/791485A8 2010-11-04
    uid                  Jim Jagielski (Release Signing Key) <jim@apache.org>
    sig          88C3A5A5 2010-11-07  Philippe M. Chiasson (Home) <gozer@ectoplasm.org>
    sig          4E24517C 2011-11-10  Hyrum K. Wright (Personal) <hyrum@hyrumwright.org>
    sig          C4FC9A65 2011-11-10  Bernd Bohmann <bommel@apache.org>
    sig          1F27E622 2015-04-16  Konstantin I Boudnik (Cos) <cos@boudnik.org>
    sig          08C975E5 2010-11-04  Jim Jagielski <jim@apache.org>
    sig 2        F2EFD0F0 2011-11-14  Christopher David Schultz (Christopher David Schultz) <chris@christopherschultz.net>
    sig 3        311A3DE5 2010-11-10  Ruediger Pluem <rpluem@apache.org>
    sig          64A6A0BA 2013-02-27  Steven J. Hathaway (Apache PGP) <shathaway@apache.org>
    sig          00A1234F 2015-04-15  Andre Arcilla <arcilla@apache.org>
    sig          9A59B973 2015-04-21  Stefan Sperling <stsp@stsp.name>
    sig          F51BB88A 2010-11-04  Sander Temme <sander@temme.net>
    ...more signatures redacted...

Since the developers are usually quite busy, you may not immediately find
success in someone who is willing to meet face-to-face (they may not even
respond to your emails because they are so busy!). If you do not have a
developer nearby or have trouble locating a suitable person, please send an
email to the address of the key you are attempting to verify. They may be
able to find someone who will be willing to validate their key or arrange
alternate mechanisms for validation.

Once you have entered the web of trust, you should see the following upon
verifying the signature of a release.

    % gpg --verify httpd-2.4.18.tar.gz.asc httpd-2.4.18.tar.gz
    gpg: Signature made Tue Dec  8 21:32:07 2015 CET using RSA key ID 791485A8
    gpg: Good signature from "Jim Jagielski (Release Signing Key) <jim@apache.org>"
    gpg:                 aka "Jim Jagielski <jim@jimjag.com>"
    gpg:                 aka "Jim Jagielski <jim@jaguNET.com>"
    gpg:                 aka "Jim Jagielski <jimjag@gmail.com>"

In order to check the integrity of the downloaded file, you need to download the source and the related SHA256
hash. For example, assuming a preference for tar.bz, to verify the 2.4.34 release you should end up with two files on disk:
  
  * httpd-2.4.34.tar.bz2 (source)
  * httpd-2.4.34.tar.bz2.sha256 (SHA256 hash)

On most Unix systems then it is only a matter of executing: 

    % shasum -a 256 -c httpd-2.4.34.tar.bz2.sha256
    httpd-2.4.34.tar.bz2: OK

Behind the scenes, the command checks that the SHA hash contained in httpd-2.4.34.tar.bz2.sha256 matches the one
calculated for the file httpd-2.4.34.tar.bz2. The correct result should be a 'OK' displayed.

Another way to calculate the SHA256 has for a file is to use openssl:

    % openssl sha256 -r httpd-2.4.34.tar.bz2
    fa53c95631febb08a9de41fd2864cfff815cf62d9306723ab0d4b8d7aa1638f0 *httpd-2.4.34.tar.bz2

And then verify that the content of httpd-2.4.34.tar.bz2.sha256 matches the above result.
