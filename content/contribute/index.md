Title: Apache HTTP Server: Contribute
license: https://www.apache.org/licenses/LICENSE-2.0

Just the facts… where and how to contribute.

# Where

The software’s source code is in svn at:

 * Trunk: <samp>https://svn.apache.org/repos/asf/httpd/httpd/trunk</samp>
 * 2.4 (stable): <samp>https://svn.apache.org/repos/asf/httpd/httpd/2.4.x</samp>

The source is also [mirrored on GitHub](https://github.com/apache/httpd).

(Further details in [Developer Info](../dev/))

## Documentation and website
The documentation source is in each version's source tree, under <samp>docs/manual/</samp>.

Website source is at: <samp>https://github.com/apache/httpd-site</samp>

# How

Patches may be submitted by mailing output of <samp>svn diff</samp> to
the [dev@httpd](https://lists.apache.org/list.html?dev@httpd.apache.org)
mailing list, or via a pull request at the above GitHub repo.

Documentation patches may be sent to
[the `docs` mailing list](https://httpd.apache.org/lists.html#http-docs).

(Further details about how to generate an svn diff are in the
[devnotes](../dev/devnotes.html))

# What

Places to find good things to work on include:

* The [STATUS file](https://svn.apache.org/repos/asf/httpd/httpd/trunk/STATUS)
* [Issue trackers](../bug_report.html)