#!/bin/sh
python3 content/security/cvejsontohtml.py -i content/security/json/ --version 2.2 --extratext '<h3>Apache httpd 2.2 is End-of-Life since December 2017 and should not be used.   This page only lists security issues that occurred before the End-of-Life.  Subsequent issues may have affected 2.2 but will not be investigated or listed here.  Users are advised to upgrade to the currently supported released version to address known issues.</h3>' > content/security/vulnerabilities_22.md
echo "content/security/vulnerabilities_22.md"
