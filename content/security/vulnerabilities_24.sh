#!/bin/sh
python3 content/security/cvejsontohtml.py -i content/security/json/ --version 2.4 --extratext '<em>The initial GA release, Apache httpd 2.4.1, includes fixes for all vulnerabilities which have been resolved in Apache httpd 2.2.22 and all older releases.  Consult the <a href="vulnerabilities_22.html">Apache httpd 2.2 vulnerabilities list</a> for more information.</em>' > content/security/vulnerabilities_24.md
echo "content/security/vulnerabilities_24.md"
