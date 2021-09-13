Title: How to Contribute Patches to Apache
license: https://www.apache.org/licenses/LICENSE-2.0

# How to Contribute Patches to Apache

Third-party patches are essential to the success of Apache - the "core"
developers don't have access to all platforms, and we certainly aren't
using Apache in all the different ways it can be used. To that end, we try
to make it as easy as possible to contribute code. However, we do have some
expectations of contributors, and a process to all this, simply to help us
manage the flood of contributions we could get. This page describes that
process.

# Code Style #

We have a fairly firmly-set code format we use in our code; it was one we
arrived at through no small amount of debate. The format is described in
our official [style guide](styleguide.html). While there is some code in
the project that does not follow the style guide, it is generally safe to
assume that your code is wrong if it is not formatted like the other code
in the file.

We also have very high expectations for code quality; and to us this means
the avoidance of excessive static buffers, using the memory pool mechanism
(which ensures proper cleanup), and otherwise writing thread-safe code. We
also expect one or two levels of optimizations to be applied, too - is a
bitmask faster for this? Is a strchr() faster than an index()? Etc. Of
course it'd be nice if we had a real document describing this all, but we
don't yet.

# Documentation #

The Apache documentation needs to be updated for some patches, most often
for enhancements. You may wish to see if your patch is considered generally
acceptable before updating the documentation. Patches for the documentation
are submitted with any code changes in the same patch format.

Please note that for Apache 2.0 and above, most of the documentation is
generated from XML. Your changes need to be made to the XML version. See
[http://httpd.apache.org/docs-project/docsformat.html](/docs-project/docsformat.html)
for more information.

# Choosing a level of Apache code for comparison #

Currently, there are two active Apache httpd source trees:

1. Apache httpd 2.4.x (current release, GA)

1. Apache httpd 2.5.x (development/beta version)

A patch should be created against the last public release or, if practical,
the latest code in subversion for the relevant source tree. Patches created
against older releases may not apply to current sources.

Instructions for obtaining a source tree from subversion are at [Apache
Development Notes](/dev/devnotes.html) 

# Patch Format #

We prefer that patches be submitted in unified diff format:

<BLOCKQUOTE><CODE>diff -u file-old.c file.c</CODE></BLOCKQUOTE>

but that isn't available on all platforms. If your platform doesn't support
unified diffs, please use a context diff instead:

<BLOCKQUOTE><CODE>diff -C3 file-old.c file.c</CODE></BLOCKQUOTE>

where `file.c` is the file affected. We should be able to feed the
patch directly into the "patch" program and have it update the file or set
of files. The `-C3` is very important - line numbers can change on a daily
basis in some code files, so having context is crucial to knowing where it
all really goes.

If multiple files are modified, the following setup can simplify the
management of original and modified files:

1. `cd /sources`

1. `tar xvzf httpd-2.4.x.tar.gz`

1. `cp -ax httpd-2.4.x httpd-2.4.x.new`

1. edit files in httpd-2.4.x.new and build/test

1. `cd /sources`

1. `diff -ru httpd-2.4.x httpd-2.4.x.new > my_unified_diff.patch`

If your source tree was checked out of subversion:

        svn diff

will create the patch in the correct format.

# Submitting your Patch #

Traditionally, patches have been submitted on the developer's mailing list
as well as through the bug database. Unfortunately, this has made it hard
to easily track the patches. And without being able to easily track them,
too many of them have been ignored.

Patches must now be submitted through the bug database, at
[http://bz.apache.org/bugzilla/](http://bz.apache.org/bugzilla/).
You'll need to create a Bugzilla account there if you don't already have
one. Submit the patch by first entering a new bug report. Be sure to
specify APR for the product if the patch is for a file in srclib/apr or
srclib/apr-util. The following information is very helpful, when it is
available:

1. explain how to reproduce the problem and how the patch has been tested

After the bug report has been created, edit it again and specify
**PatchAvailable** as a keyword and then add your patch as a new
attachment.

If you wish to discuss the patch on the developer's mailing list, prefix
your subject line with "[PATCH &lt;PR-number&gt;]" to reference your patch
submission.

Be aware that the core developers tend to be very conservative about what
makes it into the core of Apache. Apache has a very flexible API, and any
advanced functionality is likely to be pushed to be a third-party module.
Portability fixes are the most important; protocol correctness is also
critical for us; and we're sure there's more dumb mistakes in the code than
we could shake a stick at. Those will get priority; new functionality may
not.

# What if my patch gets ignored?  {#ignored}

Because Apache has only a small number of volunteer developers, and these
developers are often very busy, it is possible that your patch will not
receive any immediate feedback. Developers must prioritize their time,
dealing first with serious bugs and with parts of the code in which they
have interest and knowledge. Here are some suggestions on what you can do
to encourage action on your patch:

1. Be persistent but polite. Post to the developers list pointing out your
patch and why you feel it is important. Feel free to do this about once a
week and continue until you get a response. Just be sure to be polite about
it, since the developers are unlikely to respond to rude messages.

1. Encourage other Apache users to review and test your patch, and then
append a note to the bug report with the details. Developers are much more
likely to review and commit a patch if they see that it has been widely
tested.

1. Make sure your patch is easy to read and apply. Follow all the style
suggestions in the above sections and include any necessary documentation
changes.

1. Review the bugs database for similar errors. If there are duplicates,
close them as duplicates of the initial report (this cross references the
two bugs to each other.) Add an extra note when closing well documented
dups if the particular bug report contains useful unique details. If there
is a report that isn't identical, but might be helped by your patch, mark
it as 'depends on' the bug report containing your patch. Finally mark the
original incident as 'depends on' your bug report, with patch.

1. Earn "brownie points" by dealing with other bug reports that you can
politely and correctly address. As ugly as this job is -- sort of like the
poop crew following a parade -- it leaves the principal committers with
time to address the real bugs and their solutions instead of sweeping up
the droppings.

