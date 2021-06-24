Title: Apache HTTP Server Project Guidelines and Voting Rules
license: https://www.apache.org/licenses/LICENSE-2.0

# Guidelines

This document defines the guidelines for the [Apache HTTP Server
Project](/). It includes definitions of how conflict
is resolved by voting, who is able to vote, and the procedures to follow
for proposing and making changes to the Apache products.

The objective here is to avoid unnecessary conflict over changes and
continue to produce a quality system in a timely manner. Not all conflict
can be avoided, but at least we can agree on the procedures for conflict to
be resolved.

# People, Places, and Things

### Apache HTTP Server Project Management Committee

The group of volunteers who are responsible for managing the Apache 
HTTP Server Project. This includes deciding what is distributed as
products of the Apache HTTP Server Project, maintaining the Project's
shared resources, speaking on behalf of the Project, resolving license
disputes regarding Apache products, nominating new PMC members or
committers, and establishing these guidelines.
Membership in the Apache PMC is by invitation only and must be approved by
consensus of the active Apache PMC members. A PMC member is considered
inactive by their own declaration or by not contributing in any form to the
project for over six months. An inactive member can become active again by
reversing whichever condition made them inactive ( *i.e.* , by reversing
their earlier declaration or by once again contributing toward the
project's work). Membership can be revoked by a unanimous vote of all the
active PMC members other than the member in question.

### Apache HTTP Server Committers 

The group of volunteers who are responsible for the technical aspects
of the Apache HTTP Server Project. This group has write access to the
appropriate source repositories and these volunteers may cast binding
votes on any technical discussion.
Membership as a Committer is by invitation only and must be approved by
consensus of the active Apache PMC members. A Committer is considered
inactive by their own declaration or by not contributing in any form to the
project for over six months. An inactive member can become active again by
reversing whichever condition made them inactive ( *i.e.* , by reversing
their earlier declaration or by once again contributing toward the
project's work). Membership can be revoked by a unanimous vote of all the
active PMC members (except the member in question if they are a PMC
member).

### Apache Developers 
All of the volunteers who are contributing time, code, documentation,
or resources to the Apache Project. A developer that makes sustained,
welcome contributions to the project for over six months is usually
invited to become a Committer, though the exact timing of such
invitations depends on many factors.

### Mailing list 
The Apache developers' primary mailing list for discussion of issues
and changes related to the project ( *dev@httpd.apache.org* ).
Subscription to the list is open, but only subscribers can post
directly to the list.

### Private list
The Apache PMC's private mailing list for discussion of issues that
are inappropriate for public discussion, such as legal, personal, or
security issues prior to a published fix. Subscription to the list is
only open (actually: mandatory) to Apache httpd's Project Management
Committee.

### Subversion 
All of the Apache products are maintained in shared information
repositories using [Subversion on](devnotes.html). Only some of the
Apache developers have write access to these repositories; everyone
has [read access](http://svn.apache.org/repos/asf/httpd/httpd).

# STATUS #

Each of the Apache Project's active source code repositories contain a file
called "STATUS" which is used to keep track of the agenda and plans for
work within that repository. The STATUS file includes information about
release plans, a summary of code changes committed since the last release,
a list of proposed changes that are under discussion, brief notes about
items that individual developers are working on or want discussion about,
and anything else that might be useful to help the group track progress.
The active STATUS files are automatically posted to the mailing list each
week.

Many issues will be encountered by the project, each resulting in zero or
more proposed action items. Issues should be raised on the mailing list as
soon as they are identified. Action items **must** be raised on the mailing
list and added to the relevant STATUS file. All action items may be voted
on, but not all of them will require a formal vote.

# Voting

Any of the Apache Developers may vote on any issue or action item. However,
the only binding votes are those cast by active members of the Apache HTTP
Server; if the vote is about a change to source code or documentation, the
primary author of what is being changed may also cast a binding vote on
that issue. All other votes are non-binding. All developers are encouraged
to participate in decisions, but the decision itself is made by those who
have been long-time contributors to the project. In other words, the Apache
httpd Project is a minimum-threshold meritocracy.

The act of voting carries certain obligations -- voting members are not
only stating their opinion, they are agreeing to help do the work of the
Apache Project. Since we are all volunteers, members often become inactive
for periods of time in order to take care of their "real jobs" or devote
more time to other projects. It is therefore unlikely that the entire group
membership will vote on every issue. To account for this, all voting
decisions are based on a minimum quorum.

Each vote can be made in one of three flavors:

- **+1** : Yes, agree, or the action should be performed. On some issues, this
vote is only binding if the voter has tested the action on their own system(s).

- **±0** : Abstain, no opinion, or I am happy to let the other group members
decide this issue. An abstention may have detrimental effects if too many people abstain.

- **-1** : No. On issues where consensus is required, this vote counts as a **veto**. 
All vetos must include an explanation of why the veto is
appropriate. A veto with no explanation is void. No veto can be
overruled. If you disagree with the veto, you should lobby the person
who cast the veto. Voters intending to veto an action item should make
their opinions known to the group immediately, so that the problem can
be remedied as early as possible.

An action item requiring *consensus approval* must receive at least **3
binding +1** votes and **no vetos**. An action item requiring *majority
approval* must receive at least **3 binding +1** votes and more **+1**
votes than **-1** votes ( *i.e.* , a majority with a minimum quorum of
three positive votes). All other action items are considered to have *lazy
approval* until someone votes **-1** , after which point they are decided
by either consensus or a majority vote, depending upon the type of action
item.

Votes are tallied within the STATUS file, adjacent to the action item under
vote. All votes must be either sent to the mailing list or added directly
to the STATUS file entry for that action item.

# Types of Action Items #

### Long Term Plans 

Long term plans are simply announcements that group members are
working on particular issues related to the Apache software. These are
not voted on, but group members who do not agree with a particular
plan, or think an alternate plan would be better, are obligated to
inform the group of their feelings. In general, it is always better to
hear about alternate plans **prior** to spending time on less adequate solutions.

### Short Term Plans

Short term plans are announcements that a developer is working on a
particular set of documentation or code files, with the implication
that other developers should avoid them or try to coordinate their
changes. This is a good way to proactively avoid conflict and possible
duplication of work.

### Release Plan

A release plan is used to keep all the developers aware of when a
release is desired, who will be the release manager, when the
repository will be frozen in order to create the release, and assorted
other trivia to keep us from tripping over ourselves during the final
moments. Lazy majority (at least 3 x +1 and more +1 than -1) decides 
each issue in the release plan.

### Release Testing

After a new release is built, colloquially termed a tarball, it must
be tested before being released to the public. Majority approval is
required before the tarball can be publically released.

### Showstoppers

Showstoppers are issues that require a fix be in place before the next
public release. They are listed in the STATUS file in order to focus
special attention on the problem. An issue becomes a showstopper when
it is listed as such in STATUS and remains so by lazy consensus.

### Product Changes

Changes to the Apache products, including code and documentation, will
appear as action items under several categories corresponding to the change status:

* **Concept/Plan** : an idea or plan for a change. These are usually only listed in STATUS
     when the change is substantial, significantly impacts the API, or is
     likely to be controversial. Votes are being requested early so as to
     uncover conflicts before too much work is done.

* **Proposed patch**: A specific set of changes to the current product in the form of [input
     to the patch command](#patch) (a diff output).

* **Committed change** : A one-line summary of a change that has been committed to the
      repository since the last public release. All product changes to the currently active repository
      are subject to lazy consensus.
     All product changes to a prior-branch (old version) repository require consensus before
     the change is committed.

* **Backport**:  A backport is the application of a change on the Subversion repository
     trunk to the a maintenance branch of the project. This is necessary in
     cases where an issue exists in multiple versions of the Apache HTTP
     Server. A fix for such an issue will typically be developed for the
     trunk, which is under active development.

# When to Commit a Change

Ideas must be review-then-commit; patches can be commit-then-review. With a
commit-then-review process, we trust that the developer doing the commit
has a high degree of confidence in the change. Doubtful changes, new
features, and large-scale overhauls need to be discussed before being
committed to a repository. Any change that affects the semantics of
arguments to configurable directives, significantly adds to the runtime
size of the program, or changes the semantics of an existing API function
must receive consensus approval on the mailing list before being committed.

Each developer is responsible for notifying the mailing list and adding an
action item to STATUS when they have an idea for a new feature or major
change to propose for the product. The distributed nature of the Apache
project requires an advance notice of 48 hours in order to properly review
a major change -- consensus approval of either the concept or a specific
patch is required before the change can be committed. Note that a member
might veto the concept (with an adequate explanation), but later rescind
that veto if a specific patch satisfies their objections. No advance notice
is required to commit singular bug fixes.

Related changes should be committed as a group, or very closely together.
Half-completed projects should not be committed unless doing so is
necessary to pass the baton to another developer who has agreed to complete
the project in short order. All code changes must be successfully compiled
on the developer's platform before being committed.

The current source code tree should be capable of complete compilation at
all times. However, it is sometimes impossible for a developer on one
platform to avoid breaking some other platform when a change is committed,
particularly when completing the change requires access to a special
development tool on that other platform. If it is anticipated that a given
change will break some other platform, the committer must indicate that in
the commit log.

The committer is responsible for the quality of any third-party code or
documentation they commit to the repository. All software committed to the
repository must be covered by the Apache LICENSE or contain a copyright and
license that allows redistribution under the same conditions as the Apache
LICENSE.

A committed change must be reversed if it is vetoed by one of the voting
members and the veto conditions cannot be immediately satisfied by the
equivalent of a "bug fix" commit. The veto must be rescinded before the
change can be included in any public release.

# CHANGES file and Subversion logs 

### Changelog

Many code changes should be noted in the CHANGES file, and all should be
documented in Subversion commit messages. Often the text of the Subversion
log and the CHANGES entry are the same, but the distinct requirements
sometimes result in different information.

### Subversion log

The Subversion commit log message contains any information needed by

- fellow developers or other people researching source code changes/fixes

- end users (at least point out what the implications are for end users; it
doesn't have to be in the most user friendly wording)

If the code change was provided by a non-committer, attribute it using
Submitted-by. If the change was committed verbatim, identify the
committer(s) who reviewed it with Reviewed-by. If the change was committed
with modifications, use the appropriate wording to document that, perhaps
"committed with changes" if the person making the commit made the changes,
or "committed with contributions from xxxx" if others made contributions to
the code committed.

Example log message:
> Check the return code from parsing the content length, to avoid a
> crash if requests contain an invalid content length.
>
> PR: 99999
>
> Submitted by: Jane Doe &lt;janedoe example.com&gt;
>
> Reviewed by: susiecommitter

Commit messages can be minimal when making routine updates to STATUS, for
example to propose a backport or vote.

### CHANGES

CHANGES is the subset of the information that end users need to see when
they upgrade from one release to the next:

- what can I now do that I couldn't do before

- what problems that we anticipate a user could have suffered from are now
fixed

- all security fixes included, with CVE number. (If not available at the
time of the commit, add later.)

The usability of CHANGES for end users decreases as information of use to
few individuals, or which doesn't pertain to evaluating the new release, is
added. Specifically:

- Fixes for bugs introduced after the last release don't belong in CHANGES.

- Fixes for bugs that we don't expect anybody noticed don't belong in
CHANGES. (Bend the rule a little for outside contributions, as the
submitter may need to see their name in lights as reward for their efforts,
which typically were undertaken with no guarantee that any committer would
take interest.)

- Documentation fixes, whether for end users or developers, don't belong in
CHANGES.

CHANGES applies to changes even between alpha releases, so backporting a
change from trunk to a stable release does not generally require removing
the change from the CHANGES file in trunk.

The attribution for the change is anyone responsible for the code changes.

### Formatting

Identify non-committers by name, and their email in obfuscated form if
available. The obfuscation is done by replacing "@" with a space and adding
"&lt;" and "&gt;" around the address. For example, change
`user@example.com` to `<user example.com>`.

Identify committers with their Apache userid, e.g. `xyz` (no domain name
needed).

If the change is related to a bugzilla issue, include the PR number in the
log in the format:

       PR 1234

Security-related changes should start like this:

        *) SECURITY: CVE-YYYY-NNNN (cve.mitre.org)
           xxxxx

Most changes are inserted at the top of the CHANGES file. However,
security-related changes should always be at the top of the list of changes
for the relevant release, so if there are unreleased security changes at
the top of the file, insert other changes below them.

Example CHANGES entries: 

        *) SECURITY: CVE-2009-3095 (cve.mitre.org)
           mod_proxy_ftp: sanity check authn credentials.
           [Stefan Fritsch &lt;sf fritsch.de&gt;, Joe Orton]

        *) SECURITY: CVE-2016-1546 (cve.mitre.org)     
           mod_http2: restricting number of concurrent stream workers per connection if client is slow.

# Committing Security Fixes

Open source projects, ASF or otherwise, have varying procedures for 
commits of vulnerability fixes.  One important aspect of these procedures
is whether or not fixes to vulnerabilities can be committed to a
repository with commit logs and possibly CHANGES entries which 
purposefully obscure the vulnerability and omit any available 
vulnerability tracking information.  The Apache HTTP Server project has
decided that it is in the best interest of our users that the initial 
commit of such code changes to any branch will provide the best 
description available at that time as well as any available tracking
information such as CVE number.  Committing of the fix will be delayed 
until the project determines that all of the information about the issue
can be shared.

In some cases there are very real benefits to sharing code early even if
full information about the issue cannot, including the potential for
broader review, testing, and distribution of the fix. This is outweighed
by the concern that sharing only the code changes allows skilled analysts
to determine the impact and exploit mechanisms but does not allow the
general user community to determine if preventative measures should be
taken.

If a vulnerability is partially disclosed by committing a fix before the
bug is determined to be exploitable, the httpd security team will decide
on a case by case basis when to document the security implications and
tracking number.

# Patch Format 

### Patch

When a specific change to the software is proposed for discussion or voting
on the mailing list, it should be presented in the form of input to the
patch command. When sent to the mailing list, the message should contain a
Subject beginning with `[PATCH]` and a distinctive one-line summary
corresponding to the action item for that patch. Afterwords, the patch
summary in the STATUS file should be updated to point to the Message-ID of
that message.

The patch should be created by using the `diff -u` command from
the original software file(s) to the modified software file(s). E.g. one of the following:

* `diff -u http_main.c.orig http_main.c >> patchfile.txt`
* `svn diff http_main.c >> patchfile.txt` 

All patches necessary to address an action item should be concatenated
within a single patch message. If later modification of the patch proves
necessary, the entire new patch should be posted and not just the
difference between two patches. The STATUS file entry should then be
updated to point to the new patch message.

The completed patchfile should produce no errors or prompts when the
following command is issued in the target repository: `patch -s < patchfile`

# Addendum #

Outstanding issues with this document

- We may need a better definition for "lazy consensus".

- We should clarify under what conditions a veto can be rescinded or
overridden.

- Should we set a time limit on vetos of patches? Two weeks?

