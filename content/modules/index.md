Title: Apache httpd Modules
license: https://www.apache.org/licenses/LICENSE-2.0

# Apache httpd Modules

The following page highlights some modules that the Apache HTTP Server
Project maintains that are not included in the core distribution.

The listing of all modules included in the core distribution can be found in
the online [documentation](../docs/current/mod/).

Finally, we do not maintain any detailed listing of third-party modules. You
should use your favorite search engine, or have a look at code source
repositories such as [GitHub](https://github.com).

# mod_fcgid  {#mod_fcgid}

Does your CGI performance leave you wanting? Is mod_perl simply too much
effort for just hosting your CGI scripts? Do you want to run PHP
applications outside of your web server processes? FastCGI is the solution
for you!

`mod_fcgid` is an implementation of FastCGI for Apache HTTP Server 2.0 and
later which routes requests to FastCGI application processes which it
manages.

- [Website](/mod_fcgid/) 

- Download: [mod_fcgid current release](/download.html#mod_fcgid) 

- Source code: [mod_fcgid subversion trunk](https://svn.apache.org/viewcvs.cgi/httpd/mod_fcgid/trunk/) 

- Mailing list: [dev@httpd.apache.org](mailto:dev-subscribe@httpd.apache.org) 

# mod_ftp  {#mod_ftp}

When is Apache HTTP Server not an http: server? When it's serving the same
web content, via an ftp: protocol request!

This code is currently released as a beta. Volunteers are especially sought
to test out the IPv6 functionality (EPRT and EPSV support).

- [Website](/mod_ftp/) 

- Download: [mod_ftp current release](/download.html#mod_ftp) 

- Source code: [mod_ftp subversion trunk](https://svn.apache.org/viewcvs.cgi/httpd/mod_ftp/trunk/) 

- Mailing list: [dev@httpd.apache.org](mailto:dev-subscribe@httpd.apache.org) 

# mod_domain  {#mod_domain}

Sick of keeping your DNS records and Apache config IPs and CNAMEs in sync?
Let Apache serve your DNS for you based on your httpd.conf! Try out
`mod_domain`.

This experimental code has **not** been released, but is available to you
from the subversion development repository.

- Source: [mod_domain](https://svn.apache.org/repos/asf/httpd/sandbox/mod_domain/) 

- ViewVC: [mod_domain](https://svn.apache.org/viewvc/httpd/sandbox/mod_domain/) 

- Mailing list: [dev@httpd.apache.org](mailto:dev-subscribe@httpd.apache.org) 

# mod_mbox  {#mod_mbox}

Do you want to set up mail archives with Apache HTTPd 2.x ? Try out
`mod_mbox`.

This experimental code has **not** been released, but is available to you
from the subversion development repository. It is currently in-use by the
ASF to provide our [email archives browser.](http://mail-archives.apache.org/mod_mbox/) 

- [Website](/mod_mbox/) 

- Source: [mod_mbox trunk](https://svn.apache.org/repos/asf/httpd/mod_mbox/trunk/) 

- ViewVC: [mod_mbox](https://svn.apache.org/viewvc/httpd/mod_mbox/trunk/) 

- Mailing list: [dev@httpd.apache.org](mailto:dev-subscribe@httpd.apache.org) 

# mod_pop3  {#mod_pop3}

Do you want to see how Apache httpd-2.0 can handle different protocols?
Play with `mod_pop3`.

This experimental code has **not** been released, but is available to you
from the subversion development repository.

- Source: [mod_pop3](https://svn.apache.org/repos/asf/httpd/sandbox/mod_pop3/) 

- ViewVC: [mod_pop3](https://svn.apache.org/viewvc/httpd/sandbox/mod_pop3/) 

- Mailing list: [dev@httpd.apache.org](mailto:dev-subscribe@httpd.apache.org) 

# mod_arm4  {#mod_arm4}

Instrument the Apache HTTP Server to the [ARM4
API](http://www.opengroup.org/tech/management/arm/) 

This experimental code has **not** been released, but is available to you
from the subversion development repository.

- Source: [mod_arm4](https://svn.apache.org/repos/asf/httpd/sandbox/mod_arm4/) 

- ViewVC: [mod_arm4](https://svn.apache.org/viewvc/httpd/sandbox/mod_arm4/) 

- Mailing list: [dev@httpd.apache.org](mailto:dev-subscribe@httpd.apache.org) 

# mod_smtpd  {#mod_smtpd}

This experimental code has **not** been released, but is available to you
from the subversion development repository.

Serve SMTP on Apache with `mod_smtpd`.

-  [Website](/mod_smtpd/) 

- Source: [mod_smtpd](https://svn.apache.org/repos/asf/httpd/sandbox/mod_smtpd/) 

- ViewVC: [mod_smtpd](https://svn.apache.org/viewvc/httpd/sandbox/mod_smtpd/) 

- Mailing list: [dev@httpd.apache.org](mailto:dev-subscribe@httpd.apache.org) 

# Sandbox  {#sandbox}

The sandbox is where unreleased code goes to play. Browse around for some
goodies that are not part of the normal Apache HTTP Server distribution,
but may give you an idea about ways you can extend the server. Someone may
be actively working on these bits, but they may be completely unmaintained!

- Source: [Sandbox](https://svn.apache.org/repos/asf/httpd/sandbox/) 

- ViewVC: [Sandbox](https://svn.apache.org/viewvc/httpd/sandbox/) 

# mod_aspdotnet (retired from the ASF)  {#mod_aspdotnet}

The `mod_aspdotnet` module has been retired by the httpd project. Every ASF
project requires multiple developers, and this project did not have enough
developers participating to remain under the ASF umbrella. Development has
been resumed by the original authors at its new home, the [mod-aspdotnet
SourceForge project](http://sourceforge.net/projects/mod-aspdotnet). Note
there is NO further support or effort on this module from the httpd
project, refer all questions on to the SourceForge project's user and
development lists.

# mod_python (retired to the attic)  {#mod_python}

The Quetzalcoatl `mod_python` project has been retired to the attic. Note
there is NO further support or effort on this module from the httpd
project, see the attic information page below for further information. You
may also wish to research `mod_wsgi` , another effort outside of the ASF.

- Website: [Attic
Placeholder](https://attic.apache.org/projects/quetzalcoatl.html) 

