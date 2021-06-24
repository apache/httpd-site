#!/bin/sh
python3 content/security/cvejsontohtml.py -i content/security/json/ --version 2.0 --extratext '<h3>Apache httpd 2.0 has had no new releases since 2013 and should not be used.   This page only lists security issues that occurred before August 2013.  Subsequent issues may have affected 2.0 but will not be investigated or listed here.  Users are advised to upgrade to the currently supported released version to address known issues.</h3>' > content/security/vulnerabilities_20.md
echo "content/security/vulnerabilities_20.md"
