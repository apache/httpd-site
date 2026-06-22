Title: Documentation Format and Build
license: https://www.apache.org/licenses/LICENSE-2.0

# Documentation Format and Build

This page describes the XML format used for the Apache HTTP Server
documentation and how to transform it into HTML for review.

## Format Overview

The documentation is written in a custom XML format with its own DTD.
The DTD is in the
[style directory](https://httpd.apache.org/docs/current/style/) of the
manual.

For markup conventions, element usage, prose style rules, and
typographic guidelines, see the
[Documentation Style Guide](style-guide.html).

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

The `validate-xhtml` target uses the W3C Nu HTML Checker. If you don't
already have it, download `vnu.jar` into the `build/` directory:

    curl -L -o vnu.jar https://github.com/validator/validator/releases/download/latest/vnu.jar

See [https://github.com/validator/validator](https://github.com/validator/validator) for details.

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
