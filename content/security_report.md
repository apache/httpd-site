Title: Reporting Security Problems with Apache
license: https://www.apache.org/licenses/LICENSE-2.0

# Security Updates  {#discovering}

Lists of security problems fixed in released versions of the Apache HTTP
Server are available:

-  [Apache 2.4 Security Vulnerabilities](/security/vulnerabilities_24.html) 

To get notification of when new security issues are fixed, join the [Apache
HTTP Server Announcements
list](/lists.html#http-announce) 

# Reporting New Security Problems with the Apache HTTP Server  {#reporting}

The Apache Software Foundation takes a very active stance in eliminating
security problems and denial of service attacks against the Apache HTTP
server.

We strongly encourage folks to report such problems to the private security
mailing list of the ASF Security Team, before disclosing them in a public
forum.

Please see the page of the [ASF Security
Team](https://www.apache.org/security/) for further information and contact
information.

**The Security Team cannot accept regular bug reports or other queries, we
ask that you use our [bug reporting page](/bug_report.html) for
those.**

**<font color="red">All mail sent to the Security Team that does
not relate to security problems in Apache software will be
ignored.</font>** 

Note that all networked servers are subject to denial of service attacks,
and we cannot promise magic workarounds to generic problems (such as a
client streaming lots of data to your server, or re-requesting the same URL
repeatedly). In general our philosophy is to avoid any attacks which can
cause the server to consume resources in a non-linear relationship to the
size of inputs.

[More security
tips](/docs/trunk/misc/security_tips.html) 

# Security Standards  {#standards}

Apache HTTP Server vulnerabilities are labelled with
[CVE](http://cve.mitre.org) (Common Vulnerabilities and Exposures)
identifiers.

# Impact of third-party issues {#thirdparty}

This section describes issues that are not directly present in
Apache HTTP Server.

## CVE-2023-44487 HTTP/2 'Rapid Reset' {#CVE-2023-44487}

Apache HTTP Server is not impacted by the problem described in
[CVE-2023-44487](https://www.cve.org/CVERecord?id=CVE-2023-44487):
the long-standing measures we have in place to limit excessive load
from clients are effective in this scenario. The attack described
will cause extra CPU usage on your Apache HTTP Server process, but
not impact any backends.

As an extra mitigation, if you upgrade the [libnghttp2](http://nghttp2.org/)
dependency of `mod_http2` to [at least version 1.57.0](https://github.com/nghttp2/nghttp2/releases/tag/v1.57.0)
this will completely remove the impact from Rapid Reset exploits.


# Historical Releases  {#historical}

Earlier versions of Apache HTTP Server are no longer receiving security
updates and should not be used.

-  [Apache 2.2 Historical Security Vulnerabilities (2005-2017)](/security/vulnerabilities_22.html)

-  [Apache 2.0 Historical Security Vulnerabilities (2002-2013)](/security/vulnerabilities_20.html)

-  [Apache 1.3 Historical Security Vulnerabilities (1998-2010)](/security/vulnerabilities_13.html) 

