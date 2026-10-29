Title: Apache Development Notes
license: https://www.apache.org/licenses/LICENSE-2.0

# Apache Development Notes

This page gives some basic background on how the Apache HTTP Server
source is maintained and how changes get made.

# Overview #

The Apache HTTP Server source code is hosted in git at
<https://github.com/apache/httpd>. The repository used to live in
Subversion, and the old SVN tree is no longer used for new work.

There are two active branches:

* <samp>trunk</samp> is the development branch (2.5, slated for a 2.6
  release).
* <samp>2.4.x</samp> is the current stable branch.

To get a copy of the source:

    % git clone https://github.com/apache/httpd.git
    % cd httpd

This gives you <samp>trunk</samp>. To work on the stable branch instead:

    % git switch 2.4.x

The developers continue to seek to maintain module compatibility between
2.4.1 and future 2.4 releases for administrators and end users.

# Making Changes #

All changes go through pull requests on GitHub, for both
<samp>trunk</samp> and <samp>2.4.x</samp>.

1. Fork <https://github.com/apache/httpd> on GitHub and clone your fork.

1. Create a branch for your change from the branch you are targeting:

        % git switch -c my-fix trunk

1. Make your changes and check that they build and pass the tests. Please
   follow the Apache style, as described in the [style guide](styleguide.html).

1. Commit, push the branch to your fork, and open a pull request against
   <samp>trunk</samp> or <samp>2.4.x</samp> in the
   [httpd repository](https://github.com/apache/httpd/pulls).

Keep your branch up to date with the upstream branch while the pull request
is open, as reviewers may ask for changes before it can be merged.

Larger changes or new features are worth raising on the
[developers list](https://httpd.apache.org/lists.html#http-dev) before you
spend a lot of time on them.

# Review and Backports #

The review-then-commit and commit-then-review rules that applied under SVN
still apply. The [project guidelines](guidelines.html) describe them in
detail.

Voting on backports in the STATUS file has been replaced by pull request
reviews. To propose a backport to the stable branch, open a pull request
against <samp>2.4.x</samp>. The approvals that used to be recorded as votes
in STATUS are now given as reviews on that pull request.

# Committer Access #

Committers need to link their ASF and GitHub accounts before they can push
to or merge in the repository. This is done through the ASF
[GitBox account linking](https://gitbox.apache.org/setup/) page, which also
requires two-factor authentication to be enabled on your GitHub account.

# Other Repositories #

A few other repositories are used by the project.

## httpd-site ##

The website is hosted on GitHub at <https://github.com/apache/httpd-site/>.

The pages use Markdown syntax. When a change is committed to this
repository, the corresponding HTML files are generated automatically and
published to <https://httpd.apache.org/>.

## httpd-tests ##

The Perl test framework is hosted on GitHub at
<https://github.com/apache/httpd-tests>.

## dev-tools ##

Release scripts and other developer tools are still kept in SVN and can be
checked out with:

    % svn checkout https://svn.apache.org/repos/asf/httpd/dev-tools/trunk/ httpd-dev-tools

The scripts used to roll a release are in the <samp>release/</samp>
directory. The policies and procedures for rolling a release are covered in
the [release guidelines](release.html).

## Release distribution ##

Release candidates are staged in <https://dist.apache.org/repos/dist/dev/httpd/>
and final releases are published from
<https://dist.apache.org/repos/dist/release/httpd/>, which is mirrored to
<https://downloads.apache.org/httpd/>. Both are SVN repositories, as with all
ASF release areas.

## docs-build ##

The tools used to build the manual from the XML sources are still kept in
SVN at <samp>https://svn.apache.org/repos/asf/httpd/docs-build/trunk</samp>.

**Building the documentation from a git checkout is currently broken.**
This is being worked on with ASF Infrastructure in
[INFRA-28588](https://issues.apache.org/jira/browse/INFRA-28588). Updated
instructions will be added here once it is resolved.

# Continuous integration (CI) #

[GitHub Actions](https://github.com/apache/httpd/actions) is used for CI.

It builds httpd on different processors and operating systems, with
different compiler and library versions, and with different
configurations.

On a successful build, the in-tree tests and the
[Perl test framework](https://github.com/apache/httpd-tests) are run as
well.

This runs for pull requests and for each commit. The goal is to spot new
build issues and regressions early.

If you want to commit something without triggering the whole process (a
documentation change, for example), add the magic "[skip ci]" keyword to
the commit message.

Here are the [latest build results](https://github.com/apache/httpd/actions).
