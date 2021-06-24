#!/bin/bash
#
# This script applies the pull request <PR number> to the Subversion working
# copy of the branch. It requires that is executed in the root of the working
# copy. Apart from applying the patch it also updates the mergeinfo property
# if the commits in the PR have this information, e.g. the PR got created via
# create_pr.sh and creates a possible commit message in a file named clog.
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

REVS=`curl -s https://api.github.com/repos/apache/httpd/pulls/${PR}/commits | jq .[].commit.message | egrep -o "git-svn-id: ${TRUNK}@[0-9]+" | cut -f2 -d '@'`

COMMITS=`echo -n $REVS | tr ' ' ,`

svn merge --record-only -c ${COMMITS} ${TRUNK} .

if [ -f clog ] ; then
    mv -f clog clog~
fi

echo "Merge r$(echo $COMMITS | sed -e 's/,/, r/g') from trunk:" > clog

for REV in ${REVS} ; do
    svn log -r${REV} ${TRUNK} | sed '1,2d;$d' >> clog
    RAUTH=`svn propget svn:author --revprop -r${REV} ${TRUNK}`

    if [ -z "${AUTHOR}" ] ; then
        AUTHOR="${RAUTH}"
    fi
    if [ "${RAUTH}" != "${AUTHOR}" ] ; then
        AUTHOR="${AUTHOR}, ${RAUTH}"
    fi
done

echo >> clog
echo "Submitted by: ${AUTHOR}" >> clog
echo "Reviewed by: ">> clog

echo >> clog
echo "Github: closes #${PR}" >> clog

echo
cat clog

make update-changes

grep --color=auto -i "skip ci" clog

