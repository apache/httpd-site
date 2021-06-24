#!/bin/sh

# Generate and send Announce notifications including security announcements
#
# USAGE: announce.sh version 'yourid@apache.org' 'Your Name' (scratch_dir)
# scratch_dir: Optional directory to use as the SVN clone and staging location.
#              Will be created and deleted automatically by this script

#Useful for debugging
#set -x

#Bail when non-zero return codes are encountered
set -e

#Make sure English is used when formating dates
export LANG=en_US.UTF-8

usage () {
  echo "USAGE: $0 version your_asf_id 'Your Name' (scratch_dir)"
  echo "WARNING: The scratch_dir will be purged if it exists"
  exit 1
}

version=$1
asf_id=$2
name=$3
scratch=$4

if test -z "$version";then usage
elif test -z "$asf_id";then usage
elif test -z "$name";then usage
fi

email="$asf_id@apache.org"

if test -z "$scratch";then
  scratch=./tmp_scratch
fi

#Ensure these variables are set to *some* value
if test -z "$NONINTERACTIVE";then
  NONINTERACTIVE=""
fi

if test -z "$SHELL";then
  SHELL="sh"
fi

#Bail if a variable is unset, but attempted to be substituted
set -u

major="`echo ${version} | sed 's/\..*$//'`"
minor="`echo ${version} | sed 's/^[0-9]*\.\([0-9]*\)\..*$/\1/'`"
patch="`echo ${version} | sed 's/^.*\.//'`"
branch="${major}.${minor}"

dist_base="$scratch"/dist
branch_base="$scratch"/branch
release_base="$scratch"/dist/release/httpd
staging_base="$scratch"/dist/dev/httpd
private_base="$scratch"/private
site_base="$scratch"/site/content
notification_scripts="$scratch"/notification_scripts

announce_addresses='announce@apache.org announce@httpd.apache.org'
security_addresses='announce@httpd.apache.org security@httpd.apache.org oss-security@lists.openwall.com'

is_security_release=0
is_feature_release=0
is_bugfix_release=0

### Ensure scratch space is in a state we are ready to work with
rm -rf "$scratch"
svn checkout --depth=empty https://dist.apache.org/repos/dist/ "$dist_base"
svn update --set-depth immediates --parents "$release_base"
svn update --set-depth immediates --parents "$staging_base"
svn checkout --depth=empty https://svn.apache.org/repos/asf/httpd/httpd/branches/${branch}.x "$branch_base"
svn checkout --depth=empty https://svn.apache.org/repos/asf/httpd/site/trunk/content/ "$site_base"
svn checkout https://svn.apache.org/repos/private/pmc/httpd/ "$private_base"
mkdir "$notification_scripts"


### Prepare security announcements

#Make patches apply cleanly
mv "$release_base"/CHANGES_$branch "$release_base"/CHANGES
svn update "$branch_base"/CHANGES

#Get the section of STATUS we focus on during this phase
SHORT_STATUS=`cat "$private_base"/SECURITY/STATUS | sed -n '/## ANNOUNCE READY/,/## RELEASE SHOWSTOPPERS/p'`

#Notice the grep for CVE<stuff> with a line-ending / (that gets stripped). This is needed in case
#subsequent lines have a note referring to a file in the directory, too
for dir in `echo "$SHORT_STATUS" | grep -o '\- CVE.*$' | sed -e 's/\///g' -e 's/^- //g'`;do
echo "Checking $dir..."
  #Flip the bit
  is_security_release=1

  #Opportunisticly apply patches to CHANGES regardless of section (announce ready vs changes ready)
  #because sometimes things are placed in announce ready even though they haven't had the CHANGES fix applied
  if test -f "$private_base"/SECURITY/$dir/CHANGES.diff;then
    patch -p0 -d "$branch_base" < "$private_base"/SECURITY/$dir/CHANGES.diff 
    patch -p0 -d "$release_base" < "$private_base"/SECURITY/$dir/CHANGES.diff 
  elif test -f "$private_base"/SECURITY/$dir/CHANGES;then
    for UPDATE_FILE in "$branch_base"/CHANGES "$release_base"/CHANGES;do
      VERSION="$version" UPDATE_FILE="$UPDATE_FILE" STATUS_UPDATE=`cat "$private_base"/SECURITY/$dir/CHANGES` perl -e '
        $ENV{STATUS_UPDATE} =~ s/^\s*$//g;
        die "Status update not found!" if !$ENV{STATUS_UPDATE};
        open(CHANGES, "$ENV{UPDATE_FILE}"); my @content=<CHANGES>; close(CHANGES);
        foreach my $line (@content) {
          print "$line";
          if (!$added && $line =~ /Changes with Apache $ENV{VERSION}/i) {
            print "\n$ENV{STATUS_UPDATE}\n";
            $added = 1;
          }
        }
        die "Did not add this entry to Changes because the $ENV{VERSION} changes heading was not found!" if !$added;
      ' > "$scratch"/tmp_status
      mv "$scratch"/tmp_status "$UPDATE_FILE"
    done
  else
    #Fail if this is in the changes ready section, but we didn't find a change
    if echo "$SHORT_STATUS" | sed -n '/CHANGES READY FOR REPLACEMENT/,/##/p' | grep "$dir" >/dev/null;then
      echo "Missing CHANGES.diff or CHANGES file for $dir"
      exit 1
    fi
  fi

  #From start of file to "---"
  cve_info=`cat "$private_base"/SECURITY/$dir/NOTIFICATION | sed '/---/Q' | grep -v '^$'`

  #Prepare the notification contents. From "---" to end of file
  contents=`cat "$private_base"/SECURITY/$dir/NOTIFICATION | sed -e '1,/---/ d'`

  if ! cve_description=`echo "$contents" | grep -o 'CVE-[0-9]\+-[0-9]\+: .*[^\.]'`;then
    echo "ERROR: Could not parse CVE description from NOTIFICATION. Format='CVE-0000-00000: description of vulnerability'"
    exit 1
  fi

  counter=0
  MID="<`perl -e 'print time . ".";@chars=("A".."Z",0..0);print $chars[rand @chars] for 1..8;'`@httpd.apache.org>"
  DATE=`date '+%a, %d %b %Y %H:%M:%S %z'`
  for address in `echo "$security_addresses"`;do
    mail_message="$notification_scripts"/"$dir".$counter.txt
    echo "From: $name <$email>" > "$mail_message"
    echo "To: $address" >> "$mail_message"
    echo "Reply-To: dev@httpd.apache.org" >> "$mail_message"
    echo "Subject: $cve_description" >> "$mail_message"
    echo "Date: $DATE" >> "$mail_message"
    echo "Message-ID: $MID" >> "$mail_message"
    echo "" >> "$mail_message"
    echo "$contents" >> "$mail_message"

    #XXX: https://www.apache.org/security/committers.html says we should also notify the reporter
    #     but we are not tracking their address here
    #TODO: https://www.apache.org/security/committers.html says we must also submit the report to mitre
    #      but this script does not yet handle that (capcha is on the page)
    cat <<EOF >"$notification_scripts"/"$dir".$counter.sh
curl --url 'smtps://mail-relay.apache.org:465' \\
  --ssl-reqd --mail-from "$email" \\
  --mail-rcpt "$address" \\
  --upload-file '$mail_message' --user '$asf_id'
EOF
    counter=`expr $counter + 1`
  done

  #Move to the resolved location
  svn mv "$private_base"/SECURITY/$dir "$private_base"/resolved/

  #... and purge from STATUS. Remove the lines from this directory name to an empty line
  NEW=`cat "$private_base"/SECURITY/STATUS | sed -e "/$dir/,/^ *\$/d"`
  echo "$NEW" > "$private_base"/SECURITY/STATUS
  if grep "$dir" "$private_base"/SECURITY/STATUS >/dev/null;then
    echo "Failed to remove $dir from SECURITY/STATUS"
    exit 1
  fi
done

#Move the file back in place
mv "$release_base"/CHANGES "$release_base"/CHANGES_$branch

if test $is_security_release = 1;then
  #Regenerate a new version-specific changes file to include the
  # CVE data that we just added (copypasta from push.sh)

  #Clever shell tricks... allow the shell to expand the unknown version.
  #If CURRENT is not this branch, this will not trigger a failure from `set -e`
  if test -f "$release_base"/CURRENT-IS-${major}.${minor}*;then
    latest_release=`ls "$release_base"/CURRENT-IS-${major}.${minor}.* | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+'`
  #Current is not defined for this branch. Use sort to guess
  else
    latest_release=`ls "$release_base"/httpd-${major}.${minor}.*.tar.gz | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+' | sort -r | head -1`
  fi

  #Delete all lines between the current release and the note about -dev version
  cat "$release_base"/CHANGES_$branch | perl -e '
    while(<STDIN>){
      $d=1 if /Changes with Apache '$latest_release'/;
      $d=0 if /^  \[/;
      print if !$d;
    }' > "$release_base"/CHANGES_$version
fi



### Figure out what kind of release we are dealing with as "scientifically" as possible
if grep -i 'Add ' "$release_base"/CHANGES_${version} >/dev/null;then
  is_feature_release=1
fi
if grep -i 'Fix ' "$release_base"/CHANGES_${version} >/dev/null;then
  is_bugfix_release=1
fi

#This seems so wrong, but it's hard to teach a script proper grammar
if test $is_security_release = 1 && test $is_feature_release = 1 && test $is_bugfix_release = 1;then
  release_type="security, feature and bug fix"
elif test $is_security_release = 1 && test $is_feature_release = 1 && test $is_bugfix_release = 0;then
  release_type="security and feature"
elif test $is_security_release = 1 && test $is_feature_release = 0 && test $is_bugfix_release = 1;then
  release_type="security and bug fix"
elif test $is_security_release = 0 && test $is_feature_release = 1 && test $is_bugfix_release = 1;then
  release_type="feature and bug fix"
elif test $is_security_release = 0 && test $is_feature_release = 0 && test $is_bugfix_release = 1;then
  release_type="bug fix"
elif test $is_security_release = 0 && test $is_feature_release = 1 && test $is_bugfix_release = 0;then
  release_type="feature"
elif test $is_security_release = 1 && test $is_feature_release = 0 && test $is_bugfix_release = 0;then
  release_type="security"
else
  echo "Failed to determine what type of release this is among security, feature and bug fix"
  exit 1
fi


### Clean up the last bits of files and do sanity checks along the way
cp "$staging_base"/Announcement${major}.${minor}.* "$release_base"/

#Likely a duplicate of what we did while staging this announcement, but be safe... force version number in announcements
perl -pi -e "s/$major\.$minor\.\d+/$version/g" "$release_base"/Announcement${major}.${minor}.*
if ! grep "$version" "$release_base"/Announcement${major}.${minor}.txt >/dev/null;then
  echo "Failed to update the version string to $version in Announcement${major}.${minor}.* files"
  exit 1
fi

#Also update the announcement with the type of release
perl -pi -e "s/a (security|feature|bug fix|and|,| )* release\./a $release_type release./g" "$release_base"/Announcement${major}.${minor}.*
if ! grep "$release_type" "$release_base"/Announcement${major}.${minor}.txt >/dev/null;then
  echo "Failed to update the type of release in Announcement${major}.${minor}.* files"
  exit 1
fi

#Ensure the right date is in the announcement file
release_date=`date "+%B %d, %Y"`
perl -pi -e "s/^   (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec).*/   $release_date/" "$release_base"/Announcement${major}.${minor}.*
if ! grep "$release_date" "$release_base"/Announcement${major}.${minor}.txt >/dev/null;then
  echo "Failed to update the release data in Announcement${major}.${minor}.* files"
  exit 1
fi


#Update the latest version pointer
svn rm --force "$release_base"/CURRENT-IS-*
touch "$release_base"/CURRENT-IS-${version}
svn add "$release_base"/CURRENT-IS-${version}

## Prepare the regular announcement
contents=`cat "$release_base"/Announcement$branch.txt`
counter=0
MID="<`perl -e 'print time . ".";@chars=("A".."Z",0..0);print $chars[rand @chars] for 1..8;'`@httpd.apache.org>"
DATE=`date '+%a, %d %b %Y %H:%M:%S %z'`
for address in `echo "$announce_addresses"`;do
  mail_message="$notification_scripts"/Announcement.$counter.txt

  echo "From: $name <$email>" > "$mail_message"
  echo "To: $address" >> "$mail_message"
  echo "Reply-To: dev@httpd.apache.org" >> "$mail_message"
  echo "Subject: [ANNOUNCEMENT] Apache HTTP Server $version Released" >> "$mail_message"
  echo "Date: $DATE" >> "$mail_message"
  echo "Message-ID: $MID" >> "$mail_message"
  echo "" >> "$mail_message"
  echo "$contents" >> "$mail_message"

  cat <<EOF >"$notification_scripts"/Announcement.$counter.sh
curl --url 'smtps://mail-relay.apache.org:465' \\
  --ssl-reqd --mail-from "$email" \\
  --mail-rcpt "$address" \\
  --upload-file '$mail_message' --user '$asf_id'
EOF
  counter=`expr $counter + 1`
done

chmod 744 "$notification_scripts"/*.sh


#Update the site content with the new release date and version
iso_date=`date +%Y-%m-%d`
svn update "$site_base"/doap.rdf
perl -pi -e "s/$major\.$minor\.\d+/$version/g" "$site_base"/doap.rdf
perl -pi -e "s|<created>.*|<created>$iso_date</created>|g" "$site_base"/doap.rdf

#Modify the home page by replacing the date and the version string
svn update "$site_base"/index.mdtext
perl -pi -e "s|Apache httpd $major.$minor.* Released <span>.*</span>|Apache httpd $version Released <span>$iso_date</span>|g" "$site_base"/index.mdtext
perl -pi -e "s/$major\.$minor\.\d+/$version/g" "$site_base"/index.mdtext

#Downloads page
#Get signature info - note the pipe through grep... this masks signature
# verification failures which would cause an abort due to `set -e`. Essentially
# we are assuming the signature is valid and we only care to get information about it
sig_info=`gpg --verify "$release_base"/httpd-${version}.tar.gz.asc "$release_base"/httpd-${version}.tar.gz 2>&1 | grep '^'`
key_id=`echo "$sig_info" | grep 'key ID' | sed -e 's/.* key ID //g'`
signer_name=`echo "$sig_info" | grep from | sed -e 's/.*from "//' -e 's/["(<].*//' -e 's/ $//'`
svn update "$site_base"/download.mdtext
perl -pi -e "s/$major\.$minor\.\d+/$version/g" "$site_base"/download.mdtext
perl -pi -e "s/\\d{4}-\\d{2}-\\d{2}/$iso_date/ if /$version/" "$site_base"/download.mdtext
if ! grep -e "# Apache HTTP Server $version (httpd): $version.*<span>$iso_date</span>" "$site_base"/download.mdtext >/dev/null;then
  echo "Failed to update the release version and/or date in download.mdtext"
  exit 1
fi

#Removed in r1841621
#perl -pi -e "s/(httpd-$version\.tar\.\* are signed by).*/\$1 $signer_name \`$key_id\`/" "$site_base"/download.mdtext
#if ! grep "httpd-${version}.tar.* are signed by $signer_name \`$key_id\`" "$site_base"/download.mdtext >/dev/null;then
#  echo "Failed to update the signer name/key id in download.mdtext"
#  exit 1
#fi

#Note this release in STATUS
date_string=`date '+%B %d, %Y'`
svn update "$branch_base"/STATUS
perl -pi -e "s/^(\s+$version\s+:\s+Tagged on \S+ \d+, \d+)/\$1. Released on $date_string./g" "$branch_base"/STATUS
if ! egrep "$version.*Released on $date_string" "$branch_base"/STATUS >/dev/null;then
  echo "Failed to set the release date in $branch_base/STATUS"
  exit 1
fi

if test -z "$NONINTERACTIVE";then
  echo "All script work is done. You now have the chance to poke around and make sure everything"
  echo "is good before the results are committed and/or emailed to people. This is the last safe place"
  echo "to turn back"
  echo ""
  echo "Important directories:"
  echo "DIST: $dist_base"
  echo "Branch: $branch_base"
  echo "Private: $private_base"
  echo "Site: $site_base"
  echo "Announcements: $notification_scripts"
  echo ""
  echo "Important files:"
  echo "$release_base/CHANGES_$branch"
  echo "$release_base/CHANGES_$version"
  echo "$release_base/Announcement$branch.txt"
  echo "$release_base/Announcement$branch.html"
  echo "$private_base/SECURITY/STATUS"
  echo ""
  if test $is_security_release = 1;then
    echo "This release IS DETECTED TO BE A SECURITY RELEASE"
  else
    echo "This release is not detected to be a security release"
  fi
  echo ""
  echo "To proceed, simply exit the shell. If you DO NOT want to proceed, you can exit with a non-zero code like so:"
  echo "exit 1"
  echo ""

  if ! $SHELL;then
    echo "Aborting! Not saving changes."
    exit 1
  else
    echo "Proceeding with commits and pushes."
  fi
fi

### Make the world aware
for script in "$notification_scripts"/*.sh;do
  $script
done

for dir in "$dist_base" "$branch_base" "$private_base" "$site_base";do
  cd $dir
  svn commit -m "Updates for announcement of $version"
  cd -
done

#Publish the site updates
TMP_KEY=`curl -s -u "$asf_id" --url https://cms.apache.org/httpd/publish | grep key | cut -d '"' -f 6`
if test -z "$TMP_KEY";then
  echo "There was an error getting a key to publish the website."
  echo "Visit https://cms.apache.org/httpd/publish to do this manually."
  exit 1
fi

curl --url https://cms.apache.org/httpd/publish \
  -X POST \
  -u "$asf_id" \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -d "key=$TMP_KEY&message=Publish%20$version%20updates&source_url=https%3A%2F%2Fsvn.apache.org%2Frepos%2Fasf%2Fhttpd%2Fsite&submit=Submit&referer="
