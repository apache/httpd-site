Title: Contributing to the Documentation
license: https://www.apache.org/licenses/LICENSE-2.0

# Contributing to the Apache HTTP Server Documentation

We'd love your help improving the Apache HTTP Server documentation. You
don't need to be a programmer — if you can spot a confusing sentence, fix
a typo, or explain something more clearly, you're already making a
difference. Your work will be read by millions of httpd users worldwide.

This page is about *contributing to the docs*, not about configuring
httpd. For configuration help, see the
[Users mailing list](../userslist.html).

## Before You Start

- **No ICLA or ASF account is needed** to submit documentation patches.
  Anyone can contribute.
- **The GitHub mirror** (github.com/apache/httpd) is read-only — do NOT
  open pull requests there. They won't be reviewed. Patches go through
  SVN and the mailing list.
- **Patches sent to the mailing list** are typically reviewed within a
  few days.

## Ways to Contribute

There's something for every skill level:

### Quick Wins (no SVN needed)

- **Report a problem** — [Open a Bugzilla
  ticket](https://bz.apache.org/bugzilla/enter_bug.cgi?product=Apache%20httpd-2&component=Documentation)
  describing what's wrong or confusing.
- **Suggest an improvement** — Send a note to the
  [docs mailing list](mailto:docs-subscribe@httpd.apache.org) with your
  idea.
- **Join the conversation** — Subscribe to `docs@httpd.apache.org` and
  weigh in on ongoing discussions.

### Fast Path for Small Fixes

You don't need SVN to report a problem or suggest a fix. For typos or
small corrections, just describe the fix in an email to
`docs@httpd.apache.org`, or open a Bugzilla ticket with the corrected
text. A committer will apply it for you.

For anything more than a sentence or two, the SVN patch workflow
(described below) is preferred — it gives reviewers the full context of
your change.

### Fix and Improve (SVN patch workflow)

- Fix typos, broken examples, or unclear explanations.
- Add missing configuration examples.
- Update outdated information.
- Improve the documentation for a module you know well.

For these, you'll check out the docs from SVN, make your changes, and
send us a patch. See our [SVN workflow guide](svn.html) for step-by-step
instructions — it's straightforward even if you haven't used SVN before.

### Larger Contributions

- Write a new how-to or tutorial.
- Document a module that's missing coverage.
- Translate documentation into another language (see the
  [translation guide](translations.html)).

For anything substantial, we recommend introducing yourself on the
mailing list first. That way you can get feedback on your approach
before investing a lot of time.

## Getting Set Up

1. **Subscribe to the mailing list** — Send email to
   [docs-subscribe@httpd.apache.org](mailto:docs-subscribe@httpd.apache.org).
2. **Check out the source** — Follow our [SVN instructions](svn.html).
3. **Learn the format** — Read about the
   [documentation XML format](docsformat.html) and the
   [style guide](style-guide.html).
4. **Set up your tools** — See [Tools for Contributors](tools.html) for
   editor and workflow recommendations.

## Submitting Your Work

The standard workflow is:

1. Make your changes in your SVN checkout.
2. Run `svn diff > my-changes.patch` to create a patch file.
3. Send the patch to `docs@httpd.apache.org`, or attach it to a
   [Bugzilla ticket](https://bz.apache.org/bugzilla/enter_bug.cgi?product=Apache%20httpd-2&component=Documentation).
4. Include a brief description of what you changed and why.

Don't worry about getting everything perfect on the first try. We review
all contributions and are happy to help you iterate.

## Communication Channels

- **Mailing list:** `docs@httpd.apache.org`
  ([subscribe](mailto:docs-subscribe@httpd.apache.org) |
  [archives](https://lists.apache.org/list.html?docs@httpd.apache.org))
- **IRC:** #httpd on [irc.libera.chat](https://libera.chat/)
- **Bug tracker:**
  [Bugzilla](https://bz.apache.org/bugzilla/enter_bug.cgi?product=Apache%20httpd-2&component=Documentation)

## The XML Format

The documentation is written in a custom XML format, transformed to HTML
via XSLT. If you're not familiar with XML, don't let that stop you — it's
quite readable, and the community will help you with markup questions.
See the [documentation format](docsformat.html) page for details, and
the [style guide](style-guide.html) for markup conventions.

## Translation Projects

If you'd like to translate the documentation into another language, see
the [translations page](translations.html) for how to get started.
