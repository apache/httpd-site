Title: Apache Development Notes
license: https://www.apache.org/licenses/LICENSE-2.0

# Apache Development Notes

This page is intended to provide some basic background about development
nits and the maintenance of the developer site.

# Overview #

The Apache HTTP Server Project uses
[Subversion](http://subversion.apache.org/) for hosting its source code.

To check out the 2.4.x branch:

> `
svn checkout http://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x
httpd-2.4.x
` 

To check out the current development version (as of this writing, 2.5.x),
use:

> `
svn checkout http://svn.apache.org/repos/asf/httpd/httpd/trunk httpd-trunk
` 

Committers should check out via https instead of http (so that they can
commit their changes). For more info about Subversion, please read [the ASF
version control FAQ](https://www.apache.org/dev/version-control.html).

The developers continue to seek to maintain module compatibility between
2.4.1 and future 2.4 releases for administrators and end users.

# Maintaining the Sources #

Almost all files relating to Apache, both the actual sources and the files
that aren't part of the distribution, are now maintained in an
[SVN](http://subversion.apache.org/) repository. Here is the way in which
changes are applied:

1. Developer checks out a copy of the files on which they want to work (in
   this case, the trunk), into a private working directory
   called <samp>httpd-trunk</samp>:

   <samp>% svn checkout http://svn.apache.org/repos/asf/httpd/httpd/trunk
   httpd-trunk</samp>

   This step only needs to be performed once (unless the private working
   directory is tainted or deleted). Committers should use a URL prefix
   of <samp>https</samp> on the checkout, to save themselves headaches later.

1. Developer keeps their working directory synchronised with changes made to
   the repository:

   <samp>% svn update httpd-trunk</samp>

   This should probably be done daily or even more frequently during periods
   of high activity.

1. Developer makes changes to their working copies, makes sure they work, and
   generates a patch so others can apply the changes to test them:

   <samp>% svn diff httpd-trunk/modules/http/mod_mime.c &gt;
   /tmp/foo</samp>

   The <samp>/tmp/foo</samp> file is mailed to the [developers
   list](http://httpd.apache.org/lists.html#http-dev) so they can consider the
   value/validity of the patch. It is worth making sure your code follows the
   Apache style, as described in the [style guide](styleguide.html).

1. Once other developers have agreed that the change is a Good Thing, the
   developer checks the changes into the repository:

   <samp>% svn commit httpd-trunk/modules/http/mod_mime.c</samp>

# SVN Subtrees #

There are several different branches under the <samp>httpd</samp> subtree in
the Apache SVN repository that pertain to the different releases. The top
level can be perused with the [SVN
ViewCVS](http://svn.apache.org/viewcvs.cgi/) pages. The main subtrees
pertaining to the <samp>httpd</samp> server source are:

## httpd-2.4 ##

To create a directory tree containing the 2.4 sources, and call
it <samp>httpd-2.4</samp>, change your current directory to the *parent* of
the tree and then check the 2.4 sources out as follows:

    % cd /usr/local/apache
    % svn checkout http://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x httpd-2.4

## httpd-2.5 ##

If you want to check out the bleeding edge of development, the httpd-2.5
development tree (slated for a release 2.6), and call
it <samp>httpd-trunk</samp>, checkout as follows:

    % cd /usr/local/apache
    % svn checkout http://svn.apache.org/repos/asf/httpd/httpd/trunk httpd-trunk

## httpd-site ##

> httpd-site is no longer in the Apache CMS system. It has moved to `https://github.com/apache/httpd-site/`.
> The following paragraphs are obsolete.

This subtree contains the files that live
at <samp>http://httpd.apache.org/</samp>. The directory on the host that
maps to that URL is actually a set of checked-out working copies of the SVN
files.

Basic changes can be made to this website in your browser by using the ASF CMS system. 

First, add this as a bookmark: 

&nbsp; &nbsp; javascript:void(location.href='https://cms.apache.org/redirect?uri='+escape(location.href))

Then browse to the page you'd like to edit, and  click the CMS bookmark.
The CMS system allows you to edit, commit, preview in staging, then push to production from a browser interface.  


The SVN URL
is <samp>https://svn.apache.org/repos/asf/httpd/site/trunk/docs</samp>.
<make_note> It is important that the files on the Web host not be modified
directly. If you want or need to change one, check it out into a private
working copy, modify **that** , commit the change into SVN, and then
perform a <samp>svn update</samp> to bring the host directory into sync with
the SVN sources.</make_note>
The Web site *directories* (as opposed to files) are not maintained in
synch with the SVN files automatically. They are manually updated from SVN
by various people as they consider appropriate. This is usually not an
issue, unless a group of files are being updated according to an ongoing
group discussion.

## httpd-dist ##

Like the <samp>httpd-site</samp> subtree, this one is used to maintain the
files that comprise a website - in this
case, <samp>http://downloads.apache.org/httpd/</samp>. Also like the previous
subtree, the directory on the server is a checked-out working copy of this
subtree. However, since this is a distribution directory, we only have the
surrounding documentation and control files checked into this subtree --
the actual tarballs are simply copied to www.apache.org.

The SVN URL
is <samp>https://svn.apache.org/repos/asf/httpd/httpd/dist</samp>.

Committers will generally deal with this subtree when "rolling" a release.
This is a series of steps taken to create a complete new release of the
Apache httpd software. Amongst other things, the key to this subtree is
the <samp>tools/</samp> directory, which contains
the <samp>release.sh</samp> shell script. More information on the policies
and procedures relating to rolling releases can be found on the [Release
Guidelines](release.html) page.

# Setting Up Remote SVN #

A brief overview of getting started with SVN committer access can be found
[here](http://www.apache.org/dev/version-control.html#https-svn). One key
change to note is that SSH is not used anymore for committer access, due to
the functional differences with SVN.

# Working with git / GitHub #

Our project is read-only mirrored by GitHub, and users contributors
occasionally open pull requests there.  We cannot directly accept/close
pull requests, but we can comment/review and then commit the patches. The
commit message can contain the phrase "this closes #X" where X is the 
pull request number which will be prominent in the interface.

  - <https://github.com/apache/httpd>
  - <https://github.com/apache/httpd/pulls>

An example revision that closes a pull request is <http://svn.apache.org/viewvc?view=revision&revision=1780308>

# Continuous integration (CI) #

[Travis](https://travis-ci.com/) CI services are used.

This service allows us to automatically build httpd on different processors, OS,
with different gcc vesions, with different library versions and with different
configurations.
On successul built, our [Perl test framework](http://svn.apache.org/viewvc/httpd/test/framework/trunk/)
is also automatically executed.

All this is executed for each commit.

The goal is to spot early new build issues and regression.

Should a committer want to commit something, without triggering the whole process
(doc change or STATUS update for example), he can add the magic "[skip ci]"
keyword as part of the commit message.


Here are the [latest built results](https://travis-ci.com/github/apache/httpd).
