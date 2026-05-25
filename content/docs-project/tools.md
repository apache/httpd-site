Title: Tools for Contributors
license: https://www.apache.org/licenses/LICENSE-2.0

# Tools for Contributors

You don't need much to contribute to the Apache HTTP Server
documentation — a text editor and SVN will get you started. But the
right tools can make the workflow smoother, especially if XML or SVN
are new to you.

Everything here is optional. Use whatever works for you.

## Text Editors

The documentation is written in XML, so an editor with XML support
makes life easier — syntax highlighting, auto-closing tags, and
validation feedback help catch mistakes early.

- **VS Code** with the
  [XML extension](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-xml)
  — good highlighting, schema validation, and auto-completion. Free and
  cross-platform.
- **Emacs** with `nxml-mode` — excellent built-in XML editing with
  real-time validation against the DTD. Ships with Emacs.
- **Vim** with XML plugins (e.g., `vim-xml`, `xmledit`) — tag matching
  and completion for Vim users.
- **Any editor** — the XML format is readable plain text. If you're
  comfortable in your editor, it will work fine.

## SVN Clients

The command-line `svn` client is what most contributors use, and it's
what our workflow documentation assumes. It's available on all platforms:

- **Command-line svn** (recommended) — ships with most Linux
  distributions. On macOS, install via Homebrew (`brew install svn`). On
  Windows, available via
  [SlikSVN](https://sliksvn.com/) or
  [TortoiseSVN](https://tortoisesvn.net/) (which includes command-line
  tools).
- **TortoiseSVN** (Windows) — integrates with Windows Explorer. Good if
  you prefer a GUI, but command-line is still recommended for generating
  patches.
- **svnX** (macOS) — a macOS GUI for SVN. Useful for browsing history
  and viewing diffs visually.

See the [SVN workflow page](svn.html) for checkout and patch
instructions.

## XML Validation

Always validate your XML before submitting. Malformed XML breaks the
build for everyone.

- **The Ant build targets** — the official way. From your
  `docs/manual/build/` directory:

      ./build.sh validate-xml
      ./build.sh validate-xhtml

- **xmllint** (from libxml2) — quick command-line validation:

      xmllint --noout --valid docs/manual/mod/mod_rewrite.xml

  Available on most systems (`brew install libxml2` on macOS, usually
  pre-installed on Linux).

## Viewing Your Changes

- **Browser XSLT** — modern browsers (Firefox, Chrome, Safari) can
  render the XML files directly by applying the XSLT stylesheet. Just
  open the `.xml` file in your browser for a quick preview.
- **The Ant build** — for the authoritative rendering, build the HTML:

      cd docs/manual/build
      ./build.sh

  Then open the generated HTML files in your browser.

## Diff and Merge Tools

For comparing revisions and reviewing changes:

- **svn diff** — built into SVN, always available. Produces unified
  diffs on the command line.
- **Meld** — visual three-way diff/merge tool. Free, cross-platform.
  Excellent for comparing your translation against updated English
  source.
- **vimdiff** — Vim's built-in diff mode. Fast and keyboard-driven.
- **Beyond Compare** — commercial, but powerful for large comparison
  tasks.
- **VS Code** — built-in diff viewer works well for side-by-side
  comparison of two files.

## Regex Testing (for mod_rewrite docs)

If you're working on `mod_rewrite` documentation, these tools help
verify that regex examples are correct:

- **[regex101.com](https://regex101.com/)** — interactive regex tester
  with explanation. Select the PCRE2 flavor for httpd-compatible
  patterns.
- **[RegExr](https://regexr.com/)** — another visual regex tool with
  a good reference panel.
- **pcre2test** — command-line PCRE2 testing. The definitive tool for
  verifying patterns exactly as httpd processes them.
- **[grex](https://github.com/pemistahl/grex)** — generates regex
  patterns from example strings. Useful for verifying that a documented
  pattern matches what you expect.

## AI Assistants

AI coding assistants (GitHub Copilot, Claude, etc.) can help with XML
markup if you're not familiar with the format — they're good at
generating boilerplate tags, converting plain text to properly marked-up
XML, and suggesting element structures.

**However:** Always review AI-generated markup carefully. These tools
can produce plausible-looking but incorrect XML, use wrong element
names, or miss project-specific conventions. Human review is always
needed. When in doubt, check the [style guide](style-guide.html).

## Apache httpd Docs MCP Server

The [Apache httpd docs MCP server](https://github.com/rbowen/apache-httpd-docs-mcp)
lets you query the documentation programmatically — search directives,
look up module details, and browse pages via AI assistants or scripts.
Useful for quickly finding related documentation when writing new
content or checking cross-references.

## Summary

| Task | Recommended Tool |
|------|------------------|
| Editing XML | VS Code + XML extension, Emacs nxml-mode, or Vim |
| Version control | Command-line svn |
| Validating XML | `./build.sh validate-xml` or xmllint |
| Previewing output | Open .xml in browser, or full Ant build |
| Comparing changes | svn diff, Meld, or vimdiff |
| Testing regex | regex101.com (PCRE2 mode) |
| Querying docs | Apache httpd docs MCP server |
