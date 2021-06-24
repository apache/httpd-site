Title: mod_fcgid - FastCGI interface module for Apache 2
license: https://www.apache.org/licenses/LICENSE-2.0

# Introduction

`mod_fcgid` is a high performance alternative to mod_cgi or mod_cgid, which
starts a sufficient number instances of the CGI program to handle
concurrent requests, and these programs remain running to handle further
incoming requests. It is favored by the PHP developers, for example, as a
preferred alternative to running mod_php in-process, delivering very
similar performance.

# mod_fcgid 2.3.9 released <span>2013-10-08</span>

The Apache Software Foundation and the Apache HTTP Server Project are
pleased to announce the release of version 2.3.9 of mod_fcgid, a FastCGI
implementation for Apache HTTP Server versions 2.0, 2.2, and 2.4.  This
version of mod_fcgid is a security release.

You can get the source from [your local
mirror](/download.cgi#mod_fcgid) 

Development of mod_fcgid can be followed through the
[Subversion](http://subversion.apache.org/) repositories. For public access
you can use:

    % svn checkout http://svn.apache.org/repos/asf/httpd/mod_fcgid/trunk mod_fcgid

# Documentation

The [mod_fcgid reference page](mod/mod_fcgid.html) will get you started.

See the
[README-FCGID](http://svn.apache.org/repos/asf/httpd/mod_fcgid/trunk/README-FCGID)
file distributed with the module's source code for additional build and
installation notes.

# Mailing Lists

Discussions of `mod_fcgid` take place on the [Apache HTTP Server mailing
lists](../lists.html) , including the following:

-  [User support and discussion](../lists.html#http-users) 

-  [Development discussions](../lists.html#http-dev) 

-  [svn commit logs for httpd, including mod_fcgid](../lists.html#http-cvs) 

# History

`mod_fcgid` was created by Ryan Pan (Pan Qingfeng, pqf or 潘庆峰) in
2004 as a new FastCGI implementation, and was granted to the ASF as an
Apache HTTP Server subproject in 2009, shepherded by Chris Darroch
(chrisd).

