Title: libapreq download
license: https://www.apache.org/licenses/LICENSE-2.0

# Downloading libapreq  {#Download}

Download libapreq from the
[distribution directory](https://downloads.apache.org/httpd/libapreq/).
You **must** [verify the integrity](#verify) of the downloaded files using
signatures downloaded from the same location.

# Apache HTTP Request Library 2.17  {#v2_17}

This release works with Apache HTTP Server 2.4. It will not work with
older 1.3.x releases, and is not tested against (unsupported) 2.0 or 2.2
releases.

[libapreq2-2.17](https://downloads.apache.org/httpd/libapreq/libapreq2-2.17.tar.gz) 
[ [PGP](https://downloads.apache.org/httpd/libapreq/libapreq2-2.17.tar.gz.asc) ] [ [SHA256](https://downloads.apache.org/httpd/libapreq/libapreq2-2.17.tar.gz.sha256) ] [ [SHA512](https://downloads.apache.org/httpd/libapreq/libapreq2-2.17.tar.gz.sha512) ]

# Apache HTTP Request Library 1.34  {#v1_03}

This release works with Apache HTTP Server 1.3 (which is EOL). It will not work with
newer 2.x releases. Use [libapreq2-2.17](#v2_17) for Apache HTTP Server 2.4.

[libapreq-1.34](https://downloads.apache.org/httpd/libapreq/libapreq-1.34.tar.gz) 
[ [PGP](https://downloads.apache.org/httpd/libapreq/libapreq-1.34.tar.gz.asc) ] 
[ [MD5](https://downloads.apache.org/httpd/libapreq/libapreq-1.34.tar.gz.md5) ]

# Verify the integrity of the files  {#verify}

Verify the integrity of downloaded files using PGP signatures. First
download the [KEYS](https://downloads.apache.org/httpd/KEYS) file and the
`.asc` signature for the distribution you downloaded. Then verify using:

    % gpg --import KEYS
    % gpg --verify libapreq2-2.17.tar.gz.asc libapreq2-2.17.tar.gz

You can also verify using the SHA256 or SHA512 hashes:

    % shasum -a 256 -c libapreq2-2.17.tar.gz.sha256

