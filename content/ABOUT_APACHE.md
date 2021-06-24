Title: About the Apache HTTP Server Project
license: https://www.apache.org/licenses/LICENSE-2.0

# What is the Apache HTTP Server Project?  {#What}

The Apache HTTP Server Project is a collaborative software development
effort aimed at creating a robust, commercial-grade, featureful, and
freely-available source code implementation of an HTTP (Web) server. The
project is jointly managed by a group of volunteers located around the
world, using the Internet and the Web to communicate, plan, and develop the
server and its related documentation. This project is part of the Apache
Software Foundation. In addition, hundreds of users have contributed ideas,
code, and documentation to the project. This file is intended to briefly
describe the history of the Apache HTTP Server and recognize the many
contributors.

# How Apache Came to Be  {#How}

In February of 1995, the most popular server software on the Web was the
public domain HTTP daemon developed by Rob McCool at the National Center
for Supercomputing Applications, University of Illinois, Urbana-Champaign.
However, development of that httpd had stalled after Rob left NCSA in
mid-1994, and many webmasters had developed their own extensions and bug
fixes that were in need of a common distribution. A small group of these
webmasters, contacted via private e-mail, gathered together for the purpose
of coordinating their changes (in the form of "patches"). Brian Behlendorf
and Cliff Skolnick put together a mailing list, shared information space,
and logins for the core developers on a machine in the California Bay Area,
with bandwidth donated by HotWired. By the end of February, eight core
contributors formed the foundation of the original Apache Group:

- Brian Behlendorf
- Roy T. Fielding
- Rob Hartill
- David Robinson
- Cliff Skolnick
- Randy Terbush
- Robert S. Thau
- Andrew Wilson

with additional contributions from

- Eric Hagberg
- Frank Peters
- Nicolas Pioch

Using NCSA httpd 1.3 as a base, we added all of the published bug fixes and
worthwhile enhancements we could find, tested the result on our own
servers, and made the first official public release (0.6.2) of the Apache
server in April 1995. By coincidence, NCSA restarted their own development
during the same period, and Brandon Long and Beth Frank of the NCSA Server
Development Team joined the list in March as honorary members so that the
two projects could share ideas and fixes.

The early Apache server was a big hit, but we all knew that the codebase
needed a general overhaul and redesign. During May-June 1995, while Rob
Hartill and the rest of the group focused on implementing new features for
0.7.x (like pre-forked child processes) and supporting the rapidly growing
Apache user community, Robert Thau designed a new server architecture
(code-named Shambhala) which included a modular structure and API for
better extensibility, pool-based memory allocation, and an adaptive
pre-forking process model. The group switched to this new server base in
July and added the features from 0.7.x, resulting in Apache 0.8.8 (and its
brethren) in August.

After extensive beta testing, many ports to obscure platforms, a new set of
documentation (by David Robinson), and the addition of many features in the
form of our standard modules, Apache 1.0 was released on December 1, 1995.

Less than a year after the group was formed, the Apache server passed
NCSA's httpd as the #1 server on the Internet and according to the [survey
by Netcraft](http://www.netcraft.com/survey/) , it retains that position
today.

In 1999, members of the Apache Group formed the [Apache Software
Foundation](http://www.apache.org/) to provide organizational, legal, and
financial support for the Apache HTTP Server. The foundation has placed the
software on a solid footing for future development, and greatly expanded
the number of Open Source software projects, which fall under this
Foundation's umbrella.

# Getting Involved  {#Involved}

If you just want to send in an occasional suggestion/fix, then you can
simply use the bug reporting form at &lt;
http://httpd.apache.org/bug_report.html &gt;. You can also subscribe to
the announcements mailing list (`announce@httpd.apache.org`)
which we use to broadcast information about new releases, bugfixes, and
upcoming events. There's a lot of information about the development process
(much of it in serious need of updating) to be found at &lt;
http://httpd.apache.org/dev/ &gt;.

> **NOTE:** The developer mailing list is NOT a user support forum; it is
> for people actively working on development of the server code. There is
> also a 'docs' subproject for those who are actively developing and
> translating the documentation. If you have user/configuration questions,
> subscribe to the [Users list](../userslist.html) or try the USENET
> newsgroups " <news:comp.infosystems.www.servers.unix> " or "
> <news:comp.infosystems.www.servers.ms-windows> " (as appropriate for
> the platform you use).

# Development  {#Development}

There is a core group of contributors, formed initially of the project
founders, and augmented from time to time by other outstanding
contributors. There are 'committers', who are granted access to the source
code control repositories to help maintain the project or docs, and the
core group now managing the project, which is called the Apache HTTP
Project Management Committee (PMC, for short). In fact, each Apache
Software Foundation project has its own PMC, to determine committers,
project direction and overall management. The terms "The Apache Group" or
"Apache Core" are no longer used.

The project is a meritocracy -- the more work you have done, the more you
will be allowed to do. The group founders set the original rules, but they
can be changed by vote of the active PMC members. There is a group of
people who have logins on our server and access to the source code
repositories. Everyone has read-only access to the repositories. Changes to
the code are proposed on the mailing list and usually voted on by active
members -- three +1 ('yes' votes) and no -1 ('no' votes, or vetoes) are
needed to commit a code change during a release cycle; docs are usually
committed first and then changed as needed, with conflicts resolved by
majority vote.

Our primary method of communication is our mailing list. Approximately 40
messages a day flow over the list, and are typically very conversational in
tone. We discuss new features to add, bug fixes, user problems,
developments in the web server community, release dates, etc. The actual
code development takes place on the developers' local machines, with
proposed changes communicated using a patch (output of a unified "diff -u
oldfile newfile" command), and then applied to the source code control
repositories by one of the committers. Anyone on the mailing list can vote
on a particular issue, but only those made by active members or people who
are known to be experts on that part of the server are counted towards the
requirements for committing. Vetoes must be accompanied by a convincing
technical justification.

New members of the Apache HTTP Project Management Committee are added when
a frequent contributor is nominated by one member and unanimously approved
by the voting members. In most cases, this "new" member has been actively
contributing to the group's work for over six months, so it's usually an
easy decision.

The project guidelines continuously evolve under the oversight of the PMC,
as the membership of the group changes and our development/coordination
tools improve.

# Why Apache Software is Free  {#why-free}

Apache Software exists to provide robust and commercial-grade reference
implementations of many types of software. It must remain a platform upon
which individuals and institutions can build reliable systems, both for
experimental purposes and for mission-critical purposes. We believe that
the tools of online publishing should be in the hands of everyone, and that
software companies should make their money by providing value-added
services such as specialized modules and support, amongst other things. We
realize that it is often seen as an economic advantage for one company to
"own" a market - in the software industry, that means to control tightly a
particular conduit such that all others must pay for its use. This is
typically done by "owning" the protocols through which companies conduct
business, at the expense of all those other companies. To the extent that
the protocols of the World Wide Web remain "unowned" by a single company,
the Web will remain a level playing field for companies large and small.
Thus, "ownership" of the protocols must be prevented. To this end, the
existence of robust reference implementations of various protocols and
application programming interfaces, available free to all companies and
individuals, is a tremendously good thing.

Furthermore, the Apache Software Foundation is an organic entity; those who
benefit from this software by using it, often contribute back to it by
providing feature enhancements, bug fixes, and support for others in public
lists and newsgroups. The effort expended by any particular individual is
usually fairly light, but the resulting product is made very strong. These
kinds of communities can only happen with freely available software -- when
someone has paid for software, they usually aren't willing to fix its bugs
for free. One can argue, then, that Apache's strength comes from the fact
that it's free, and if it were made "not free" it would suffer
tremendously, even if that money were spent on a real development team.

We want to see Apache Software used very widely -- by large companies,
small companies, research institutions, schools, individuals, in the
intranet environment, everywhere -- even though this may mean that
companies who could afford commercial software, and would pay for it
without blinking, might get a "free ride" by using Apache. We are even
happy when some commercial software companies completely drop their own
HTTP server development plans and use Apache as a base, with the proper
attributions as described in the
[LICENSE](http://www.apache.org/licenses/). That is to say, the Apache HTTP
Sever only comes from the Apache Software Foundation, but many vendors ship
their own product "based on the Apache  {Project}". There is no "{Vendor}
Apache  {Product}", this is an abuse of the Apache Software Foundation's
marks.

