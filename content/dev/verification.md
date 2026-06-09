Title: Verifying Apache HTTP Server Releases
license: https://www.apache.org/licenses/LICENSE-2.0

# Verifying Apache HTTP Server Releases

All official releases of code distributed by the Apache HTTP Server Project
are signed by the release manager for the release. PGP signatures and SHA
hashes are available along with the distribution.

Validating a download involves two separate processes:

1. **[Verifying the integrity of the file](#Hashes)** — using a SHA hash
   to confirm the file was not corrupted or tampered with during download.
2. **[Verifying the source of the file](#Checking)** — using a PGP
   signature to confirm it was actually released by a trusted Apache
   committer.

These are independent checks. For strongest assurance, do both.

# Verifying the PGP Signature  {#Checking}

**Goal:** Confirm that the file you downloaded was actually signed by an
Apache release manager, and has not been modified since.

The following example uses [The GNU Privacy Guard](http://www.gnupg.org/).
Any [OpenPGP](http://www.openpgp.org/)-compliant program should work
successfully.

This example assumes you've already downloaded `httpd-2.4.68.tar.gz`
(the release) and `httpd-2.4.68.tar.gz.asc` (the detached PGP signature).

First, check the detached signature against the release:

    % gpg --verify httpd-2.4.68.tar.gz.asc httpd-2.4.68.tar.gz
    gpg: Signature made Fri Jun  5 08:53:02 2026 EDT
    gpg:                using RSA key 65B2D44FE74BD5E3DE3AC3F082781DE46D5954FA
    gpg: Can't check signature: No public key

The "Can't check signature" output means that you don't have the release
manager's public key (`65B2D44FE74BD5E3DE3AC3F082781DE46D5954FA`) in your
local system. You need to import it.

The recommended way is to download the KEYS file maintained by the Apache
HTTP Server project, which contains the public keys of all release managers:

    % wget https://downloads.apache.org/httpd/KEYS
    % gpg --import KEYS
    gpg: key 8B3A601F08C975E5: public key "Jim Jagielski <jim@apache.org>" imported
    gpg: key 193F180AB55D9977: public key "William A. Rowe, Jr. <wrowe@rowe-clan.net>" imported
    gpg: key 4C042818311A3DE5: public key "Ruediger Pluem <rpluem@apache.org>" imported
    ...
    gpg: key 82781DE46D5954FA: public key "Eric Covener <covener@apache.org>" imported
    gpg: key EC99EE267EB5F61A: public key "Yann Ylavic <ylavic@apache.org>" imported
    gpg: key 5A4B10AE43B56A27: public key "Joe Orton (Release Signing Key) <jorton@apache.org>" imported
    gpg: key 19B033D1760C227B: public key "Christophe JAILLET <christophe.jaillet@wanadoo.fr>" imported
    gpg: key D377C9E7D1944C66: public key "Stefan Eissing (icing) <stefan@eissing.org>" imported
    gpg: Total number processed: 69
    gpg:               imported: 41

This imports the public keys of all current and past httpd release managers
into your local keyring.

Now let's verify the release signature again:

    % gpg --verify httpd-2.4.68.tar.gz.asc httpd-2.4.68.tar.gz
    gpg: Signature made Fri Jun  5 08:53:02 2026 EDT
    gpg:                using RSA key 65B2D44FE74BD5E3DE3AC3F082781DE46D5954FA
    gpg: Good signature from "Eric Covener <covener@apache.org>" [unknown]
    gpg:                 aka "Eric Covener <ecovener@us.ibm.com>" [unknown]
    gpg: WARNING: This key is not certified with a trusted signature!
    gpg:          There is no indication that the signature belongs to the owner.
    Primary key fingerprint: 65B2 D44F E74B D5E3 DE3A  C3F0 8278 1DE4 6D59 54FA

This output confirms that the signature on the file is valid. The
WARNING indicates that you have not established a trust relationship with
this key in your local GPG configuration. Since you obtained the key from
a trusted source (downloads.apache.org over HTTPS), you can be confident that
the key is genuine.

If you'd like to understand the PGP trust model, the "web of trust," and
how you would establish such a trust relationship with this key, please
see the GNU Privacy Handbook: 
[Validating other keys on your public keyring](https://www.gnupg.org/gph/en/manual/x332.html).

# Verifying the Hash  {#Hashes}

**Goal:** Confirm the file was not corrupted or truncated during download.
This is independent of PGP — it does not prove who released the file, only
that what you received matches what was published.

Download the source and the corresponding hash file. For example, to verify
the 2.4.68 release, you should end up
with two files:

  * `httpd-2.4.68.tar.gz` (source)
  * `httpd-2.4.68.tar.gz.sha256` (SHA256 hash)

SHA512 hashes (`.sha512`) are also available and may be used the same way.

On most Unix systems, verification is a single command:

    % shasum -a 256 -c httpd-2.4.68.tar.gz.sha256
    httpd-2.4.68.tar.gz: OK

This checks that the SHA256 hash contained in the `.sha256` file matches
the hash calculated from your downloaded file. A result of `OK` means they
match.

Alternatively, you can calculate the hash yourself and compare manually:

    % openssl sha256 -r httpd-2.4.68.tar.gz
    fa53c95631febb08a9de41fd2864cfff815cf62d9306723ab0d4b8d7aa1638f0 *httpd-2.4.68.tar.gz

Then verify that the content of `httpd-2.4.68.tar.gz.sha256` matches the
output above.
