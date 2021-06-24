#!/bin/sh

# Push candidate release tarballs in directory to the dev or release dist repos
#
# USAGE: push.sh directory version dev|dist (scratch_dir)
# directory: Directory to obtain release artifacts from
# version: x.y.z (example 2.4.38)
# dev|dist: If "dev", push to https://dist.apache.org/repos/dist/dev/httpd/ 
#           If "dist", push to https://dist.apache.org/repos/dist/release/httpd
# scratch_dir: Optional directory to use as the SVN clone and staging location.
#              Will be created and deleted automatically by this script

#Useful for debugging
set -x

#Bail when non-zero return codes are encountered
set -e

#Make sure English is used when formating dates
export LANG=en_US.UTF-8

usage () {
  echo "USAGE: $0 directory version dev|dist (scratch_dir)"
  echo "WARNING: The scratch_dir will be purged if it exists"
  exit 1
}

dir=$1
version=$2
repo=$3
scratch=$4

if test -z "$dir";then usage
elif test -z "$version"; then usage
elif test -z "$repo"; then usage
elif test "dev" = "$repo";then
  true
elif test "dist" = "$repo";then 
  true
else usage
fi

if test -z "$scratch";then
  scratch=./tmp_scratch
fi

major="`echo ${version} | sed 's/\..*$//'`"
minor="`echo ${version} | sed 's/^[0-9]*\.\([0-9]*\)\..*$/\1/'`"
patch="`echo ${version} | sed 's/^.*\.//'`"

dist_base="$scratch"/dist
dev_base="$scratch"/dist/dev/httpd
release_base="$scratch"/dist/release/httpd

#Ensure scratch space is in a state we are ready to work with
rm -rf "$scratch"
svn checkout --depth=empty https://dist.apache.org/repos/dist/ "$scratch"/dist
svn update --set-depth immediates --parents "$dev_base"
svn update --set-depth immediates --parents "$release_base"

if test "dev" = "$repo";then
  ##Remove existing version-specific CHANGES files
  if ls "$dev_base"/CHANGES_${major}.${minor}.* >/dev/null 2>&1;then
    svn rm "$dev_base"/CHANGES_${major}.${minor}.*
  fi

  ## Generate a new version-specific CHANGES file
  #Clever shell tricks... allow the shell to expand the unknown version.
  #If CURRENT is not this branch, this will not trigger a failure from `set -e`
  if test -f "$release_base"/CURRENT-IS-${major}.${minor}*;then
    latest_release=`ls "$release_base"/CURRENT-IS-${major}.${minor}.* | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+'`
  #Current is not defined for this branch. Use sort to guess
  else
    latest_release=`ls "$release_base"/httpd-${major}.${minor}.*.tar.gz | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+' | sort -r | head -1`
  fi

  #Delete all lines after the current release
  cat CHANGES_$major.$minor | perl -e '
    while(<STDIN>){
      $d=1 if /Changes with Apache '$latest_release'/;
      print if !$d;
    }' > "$dev_base"/CHANGES_$version

  #Add the file to our changeset
  svn add "$dev_base"/CHANGES_$version

  #Place the tarballs and add to changeset
  cp "$dir"/*$version*.tar.* "$dev_base"/
  svn add "$dev_base"/*$version*.tar.*

  #Place the latest maj.min CHANGES file
  if test -f "$dev_base"/CHANGES_${major}.${minor};then
    cp "$dir"/CHANGES_${major}.${minor} "$dev_base"/
  else
    cp "$dir"/CHANGES_${major}.${minor} "$dev_base"/

    #File does not exist, so must be added to change set
    svn add "$dev_base"/CHANGES_${major}.${minor}
  fi

  #Prep announcement files with latest version
  perl -pi -e "s/$major\.$minor\.\d+/$version/g" "$dev_base"/Announcement${major}.${minor}.*

  #Push changes up to dev 
  cd "$dev_base"
  svn commit -m "Add $version files"
  cd -
elif test "dist" = "$repo";then
  #Likely a duplicate of what we did above, but be safe... force version number in announcements
  perl -pi -e "s/$major\.$minor\.\d+/$version/g" "$release_base"/Announcement${major}.${minor}.*

  #Ensure the right date is in announcement file
  release_date=`LC_TIME=en_US date "+%B %d, %Y"`
  perl -pi -e "s/^   (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec).*/   $release_date/" "$release_base"/Announcement${major}.${minor}.*

  #Do an SVN move of the files to retain history
  svn mv "$dev_base"/httpd-${version}.tar.* "$release_base"/
  svn mv "$dev_base"/CHANGES_${version} "$release_base"/
  svn rm "$dev_base"/httpd-${version}-deps.tar.*

  #We cannot move since these exist in the destination
  cp "$dev_base"/CHANGES_${major}.${minor} "$release_base"/
  svn rm "$dev_base"/CHANGES_${major}.${minor}
  cp "$dev_base"/Announcement${major}.${minor}.* "$release_base"/
  #Note we don't delete the Announce files since it is our template

  cd "$dist_base"
  svn commit -m "Push $version up to the release directory"
  cd -
fi
