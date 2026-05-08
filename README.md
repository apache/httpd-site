# Apache HTTP Server Project Website

This is the source for the [Apache HTTP Server Project website](https://httpd.apache.org/), built using the [ASF Pelican Action](https://infra.apache.org/asf-pelican.html) and the ASF theme.

## Contributing

- **Submit changes**: Open a pull request against this repository at <https://github.com/apache/httpd-site>.
- **Report issues**: File an issue on the same GitHub repository.
- **Discuss changes**: Use the docs mailing list at `docs@httpd.apache.org`. You can subscribe by sending a message to `docs-subscribe@httpd.apache.org`.

## Building and testing

The site is built automatically by the ASF CI/CD pipeline via the [ASF Infrastructure Pelican Action](https://github.com/apache/infrastructure-actions/tree/main/pelican). You do not need to build locally to contribute — just edit the Markdown or HTML files in `content/` and submit a PR.

### Preview branches

To preview your changes before merging to `main`, push to a `preview/*` branch:

```bash
git checkout -b preview/my-changes
# make your edits
git commit -a -m "Description of changes"
git push origin preview/my-changes
```

The ASF autobuild will generate a staged preview. Build notifications are sent to `dev@httpd.apache.org`.

### Local builds

There is no straightforward local build for sites using the newer `pelicanconf.yaml` system. For full details on the build process and tooling, see the [ASF-Pelican documentation](https://infra.apache.org/asf-pelican.html).

## Security content

The Pelican build runs [`content/security/vulnerabilities.sh`](content/security/vulnerabilities.sh) to generate security advisory HTML and JSON. These generated files are listed in [`.gitignore`](.gitignore).

Shell and Python script files are otherwise ignored by the build.
