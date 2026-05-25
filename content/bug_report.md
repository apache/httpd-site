Title: Bug Reporting

# Issue Tracking #

 **Reports of security issues should *not* be made here. Please see the [security report page](security_report.html)
if you have concerns or think you have discovered a security hole in the Apache HTTP server software.**

If you have identified a bug in the Apache HTTP Server, before you fill out a problem report form, <font color="red">make **sure** you have done **all** of the following:</font>

1. Verified that the issue affects [the most recent version of Apache httpd](/download.cgi).

1. Followed the instructions in the `INSTALL` file correctly.

1. Tried compiling with only the distributed set of modules and with no other patches (so that we can make sure it's an httpd bug and not a bug in a module or patch provided by someone else). It is frustrating to take time and effort to track down a problem only to figure out that it is caused by a broken third party module.

1. Looked at the error log. Please include any related messages in your report, or state that there are none.

1. Checked the [FAQ](https://cwiki.apache.org/confluence/display/HTTPD/FAQ).

1. Searched [the issue report database](https://bz.apache.org/bugzilla/). When you are doing this, you should be sure to search closed problem reports in addition to open ones. The search form on the main Bugzilla page by default applies only to open reports; to search all bug reports, begin the search with the keyword "ALL". For example, the following search will find all reported proxy bugs in Apache httpd 2.4: "ALL httpd-2.4 mod_proxy". Some helpful queries:

    * [All bugs fixed in the last 60 days](https://bz.apache.org/bugzilla/buglist.cgi?chfield=resolution&amp;chfieldfrom=-60d&amp;chfieldto=Now&amp;product=Apache%20httpd-2&amp;resolution=FIXED) 

    * [Frequently reported bugs](https://bz.apache.org/bugzilla/buglist.cgi?product=Apache+httpd-2&amp;long_desc=duplicate+of+this+bug.&amp;long_desc_type=allwordssubstr&amp;chfieldfrom=-30d&amp;chfieldto=Now&amp;) (bugs with duplicates changed in the last 30 days)

    * [All tickets changed in the last 10 days](https://bz.apache.org/bugzilla/buglist.cgi?chfieldfrom=-10d&amp;chfieldto=Now&amp;product=Apache+httpd-2) 


If you are unsure whether you have found a bug in the Apache HTTP Server, we strongly recommend that you consult the
[Apache HTTP Server Users List](userslist.html) before filing a ticket. If you don't receive a response
within a few days, then please submit it to the relevant issue tracking system. If it's a known issue, you'll probably get a faster response from the mailing list and you will help keep developer time free for improving Apache httpd.
Most bug reports submitted are actually user configuration problems that could be easily fixed by asking on the mailing list.

Do **not** post to the mailing list **and** submit a bug report at the same time. Post to the mailing list first, and wait a few days before submitting a bug report.

**Do NOT send configuration questions!** 

**If you're tracing spam or you're here because one of your favorite websites now says 'It Worked! Apache is installed!' -- then contact the mail originator or the website's owner directly, because they're just using our software and we have nothing to do with them. Don't waste your time, or ours, by telling us about it.** 

If you have done all of the preceding, then please select the appropriate issue tracking system, fill out the form and submit it:
* For the software and most documentation issues, use [ASF Bugzilla](https://bz.apache.org/bugzilla/). The appropriate Bugzilla project for Apache HTTPD is "Apache httpd-2".
* For the website pages such as this one which are not part of the distributed documentation (`docs/`), use [the `httpd-site` GitHub issue tracker](https://github.com/apache/httpd-site/issues).

We will respond to it as soon as we can.

| Issue Type | Where to Report |
|------------|-----------------|
| Code / software bugs | [ASF Bugzilla — Apache httpd-2](https://bz.apache.org/bugzilla/enter_bug.cgi?product=Apache+httpd-2) |
| Documentation bugs | [ASF Bugzilla — Documentation](https://bz.apache.org/bugzilla/enter_bug.cgi?product=Apache+httpd-2&component=Documentation) |
| Website issues | [File as Documentation](https://bz.apache.org/bugzilla/enter_bug.cgi?product=Apache+httpd-2&component=Documentation) |

