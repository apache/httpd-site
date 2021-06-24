#!/bin/sh
python content/security/makeconsolidatedjson.py -i content/security/json/ > content/security/vulnerabilities-httpd.json
echo "content/security/vulnerabilities-httpd.json"

