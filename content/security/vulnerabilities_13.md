Title: Apache HTTP Server 1.3 vulnerabilities

<h1>Apache HTTP Server 1.3 vulnerabilities</h1>
<p>This page lists all security vulnerabilities fixed in released versions of Apache HTTP Server 1.3. Each vulnerability is given a security <a href="/security/impact_levels.html">impact rating</a> by the Apache security team - please note that this rating may well vary from platform to platform.  We also list the versions the flaw is known to affect, and where a flaw has not been verified list the version with a question mark.</p>
<p>Please note that if a vulnerability is shown below as being fixed in a "-dev" release then this means that a fix has been applied to the development source tree and will be part of an upcoming full release.</p>
<p>Please send comments or corrections for these vulnerabilities to the <a href="/security_report.html">Security Team</a>.</p> <br/>
<p><h3>Apache httpd 1.3 has had no new releases since 2010 and should not be used.   This page only lists security issues that occurred before March 2010.  Subsequent issues may have affected 1.3 but will not be investigated or listed here.  Users are advised to upgrade to the currently supported released version to address known issues.</h3></p><br/>

<h1 id="1.3-never">Fixed in Apache HTTP Server 1.3-never</h1><dl>

<dt><h3 id="CVE-2011-3368">moderate: <name name="CVE-2011-3368">mod_proxy reverse proxy exposure</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2011-3368">CVE-2011-3368</a>)</h3></dt>
<dd><p>An exposure was found when using mod_proxy in reverse proxy mode. In certain configurations using RewriteRule with proxy flag or ProxyPassMatch, a remote attacker could cause the reverse proxy to connect to an arbitrary server, possibly disclosing sensitive information from internal web servers not directly accessible to attacker. No update of 1.3 will be released.</p><p>Patches will be published to https://archive.apache.org/dist/httpd/patches/apply_to_1.3.42/</p>
<p>Acknowledgements: This issue was reported by Context Information Security Ltd</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2011-09-16</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2011-10-05</td></tr>
<tr><td class="cve-header">Update 2.2.22 released</td><td class="cve-value">2012-01-31</td></tr>
<tr><td class="cve-header">Update 2.0.65 released</td><td class="cve-value">2013-07-22</td></tr>
<tr><td class="cve-header">Update 1.3-never released</td><td class="cve-value">--</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.2.21, 2.2.20, 2.2.19, 2.2.18, 2.2.17, 2.2.16, 2.2.15, 2.2.14, 2.2.13, 2.2.12, 2.2.11, 2.2.10, 2.2.9, 2.2.8, 2.2.6, 2.2.5, 2.2.4, 2.2.3, 2.2.2, 2.2.0, 2.0.64, 2.0.63, 2.0.61, 2.0.59, 2.0.58, 2.0.55, 2.0.54, 2.0.53, 2.0.52, 2.0.51, 2.0.50, 2.0.49, 2.0.48, 2.0.47, 2.0.46, 2.0.45, 2.0.44, 2.0.43, 2.0.42, 2.0.40, 2.0.39, 2.0.37, 2.0.36, 2.0.35, 1.3.42, 1.3.41, 1.3.39, 1.3.37, 1.3.36, 1.3.35, 1.3.34, 1.3.33, 1.3.32, 1.3.31, 1.3.29, 1.3.28, 1.3.27, 1.3.26, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.42">Fixed in Apache HTTP Server 1.3.42</h1><dl>

<dt><h3 id="CVE-2010-0010">moderate: <name name="CVE-2010-0010">mod_proxy overflow on 64-bit systems</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2010-0010">CVE-2010-0010</a>)</h3></dt>
<dd><p>An incorrect conversion between numeric types flaw was found in the mod_proxy module which affects some 64-bit architecture systems. A malicious HTTP server to which requests are being proxied could use this flaw to trigger a heap buffer overflow in an httpd child process via a carefully crafted response.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2009-12-30</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2010-01-27</td></tr>
<tr><td class="cve-header">Update 1.3.42 released</td><td class="cve-value">2010-02-03</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.41, 1.3.39, 1.3.37, 1.3.36, 1.3.35, 1.3.34, 1.3.33, 1.3.32, 1.3.31, 1.3.29, 1.3.28, 1.3.27, 1.3.26, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.41">Fixed in Apache HTTP Server 1.3.41</h1><dl>

<dt><h3 id="CVE-2007-5000">moderate: <name name="CVE-2007-5000">mod_imagemap XSS</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-5000">CVE-2007-5000</a>)</h3></dt>
<dd><p>A flaw was found in the mod_imagemap module. On sites where mod_imagemap is enabled and an imagemap file is publicly available, a cross-site scripting attack is possible.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2007-10-23</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2007-12-11</td></tr>
<tr><td class="cve-header">Update 2.2.8 released</td><td class="cve-value">2008-01-19</td></tr>
<tr><td class="cve-header">Update 2.0.63 released</td><td class="cve-value">2008-01-19</td></tr>
<tr><td class="cve-header">Update 1.3.41 released</td><td class="cve-value">2008-01-19</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.2.6, 2.2.5, 2.2.4, 2.2.3, 2.2.2, 2.2.0, 2.0.61, 2.0.59, 2.0.58, 2.0.55, 2.0.54, 2.0.53, 2.0.52, 2.0.51, 2.0.50, 2.0.49, 2.0.48, 2.0.47, 2.0.46, 2.0.45, 2.0.44, 2.0.43, 2.0.42, 2.0.40, 2.0.39, 2.0.37, 2.0.36, 2.0.35, 1.3.39, 1.3.37, 1.3.36, 1.3.35, 1.3.34, 1.3.33, 1.3.32, 1.3.31, 1.3.29, 1.3.28, 1.3.27, 1.3.26, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2, 1.3.1, 1.3.0</td></tr>
</table></dd>
<dt><h3 id="CVE-2007-6388">moderate: <name name="CVE-2007-6388">mod_status XSS</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-6388">CVE-2007-6388</a>)</h3></dt>
<dd><p>A flaw was found in the mod_status module. On sites where mod_status is enabled and the status pages were publicly accessible, a cross-site scripting attack is possible. Note that the server-status page is not enabled by default and it is best practice to not make this publicly available.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2007-12-15</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2008-01-02</td></tr>
<tr><td class="cve-header">Update 2.2.8 released</td><td class="cve-value">2008-01-19</td></tr>
<tr><td class="cve-header">Update 2.0.63 released</td><td class="cve-value">2008-01-19</td></tr>
<tr><td class="cve-header">Update 1.3.41 released</td><td class="cve-value">2008-01-19</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.2.6, 2.2.5, 2.2.4, 2.2.3, 2.2.2, 2.2.0, 2.0.61, 2.0.59, 2.0.58, 2.0.55, 2.0.54, 2.0.53, 2.0.52, 2.0.51, 2.0.50, 2.0.49, 2.0.48, 2.0.47, 2.0.46, 2.0.45, 2.0.44, 2.0.43, 2.0.42, 2.0.40, 2.0.39, 2.0.37, 2.0.36, 2.0.35, 1.3.39, 1.3.37, 1.3.36, 1.3.35, 1.3.34, 1.3.33, 1.3.32, 1.3.31, 1.3.29, 1.3.28, 1.3.27, 1.3.26, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.39">Fixed in Apache HTTP Server 1.3.39</h1><dl>

<dt><h3 id="CVE-2006-5752">moderate: <name name="CVE-2006-5752">mod_status cross-site scripting</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-5752">CVE-2006-5752</a>)</h3></dt>
<dd><p>A flaw was found in the mod_status module. On sites where the server-status page is publicly accessible and ExtendedStatus is enabled this could lead to a cross-site scripting attack. Note that the server-status page is not enabled by default and it is best practice to not make this publicly available.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2006-10-19</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2007-06-20</td></tr>
<tr><td class="cve-header">Update 1.3.39 released</td><td class="cve-value">2007-09-07</td></tr>
<tr><td class="cve-header">Update 2.0.61 released</td><td class="cve-value">2007-09-07</td></tr>
<tr><td class="cve-header">Update 2.2.6 released</td><td class="cve-value">2007-09-07</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.2.4, 2.2.3, 2.2.2, 2.2.0, 2.0.59, 2.0.58, 2.0.55, 2.0.54, 2.0.53, 2.0.52, 2.0.51, 2.0.50, 2.0.49, 2.0.48, 2.0.47, 2.0.46, 2.0.45, 2.0.44, 2.0.43, 2.0.42, 2.0.40, 2.0.39, 2.0.37, 2.0.36, 2.0.35, 1.3.37, 1.3.36, 1.3.35, 1.3.34, 1.3.33, 1.3.32, 1.3.31, 1.3.29, 1.3.28, 1.3.27, 1.3.26, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2</td></tr>
</table></dd>
<dt><h3 id="CVE-2007-3304">moderate: <name name="CVE-2007-3304">Signals to arbitrary processes</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-3304">CVE-2007-3304</a>)</h3></dt>
<dd><p>The Apache HTTP server did not verify that a process was an Apache child process before sending it signals. A local attacker with the ability to run scripts on the HTTP server could manipulate the scoreboard and cause arbitrary processes to be terminated which could lead to a denial of service.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2006-05-15</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2007-06-19</td></tr>
<tr><td class="cve-header">Update 2.0.61 released</td><td class="cve-value">2007-09-07</td></tr>
<tr><td class="cve-header">Update 2.2.6 released</td><td class="cve-value">2007-09-07</td></tr>
<tr><td class="cve-header">Update 1.3.39 released</td><td class="cve-value">2007-09-07</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.2.4, 2.2.3, 2.2.2, 2.2.0, 2.0.59, 2.0.58, 2.0.55, 2.0.54, 2.0.53, 2.0.52, 2.0.51, 2.0.50, 2.0.49, 2.0.48, 2.0.47, 2.0.46, 2.0.45, 2.0.44, 2.0.43, 2.0.42, 2.0.40, 2.0.39, 2.0.37, 2.0.36, 2.0.35, 1.3.37, 1.3.36, 1.3.35, 1.3.34, 1.3.33, 1.3.32, 1.3.31, 1.3.29, 1.3.28, 1.3.27, 1.3.26, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2, 1.3.1, 1.3.0</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.37">Fixed in Apache HTTP Server 1.3.37</h1><dl>

<dt><h3 id="CVE-2006-3747">important: <name name="CVE-2006-3747">mod_rewrite off-by-one error</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-3747">CVE-2006-3747</a>)</h3></dt>
<dd><p>An off-by-one flaw exists in the Rewrite module, mod_rewrite. Depending on the manner in which Apache httpd was compiled, this software defect may result in a vulnerability which, in combination with certain types of Rewrite rules in the web server configuration files, could be triggered remotely. For vulnerable builds, the nature of the vulnerability can be denial of service (crashing of web server processes) or potentially allow arbitrary code execution.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2006-07-21</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2006-07-27</td></tr>
<tr><td class="cve-header">Update 2.2.3 released</td><td class="cve-value">2006-07-27</td></tr>
<tr><td class="cve-header">Update 2.0.59 released</td><td class="cve-value">2006-07-27</td></tr>
<tr><td class="cve-header">Update 1.3.37 released</td><td class="cve-value">2006-07-27</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.2.2, 2.2.0, 2.0.58, 2.0.55, 2.0.54, 2.0.53, 2.0.52, 2.0.51, 2.0.50, 2.0.49, 2.0.48, 2.0.47, 2.0.46, 1.3.36, 1.3.35, 1.3.34, 1.3.33, 1.3.32, 1.3.31, 1.3.29, 1.3.28</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.35">Fixed in Apache HTTP Server 1.3.35</h1><dl>

<dt><h3 id="CVE-2005-3352">moderate: <name name="CVE-2005-3352">mod_imap Referer Cross-Site Scripting</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2005-3352">CVE-2005-3352</a>)</h3></dt>
<dd><p>A flaw in mod_imap when using the Referer directive with image maps. In certain site configurations a remote attacker could perform a cross-site scripting attack if a victim can be forced to visit a malicious URL using certain web browsers.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2005-11-01</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2005-12-12</td></tr>
<tr><td class="cve-header">Update 2.2.2 released</td><td class="cve-value">2006-05-01</td></tr>
<tr><td class="cve-header">Update 2.0.58 released</td><td class="cve-value">2006-05-01</td></tr>
<tr><td class="cve-header">Update 1.3.35 released</td><td class="cve-value">2006-05-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.2.0, 2.0.55, 2.0.54, 2.0.53, 2.0.52, 2.0.51, 2.0.50, 2.0.49, 2.0.48, 2.0.47, 2.0.46, 2.0.45, 2.0.44, 2.0.43, 2.0.42, 2.0.40, 2.0.39, 2.0.37, 2.0.36, 2.0.35, 1.3.34, 1.3.33, 1.3.32, 1.3.31, 1.3.29, 1.3.28, 1.3.27, 1.3.26, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2, 1.3.1, 1.3.0</td></tr>
</table></dd>
<dt><h3 id="CVE-2006-3918">moderate: <name name="CVE-2006-3918">Expect header Cross-Site Scripting</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-3918">CVE-2006-3918</a>)</h3></dt>
<dd><p>A flaw in the handling of invalid Expect headers. If an attacker can influence the Expect header that a victim sends to a target site they could perform a cross-site scripting attack. It is known that some versions of Flash can set an arbitrary Expect header which can trigger this flaw. Not marked as a security issue for 2.0 or 2.2 as the cross-site scripting is only returned to the victim after the server times out a connection.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">--</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2006-05-08</td></tr>
<tr><td class="cve-header">Update 1.3.35 released</td><td class="cve-value">2006-05-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.34, 1.3.33, 1.3.32, 1.3.31, 1.3.29, 1.3.28, 1.3.27, 1.3.26, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.33">Fixed in Apache HTTP Server 1.3.33</h1><dl>

<dt><h3 id="CVE-2004-0940">moderate: <name name="CVE-2004-0940">mod_include overflow</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2004-0940">CVE-2004-0940</a>)</h3></dt>
<dd><p>A buffer overflow in mod_include could allow a local user who is authorised to create server side include (SSI) files to gain the privileges of a httpd child.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2004-10-21</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2004-10-21</td></tr>
<tr><td class="cve-header">Update 1.3.33 released</td><td class="cve-value">2004-10-28</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.32, 1.3.31, 1.3.29, 1.3.28, 1.3.27, 1.3.26, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2, 1.3.1, 1.3.0</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.32">Fixed in Apache HTTP Server 1.3.32</h1><dl>

<dt><h3 id="CVE-2004-0492">moderate: <name name="CVE-2004-0492">mod_proxy buffer overflow</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2004-0492">CVE-2004-0492</a>)</h3></dt>
<dd><p>A buffer overflow was found in the Apache proxy module, mod_proxy, which can be triggered by receiving an invalid Content-Length header. In order to exploit this issue an attacker would need to get an Apache installation that was configured as a proxy to connect to a malicious site. This would cause the Apache child processing the request to crash, although this does not represent a significant Denial of Service attack as requests will continue to be handled by other Apache child processes. This issue may lead to remote arbitrary code execution on some BSD platforms.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2003-06-08</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2003-06-10</td></tr>
<tr><td class="cve-header">Update 1.3.32 released</td><td class="cve-value">2004-10-20</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.31, 1.3.29, 1.3.28, 1.3.27, 1.3.26</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.31">Fixed in Apache HTTP Server 1.3.31</h1><dl>

<dt><h3 id="CVE-2003-0020">low: <name name="CVE-2003-0020">Error log escape filtering</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2003-0020">CVE-2003-0020</a>)</h3></dt>
<dd><p>Apache does not filter terminal escape sequences from error logs, which could make it easier for attackers to insert those sequences into terminal emulators containing vulnerabilities related to escape sequences.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2003-02-24</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2003-02-24</td></tr>
<tr><td class="cve-header">Update 1.3.31 released</td><td class="cve-value">2004-05-12</td></tr>
<tr><td class="cve-header">Update 2.0.49 released</td><td class="cve-value">2004-03-19</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.0.48, 2.0.47, 2.0.46, 2.0.45, 2.0.44, 2.0.43, 2.0.42, 2.0.40, 2.0.39, 2.0.37, 2.0.36, 2.0.35, 1.3.29, 1.3.28, 1.3.27, 1.3.26, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2, 1.3.1, 1.3.0</td></tr>
</table></dd>
<dt><h3 id="CVE-2003-0987">low: <name name="CVE-2003-0987">mod_digest nonce checking</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2003-0987">CVE-2003-0987</a>)</h3></dt>
<dd><p>mod_digest does not properly verify the nonce of a client response by using a AuthNonce secret. This could allow a malicious user who is able to sniff network traffic to conduct a replay attack against a website using Digest protection. Note that mod_digest implements an older version of the MD5 Digest Authentication specification which is known not to work with modern browsers. This issue does not affect mod_auth_digest.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2003-12-18</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2003-12-18</td></tr>
<tr><td class="cve-header">Update 1.3.31 released</td><td class="cve-value">2004-05-12</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.29, 1.3.28, 1.3.27, 1.3.26, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2, 1.3.1, 1.3.0</td></tr>
</table></dd>
<dt><h3 id="CVE-2003-0993">important: <name name="CVE-2003-0993">Allow/Deny parsing on big-endian 64-bit platforms</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2003-0993">CVE-2003-0993</a>)</h3></dt>
<dd><p>A bug in the parsing of Allow/Deny rules using IP addresses without a netmask on big-endian 64-bit platforms causes the rules to fail to match.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2003-10-15</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2003-10-15</td></tr>
<tr><td class="cve-header">Update 1.3.31 released</td><td class="cve-value">2004-05-12</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.29, 1.3.28, 1.3.27, 1.3.26, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2, 1.3.1, 1.3.0</td></tr>
</table></dd>
<dt><h3 id="CVE-2004-0174">important: <name name="CVE-2004-0174">listening socket starvation</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2004-0174">CVE-2004-0174</a>)</h3></dt>
<dd><p>A starvation issue on listening sockets occurs when a short-lived connection on a rarely-accessed listening socket will cause a child to hold the accept mutex and block out new connections until another connection arrives on that rarely-accessed listening socket. This issue is known to affect some versions of AIX, Solaris, and Tru64; it is known to not affect FreeBSD or Linux.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2004-02-25</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2004-03-18</td></tr>
<tr><td class="cve-header">Update 1.3.31 released</td><td class="cve-value">2004-05-12</td></tr>
<tr><td class="cve-header">Update 2.0.49 released</td><td class="cve-value">2004-03-19</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.0.48, 2.0.47, 2.0.46, 2.0.45, 2.0.44, 2.0.43, 2.0.42, 2.0.40, 2.0.39, 2.0.37, 2.0.36, 2.0.35, 1.3.29, 1.3.28?, 1.3.27?, 1.3.26?, 1.3.24?, 1.3.22?, 1.3.20?, 1.3.19?, 1.3.17?, 1.3.14?, 1.3.12?, 1.3.11?, 1.3.9?, 1.3.6?, 1.3.4?, 1.3.3?, 1.3.2?, 1.3.1?, 1.3.0?</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.29">Fixed in Apache HTTP Server 1.3.29</h1><dl>

<dt><h3 id="CVE-2003-0542">low: <name name="CVE-2003-0542">Local configuration regular expression overflow</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2003-0542">CVE-2003-0542</a>)</h3></dt>
<dd><p>By using a regular expression with more than 9 captures a buffer overflow can occur in mod_alias or mod_rewrite. To exploit this an attacker would need to be able to create a carefully crafted configuration file (.htaccess or httpd.conf)</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2003-08-04</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2003-10-27</td></tr>
<tr><td class="cve-header">Update 1.3.29 released</td><td class="cve-value">2003-10-27</td></tr>
<tr><td class="cve-header">Update 2.0.48 released</td><td class="cve-value">2003-10-27</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.0.47, 2.0.46, 2.0.45, 2.0.44, 2.0.43, 2.0.42, 2.0.40, 2.0.39, 2.0.37, 2.0.36, 2.0.35, 1.3.28, 1.3.27, 1.3.26, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2, 1.3.1, 1.3.0</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.28">Fixed in Apache HTTP Server 1.3.28</h1><dl>

<dt><h3 id="CVE-2003-0460">important: <name name="CVE-2003-0460">RotateLogs DoS</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2003-0460">CVE-2003-0460</a>)</h3></dt>
<dd><p>The rotatelogs support program on Win32 and OS/2 would quit logging and exit if it received special control characters such as 0x1A.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2003-07-04</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2003-07-18</td></tr>
<tr><td class="cve-header">Update 1.3.28 released</td><td class="cve-value">2003-07-18</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.27, 1.3.26?, 1.3.24?, 1.3.22?, 1.3.20?, 1.3.19?, 1.3.17?, 1.3.14?, 1.3.12?, 1.3.11?, 1.3.9?, 1.3.6?, 1.3.4?, 1.3.3?, 1.3.2?, 1.3.1?, 1.3.0?</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.27">Fixed in Apache HTTP Server 1.3.27</h1><dl>

<dt><h3 id="CVE-2002-0839">important: <name name="CVE-2002-0839">Shared memory permissions lead to local privilege escalation</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2002-0839">CVE-2002-0839</a>)</h3></dt>
<dd><p>The permissions of the shared memory used for the scoreboard allows an attacker who can execute under the Apache UID to send a signal to any process as root or cause a local denial of service attack.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2001-11-11</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2002-10-03</td></tr>
<tr><td class="cve-header">Update 1.3.27 released</td><td class="cve-value">2002-10-03</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.26, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2, 1.3.1, 1.3.0</td></tr>
</table></dd>
<dt><h3 id="CVE-2002-0840">low: <name name="CVE-2002-0840">Error page XSS using wildcard DNS</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2002-0840">CVE-2002-0840</a>)</h3></dt>
<dd><p>Cross-site scripting (XSS) vulnerability in the default error page of Apache 2.0 before 2.0.43, and 1.3.x up to 1.3.26, when UseCanonicalName is "Off" and support for wildcard DNS is present, allows remote attackers to execute script as other web page visitors via the Host: header.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2002-09-20</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2002-10-02</td></tr>
<tr><td class="cve-header">Update 2.0.43 released</td><td class="cve-value">2002-10-03</td></tr>
<tr><td class="cve-header">Update 1.3.27 released</td><td class="cve-value">2002-10-03</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.0.42, 2.0.40, 2.0.39, 2.0.37, 2.0.36, 2.0.35, 1.3.26, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2, 1.3.1, 1.3.0</td></tr>
</table></dd>
<dt><h3 id="CVE-2002-0843">important: <name name="CVE-2002-0843">Buffer overflows in ab utility</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2002-0843">CVE-2002-0843</a>)</h3></dt>
<dd><p>Buffer overflows in the benchmarking utility ab could be exploited if ab is run against a malicious server</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2002-09-23</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2002-10-03</td></tr>
<tr><td class="cve-header">Update 1.3.27 released</td><td class="cve-value">2002-10-03</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.26, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2, 1.3.1, 1.3.0</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.26">Fixed in Apache HTTP Server 1.3.26</h1><dl>

<dt><h3 id="CVE-2002-0392">critical: <name name="CVE-2002-0392">Apache Chunked encoding vulnerability</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2002-0392">CVE-2002-0392</a>)</h3></dt>
<dd><p>Malicious requests can cause various effects ranging from a relatively harmless increase in system resources through to denial of service attacks and in some cases the ability to execute arbitrary remote code.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2002-05-27</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2002-06-17</td></tr>
<tr><td class="cve-header">Update 2.0.37 released</td><td class="cve-value">2002-06-18</td></tr>
<tr><td class="cve-header">Update 1.3.26 released</td><td class="cve-value">2002-06-18</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.0.36, 2.0.35, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2, 1.3.1, 1.3.0</td></tr>
</table></dd>
<dt><h3 id="CVE-2003-0083">low: <name name="CVE-2003-0083">Filtered escape sequences</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2003-0083">CVE-2003-0083</a>)</h3></dt>
<dd><p>Apache did not filter terminal escape sequences from its access logs, which could make it easier for attackers to insert those sequences into terminal emulators containing vulnerabilities related to escape sequences.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2003-02-24</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2003-02-24</td></tr>
<tr><td class="cve-header">Update 2.0.46 released</td><td class="cve-value">2004-04-02</td></tr>
<tr><td class="cve-header">Update 1.3.26 released</td><td class="cve-value">2002-06-18</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.0.45, 2.0.44, 2.0.43, 2.0.42, 2.0.40, 2.0.39, 2.0.37, 2.0.36, 2.0.35, 1.3.24, 1.3.22, 1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2, 1.3.1, 1.3.0</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.24">Fixed in Apache HTTP Server 1.3.24</h1><dl>

<dt><h3 id="CVE-2002-0061">critical: <name name="CVE-2002-0061">Win32 Apache Remote command execution</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2002-0061">CVE-2002-0061</a>)</h3></dt>
<dd><p>Apache for Win32 before 1.3.24 and 2.0.34-beta allows remote attackers to execute arbitrary commands via parameters passed to batch file CGI scripts.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2002-02-13</td></tr>
<tr><td class="cve-header">Update 1.3.24 released</td><td class="cve-value">2002-03-22</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.22, 1.3.20?, 1.3.19?, 1.3.17?, 1.3.14?, 1.3.12?, 1.3.11?, 1.3.9?, 1.3.6?, 1.3.4?, 1.3.3?, 1.3.2?, 1.3.1?, 1.3.0?</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.22">Fixed in Apache HTTP Server 1.3.22</h1><dl>

<dt><h3 id="CVE-2001-0729">important: <name name="CVE-2001-0729">Requests can cause directory listing to be displayed</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2001-0729">CVE-2001-0729</a>)</h3></dt>
<dd><p>A vulnerability was found in the Win32 port of Apache 1.3.20. A client submitting a very long URI could cause a directory listing to be returned rather than the default index page.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2001-09-18</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2001-09-28</td></tr>
<tr><td class="cve-header">Update 1.3.22 released</td><td class="cve-value">2001-10-12</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.20</td></tr>
</table></dd>
<dt><h3 id="CVE-2001-0730">moderate: <name name="CVE-2001-0730">split-logfile can cause arbitrary log files to be written to</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2001-0730">CVE-2001-0730</a>)</h3></dt>
<dd><p>A vulnerability was found in the split-logfile support program. A request with a specially crafted Host: header could allow any file with a .log extension on the system to be written to.</p>
<table class="cve"><tr><td class="cve-header">Issue public</td><td class="cve-value">2001-09-28</td></tr>
<tr><td class="cve-header">Update 1.3.22 released</td><td class="cve-value">2001-10-12</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.20, 1.3.19, 1.3.17, 1.3.14, 1.3.12, 1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2, 1.3.1, 1.3.0</td></tr>
</table></dd>
<dt><h3 id="CVE-2001-0731">important: <name name="CVE-2001-0731">Multiviews can cause a directory listing to be displayed</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2001-0731">CVE-2001-0731</a>)</h3></dt>
<dd><p>A vulnerability was found when Multiviews are used to negotiate the directory index. In some configurations, requesting a URI with a QUERY_STRING of M=D could return a directory listing rather than the expected index page.</p>
<table class="cve"><tr><td class="cve-header">Issue public</td><td class="cve-value">2001-07-09</td></tr>
<tr><td class="cve-header">Update 1.3.22 released</td><td class="cve-value">2001-10-12</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.20, 1.3.19?, 1.3.17?, 1.3.14?, 1.3.12?, 1.3.11?, 1.3.9?, 1.3.6?, 1.3.4?, 1.3.3?, 1.3.2?, 1.3.1?, 1.3.0?</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.20">Fixed in Apache HTTP Server 1.3.20</h1><dl>

<dt><h3 id="CVE-2001-1342">important: <name name="CVE-2001-1342">Denial of service attack on Win32 and OS2</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2001-1342">CVE-2001-1342</a>)</h3></dt>
<dd><p>A vulnerability was found in the Win32 and OS2 ports of Apache 1.3. A client submitting a carefully constructed URI could cause a General Protection Fault in a child process, bringing up a message box which would have to be cleared by the operator to resume operation. This vulnerability introduced no identified means to compromise the server other than introducing a possible denial of service.</p>
<table class="cve"><tr><td class="cve-header">Update 1.3.20 released</td><td class="cve-value">2001-05-22</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.20, 1.3.19?, 1.3.17?, 1.3.14?, 1.3.12?, 1.3.11?, 1.3.9?, 1.3.6?, 1.3.4?, 1.3.3?, 1.3.2?, 1.3.1?, 1.3.0?</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.19">Fixed in Apache HTTP Server 1.3.19</h1><dl>

<dt><h3 id="CVE-2001-0925">important: <name name="CVE-2001-0925">Requests can cause directory listing to be displayed</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2001-0925">CVE-2001-0925</a>)</h3></dt>
<dd><p>The default installation can lead mod_negotiation and mod_dir or mod_autoindex to display a directory listing instead of the multiview index.html file if a very long path was created artificially by using many slashes.</p>
<table class="cve"><tr><td class="cve-header">Update 1.3.19 released</td><td class="cve-value">2001-02-28</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.17, 1.3.14, 1.3.12, 1.3.11</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.14">Fixed in Apache HTTP Server 1.3.14</h1><dl>

<dt><h3 id="CVE-2000-0505">moderate: <name name="CVE-2000-0505">Requests can cause directory listing to be displayed on NT</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2000-0505">CVE-2000-0505</a>)</h3></dt>
<dd><p>A security hole on Apache for Windows allows a user to view the listing of a directory instead of the default HTML page by sending a carefully constructed request.</p>
<table class="cve"><tr><td class="cve-header">Update 1.3.14 released</td><td class="cve-value">2000-10-13</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.12, 1.3.11?, 1.3.9?, 1.3.6?, 1.3.4?, 1.3.3?, 1.3.2?, 1.3.1?, 1.3.0?</td></tr>
</table></dd>
<dt><h3 id="CVE-2000-0913">important: <name name="CVE-2000-0913">Rewrite rules that include references allow access to any file</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2000-0913">CVE-2000-0913</a>)</h3></dt>
<dd><p>The Rewrite module, mod_rewrite, can allow access to any file on the web server. The vulnerability occurs only with certain specific cases of using regular expression references in RewriteRule directives: If the destination of a RewriteRule contains regular expression references then an attacker will be able to access any file on the server.</p>
<table class="cve"><tr><td class="cve-header">Issue public</td><td class="cve-value">2000-09-29</td></tr>
<tr><td class="cve-header">Update 1.3.14 released</td><td class="cve-value">2000-10-13</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.12, 1.3.11?, 1.3.9?, 1.3.6?, 1.3.4?, 1.3.3?, 1.3.2?, 1.3.1?, 1.3.0?</td></tr>
</table></dd>
<dt><h3 id="CVE-2000-1204">important: <name name="CVE-2000-1204">Mass virtual hosting can display CGI source</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2000-1204">CVE-2000-1204</a>)</h3></dt>
<dd><p>A security problem for users of the mass virtual hosting module, mod_vhost_alias, causes the source to a CGI to be sent if the cgi-bin directory is under the document root. However, it is not normal to have your cgi-bin directory under a document root.</p>
<table class="cve"><tr><td class="cve-header">Update 1.3.14 released</td><td class="cve-value">2000-10-13</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.12, 1.3.11, 1.3.9</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.12">Fixed in Apache HTTP Server 1.3.12</h1><dl>

<dt><h3 id="CVE-2000-1205">important: <name name="CVE-2000-1205">Cross-site scripting can reveal private session information</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2000-1205">CVE-2000-1205</a>)</h3></dt>
<dd><p>Apache was vulnerable to cross site scripting issues. It was shown that malicious HTML tags can be embedded in client web requests if the server or script handling the request does not carefully encode all information displayed to the user. Using these vulnerabilities attackers could, for example, obtain copies of your private cookies used to authenticate you to other sites.</p>
<table class="cve"><tr><td class="cve-header">Update 1.3.12 released</td><td class="cve-value">2000-02-25</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.11, 1.3.9, 1.3.6, 1.3.4, 1.3.3, 1.3.2, 1.3.1, 1.3.0</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.11">Fixed in Apache HTTP Server 1.3.11</h1><dl>

<dt><h3 id="CVE-2000-1206">moderate: <name name="CVE-2000-1206">Mass virtual hosting security issue</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2000-1206">CVE-2000-1206</a>)</h3></dt>
<dd><p>A security problem can occur for sites using mass name-based virtual hosting (using the new mod_vhost_alias module) or with special mod_rewrite rules.</p>
<table class="cve"><tr><td class="cve-header">Update 1.3.11 released</td><td class="cve-value">2000-01-21</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.9, 1.3.6?, 1.3.4?, 1.3.3?, 1.3.2?, 1.3.1?, 1.3.0?</td></tr>
</table></dd>
</dl></br/>

<h1 id="1.3.2">Fixed in Apache HTTP Server 1.3.2</h1><dl>

<dt><h3 id="CVE-1999-1199">important: <name name="CVE-1999-1199">Multiple header Denial of Service vulnerability</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-1999-1199">CVE-1999-1199</a>)</h3></dt>
<dd><p>A serious problem exists when a client sends a large number of headers with the same header name. Apache uses up memory faster than the amount of memory required to simply store the received data itself. That is, memory use increases faster and faster as more headers are received, rather than increasing at a constant rate. This makes a denial of service attack based on this method more effective than methods which cause Apache to use memory at a constant rate, since the attacker has to send less data.</p>
<table class="cve"><tr><td class="cve-header">Update 1.3.2 released</td><td class="cve-value">1998-09-23</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">1.3.1, 1.3.0</td></tr>
</table></dd>
</dl></br/>
