#!/bin/bash
#
# This script applies the pull request <PR number> to the Subversion working
# copy of the trunk. It requires that is executed in the root of the working
# copy. Apart from applying the patch it also and creates a possible commit
# message in a file named clog.
# Requires curl, svn and jq be on the PATH.

if [ "$#" -lt 1 ] ; then
    echo "usage: $(basename $0) <PR number>"
    exit
fi

if [ ! -d .svn ] ; then
    echo "No Subversion working copy"
    exit
fi

PR=$1

DIFF_URL="https://github.com/apache/httpd/pull/$PR.diff"
TRUNK="https://svn.apache.org/repos/asf/httpd/httpd/trunk"

if curl -s -v -L -o /dev/null ${DIFF_URL} 2>&1 | grep -q "HTTP/1.1 404 Not Found" ; then
    echo "Pull request $PR not found."
    exit
fi

if ! curl -s -L ${DIFF_URL} | patch -p1 ; then
    echo "Patching failed."
    exit
fi

curl -s https://api.github.com/repos/apache/httpd/pulls/${PR}/commits | jq .[].commit.message | perl -pe 's/^"//; s/"$//; s/\\n/\n/g; ' > clog

echo >> clog
echo "Github: closes #{$PR}" >> clog

