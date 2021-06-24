Title: mod_ftp - FTP Protocol module for Apache 2
license: https://www.apache.org/licenses/LICENSE-2.0

# Introduction #

`mod_ftp` is a FTP Protocol module to serve httpd content over the FTP
protocol (whereever the HTTP protocol could also be used). It provides both
RETR/REST retrieval and STOR/APPE upload, using the same user/permissions
model as httpd (so it shares the same security considerations as mod_dav
plus mod_dav_fs).

# Get It! #

`mod_ftp` 0.9.6 is released as beta, and you can get the source from
[your local mirror](https://httpd.apache.org/download.cgi#mod_ftp).

Development of mod_ftp can be followed through the
[Subversion](http://subversion.apache.org/) repositories. For public access
you can use :

    % svn checkout http://svn.apache.org/repos/asf/httpd/mod_ftp/trunk/ mod_ftp

# Documentation #

The [ftp documentation](ftp/index.html) starting page and the [mod_ftp
reference page](mod/mod_ftp.html) will get you started.

See the
[README-FTP](http://svn.apache.org/repos/asf/httpd/mod_ftp/trunk/README-FTP)
file distributed with the module's source code for additional build and
installation notes.

# Mailing Lists #

Discussions of `mod_ftp` take place on the main HTTPD development mailing
list.

-  [dev@httpd.apache.org](mailto:dev-subscribe@httpd.apache.org) -
development (
[archives](http://mail-archives.apache.org/mod_mbox/httpd-dev/) ).

-  [cvs@httpd.apache.org](mailto:cvs-subscribe@httpd.apache.org) - svn
commit logs for httpd, including mod_ftp (
[archives](http://mail-archives.apache.org/mod_mbox/httpd-cvs/) ).

# History #

`mod_ftp` was created by Covalent in 2001, granted to the ASF and entered
incubation in 2005, and was graduated as a subproject of the HTTP Server
Project in 2007.

