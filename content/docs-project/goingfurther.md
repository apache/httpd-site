Title: Translations - Documentation Project
license: https://www.apache.org/licenses/LICENSE-2.0

# Introduction #

In order to work more efficiently with your translations and keep them
up-to-date, it's recommended that
you download the svn repository into your computer, so you can regularly check what
english files have been updated since your last visit/change, and transfer these
changes to your existing translated files. Also, in this manner, you will be
able to build locally the doc (transform it to HTML files) in order to see how
your changes look like.

Doc manual is divided in branches:

- <b>trunk:</b> It's the development branch; in other words, 2.4 branch plus new
  features, changes; you allways must begin to translate files in this branch,
  then port your work to other branches.
- <b>2.4:</b> It's the current stable branch, recommended for a prod server

Good to see [what has already been
translated](http://home.apache.org/~takashi/translation-status/test.html#2.4) and
whether it's up to date or not.

# Downloading svn repository #

In order to work properly, you have to download the `doc` tree (svn repository) onto
your computer:

- Create a directory called <b>"httpd-doc"</b> on your computer : `mkdir
  httpd-doc`
- cd to this directory: `cd httpd-doc`
- Download svn repository:
	- `svn co https://svn.apache.org/repos/asf/httpd/httpd/trunk/docs
	  httpd-trunk`
	- `svn co
	  https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x/docs
	  httpd-2.4`</br>
    
  **Note:** SVN is a powerful program; see more [here](svn.html) and of course
  "`svn --help`" or "`man svn`" if you work in a Unix-like environment.	  

# New translations #

Translate documents that are not yet translated as shown in [Translations
document](translations.html).

# Maintaining your translations #

There are several ways to do that.
Here is the method I use since several years; its probably not the best, but it
will help you to get started.

- cd to your repository root <b>"httpd-doc"</b>

- Create a directory called <b>"working"</b> (it will be used later): `mkdir
  working`

- Create a directory called <b>"sav"</b> (reference directory for updates detection -
  see below): `mkdir sav`
- Copy svn repository you downloaded above in <b>"sav"</b> directory:
	- `cp -a httpd-trunk sav`
	- `cp -a httpd-2.4 sav`

- Once you have finished to work on a file, say <b>file.xml.fr</b>, save it to
  corresponding directory in sav tree, along with its english version
  <b>file.xml</b>;
  you'll understand why in a next step.
- Say a week later, you wish to see if doc gurus have made some changes: cd to
  your repository root <b>"httpd-doc"</b> which contains the different branches.
  
- Copy [this script](modifs-detection) in <b>"httpd-doc"</b> directory and launch it
  from there.
Modifications will be displayed for each branch.

- Suppose modifications for 2.4 branch contains this line:<br />

	<b>U manual/bind.xml</b><br/>

	That means manual/bind.xml file has been modified since your last visit.
In order to check these modifications, you have to compare the last version of
manual/bind.xml with the one you have saved above into the <b>"sav"</b> directory
during your last working session; for
this purpose, you can use the diff command this way:<br />

	`diff sav/httpd-2.4/manual/bind.xml httpd-2.4/manual/bind.xml > working/diff-bind`

- `working/diff-bind` file covers now all modifications you have to transfer after
  translation to your own bind.xml.ll (ll-> Local Language), say bind.xml.fr for a (good) example.

- When you're finished, don't forget to save your work  (new versions of
  bind.xml and bind.xml.fr in the appropriate <b>"sav"</b> subdirectory).

- In order to check how your modifications look like, you have to build the docs
  to generate HTML files from xml ones (see [this document](docsformat.html)).

- Once you're satisfied with your work, submit a patch to [https://bz.apache.org/bugzilla/](https://bz.apache.org/bugzilla/)


# Questions #

Feel free to send your questions to docs@httpd.apache.org
