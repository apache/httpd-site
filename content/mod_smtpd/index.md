Title: mod_smtpd - Modular SMTP Server for Apache 2.2
license: https://www.apache.org/licenses/LICENSE-2.0

# Introduction #

`mod_smtpd` is a modular SMTP server similar in spirit to
[qpsmtpd](http://smtpd.develooper.com).

For developers it offers a dependable platform to quickly write a custom
SMTP application without the burdens of portability, protocol,
daemonization and/or process scheduling.

For system administrators it precludes the need for a separate SMTP daemon
and also allows for simple replacement of SMTP backend without having to
switch SMTP daemons (just load a different queue module!).

Features Include:

- Simple yet advanced plugin system based on Apache hooks.

- Close to nothing built in. All functionality is required by plugins.

- Use of Apache filters for the SMTP "DATA" command.

# Get It! #

`mod_smtpd` hasn't been released yet. It is still alpha quality and isn't
ready for production use. If you'd like to try it out development of
mod_smtpd can be followed through the
[Subversion](http://subversion.apache.org/) repositories. For public access
you can use :
`
    % svn checkout http://svn.apache.org/repos/asf/httpd/mod_smtpd/trunk/
    mod_smtpd
  ` 

# Documentation #

-  [Installation instructions](install.html) 

- More documentation coming soon!

# Mailing Lists #

Discussions on `mod_smtpd` take place on the main HTTPd development mailing
list.

-  [dev@httpd.apache.org](mailto:dev-subscribe@httpd.apache.org) - module
development (
[archives](http://mail-archives.apache.org/mod_mbox/httpd-dev/) ).

-  [cvs@httpd.apache.org](mailto:cvs-subscribe@httpd.apache.org) - svn
commit logs for httpd, including mod_mbox (
[archives](http://mail-archives.apache.org/mod_mbox/httpd-cvs/) ).

# History #

`mod_smtpd` started life as a 2005 Google Summer of Code project.

