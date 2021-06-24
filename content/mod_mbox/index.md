Title: mod_mbox - Mailing list archives browser
license: https://www.apache.org/licenses/LICENSE-2.0

# Mailing list archives browser #

`mod_mbox` is a mailing list archive browser. Functionality includes:

- A dynamic browsing interface, using AJAX (Asynchronous Javascript And
XML)

- A flat, Javascript-less interface, using static XHTML

- Mail attachments and MIME parts viewing and downloading

# News #

**July and August 2005** - Summer Of Code projects ( `httpd-mbox-if` and
`httpd-mbox-search` ) renew and improve the module.

**July 17, 2001** - First `mod_mbox` release.

# Documentation #

-  [Installation instructions](install.html) 

- Configuration directives [reference](ref.html) 

# Mailing Lists #

Discussions on mod_mbox take place on the main HTTPd development mailing
list.

-  [dev@httpd.apache.org](mailto:dev-subscribe@httpd.apache.org) - module
development (
[archives](http://mail-archives.apache.org/mod_mbox/httpd-dev/) ).

-  [cvs@httpd.apache.org](mailto:cvs-subscribe@httpd.apache.org) - svn
commit logs for httpd, including mod_mbox (
[archives](http://mail-archives.apache.org/mod_mbox/httpd-cvs/) ).

# Subversion repository #

Development of mod_mbox can be followed through the
[Subversion](http://subversion.apache.org/) repositories. For public access
you can use :

    % svn checkout http://svn.apache.org/repos/asf/httpd/mod_mbox/trunk/
    mod_mbox

# History #

`mod_mbox` was originally written by **Justin Erenkrantz** in 2001, and
**Paul Querna** also worked on the module from time to time. More recently,
**Maxime Petazzoni** and **Russell Johnson** joined the "team" as Summer Of
Code students. Russell implemented the full text search in `mod_mbox` ,
while Maxime worked on improving the module's user interface.

