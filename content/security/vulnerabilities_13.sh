#!/bin/sh
python3 content/security/cvejsontohtml.py -i content/security/json/ --version 1.3 --extratext '<h3>Apache httpd 1.3 has had no new releases since 2010 and should not be used.   This page only lists security issues that occurred before March 2010.  Subsequent issues may have affected 1.3 but will not be investigated or listed here.  Users are advised to upgrade to the currently supported released version to address known issues.</h3>' > content/security/vulnerabilities_13.md
echo "content/security/vulnerabilities_13.md"
