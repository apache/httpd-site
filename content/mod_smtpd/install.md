Title: mod_smtpd - Modular SMTP Server for Apache 2.2 Installation
license: https://www.apache.org/licenses/LICENSE-2.0

# Installation instructions #

`mod_smtpd` is very easy to install and setup. First, we need to build the
module and make the Apache HTTPd webserver load it. Then, we'll setup our
archives repository and complete Apache's configuration.

`mod_smtpd` has, of course, some requirements :

- Apache HTTPd &gt;= 2.2 ( `mod_smtpd` has been tested succesfully with
Apache 2.2.0 and 2.3.0-dev)

- APR and APR-Util &gt;= 0.9

- libapreq2

# Download and build #

Checkout sources via Subversion :
`
    svn checkout https://svn.apache.org/repos/asf/httpd/mod_smtpd/trunk
    mod_smtpd
  ` 
Then, build `mod_smtpd` :
<code>./autogen.sh<br></br>./configure<br></br>make clean all<br></br>su -c
'make install'</code>
Refer to the configure help ( `./configure --help` ) if you need a to
specify an installation prefix ( `--prefix=...` ) or any other specific
setup.

# Preliminary Apache setup #

The next step is to make Apache HTTPd load the `mod_smtpd` module at
runtime. Edit your Apache configuration file, and add the following to the
rest of the `LoadModule` lines :
`
    LoadModule smtpd_module /usr/lib/apache2/modules/mod_smtpd.so
  ` 
Or replace that directory with your default Apache 2.2 install directory.

# mod_smtpd configuration #

You now need to configure Apache to run mod_smtpd whenever a network
connection comes in. We recommend this virtual host setup:
<code>NameVirtualHost *:80<br></br>NameVirtualHost
*:25<br></br><br></br>&lt;VirtualHost *:80&gt;<br></br># your webserver
configuration here<br></br>&lt;/VirtualHost
&gt;<br></br><br></br>&lt;VirtualHost *:25&gt;<br></br>ServerName localhost
# or whatever desired<br></br>SmtpProtocol On<br></br># addition mod_smtpd
or associated plugin configuration here<br></br>&lt;/VirtualHost
&gt;<br></br></code>
