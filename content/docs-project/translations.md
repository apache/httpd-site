Title: Translations - Documentation Project
license: https://www.apache.org/licenses/LICENSE-2.0

# Welcome ! #

We encourage translations of the documentation into other languages and thank
you in advance for your contribution. If you would like to assist in translating
the docs, please start by reading the general [documentation project
information](./) , and subscribing to the [documentation project mailing
list](http://mail-archives.apache.org/mod_mbox/httpd-docs/). The documentation
project participants are usually very willing to help you with any questions or
technical difficulties that may arise during your work.

# Getting Started #

To get started translating whole or part(s) of the doc and keep it up to date,
you'll need to do the following.

- Join the docs mailing list by sending a message to
  [docs-subscribe@httpd.apache.org](mailto:docs-subscribe@httpd.apache.org).

- Send a message to the list above to say that you wish to get involved in
  translating the doc into your language. Maybe there's already in place a
  translation team for your language that will help you in your work.

- Let's suppose you look at http://httpd.apache.org/docs/trunk/configuring.html
  and see that there's no version of this page in your language.

- Get english version of the source file [here](https://svn.apache.org/repos/asf/httpd/httpd/trunk/docs/manual/configuring.xml)
  Note that you must download the .xml file, not the .html one.

- Make a copy of that file with the two-letter file extension representing your
  language. For example, for a Spanish translation, you'd copy `configuring.xml`
  to `configuring.xml.es`. You are now ready to start well said translation :

	- If your language contains accented and/or multi-bytes characters, set
	  your text editor encoding to "UTF-8" , and check that the first line
	  of the file is:<br />
	  <?xml version="1.0" encoding="UTF-8" ?>
	- In the header, replace the string "$LastChangedRevision:" by the
	  string "English Revision:"
	- Make sure you put your name at the top of the file if you are
	  translating or reviewing the documentation like this:<br />
	  &lt;!-- French translation : &lt;translator name&gt; --&gt;<br />
	  &lt;!-- Reviewed by : &lt;reviewer name&gt; --&gt;
	- Translate all textual portions of the document, leaving directives,
	  examples, and other literal code portions unchanged.
	- What has to be translated ? All text parts between &lt;p&gt; and
	  &lt;/p&gt;, &lt;title&gt; and &lt;/title&gt;, &lt;description&gt; and
	  &lt;/description&gt;, &lt;name&gt; and &lt;/name&gt;,
	  &lt;compatibility&gt; and &lt;/compatibility&gt;, &lt;note&gt; and
	  &lt;/note&gt;, &lt;li&gt; and &lt;/li&gt;, &lt;dd&gt; and &lt;/dd&gt;.
  - We strongly encourage xml file to fit within <b>80</b> console width, so
    it is easy for any maintainer to review the files. Exceptions do happen for
    complex xml tags and unspaced languages such as Chinese and Japanese.

- Send your results - either complete files, or the output of `svn diff` to the
  docs mailing list, in order someone can commit it to the repository.  Eventually,
  you can do this step yourself.

# Going further ! #

If you wish to go further in translating of the doc, in other words maintaining
your translations and keep them up-to-date, read [this
document](goingfurther.html).







# Related Information #

Please note the following documents. They give you further information which may
be helpful.

- The [Documentation Format and
  Transformation](http://httpd.apache.org/docs-project/docsformat.html) page
  gives some information about the transformation from xml to html.
  Translations of documentation for Apache version 2.0 and higher should be sent
  as xml file. Committers will take care of generating and committing the
  corresponding html file.

# Review Standards #

Because English is the main development language of the Apache HTTP Server, it
is difficult for the developers to check the quality of documentation submitted
in other languages. Therefore, we require that all translated documentation be
reviewed by another fluent speaker of the relevant language, before it can be
accepted. Each commit message should list the reviewer. If the translator is not
the same as the committer, the translator should also be named in the commit
message.

We also encourage you to place the name of the translator in a comment at the
top of the file, like this:

  &lt;!-- ===================================================== Translated by:
   Nilgün Belma Bugüner &lt;nilgun belgeler.org&gt; Reviewed by: Orhan Berent
  &lt;berent belgeler.org&gt;
  ========================================================== --&gt;
 
The build system keeps track of the svn revision number of the equivalent
English version, so that future translators have an idea of where they need to
start.


