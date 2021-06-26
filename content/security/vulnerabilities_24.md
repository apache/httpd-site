Title: Apache HTTP Server 2.4 vulnerabilities

<h1>Apache HTTP Server 2.4 vulnerabilities</h1>
<p>This page lists all security vulnerabilities fixed in released versions of Apache HTTP Server 2.4. Each vulnerability is given a security <a href="/security/impact_levels.html">impact rating</a> by the Apache security team - please note that this rating may well vary from platform to platform.  We also list the versions the flaw is known to affect, and where a flaw has not been verified list the version with a question mark.</p>
<p>Please note that if a vulnerability is shown below as being fixed in a "-dev" release then this means that a fix has been applied to the development source tree and will be part of an upcoming full release.</p>
<p>Please send comments or corrections for these vulnerabilities to the <a href="/security_report.html">Security Team</a>.</p> <br/>
<p><em>The initial GA release, Apache httpd 2.4.1, includes fixes for all vulnerabilities which have been resolved in Apache httpd 2.2.22 and all older releases.  Consult the <a href="vulnerabilities_22.html">Apache httpd 2.2 vulnerabilities list</a> for more information.</em></p><br/>

<h1 id="2.4.48">Fixed in Apache HTTP Server 2.4.48</h1><dl>

<dt><h3 id="CVE-2019-17567">moderate: <name name="CVE-2019-17567">mod_proxy_wstunnel tunneling of non Upgraded connections</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-17567">CVE-2019-17567</a>)</h3></dt>
<dd><p>Apache HTTP Server versions 2.4.6 to 2.4.46 mod_proxy_wstunnel configured on an URL that is not necessarily Upgraded by the origin server was tunneling the whole connection regardless, thus allowing for subsequent requests on the same connection to pass through with no HTTP validation, authentication or authorization possibly configured.</p>
<p>Acknowledgements: Reported by Mikhail Egorov (&lt;0ang3el gmail.com&gt;)</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2019-10-05</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2021-06-01</td></tr>
<tr><td class="cve-header">Update 2.4.48 released</td><td class="cve-value">2021-06-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.46, 2.4.43, 2.4.41, 2.4.39, 2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6</td></tr>
</table></dd>
<dt><h3 id="CVE-2020-13938">moderate: <name name="CVE-2020-13938">Improper Handling of Insufficient Privileges</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13938">CVE-2020-13938</a>)</h3></dt>
<dd><p>Apache HTTP Server versions 2.4.0 to 2.4.46 Unprivileged local users can stop httpd on Windows</p>
<p>Acknowledgements: Discovered by Ivan Zhakov</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2021-01-26</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2021-06-01</td></tr>
<tr><td class="cve-header">Update 2.4.48 released</td><td class="cve-value">2021-06-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.46, 2.4.43, 2.4.41, 2.4.39, 2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6, 2.4.4, 2.4.3, 2.4.2, 2.4.1, 2.4.0</td></tr>
</table></dd>
<dt><h3 id="CVE-2020-13950">low: <name name="CVE-2020-13950">mod_proxy_http NULL pointer dereference</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-13950">CVE-2020-13950</a>)</h3></dt>
<dd><p>Apache HTTP Server versions 2.4.41 to 2.4.46 mod_proxy_http can be made to crash (NULL pointer dereference) with specially crafted requests using both Content-Length and Transfer-Encoding headers, leading to a Denial of Service</p>
<p>Acknowledgements: Reported by Marc Stern (&lt;marc.stern approach.be&gt;)</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2020-09-11</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2021-06-01</td></tr>
<tr><td class="cve-header">Update 2.4.48 released</td><td class="cve-value">2021-06-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.46, 2.4.43, 2.4.41</td></tr>
</table></dd>
<dt><h3 id="CVE-2020-35452">low: <name name="CVE-2020-35452">mod_auth_digest possible stack overflow by one nul byte</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-35452">CVE-2020-35452</a>)</h3></dt>
<dd><p>Apache HTTP Server versions 2.4.0 to 2.4.46 A specially crafted Digest nonce can cause a stack overflow in mod_auth_digest. There is no report of this overflow being exploitable, nor the Apache HTTP Server team could create one, though some particular compiler and/or compilation option might make it possible, with limited consequences anyway due to the size (a single byte) and the value (zero byte) of the overflow</p>
<p>Acknowledgements: This issue was discovered and reported by GHSL team member @antonio-morales (Antonio Morales)</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2020-11-11</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2021-06-01</td></tr>
<tr><td class="cve-header">Update 2.4.48 released</td><td class="cve-value">2021-06-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.46, 2.4.43, 2.4.41, 2.4.39, 2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6, 2.4.4, 2.4.3, 2.4.2, 2.4.1, 2.4.0</td></tr>
</table></dd>
<dt><h3 id="CVE-2021-26690">low: <name name="CVE-2021-26690">mod_session NULL pointer dereference</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-26690">CVE-2021-26690</a>)</h3></dt>
<dd><p>Apache HTTP Server versions 2.4.0 to 2.4.46 A specially crafted Cookie header handled by mod_session can cause a NULL pointer dereference and crash, leading to a possible Denial Of Service</p>
<p>Acknowledgements: This issue was discovered and reported by GHSL team member @antonio-morales (Antonio Morales)</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2021-02-08</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2021-06-01</td></tr>
<tr><td class="cve-header">Update 2.4.48 released</td><td class="cve-value">2021-06-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.46, 2.4.43, 2.4.41, 2.4.39, 2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6, 2.4.4, 2.4.3, 2.4.2, 2.4.1, 2.4.0</td></tr>
</table></dd>
<dt><h3 id="CVE-2021-26691">low: <name name="CVE-2021-26691">mod_session response handling heap overflow</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-26691">CVE-2021-26691</a>)</h3></dt>
<dd><p>Apache HTTP Server versions 2.4.0 to 2.4.46 A specially crafted SessionHeader sent by an origin server could cause a heap overflow</p>
<p>Acknowledgements: Discovered internally Christophe Jaillet</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2021-03-01</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2021-06-01</td></tr>
<tr><td class="cve-header">Update 2.4.48 released</td><td class="cve-value">2021-06-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.46, 2.4.43, 2.4.41, 2.4.39, 2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6, 2.4.4, 2.4.3, 2.4.2, 2.4.1, 2.4.0</td></tr>
</table></dd>
<dt><h3 id="CVE-2021-30641">moderate: <name name="CVE-2021-30641">Unexpected URL matching with 'MergeSlashes OFF'</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-30641">CVE-2021-30641</a>)</h3></dt>
<dd><p>Apache HTTP Server versions 2.4.39 to 2.4.46 Unexpected matching behavior with 'MergeSlashes OFF'</p>
<p>Acknowledgements: Discovered by Christoph Anton Mitterer</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2021-04-14</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2021-06-01</td></tr>
<tr><td class="cve-header">Update 2.4.48 released</td><td class="cve-value">2021-06-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.46, 2.4.43, 2.4.41, 2.4.39</td></tr>
</table></dd>
<dt><h3 id="CVE-2021-31618">important: <name name="CVE-2021-31618">NULL pointer dereference on specially crafted HTTP/2 request</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-31618">CVE-2021-31618</a>)</h3></dt>
<dd><p>Apache HTTP Server protocol handler for the HTTP/2 protocol checks received request headers against the size limitations as configured for the server and used for the HTTP/1 protocol as well. On violation of these restrictions and HTTP response is sent to the client with a status code indicating why the request was rejected.</p><p></p><p>This rejection response was not fully initialised in the HTTP/2 protocol handler if the offending header was the very first one received or appeared in a a footer. This led to a NULL pointer dereference on initialised memory, crashing reliably the child process. Since such a triggering HTTP/2 request is easy to craft and submit, this can be exploited to DoS the server.</p><p></p><p>This issue affected  mod_http2 1.15.17 and Apache HTTP Server version 2.4.47 only. Apache HTTP Server 2.4.47 was never released.</p>
<p>Acknowledgements: Apache HTTP server would like to thank  LI ZHI XIN from NSFoucs for reporting this.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2021-04-22</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2021-06-01</td></tr>
<tr><td class="cve-header">Update 2.4.48 released</td><td class="cve-value">2021-06-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.47</td></tr>
</table></dd>
</dl></br/>

<h1 id="2.4.44">Fixed in Apache HTTP Server 2.4.44</h1><dl>

<dt><h3 id="CVE-2020-9490">important: <name name="CVE-2020-9490">Push Diary Crash on Specifically Crafted HTTP/2 Header</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-9490">CVE-2020-9490</a>)</h3></dt>
<dd><p>In Apache HTTP Server versions 2.4.20 to 2.4.43, a specially crafted value for the 'Cache-Digest' header in a HTTP/2 request would result in a crash when the server actually tries to HTTP/2 PUSH a resource afterwards. Configuring the HTTP/2 feature via "H2Push off" will mitigate this vulnerability for unpatched servers.</p>
<p>Acknowledgements: Felix Wilhelm of Google Project Zero</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2020-04-24</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2020-08-07</td></tr>
<tr><td class="cve-header">Update 2.4.44 released</td><td class="cve-value">2020-08-07</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.43, 2.4.39, 2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.30, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20</td></tr>
</table></dd>
<dt><h3 id="CVE-2020-11984">moderate: <name name="CVE-2020-11984">mod_proxy_uwsgi buffer overflow</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-11984">CVE-2020-11984</a>)</h3></dt>
<dd><p>In Apache HTTP Server versions 2.4.32 to 2.4.43, mod_proxy_uwsgi has a information disclosure and possible RCE</p>
<p>Acknowledgements: Discovered by Felix Wilhelm of Google Project Zero</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2020-07-22</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2020-08-07</td></tr>
<tr><td class="cve-header">Update 2.4.44 released</td><td class="cve-value">2020-08-07</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.39, 2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33</td></tr>
</table></dd>
<dt><h3 id="CVE-2020-11993">moderate: <name name="CVE-2020-11993">Push Diary Crash on Specifically Crafted HTTP/2 Header</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-11993">CVE-2020-11993</a>)</h3></dt>
<dd><p>In Apache HTTP Server versions 2.4.20 to 2.4.43, when trace/debug was enabled for the HTTP/2 module and on certain traffic edge patterns, logging statements were made on the wrong connection, causing concurrent use of memory pools.</p><p>Configuring the LogLevel of mod_http2 above "info" will mitigate this vulnerability for unpatched servers.</p>
<p>Acknowledgements: Felix Wilhelm of Google Project Zero</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2020-06-16</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2020-08-07</td></tr>
<tr><td class="cve-header">Update 2.4.44 released</td><td class="cve-value">2020-08-07</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.43, 2.4.39, 2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.30, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20</td></tr>
</table></dd>
</dl></br/>

<h1 id="2.4.42">Fixed in Apache HTTP Server 2.4.42</h1><dl>

<dt><h3 id="CVE-2020-1927">low: <name name="CVE-2020-1927">mod_rewrite CWE-601 open redirect</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-1927">CVE-2020-1927</a>)</h3></dt>
<dd><p>In Apache HTTP Server versions 2.4.0 to 2.4.41 some mod_rewrite configurations vulnerable to open redirect.</p>
<p>Acknowledgements: The issue was discovered by Fabrice Perez</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2019-12-05</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2020-04-01</td></tr>
<tr><td class="cve-header">Update 2.4.42 released</td><td class="cve-value">2020-04-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.41, 2.4.40, 2.4.39, 2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.30, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6, 2.4.4, 2.4.3, 2.4.2, 2.4.1, 2.4.0</td></tr>
</table></dd>
<dt><h3 id="CVE-2020-1934">low: <name name="CVE-2020-1934">mod_proxy_ftp use of uninitialized value</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2020-1934">CVE-2020-1934</a>)</h3></dt>
<dd><p>in Apache HTTP Server versions 2.4.0 to 2.4.41, mod_proxy_ftp use of uninitialized value with malicious FTP backend.</p>
<p>Acknowledgements: The issue was discovered by Chamal De Silva</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2020-01-03</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2020-04-01</td></tr>
<tr><td class="cve-header">Update 2.4.42 released</td><td class="cve-value">2020-04-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.41, 2.4.40, 2.4.39, 2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.30, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6, 2.4.4, 2.4.3, 2.4.2, 2.4.1, 2.4.0</td></tr>
</table></dd>
</dl></br/>

<h1 id="2.4.41">Fixed in Apache HTTP Server 2.4.41</h1><dl>

<dt><h3 id="CVE-2019-9517">moderate: <name name="CVE-2019-9517">mod_http2, DoS attack by exhausting h2 workers.</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-9517">CVE-2019-9517</a>)</h3></dt>
<dd><p>A malicious client could perform a DoS attack by flooding a connection with requests and basically never reading responses on the TCP connection. Depending on h2 worker dimensioning, it was possible to block those with relatively few connections.</p>
<p>Acknowledgements: The issue was discovered by Jonathan Looney of Netflix.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2019-04-10</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2019-08-14</td></tr>
<tr><td class="cve-header">Update 2.4.41 released</td><td class="cve-value">2019-08-14</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.39, 2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.32, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20</td></tr>
</table></dd>
<dt><h3 id="CVE-2019-10081">moderate: <name name="CVE-2019-10081">mod_http2, memory corruption on early pushes</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10081">CVE-2019-10081</a>)</h3></dt>
<dd><p>HTTP/2 very early pushes, for example configured with "H2PushResource", could lead to an overwrite of memory in the pushing request's pool, leading to crashes. The memory copied is that of the configured push link header values, not data supplied by the client.</p>
<p>Acknowledgements: The issue was discovered by Craig Young of Tripwire VERT, &lt;vuln-report@secur3.us&gt;.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2019-04-10</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2019-08-14</td></tr>
<tr><td class="cve-header">Update 2.4.41 released</td><td class="cve-value">2019-08-14</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.39, 2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.32, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20</td></tr>
</table></dd>
<dt><h3 id="CVE-2019-10082">moderate: <name name="CVE-2019-10082">mod_http2, read-after-free in h2 connection shutdown</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10082">CVE-2019-10082</a>)</h3></dt>
<dd><p>Using fuzzed network input, the http/2 session handling could be made to read memory after being freed, during connection shutdown.</p>
<p>Acknowledgements: The issue was discovered by Craig Young of Tripwire VERT, &lt;vuln-report@secur3.us&gt;.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2019-04-12</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2019-08-14</td></tr>
<tr><td class="cve-header">Update 2.4.41 released</td><td class="cve-value">2019-08-14</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.39, 2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.32, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18</td></tr>
</table></dd>
<dt><h3 id="CVE-2019-10092">low: <name name="CVE-2019-10092">Limited cross-site scripting in mod_proxy error page</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10092">CVE-2019-10092</a>)</h3></dt>
<dd><p>A limited cross-site scripting issue was reported affecting the mod_proxy error page. An attacker could cause the link on the error page to be malfomed and instead point to a page of their choice. This would only be exploitable where a server was set up with proxying enabled but was misconfigured in such a way that the Proxy Error page was displayed. We have taken this opportunity to also remove request data from many other in-built error messages. Note however this issue did not affect them directly and their output was already escaped to prevent cross-site scripting attacks.</p>
<p>Acknowledgements: This issue was reported by Matei "Mal" Badanoiu</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2019-07-09</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2019-08-14</td></tr>
<tr><td class="cve-header">Update 2.4.41 released</td><td class="cve-value">2019-08-14</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.39, 2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.30, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6, 2.4.4, 2.4.3, 2.4.2, 2.4.1, 2.4.0</td></tr>
</table></dd>
<dt><h3 id="CVE-2019-10097">moderate: <name name="CVE-2019-10097">CVE-2019-10097 mod_remoteip: Stack buffer overflow and NULL pointer dereference</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10097">CVE-2019-10097</a>)</h3></dt>
<dd><p>When mod_remoteip was configured to use a trusted intermediary proxy server using the "PROXY" protocol, a specially crafted PROXY header could trigger a stack buffer overflow or NULL pointer deference. This vulnerability could only be triggered by a trusted proxy and not by untrusted HTTP clients.</p>
<p>Acknowledgements: The issue was discovered by Daniel McCarney &lt;cpu@letsencrypt.org&gt; Let's Encrypt / Internet Security Research Group (ISRG)</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2019-07-23</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2019-08-14</td></tr>
<tr><td class="cve-header">Update 2.4.41 released</td><td class="cve-value">2019-08-14</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33</td></tr>
</table></dd>
<dt><h3 id="CVE-2019-10098">low: <name name="CVE-2019-10098">mod_rewrite potential open redirect</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-10098">CVE-2019-10098</a>)</h3></dt>
<dd><p>Redirects configured with mod_rewrite that were intended to be self-referential might be fooled by encoded newlines and redirect instead to an an unexpected URL within the request URL.</p>
<p>Acknowledgements: The issue was discovered by Yukitsugu Sasaki</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2019-03-26</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2019-08-14</td></tr>
<tr><td class="cve-header">Update 2.4.41 released</td><td class="cve-value">2019-08-14</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.39, 2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.30, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6, 2.4.4, 2.4.3, 2.4.2, 2.4.1, 2.4.0</td></tr>
</table></dd>
</dl></br/>

<h1 id="2.4.39">Fixed in Apache HTTP Server 2.4.39</h1><dl>

<dt><h3 id="CVE-2019-0196">low: <name name="CVE-2019-0196">mod_http2, read-after-free on a string compare</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-0196">CVE-2019-0196</a>)</h3></dt>
<dd><p>Using fuzzed network input, the http/2 request handling could be made to access freed memory in string comparision when determining the method of a request and thus process the request incorrectly.</p>
<p>Acknowledgements: The issue was discovered by Craig Young, &lt;vuln-report@secur3.us&gt;.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2019-01-29</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2019-04-01</td></tr>
<tr><td class="cve-header">Update 2.4.39 released</td><td class="cve-value">2019-04-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.30, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17</td></tr>
</table></dd>
<dt><h3 id="CVE-2019-0197">low: <name name="CVE-2019-0197">mod_http2, possible crash on late upgrade</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-0197">CVE-2019-0197</a>)</h3></dt>
<dd><p>When HTTP/2 was enabled for a http: host or H2Upgrade was enabled for h2 on a https: host, an Upgrade request from http/1.1 to http/2 that was not the first request on a connection could lead to a misconfiguration and crash. A server that never enabled the h2 protocol or that only enabled it for https: and did not configure the "H2Upgrade on" is unaffected by this.</p>
<p>Acknowledgements: The issue was discovered by Stefan Eissing, greenbytes.de.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2019-01-29</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2019-04-01</td></tr>
<tr><td class="cve-header">Update 2.4.39 released</td><td class="cve-value">2019-04-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.38, 2.4.37, 2.4.35, 2.4.34</td></tr>
</table></dd>
<dt><h3 id="CVE-2019-0211">important: <name name="CVE-2019-0211">Apache HTTP Server privilege escalation from modules' scripts</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-0211">CVE-2019-0211</a>)</h3></dt>
<dd><p>In Apache HTTP Server 2.4 releases 2.4.17 to 2.4.38, with MPM event, worker or prefork, code executing in less-privileged child processes or threads (including scripts executed by an in-process scripting interpreter) could execute arbitrary code with the privileges of the parent process (usually root) by manipulating the scoreboard. Non-Unix systems are not affected.</p>
<p>Acknowledgements: The issue was discovered by Charles Fol.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2019-02-22</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2019-04-01</td></tr>
<tr><td class="cve-header">Update 2.4.39 released</td><td class="cve-value">2019-04-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.30, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17</td></tr>
</table></dd>
<dt><h3 id="CVE-2019-0215">important: <name name="CVE-2019-0215">mod_ssl access control bypass</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-0215">CVE-2019-0215</a>)</h3></dt>
<dd><p>In Apache HTTP Server 2.4 releases 2.4.37 and 2.4.38, a bug in mod_ssl when using per-location client certificate verification with TLSv1.3 allowed a client supporting Post-Handshake Authentication to bypass configured access control restrictions.</p>
<p>Acknowledgements: The issue was discovered by Michael Kaufmann.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2019-01-23</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2019-04-01</td></tr>
<tr><td class="cve-header">Update 2.4.39 released</td><td class="cve-value">2019-04-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.38, 2.4.37</td></tr>
</table></dd>
<dt><h3 id="CVE-2019-0217">important: <name name="CVE-2019-0217">mod_auth_digest access control bypass</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-0217">CVE-2019-0217</a>)</h3></dt>
<dd><p>In Apache HTTP Server 2.4 release 2.4.38 and prior, a race condition in mod_auth_digest when running in a threaded server could allow a user with valid credentials to authenticate using another username, bypassing configured access control restrictions.</p>
<p>Acknowledgements: The issue was discovered by Simon Kappel.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2019-01-29</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2019-04-01</td></tr>
<tr><td class="cve-header">Update 2.4.39 released</td><td class="cve-value">2019-04-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.30, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6, 2.4.4, 2.4.3, 2.4.2, 2.4.1, 2.4.0</td></tr>
</table></dd>
<dt><h3 id="CVE-2019-0220">low: <name name="CVE-2019-0220">Apache httpd URL normalization inconsistincy</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-0220">CVE-2019-0220</a>)</h3></dt>
<dd><p>When the path component of a request URL contains multiple consecutive slashes ('/'), directives such as LocationMatch and RewriteRule must account for duplicates in regular expressions while other aspects of the servers processing will implicitly collapse them.</p>
<p>Acknowledgements: The issue was discovered by Bernhard Lorenz &lt;bernhard.lorenz@alphastrike.io&gt; of Alpha Strike Labs GmbH.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2019-01-20</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2019-04-01</td></tr>
<tr><td class="cve-header">Update 2.4.39 released</td><td class="cve-value">2019-04-01</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.38, 2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.30, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6, 2.4.4, 2.4.3, 2.4.2, 2.4.1, 2.4.0</td></tr>
</table></dd>
</dl></br/>

<h1 id="2.4.38">Fixed in Apache HTTP Server 2.4.38</h1><dl>

<dt><h3 id="CVE-2018-17189">low: <name name="CVE-2018-17189">DoS for HTTP/2 connections via slow request bodies</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-17189">CVE-2018-17189</a>)</h3></dt>
<dd><p>By sending request bodies in a slow loris way to plain resources, the h2 stream for that request unnecessarily occupied a server thread cleaning up that incoming data. This affects only HTTP/2 connections. A possible mitigation is to not enable the h2 protocol.</p>
<p>Acknowledgements: The issue was discovered by Gal Goldshtein of F5 Networks.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2018-10-16</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2019-01-22</td></tr>
<tr><td class="cve-header">Update 2.4.38 released</td><td class="cve-value">2019-02-28</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.30, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17</td></tr>
</table></dd>
<dt><h3 id="CVE-2018-17199">low: <name name="CVE-2018-17199">mod_session_cookie does not respect expiry time</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-17199">CVE-2018-17199</a>)</h3></dt>
<dd><p>In Apache HTTP Server 2.4 release 2.4.37 and prior, mod_session checks the session expiry time before decoding the session. This causes session expiry time to be ignored for mod_session_cookie sessions since the expiry time is loaded when the session is decoded.</p>
<p>Acknowledgements: The issue was discovered by Diego Angulo from ImExHS.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2018-10-08</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2019-01-22</td></tr>
<tr><td class="cve-header">Update 2.4.38 released</td><td class="cve-value">2019-02-28</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.37, 2.4.35, 2.4.34, 2.4.33, 2.4.30, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6, 2.4.4, 2.4.3, 2.4.2, 2.4.1, 2.4.0</td></tr>
</table></dd>
<dt><h3 id="CVE-2019-0190">important: <name name="CVE-2019-0190">mod_ssl 2.4.37 remote DoS when used with OpenSSL 1.1.1</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-0190">CVE-2019-0190</a>)</h3></dt>
<dd><p>A bug exists in the way mod_ssl handled client renegotiations. A remote attacker could send a carefully crafted request that would cause mod_ssl to enter a loop leading to a denial of service. This bug can be only triggered with Apache HTTP Server version 2.4.37 when using OpenSSL version 1.1.1 or later, due to an interaction in changes to handling of renegotiation attempts.</p>
<p>Acknowledgements: The issue was discovered through user bug reports.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2019-01-01</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2019-01-22</td></tr>
<tr><td class="cve-header">Update 2.4.38 released</td><td class="cve-value">2019-02-28</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.37</td></tr>
</table></dd>
</dl></br/>

<h1 id="2.4.35">Fixed in Apache HTTP Server 2.4.35</h1><dl>

<dt><h3 id="CVE-2018-11763">low: <name name="CVE-2018-11763">DoS for HTTP/2 connections by continuous SETTINGS</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-11763">CVE-2018-11763</a>)</h3></dt>
<dd><p>By sending continous SETTINGS frames of maximum size an ongoing HTTP/2 connection could be kept busy and would never time out. This can be abused for a DoS on the server. This only affect a server that has enabled the h2 protocol.</p>
<p>Acknowledgements: The issue was discovered by Gal Goldshtein of F5 Networks.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2018-07-18</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2018-09-25</td></tr>
<tr><td class="cve-header">Update 2.4.35 released</td><td class="cve-value">2018-09-29</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.34, 2.4.33, 2.4.30, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18</td></tr>
</table></dd>
</dl></br/>

<h1 id="2.4.34">Fixed in Apache HTTP Server 2.4.34</h1><dl>

<dt><h3 id="CVE-2018-1333">low: <name name="CVE-2018-1333">DoS for HTTP/2 connections by crafted requests</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-1333">CVE-2018-1333</a>)</h3></dt>
<dd><p>By specially crafting HTTP/2 requests, workers would be allocated 60 seconds longer than necessary, leading to worker exhaustion and a denial of service. This issue only affects servers that have configured and enabled HTTP/2 support, which is not the default</p>
<p>Acknowledgements: The issue was discovered by Craig Young of Tripwire VERT.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2018-05-08</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2018-07-18</td></tr>
<tr><td class="cve-header">Update 2.4.34 released</td><td class="cve-value">2018-07-15</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.33, 2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18</td></tr>
</table></dd>
<dt><h3 id="CVE-2018-8011">moderate: <name name="CVE-2018-8011">mod_md, DoS via Coredumps on specially crafted requests</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-8011">CVE-2018-8011</a>)</h3></dt>
<dd><p>By specially crafting HTTP requests, the mod_md challenge handler would dereference a NULL pointer and cause the child process to segfault. This could be used to DoS the server.</p>
<p>Acknowledgements: The issue was discovered by Daniel Caminada &lt;daniel.caminada@ergon.ch&gt;.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2018-06-29</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2018-07-18</td></tr>
<tr><td class="cve-header">Update 2.4.34 released</td><td class="cve-value">2018-07-15</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.33</td></tr>
</table></dd>
</dl></br/>

<h1 id="2.4.33">Fixed in Apache HTTP Server 2.4.33</h1><dl>

<dt><h3 id="CVE-2017-15710">low: <name name="CVE-2017-15710">Out of bound write in mod_authnz_ldap when using too small Accept-Language values</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-15710">CVE-2017-15710</a>)</h3></dt>
<dd><p>mod_authnz_ldap, if configured with AuthLDAPCharsetConfig, uses the Accept-Language header value to lookup the right charset encoding when verifying the user's credentials. If the header value is not present in the charset conversion table, a fallback mechanism is used to truncate it to a two characters value to allow a quick retry (for example, 'en-US' is truncated to 'en'). A header value of less than two characters forces an out of bound write of one NUL byte to a memory location that is not part of the string. In the worst case, quite unlikely, the process would crash which could be used as a Denial of Service attack. In the more likely case, this memory is already reserved for future use and the issue has no effect at all.</p>
<p>Acknowledgements: The Apache HTTP Server security team would like to thank Alex Nichols and Jakob Hirsch for reporting this issue.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2017-12-07</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2018-03-21</td></tr>
<tr><td class="cve-header">Update 2.4.33 released</td><td class="cve-value">2018-03-21</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6, 2.4.4, 2.4.3, 2.4.2, 2.4.1</td></tr>
</table></dd>
<dt><h3 id="CVE-2017-15715">low: <name name="CVE-2017-15715">&lt;FilesMatch&gt; bypass with a trailing newline in the file name</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2017-15715">CVE-2017-15715</a>)</h3></dt>
<dd><p>The expression specified in &lt;FilesMatch&gt; could match '$' to a newline character in a malicious filename, rather than matching only the end of the filename. This could be exploited in environments where uploads of some files are are externally blocked, but only by matching the trailing portion of the filename.</p>
<p>Acknowledgements: The issue was discovered by Elar Lang - security.elarlang.eu</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2017-11-24</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2018-03-21</td></tr>
<tr><td class="cve-header">Update 2.4.33 released</td><td class="cve-value">2018-03-21</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6, 2.4.4, 2.4.3, 2.4.2, 2.4.1</td></tr>
</table></dd>
<dt><h3 id="CVE-2018-1283">moderate: <name name="CVE-2018-1283">Tampering of mod_session data for CGI applications</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-1283">CVE-2018-1283</a>)</h3></dt>
<dd><p>When mod_session is configured to forward its session data to CGI applications (SessionEnv on, not the default), a remote user may influence their content by using a "Session" header. This comes from the "HTTP_SESSION" variable name used by mod_session to forward its data to CGIs, since the prefix "HTTP_" is also used by the Apache HTTP Server to pass HTTP header fields, per CGI specifications. The severity is set to Moderate because "SessionEnv on" is not a default nor common configuration, it should be considered more severe when this is the case though, because of the possible remote exploitation.</p>
<p>Acknowledgements: The issue was discovered internally by the Apache HTTP Server team.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2017-11-14</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2018-03-21</td></tr>
<tr><td class="cve-header">Update 2.4.33 released</td><td class="cve-value">2018-03-21</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6, 2.4.4, 2.4.3, 2.4.2, 2.4.1</td></tr>
</table></dd>
<dt><h3 id="CVE-2018-1301">low: <name name="CVE-2018-1301">Possible out of bound access after failure in reading the HTTP request</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-1301">CVE-2018-1301</a>)</h3></dt>
<dd><p>A specially crafted request could have crashed the Apache HTTP Server prior to version 2.4.33, due to an out of bound access after a size limit is reached by reading the HTTP header. This vulnerability is considered very hard if not impossible to trigger in non-debug mode (both log and build level), so it is classified as low risk for common server usage.</p>
<p>Acknowledgements: The issue was discovered by Robert Swiecki, bug found by honggfuzz.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2018-01-23</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2018-03-21</td></tr>
<tr><td class="cve-header">Update 2.4.33 released</td><td class="cve-value">2018-03-21</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6, 2.4.4, 2.4.3, 2.4.2, 2.4.1</td></tr>
</table></dd>
<dt><h3 id="CVE-2018-1302">low: <name name="CVE-2018-1302">Possible write of after free on HTTP/2 stream shutdown</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-1302">CVE-2018-1302</a>)</h3></dt>
<dd><p>When an HTTP/2 stream was destroyed after being handled, the Apache HTTP Server prior to version 2.4.33 could have written a NULL pointer potentially to an already freed memory. The memory pools maintained by the server make this vulnerabilty hard to trigger in usual configurations, the reporter and the team could not reproduce it outside debug builds, so it is classified as low risk.</p>
<p>Acknowledgements: The issue was discovered by Robert Swiecki, bug found by honggfuzz.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2018-01-23</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2018-03-21</td></tr>
<tr><td class="cve-header">Update 2.4.33 released</td><td class="cve-value">2018-03-21</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17</td></tr>
</table></dd>
<dt><h3 id="CVE-2018-1303">low: <name name="CVE-2018-1303">Possible out of bound read in mod_cache_socache</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-1303">CVE-2018-1303</a>)</h3></dt>
<dd><p>A specially crafted HTTP request header could have crashed the Apache HTTP Server prior to version 2.4.33 due to an out of bound read while preparing data to be cached in shared memory. It could be used as a Denial of Service attack against users of mod_cache_socache.</p>
<p>Acknowledgements: The issue was discovered by Robert Swiecki, bug found by honggfuzz.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2018-01-23</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2018-03-21</td></tr>
<tr><td class="cve-header">Update 2.4.33 released</td><td class="cve-value">2018-03-21</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6</td></tr>
</table></dd>
<dt><h3 id="CVE-2018-1312">low: <name name="CVE-2018-1312">Weak Digest auth nonce generation in mod_auth_digest</name>
(<a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2018-1312">CVE-2018-1312</a>)</h3></dt>
<dd><p>When generating an HTTP Digest authentication challenge, the nonce sent to prevent reply attacks was not correctly generated using a pseudo-random seed. In a cluster of servers using a common Digest authentication configuration, HTTP requests could be replayed across servers by an attacker without detection.</p>
<p>Acknowledgements: The issue was discovered by Nicolas Daniels.</p>
<table class="cve"><tr><td class="cve-header">Reported to security team</td><td class="cve-value">2013-03-05</td></tr>
<tr><td class="cve-header">Issue public</td><td class="cve-value">2018-03-21</td></tr>
<tr><td class="cve-header">Update 2.4.33 released</td><td class="cve-value">2018-03-21</td></tr>
<tr><td class="cve-header">Affects</td><td class="cve-value">2.4.29, 2.4.28, 2.4.27, 2.4.26, 2.4.25, 2.4.23, 2.4.20, 2.4.18, 2.4.17, 2.4.16, 2.4.12, 2.4.10, 2.4.9, 2.4.7, 2.4.6, 2.4.4, 2.4.3, 2.4.2, 2.4.1</td></tr>
</table></dd>
</dl></br/>

<h1 id="2.4.28">Fixed in Apache HTTP Server 2.4.28</h1><dl>

