Title: Documentation Style Guide
license: https://www.apache.org/licenses/LICENSE-2.0

# Apache HTTP Server Documentation Style Guide #

This guide defines conventions for writing and editing the Apache HTTP
Server documentation.

There are two main audiences for this guide:

1. Documentation writers — how to author and mark up content.
2. Documentation readers — how to interpret typographic conventions
   (see the [Reader's Guide](#readers-guide) section at the end).

# Inline Markup #

## `<var>` — User-Supplied Placeholders ##

Use `<var>` for any value the user must replace with their own input.
This includes placeholders in directive syntax definitions, prose
descriptions of arguments, and inline references to user-supplied
values.

    <syntax>Listen <var>port</var></syntax>
    <syntax>AuthUserFile <var>file-path</var></syntax>
    <p>Replace <var>hostname</var> with your server's FQDN.</p>

Do **not** use `<em>` for placeholders. Legacy files use `<em>` in this role;
new and updated content should use `<var>` exclusively.

## `<em>` — Emphasis ##

Use `<em>` only for rhetorical emphasis — drawing attention to a word
or phrase in running prose.

    <p>The directive must appear <em>before</em> any VirtualHost blocks.</p>
    <p>This applies to <em>all</em> requests, not just local ones.</p>

Common legitimate uses: *not*, *must*, *only*, *all*, *any*, *before*, *after*,
*e.g.*, *i.e.*, etc.

Do **not** use `<em>` for placeholder variables (use `<var>`), for keywords
(use `<code>`), or for strong warnings (use `<strong>`).

## `<code>` — Literal Values and Inline Code ##

Use `<code>` for any literal string that appears in configuration,
commands, output, or protocols:

- Filenames and paths: `<code>.htaccess</code>`, `<code>httpd.conf</code>`
- HTTP methods: `<code>GET</code>`, `<code>POST</code>`
- Header names: `<code>Content-Type</code>`, `<code>ETag</code>`
- Configuration keywords: `<code>On</code>`, `<code>Off</code>`, `<code>None</code>`
- MIME types: `<code>text/html</code>`
- Environment variables: `<code>PATH_INFO</code>`
- CLI flags and arguments: `<code>-k</code>`, `<code>graceful</code>`
- Signal names: `<code>TERM</code>`, `<code>USR1</code>`

Do **not** nest `<strong>` inside `<code>`. If emphasis is needed on a code
element, restructure the sentence so the emphasis is in the prose.

## `<strong>` — Strong Emphasis ##

Use `<strong>` sparingly, for critical warnings or to highlight a word
that the reader must not miss:

    <p>You should <strong>not</strong> use this in production.</p>

Do **not** use `<strong>` inside `<code>` blocks. Do **not** use `<strong>` where
`<note type="warning">` would be more appropriate.

## `<program>` — Apache httpd Programs ##

Use `<program>` for any executable that ships with httpd and has its
own manual page:

    <program>httpd</program>
    <program>apachectl</program>
    <program>htpasswd</program>
    <program>rotatelogs</program>
    <program>configure</program>

This generates a cross-reference link to the program's documentation.
Do **not** use `<code>` for httpd program names.

## `<module>` — Module Names ##

Use `<module>` for Apache module names. This generates a cross-reference
link to the module's documentation:

    <module>mod_rewrite</module>
    <module>mod_ssl</module>
    <module>core</module>

Do **not** use `<code>` for module names.

## `<directive>` — Directive Names ##

Use `<directive>` for Apache directive names. Include the `module`
attribute when referencing a directive outside its own module's
documentation:

    <directive module="core">ServerRoot</directive>
    <directive module="mpm_common">Listen</directive>

Within a module's own documentation, the module attribute may be
omitted:

    <directive>Listen</directive>

For section directives, add `type="section"`:

    <directive module="core" type="section">VirtualHost</directive>

## `<glossary>` — Glossary Terms ##

Use `<glossary>` for terms defined in the project glossary. Use the
`ref` attribute when the link target differs from the display text:

    <glossary>APR</glossary>
    <glossary ref="regex">regular expression</glossary>
    <glossary>MIME-type</glossary>

# Directive Syntax Definitions #

## Placeholder Arguments ##

Use `<var>` for all user-supplied arguments in `<syntax>` blocks:

    <syntax>ServerRoot <var>directory-path</var></syntax>
    <syntax>Timeout <var>time-interval</var>[s]</syntax>

## Keyword Arguments ##

Literal keyword choices appear untagged, separated by `|`:

    <syntax>AllowOverride All|None|<var>directive-type</var>
    [<var>directive-type</var>] ...</syntax>

    <syntax>EnableSendfile On|Off</syntax>

## Standard Argument-Type Names ##

Use these lowercase hyphenated names consistently in `<var>` tags:

| Name | Meaning |
|------|---------|
| `file-path` | Filesystem path (ServerRoot-relative if not absolute) |
| `directory-path` | Filesystem directory path |
| `URL-path` | URL path component (e.g. /images/) |
| `url` | Full URL |
| `filename` | Bare filename without directory |
| `extension` | File extension (e.g. .html) |
| `regex` | Regular expression |
| `expression` | ap_expr expression |
| `number` | Integer |
| `bytes` | Size in bytes |
| `seconds` | Time in seconds |
| `duration` | Time interval (may include unit suffix) |
| `hostname` | DNS hostname |
| `name` | Generic identifier |
| `value` | Generic value |
| `provider-name` | Authentication/authorization provider name |
| `env-variable` | Environment variable name |
| `MIME-type` | Media type (e.g. text/html) |
| `method` | HTTP method |

## Quoting in Configuration Examples ##

In `<highlight language="config">` blocks, quote these argument types:

- Filesystem paths: `ServerRoot "/usr/local/apache2"`
- URLs: `Redirect "/" "https://example.com/"`
- AuthName values: `AuthName "Restricted Area"`
- Regex patterns: `RewriteRule "^/old(.*)" "/new$1"`

Do **not** quote bare keywords:

- `AllowOverride None`
- `Options FollowSymLinks`
- `Require all granted`

# Block-Level Elements #

## Code Examples ##

Use `<example>` with a nested `<highlight language="...">` block:

    <example>
    <highlight language="config">
    Listen 80
    Listen 8000
    </highlight>
    </example>

Valid language values: `config` (most common), `lua`, `c`, `perl`, `sh`, `html`.

Do **not** use bare `<example>` with `<br />` for line breaks. This is a
legacy pattern. Convert to `<highlight>` when editing such files.

If an example needs a title, use `<example><title>`:

    <example>
      <title>2.4 configuration:</title>
      <highlight language="config">
    Require all granted
      </highlight>
    </example>

## Notes and Warnings ##

Use `<note>` for informational callouts:

    <note>
    <p>When you issue a restart, a syntax check is run first.</p>
    </note>

Use `<note type="warning">` for critical warnings:

    <note type="warning">
    <p>Overlapping Listen directives will cause a fatal error.</p>
    </note>

A `<note>` may contain a `<title>` for labeled callouts:

    <note><title>Mixing old and new directives</title>
    <p>...</p>
    </note>

Do **not** use `<strong>Note:</strong>` in prose as a substitute for `<note>`.

## See Also ##

Place `<seealso>` elements after `<summary>` and before the first
`<section>`:

    <seealso><a href="vhosts/">Virtual Hosts</a></seealso>
    <seealso><program>httpd</program></seealso>
    <seealso><module>mod_ssl</module></seealso>

# Prose Style #

## Voice and Person ##

Address the reader directly in second person:

> "You should review your configuration before upgrading."
> "If you want httpd to handle IPv4 connections only..."

Use "we" occasionally when speaking as the project:

> "We recommend using the apachectl control script."

Avoid impersonal third-person constructions when second person is
natural:

- **Avoid:** "The administrator should configure..."
- **Prefer:** "You should configure..."

## Contractions ##

Contractions are acceptable and widely used throughout the
documentation. Use them naturally:

> "If it doesn't exist..."
> "...they won't be lost..."
> "...you can't use apachectl..."

## Spelling ##

Use American English spelling:

- behavior (not behaviour)
- customize (not customise)
- recognize (not recognise)
- authorize (not authorise)
- color (not colour)

## Product Name ##

Use these forms in these contexts:

- First reference in a page: "Apache HTTP Server" or "Apache httpd"
- Subsequent references: "httpd" (wrapped in `<program>` when
  referring to the executable, or bare when referring to the server generally)
- In `<program>` tags: `<program>httpd</program>`

Do **not** use bare "Apache" to refer to the server. "Apache" is the
foundation; "httpd" is the server.

## Oxford Comma ##

Use the Oxford (serial) comma:

> "...addresses, hostnames, and ports."
> "...stop, restart, and graceful-stop."

## Sentence Structure ##

Prefer active voice over passive:

- **Avoid:** "The directive is used to configure..."
- **Prefer:** "Use this directive to configure..."

Keep sentences concise. Break complex instructions into numbered
steps or bullet lists.

# Formatting and Structure #

## Indentation ##

Use spaces, not tabs. Indent consistently within each file (2 or 4
spaces are both acceptable, but do not mix within a single file).

Content inside `<highlight>` blocks should be left-aligned (no leading
indentation) for config examples, since the whitespace is preserved
in output:

    <highlight language="config">
    Listen 80
    Listen 8000
    </highlight>

## File Structure ##

Every manual page follows this structure:

    <?xml version="1.0" encoding="UTF-8" ?>
    <!DOCTYPE manualpage SYSTEM "./style/manualpage.dtd">
    <?xml-stylesheet type="text/xsl" href="./style/manual.en.xsl"?>
    <!-- $LastChangedRevision: NNNNNNN $ -->
    <!-- License block -->

    <manualpage metafile="BASENAME.xml.meta">
      <title>Page Title</title>
      <summary>...</summary>
      <seealso>...</seealso>
      <section id="unique-id">
        <title>Section Title</title>
        ...
      </section>
    </manualpage>

## Section IDs ##

Section `id` values should be short, lowercase, hyphenated English
identifiers:

    <section id="compile-time">
    <section id="access">
    <section id="commonproblems">

These IDs form URL anchors and must remain stable once published.

## Character Encoding ##

Use UTF-8 encoding for all new files. Write non-ASCII characters as
literal UTF-8 (e.g. é à ü), not as XML entities (e.g. `&eacute;`),
unless the file already uses XML entities consistently (as some
older German translations do).

# Reader's Guide  {#readers-guide} #

When reading the Apache HTTP Server documentation:

- *Italic text* (`<em>`) indicates emphasis — pay special attention
  to the marked word.

- *Slanted/colored text* (`<var>`) indicates a placeholder — replace
  it with your own value. For example, `<var>file-path</var>` means
  you supply an actual filesystem path.

- `Monospace text` (`<code>`) indicates a literal value — type it
  exactly as shown. This includes filenames, keywords, HTTP methods,
  and header names.

- **Bold text** (`<strong>`) indicates a critical point — do not skip it.

- Linked module names (`<module>`) and directive names (`<directive>`)
  are clickable cross-references to the relevant documentation.

- Linked program names (`<program>`) are clickable cross-references
  to the program's manual page.

- Shaded blocks (`<example>`/`<highlight>`) contain configuration
  snippets or shell commands that you can copy and adapt.

- Callout boxes (`<note>`) contain supplementary information.
  Warning boxes (`<note type="warning">`) indicate potential pitfalls
  or destructive actions.

- In directive syntax lines:
    - UPPERCASE or lowercase-hyphenated placeholders are values you
      supply (e.g. `file-path`, `URL-path`, `regex`).
    - Literal keywords are shown as-is (e.g. `On`, `Off`, `All`, `None`).
    - Square brackets `[ ]` indicate optional arguments.
    - Pipe characters `|` separate alternative choices.
    - Ellipsis `...` indicates the argument may be repeated.
    - Quoted arguments in examples indicate that the quotes are
      required or recommended in your configuration file.
