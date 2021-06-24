Title: Documentation Project: Subversion
license: https://www.apache.org/licenses/LICENSE-2.0

# Documentation Project: Subversion #

The documentation of the Apache HTTP Server is in the same Subversion
revision control repository as the code. If you wish to work on the
documentation, you can check out the entire source code repository, or just
the documentation.

To check out the entire repository, you'll do the following:

    svn checkout https://svn.apache.org/repos/asf/httpd/httpd/trunk httpd-trunk
    svn checkout https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x httpd-2.4

By checking out both trunk and 2.4, you'll be able to submit patches
against both the development version, and the current latest released
version.

To check out just the documentation portion of the repository, append '
`/docs` ' to the end of the checkout URLs shown above. This will give you a
much smaller checkout, but perhaps you'll lack some of the resources you
might need to verify your documentation changes.

# Creating a patch #

Once you have a checkout, creating a patch takes four steps.

1. 
Update your checkout, to be sure that you have the latest changes in the
repository, in case someone else has changed something since the last time
you worked on the docs:

<div class="example"><pre>
svn update
</pre></div>

1. 
Edit the file that you wish to modify. Make the desired changes, and then
save your changes. Documentation files are in the `/docs/manual` subdirectory
of your checkout.

1. 
At the command line, type the following to create a patch file:

<div class="example"><pre>
svn diff &gt; patch.txt
</pre></div>

1. 
Send email to the `docs@httpd.apache.org` mailing list and attach
`patch.txt`.

If you have more than one changed file, you can supply the file name on the
`svn diff` command line, in order to just record the changes in one file.

<div class="example"><pre>
svn diff mod_rewrite.xml &gt; mod_rewrite_patch.txt
</pre></div>

# See Also #

See also the document on [documentation format and
transformation](docsformat.html) for details about verifying that your
changes are compliant with our documentation format and standards. In your
email message, indicate what branch of the code the patch is against
(trunk, 2.4, 2.2, etc.) what file(s) are affected, and what change you are
making. If it's in reference to a specific bug ticket, mention that, too.

