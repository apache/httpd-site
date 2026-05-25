Title: Maintaining Translations
license: https://www.apache.org/licenses/LICENSE-2.0

# Maintaining Translations

Once you've started translating, the ongoing work is keeping your
translations up to date as the English source evolves. This page
describes a practical workflow for tracking changes and updating your
translated files.

## The Basic Idea

The English documentation changes over time — bugs get fixed, features
get documented, examples get improved. As a translator, you need to:

1. Detect which English files have changed since you last translated
2. See what specifically changed
3. Apply the equivalent changes to your translated files
4. Verify your work builds correctly

## Recommended Workflow

### Set Up Your Working Environment

Check out both active branches:

    svn checkout https://svn.apache.org/repos/asf/httpd/httpd/trunk/docs httpd-trunk
    svn checkout https://svn.apache.org/repos/asf/httpd/httpd/branches/2.4.x/docs httpd-2.4

### Track Changes with SVN

The simplest way to see what's changed since a known revision is
`svn diff` between revisions. If you noted that you last synchronized
your translation at revision 1900000, you can see all changes since then:

    svn log -r 1900000:HEAD docs/manual/mod/mod_rewrite.xml
    svn diff -r 1900000:HEAD docs/manual/mod/mod_rewrite.xml

**Tip:** Note the current revision number each time you finish updating
a translation. Add it as a comment at the top of your translated file:

    <!-- English Revision: 1912345 -->

This makes it easy to check what's changed next time:

    svn diff -r 1912345:HEAD docs/manual/mod/mod_rewrite.xml

### Update Your Translation

With the diff output showing what changed in the English source, apply
the equivalent changes to your translated file. Focus on:

- New paragraphs or sections that need translating
- Changed examples or directive descriptions
- Removed content that should also be removed from your translation
- Corrected technical information

### Verify Your Work

Build the docs to confirm your XML is valid and the output looks right:

    cd docs/manual/build
    ./build.sh validate-xml
    ./build.sh <your-language-code>

Open the generated HTML in a browser to review the final result.

### Submit Your Updates

Send your updated files as a patch:

    svn diff > translation-update.patch

Email the patch to `docs@httpd.apache.org`, or attach it to a
[Bugzilla ticket](https://bz.apache.org/bugzilla/).

## Staying in Sync

A few habits that make maintenance easier:

- **Update regularly** — small, frequent updates are much easier than
  catching up after months of changes.
- **Watch the commits list** — subscribe to the svn commits to see
  documentation changes as they happen.
- **Coordinate with other translators** — if there are multiple people
  working on your language, divide the work and communicate via the
  mailing list.

## Questions?

If you get stuck or have questions about maintaining translations, reach
out to `docs@httpd.apache.org`. We're happy to help.
