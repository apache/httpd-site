# Pelican ASF Website

See [ASF-Pelican](https://infra.apache.org/asf-pelican.html)

See [migration notes](migration/README.md)

## Security content

The pelican build first runs a shell script [`content/security/vulnerabilities.sh`](content/security/vulnerabilities.sh) to run the other shell scripts.
These generate html into md files along with the full json. See [.gitignore](.gitignore) for the list of files.

Shell and python script files are otherwise ignored by the build.

