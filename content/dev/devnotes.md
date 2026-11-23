Title: Apache Development Notes
license: https://www.apache.org/licenses/LICENSE-2.0

# Apache Development Notes

This page gives some basic background on how the Apache HTTP Server
source is maintained and how changes get made.

# Overview #

The Apache HTTP Server source code is hosted in git at
<https://github.com/apache/httpd>. The repository used to live in
Subversion, and the old SVN tree is no longer used for new work.

There are two active branches, both in the same repository:

* <samp>trunk</samp> is the development branch (2.5, slated for a 2.6
  release).
* <samp>2.4.x</samp> is the current stable branch.

# Committer Setup #

Committers need to do the following once before they can push to the
repository.

1. Create an SSH key, if you do not already have one:

        % ssh-keygen -t ed25519 -C "you@example.org"
        % ssh-add ~/.ssh/id_ed25519

1. Add the key to your GitHub account. On GitHub, open your profile, then
    Settings, then SSH and GPG keys, and click New SSH key. Give the key a
    name and paste the contents of <samp>~/.ssh/id_ed25519.pub</samp> into
    the Key field.

1. Link your GitHub account to your ASF account. The steps are described
    on the [Apache GitHub](https://infra.apache.org/apache-github.html) page,
    which takes you to [GitBox](https://gitbox.apache.org/boxer/). Follow the
    instructions there.

1. Wait for an email saying that you have been added to the "Apache
    Committers" team. You can push to the repository once that arrives.

Non-committers do not need any of this. Fork
<https://github.com/apache/httpd> on GitHub instead, and use your fork's
URL in place of the one below.

# Getting the Source #

Committers should clone using the SSH URL,
<samp>git@github.com:apache/httpd.git</samp>. If you only want to read the
code, <samp>https://github.com/apache/httpd.git</samp> works without any
setup.

Since <samp>trunk</samp> and <samp>2.4.x</samp> live in one repository,
there are a few ways to work on both. Pick whichever suits you.

## Two clones ##

This is the closest to the old SVN layout, with one directory per branch:

    % git clone git@github.com:apache/httpd.git httpd-trunk
    % git clone -b 2.4.x git@github.com:apache/httpd.git httpd-2.4.x

The <samp>-b 2.4.x</samp> option picks the branch to check out. Each
directory then behaves like its own SVN checkout.

## One clone, switching branches ##

Keep a single directory and change which branch it shows:

    % git clone git@github.com:apache/httpd.git httpd
    % cd httpd
    % git switch 2.4.x
    % git switch trunk

Commit or stash any changes before you switch, or git will refuse to
switch (or carry the changes with you).

## Worktrees ##

A worktree gives you a second directory for another branch, sharing one
clone:

    % git clone git@github.com:apache/httpd.git httpd-trunk
    % cd httpd-trunk
    % git worktree add ../httpd-2.4.x 2.4.x

This looks like the two clones layout, but both directories share the
same history, so a commit made in one is visible in the other straight
away.

# Making Changes #

All changes go through pull requests on GitHub, for both
<samp>trunk</samp> and <samp>2.4.x</samp>. A change that is needed on both
branches gets one pull request for each.

Please follow the Apache style, as described in the
[style guide](styleguide.html). Larger changes or new features are worth
raising on the [developers list](https://httpd.apache.org/lists.html#http-dev)
before you spend a lot of time on them.

## Example ##

Say you have updated <samp>docs/manual/bind.xml.fr</samp> and the change is
needed on both branches. Using the two clones layout:

1. Bring trunk up to date and create a branch for the change:

        % cd httpd-trunk
        % git switch trunk
        % git pull
        % git switch -c bind-fr-update

1. Edit the file, then commit it:

        % git add docs/manual/bind.xml.fr
        % git commit -m "Update French translation of bind.xml"

1. Push the branch to GitHub:

        % git push origin bind-fr-update

    The output includes a link to create a pull request. Open it, check that
    the base branch is <samp>trunk</samp>, and create the pull request. You
    can also start one from the
    [pull requests](https://github.com/apache/httpd/pulls) page.

1. Do the same in the 2.4.x directory, with a branch of its own:

        % cd ../httpd-2.4.x
        % git switch 2.4.x
        % git pull
        % git switch -c bind-fr-update-2.4

    Either make the same edit by hand and commit it as above, or copy the
    trunk commit across with <samp>git cherry-pick</samp>:

        % git fetch origin bind-fr-update
        % git cherry-pick FETCH_HEAD

    If the file differs between the branches, the cherry-pick may stop with
    a conflict. Run <samp>git cherry-pick --abort</samp> and make the edit by
    hand instead.

1. Push the 2.4.x branch and open a second pull request, this time with
    <samp>2.4.x</samp> as the base branch:

        % git push origin bind-fr-update-2.4

1. Once the pull requests have been merged, tidy up:

        % git switch 2.4.x
        % git pull
        % git branch -D bind-fr-update-2.4
        % git push origin --delete bind-fr-update-2.4

    and the same for <samp>bind-fr-update</samp> in the trunk directory.

With a single clone, run all of the steps in the same directory and use
<samp>git switch</samp> to move between branches. The cherry-pick step
becomes <samp>git cherry-pick bind-fr-update</samp>, as the trunk commit is
already in your clone. The same goes for worktrees, where you just change
directory instead of switching.

Non-committers push to their fork instead of <samp>origin</samp>, and open
the pull request from there.

If a reviewer asks for changes, commit them to the same branch and push
again. The pull request updates automatically.

# Review and Backports #

The review-then-commit and commit-then-review rules that applied under SVN
still apply. The [project guidelines](guidelines.html) describe them in
detail.

Voting on backports in the STATUS file has been replaced by pull request
reviews. To propose a backport to the stable branch, open a pull request
against <samp>2.4.x</samp>. The approvals that used to be recorded as votes
in STATUS are now given as reviews on that pull request.

**Not yet decided:** how commit-then-review changes, such as documentation
and translation updates on trunk, work with pull requests. For example,
whether committers can merge their own pull request without a review. Until
this is settled, ask on the
[developers list](https://httpd.apache.org/lists.html#http-dev) if you are
unsure.

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
