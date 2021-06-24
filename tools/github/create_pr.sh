#!/bin/bash
#
# This script creates a pull request against the 2.4.x branch to backport
# the given Subversion revisions from trunk.
# It requires that is executed in the root of a local clone of your fork
# of https://github.com/apache/httpd.git.
# In that clone two remotes are required:
# - origin  : which points to your fork
# - upstream: which points to https://github.com/apache/httpd.git
# Furthermore you need to have remote tracking branches for the trunk and
# 2.4.x branches in your clone that are tracked in your fork.
# Requires git and hub be on the PATH.


if [ "$#" -lt 1 ] ; then
    echo "usage: $(basename $0) <revision number> [revision numbers] ..."
    exit
fi

BRANCH_NAME=`echo "$@" | tr " " _`

git fetch upstream trunk

if ! git branch | grep -q $BRANCH_NAME ; then
    git checkout 2.4.x
    if [ "$?" -ne 0 ] ; then
        exit
    fi
    git pull upstream 2.4.x
    if [ "$?" -ne 0 ] ; then
        exit
    fi
    git checkout -b $BRANCH_NAME
    if [ "$?" -ne 0 ] ; then
        exit
    fi
else
    git checkout $BRANCH_NAME
    if [ "$?" -ne 0 ] ; then
        exit
    fi
fi

for i in "$@" ; do
#    COMMITS="$COMMITS $(git log --grep="git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@($i)" --left-right upstream/trunk...$BRANCH_NAME  --cherry-pick -P --pretty=format:%H)"
    POTENTIAL_COMMIT=$(git log --grep="git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@($i)" --left-only upstream/trunk...$BRANCH_NAME  --cherry-pick -P --pretty=format:%H)
    if [ -n "$POTENTIAL_COMMIT" ] ; then
        CHERRY_CHECK=$(git log --grep="cherry picked from commit $POTENTIAL_COMMIT" --right-only  upstream/trunk...$BRANCH_NAME -P --pretty=format:%H)
        if [ -z "$CHERRY_CHECK" ] ; then
            COMMITS="$COMMITS $POTENTIAL_COMMIT"
        fi
    fi
done

for i in $COMMITS ; do
    git cherry-pick -x $i
    if [ "$?" -ne 0 ] ; then
        exit
    fi
done

git push -u origin $BRANCH_NAME
MESSAGE=`echo "$@" | sed -e 's/ /, r/g'`
RESULT=`hub pull-request -b apache:2.4.x -m "Merge r${MESSAGE} from trunk"`
echo $RESULT
PR=`echo $RESULT | sed -e 's#.*/##'`

cat <<EOF
  *) module_name: What
     Trunk version of patch:
EOF

for i in "$@" ; do
    echo "        https://svn.apache.org/r$i"
done

cat <<EOF
     Backport version for 2.4.x of patch:
       https://patch-diff.githubusercontent.com/raw/apache/httpd/pull/$PR.diff
     +1:
EOF

