Title: Apache HTTP Server Release Guidelines
license: https://www.apache.org/licenses/LICENSE-2.0

# Introduction

This document describes the general release policies used by the Apache
HTTP Server Project to create releases of httpd-2.4 (the current Apache 2.x
branch). Aside from the voting guidelines, this policy may be adjusted by
the Release Manager.

With the introduction of Apache 2.1, the Apache httpd project has adopted
an odd-even release strategy, where development happens with alpha and beta
releases assigned an odd-numbered minor version, and its general
availability (stable) release is designed with the subsequent even-numbered
minor version. E.g. 2.1.0-alpha through 2.1.6-alpha were followed by
2.1.7-beta through 2.1.9 beta, and cumulated in the 2.2.0 general
availability release.

# Who can make a release? #

Technically, anyone can make a release of the source code due to the
[Apache Software License](http://www.apache.org/licenses/). However, only
members of the Apache HTTP Server Project (committers) can make a release
designated as Apache HTTP Server (httpd). Other people must call their
release something other than "Apache" unless they obtain written permission
from the Apache Software Foundation.

Following our official release policies, we will only accept release
binaries from members of the Apache HTTP Server Project for inclusion on
our website. This ensures that our binaries can be supported by members of
the project. Other people are free to make binaries, but we will not post
them on our website.

# Who is in charge of a release? #

The release is coordinated by a Release Manager (hereafter, abbreviated as
RM). Since this job requires trust, coordination of the development
community, and access to subversion, only committers to the project can be
RM. However, there is no set RM, and more than one RM can be active at a
time. Any committer may create a release candidate, provided that it is
based on a releasable (non-vetoed) tag of our current subversion repository
corresponding to the target version number. In order to facilitate
communication, it is deemed nice to alert the community to your planned
release schedule before creating the release candidate, since some other
folks may be on the verge of committing an important change (or backing out
an error). A release candidate should only be made when there is an
intention to propose it for a vote on public release. There are no
"private" releases at Apache.

# Who may make a good candidate for an RM? #

Someone with lots of time to kill. Being an RM is a very important job in
our community because it takes a fair amount of time to produce a stable
release. If you feel lucky, a release could be distributed without testing,
but our experience has shown that this leads to a higher number of *dud*
releases. In general, our experience has shown that a well-coordinated
release fares better than non-coordinated releases.  In all cases, three
+1 votes, and more +1 than -1 votes from PMC members are required for a
release candidate to be designated as a release.

# When do I know if it is a good time to release? #

Generally speaking, when some useful changes have been applied since the
last release and there are no showstoppers left to be resolved. It is our
convention to indicate *showstoppers* in the STATUS file in the repository.
A showstopper entry does not imply that a release cannot be made -- it is
more of an indication of current project consensus and a reminder of what
fixes are on the critical path. Each RM gets to choose when to cut a
release candidate based on the current content of subversion. The entire
PMC gets to decide whether or not that candidate deserves to be released.

An item being denoted in STATUS as a *showstopper* indicates that someone
believes the issue must be resolved before the next release, and the RM is
going to hold off until it is resolved or moved out of the showstopper
category. These items may be bugs, outstanding vetos that have not yet been
resolved, or enhancements that must make it into the release. Note that the
RM may also add showstopper entries to indicate what issues must be
resolved before they personally are willing to cut a release candidate,
though they cannot prevent others from taking on the RM job and proposing a
release candidate of their own.

# What power does the RM yield? #

The only power held by the RM is the right to determine when the current
content of subversion is worth their own effort in cutting a release
candidate. The only thing the RM has authority over is the building of a
source package, based on the contents of our subversion, that can then be
put up for vote. They can decide what snapshot revision to tag for a
candidate. They can decide to branch early and build candidates based on
the branch rather than a more active development tree, but they cannot
prevent others from working on that branch as well. They can also decide
not to build anything at all. They can do all sorts of organizational
support, advocacy, pleading, or whatever in order to encourage the rest of
the project committers to apply changes, test the candidate, vote for
things under issue, etc.

The RM is not a dictator (benevolent or not). They do not have the right to
pick apart or select any variation of the product they might like to
release: it has to be a specific tag or revision (moment in time) that is
present in our subversion and applicable to the version number targeted for
the release. If there is something they don't like in the tree, then they
have the same right as other PMC members to change or veto that code first,
make the change to subversion, and then build the release candidate.
Likewise, the RM cannot include in the candidate any change that has been
vetoed by others, and their candidate cannot be released if it contains any
changes that have been vetoed since it was built. The RM has the right to
kill their own candidate if they learn something during the release process
that they think, for whatever reason, causes the build to be unreleasable.
But the RM can't stop anyone else on the PMC from taking the same candidate
and calling for its release under their own management as RM.

# How can an RM be confident in a release? #

The RM may perform sanity checks on release candidates. One highly
recommended suggestion is to run the httpd-test suite against the
candidate. The release candidate should pass all of the relevant tests
before making it official, and certainly avoid new regressions (tests that
previously passed, and now fail).

Another good idea is to coordinate running a candidate on apache.org for a
period of time. This will require coordination with the infrastructure
team. In the past, the group has liked to see approximately 48-72 hours of
usage in production to certify that the release is functional in the real
world. Note that some committers may choose to not vote on a release until
feedback has been gathered from the apache.org instance running the
release. This is not a requirement (each committer is free to come up with
their own personal voting guidelines), but it produces a feeling of
confidence in the release that it will not be a *dud*.

# How to do a release? #

Once the tree has been suitably tested by the RM and any other interested
parties, they should "roll" a candidate tarball for potential release.

The process is largely automated through shell scripts. The exact commands
needed to perform a release are captured inside, so consider reading the
scripts and comments within for a complete understandig of the process.

Key points the automation handles:

1. It creates a candidate branch as ^/httpd/httpd/tags/candidate-$FULL_VERSION from the
   branch and revision you have checked out locally.

1. In candidate: Ensure the Copyright date reflects the current year in the NOTICE
and `docs/manual/style/xsl/common.xsl` files.
 
1. In candidate: Commit the change of `AP_SERVER_DEVBUILD_BOOLEAN` to `0` in `include/ap_release.h`.

1. In candidate: Bump `ENTITY httpd.patch` in `docs/manual/style/version.ent`.

1. In candidate: Execute `./build.sh all convmap` to ensure that the documentation
transformations are up to date.

1. Build tarballs from export of candidate. Plus checksum files.

1. Signs tarballs with your gpg key (you may specify the signing id to use).

1. Generate a proposed release announcement and CHANGES entry.

1. Commit the generated tarballs, signatures and proposed announcements
 to the subversion.
`https://dist.apache.org/repos/dist/dev/httpd/` repository.

1. Pepares and email with a [VOTE] Release X.Y.Z to call for
testing and votes on this candidate. Send this to dev@httpd.apache.org.

1. When the vote has concluded, the tarballs and signatures can be moved
to the release distribution mirror.

1. Add the new version and the new modules, if any, in bugzilla (or ask infra to do so).

1. After a 24 to 48 hour delay for the mirrors to replicate the data, the
release can be announced with any pending security announcements as well.

1. local checkout: increment the patch number for work on the next release.

1. local checkout: Add the corresponding version placeholder in CHANGES.

1. local checkout: Note the tag date in the STATUS file.


The automated workflow is:

    # Get the tooling
    svn co https://svn.apache.org/repos/asf/httpd/dev-tools tools
    # Get the branch to release, e.g.
    svn co https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x 2.4.x
    cd 2.4.x
    
    # Start a candidate 'rc1'
    ../tools/release/r0-make-candidate.sh rc1
    
    # Generate tarballs, checksums and signatures,
    ../tools/release/r1-make-tars.sh -s <gpg key id>
    
    # Create the Announcement* and CHANGES* files. Put these and 
    # the tarballs onto https://dist.apache.org/repos/dist/dev/httpd
    # Create a mail proposal in ./dist/mail-vote-$FULL_VERSION.txt
    ../tools/release/r2-prep-vote.sh
    
    # declare the vote by sending the mail to the dev list
    # wait for the results on this

    # Should the vote fail, cancel the release candiate with
    ../tools/release/reset-candidate.sh

    # Start again, use 'rc2', 'rc3'...
    # Until the vote passes...
    
    # Push the tarballs, CHANGES* etc. to 
    # https://dist.apache.org/repos/dist/release/httpd
    # this will use the version without any rc1 suffix
    ../tools/release/r3-push-release-tars.sh
    # wait for them to reach the mirrors
    
    # add CVE related information and prepare changes to the
    # dist release, website, pmc repository and local checkout
    # all these changes are local only
    ../tools/release/r4-stage-release.sh
    
    # NOTE: this is the point of no return
    
    # Commit all staged changes into the repositories
    ../tools/release/r5-commit-staged-release.sh
    # Update Bugzilla (new version and new modules, if any)
    
    # Get instructions on announcement emails and CVEs
    # that need to progress to READY in the ASF cveprocess
    ../tools/release/r6-announce.sh
    
    # you are done.
    

# What can I call this release? #

Based on the community's confidence in the code, the potential release is
tagged as alpha, beta or general availability (GA) and the candidate and
is voted in that manner. The Apache HTTP Server Project has three
classifications for its releases:

- Alpha

- Beta

- General Availability (GA)

Alpha indicates that the release is not meant for mainstream usage or may
have serious problems that prohibits its use. The initial releases off of
the x.  {odd}.z development branches are considered alpha quality.

Beta indicates that the x.  {odd}.z development branch is nearing completion
and will soon ship as a x.  {even}.0 GA release. This indicates that it is
expected to compile and perform basic tasks. However, there may be problems
with this release that inhibit its widespread adoption.

General Availability (GA) indicates that this release is the best available
version and is recommended for all usage. It also indicates that this
release replaces all previous GA versions, and it's interfaces should
remain stable throughout the life of this x.y version. (Those interfaces
that are in flux are designated *experimental*.)

Finally, remember version numbers are cheap. If x.y.13 is retracted due to
a flaw or prior veto or simply because of 'one more change' to add to this
next release, then the RM should designate x.y.14. Don't attempt to
overload an earlier tarball with additional changes, simply keep moving.

# Who can vote? #

For the ASF to release the candidate tarball/archive, at least three
project members must vote affirmatively for release, and there must be more
positive than negative votes for the release. There is no 'veto' to a
release vote. A previous veto of specific code can and should be called out
to the RM if it was mistakenly included. A new tarball release candidate
should be rolled without the offending code if this is the case.

Non-committers may cast a vote for a release's quality. In fact, this is
extremely encouraged as it provides much-needed feedback to the community
about the release's quality. However, only binding votes cast by PMC
members count towards the designation.

Finally, note that votes are on *source code* tarballs, and only the source
code is authoritative. Binaries, while helpful, are considered other
artifacts and must be generated from the exact source code contained in the
release. If a patch is unavoidable for a specific platform, the applicable
patches MUST be made available alongside the platform binaries.

# How do we make it public? #

Remember, the automation handles the moving and announcements this for
the most part.

Once the release has reached the highest-available designation (as deemed
by the RM), the release can be moved to the httpd distribution directory on
apache.org. The release tarballs and signatures can be svn mv'ed from the
https://dist.apache.org/repos/dist/dev/httpd/ repository across to the
https://dist.apache.org/repos/dist/release/httpd/ repository. In that
release tree are also the patches/, subproject/ and binaries/ distribution
trees.

It should be ensured that the release and any new module are also added to Bugzilla by sending
a mail to dev@httpd.apache.org requesting the same. The request is picked
up there by one of the project members with Bugzilla administrator
permissions and the release is added to Bugzilla.
Approximately 24 to 48 hours after the files have been moved, a public
announcement can be made. We wait this period so that the mirrors can
receive the new release before the announcement. An email can then be sent
to the announcements lists (announce@apache.org, announce@httpd.apache.org)
from your apache.org email address. Drafts of the announcement are usually
posted on the development list before sending the announcement to let the
community clarify any issues that we feel should be addressed in the announcement.

Do not forget to bump the version number and note announce date in the projects doap
file ( `httpd/site/trunk/docs/doap.rdf` ), index ( `httpd/site/trunk/content/index.mdtext` )
and download pages ( `httpd/site/trunk/content/download.mdtext` ). The download page
also has the RM's name and key ID for verification. These changes
are published by CMS. More information can be found
[here](https://svn.apache.org/repos/asf/httpd/site/trunk/README).

# What extra steps for releases containing security fixes?

If a release contains a fix for any security issues then you need to ensure that the
extra steps [here](https://www.apache.org/security/committers.html) are followed.

Additionally you need to update add vulnerability json files to ( `httpd/site/trunk/content/security/json/` )
with details of all the security fixes.  Once committed this will automatically generate the relevant
security pages.  This information can also be used to help generate the annoucement emails.  Make sure
to use CMS to publish these page updates.

You may wish to stage the json file in the private SECURITY repo prior to the release to allow
issues to be spotted.

# Should the announcement wait for binaries? #

In short, no. The only files that are required for a public release are the
source tarballs (.tar.Z,.tar.gz). Volunteers can provide the Win32 source
distribution and binaries, and other esoteric binaries.

Note that the typical Win32 source distribution differs from the original
tarball in that it has generated project files as well as the CRLF line
endings required for that platform. More information can be found
[here](http://httpd.apache.org/docs-2.0/platform/win_compiling.html).

# Oops. We found a problem. #

Up until you pushed the staged release into the different repositories,
everything is reversible. As listed above, you may run

    ../tools/release/reset-candidate.sh

in your checkout. You can give the candidate version as an argument, should
the script not detect the version correctly. It will tell you what it
finds and removes.

Then you can start again. No release relevant changes have been 
committed to the branch itself by you. If you used a 'rcN' suffix
when creating the candidate (as you should), just increment that 
number on your next attempt and there will be no confusion.

An example of this is:

1. vote on 2.4.60-rc1
1. someone finds a bug, a fix is committed
1. use `reset-candidate.sh` to revert all changes
2. update your local checkout (thus get the fix)
3. make candidate 2.4.60-rc2
4. call a vote on rc2
5. if all is well, release 2.4.60-rc2  as 2.4.60

If the release has been made public, there are two courses of action:

 1. Revoke the release and immediately create another one that has a fix to
 this problem. On publishing, the patch number should have been incremented
 already in your branch (if this failed, you will need to do this manually). 
 
 1. If the problem is less severe, place the patch to the problem in the
 /dist/httpd/patches/apply_to_X.Y.Z directory. A link to this directory
 should be included in the release notes with descriptions as to what
 problem each patch addresses.

# Suggestions? #

As always, if you have any suggestions or comments on our process, please
feel free to email our developer mailing list with your comments. We hope
you found this document useful.

