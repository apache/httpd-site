Title: Translating the Documentation
license: https://www.apache.org/licenses/LICENSE-2.0

# Translating the Documentation

Thank you for considering a translation contribution! Translations make
the Apache HTTP Server documentation accessible to millions of
non-English-speaking administrators worldwide.

Before you begin, please:

1. Read the general [documentation project information](./).
2. Subscribe to the
   [docs mailing list](mailto:docs-subscribe@httpd.apache.org).
3. Introduce yourself — let us know which language you'll be working in.
   There may already be a team for your language who can help coordinate.

## Getting Started

### 1. Set Up Your SVN Checkout

Check out the documentation source:

    svn checkout https://svn.apache.org/repos/asf/httpd/httpd/trunk/docs httpd-trunk-docs

Start your translations in **trunk**. Changes can be backported to the
2.4.x branch afterward.

### 2. Choose a File to Translate

Check the [translation status](avail_translations.html) to see what's
already been translated and what's needed.

Pick an untranslated file — for example, suppose you want to translate
`configuring.xml` into Spanish.

### 3. Create Your Translation File

Copy the English source file, adding your two-letter language code as
a file extension:

    cp configuring.xml configuring.xml.es

### 4. Translate

Open the new file in your editor and:

- **Set encoding to UTF-8.** Ensure the first line reads:
  `<?xml version="1.0" encoding="UTF-8" ?>`

- **Mark the English revision.** Replace `$LastChangedRevision:` with
  `English Revision:` followed by the current revision number. This
  helps future maintainers know when your translation was last synced.

- **Add translator credits** at the top of the file:

      <!-- Spanish translation: Your Name -->
      <!-- Reviewed by: Reviewer Name -->

- **Translate the text content.** Translate text within: `<p>`,
  `<title>`, `<description>`, `<name>`, `<compatibility>`, `<note>`,
  `<li>`, `<dd>`, and similar elements.

- **Leave code unchanged.** Directives, configuration examples, and
  other literal code stay in English.

- **Keep lines within 80 characters** where practical, so reviewers can
  read the files easily. (Exceptions for complex XML tags and languages
  without word spacing, like Chinese and Japanese.)

### 5. Submit Your Translation

Send your completed file (or a patch) to `docs@httpd.apache.org`. A
committer will review it and add it to the repository. Over time, you
may gain commit access yourself.

## Keeping Translations Current

Once your initial translation is committed, you'll want to keep it up to
date as the English source evolves. See
[Maintaining Translations](goingfurther.html) for a practical workflow.

## Review Standards

Because the development team can't easily verify non-English content, we
require that all translations be reviewed by another fluent speaker of
the language before acceptance. Each commit message should name both the
translator and the reviewer.

We encourage you to place credits in a comment at the top of the file:

    <!-- =============================================
         Translated by: Your Name <email>
         Reviewed by: Reviewer Name <email>
         ============================================= -->

The build system tracks the SVN revision of the equivalent English
version, so future translators know where to start updating.

## Related Information

- [Documentation Format](docsformat.html) — the XML format and how to
  build HTML from it
- [Translation Status](avail_translations.html) — what's been
  translated and what's needed
- [Maintaining Translations](goingfurther.html) — keeping your work
  up to date
