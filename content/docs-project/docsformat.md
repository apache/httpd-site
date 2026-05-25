Title: Documentation Format and Build
license: https://www.apache.org/licenses/LICENSE-2.0

# Documentation Format and Build

This page describes the XML format used for the Apache HTTP Server
documentation and how to transform it into HTML for review.

## Format Overview

The documentation is written in a custom XML format with its own DTD.
The DTD is in the
[style directory](https://httpd.apache.org/docs/current/style/) of the
manual. For detailed markup conventions, see the
[Documentation Style Guide](style-guide.html).

### Common Markup Elements

| Element | Purpose |
|---------|---------|
| `<example> ... </example>` | Wraps a code example block |
| `<highlight language="config"> ... </highlight>` | Configuration example with syntax highlighting |
| `<highlight language="perl"> ... </highlight>` | Perl code with highlighting |
| `<highlight language="lua"> ... </highlight>` | Lua code with highlighting |
| `<highlight language="C"> ... </highlight>` | C code with highlighting |
| `<directive module="...">Name</directive>` | Cross-reference to a directive |
| `<module>mod_name</module>` | Cross-reference to a module |
| `<program>name</program>` | Cross-reference to an httpd program |
| `<var>placeholder</var>` | User-supplied value |
| `<note> ... </note>` | Informational callout |
| `<note type="warning"> ... </note>` | Warning callout |

The full format is best learned by reading existing documentation files.
Start with a simple page and the patterns will become clear quickly.

## Viewing Your Changes

Modern browsers can render the XML files directly by applying the
referenced XSLT stylesheet. Simply open the `.xml` file in your browser
to see a reasonable approximation of the final output. This lets you
check your work without any build setup.

For the authoritative rendering, use the Ant build system described
below.

## Building the Documentation

The official build uses Xalan + Xerces (Java) via Apache Ant. This
ensures consistent HTML output across all contributors.

### Prerequisites

- Java 8 or later (JRE or JDK)
- An SVN checkout of the docs (see [SVN workflow](svn.html))

### Build Steps

From your checkout:

    cd docs/manual
    svn co https://svn.apache.org/repos/asf/httpd/docs-build/trunk build
    cd build
    ./build.sh all

The `all` target builds documentation for all available languages. To
build only English:

    ./build.sh

To build a specific language (e.g., French):

    ./build.sh fr

### Available Build Targets

To see all available targets:

    ./build.sh -projecthelp

## Validating Your Changes {#validation}

Before submitting a patch, validate your XML and the generated HTML:

    ./build.sh validate-xml
    ./build.sh validate-xhtml

These checks will catch malformed XML, broken cross-references, and
invalid HTML output. Please run them before sending patches — it saves
everyone time.

## Special Files

When adding a new module, the build process generates entries in
`mod/allmodules.xml` and creates accompanying metafiles. This step
requires a working Perl installation. If you don't have Perl available,
just note this in your patch submission and someone on the team will
handle it.

## See Also

- [Style Guide](style-guide.html) — markup conventions and prose style
- [SVN Workflow](svn.html) — checking out and submitting patches
- [Tools for Contributors](tools.html) — editors and validation tools
