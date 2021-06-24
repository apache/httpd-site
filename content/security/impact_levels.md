Title: Summary of security impact levels
license: https://www.apache.org/licenses/LICENSE-2.0

# Summary of security impact levels for Apache httpd  {#top}

The Apache Security Team rates the impact of each security flaw that
affects the Apache web server. We've chosen a rating scale quite similar to
those used by other major vendors in order to be consistent. Basically the
goal of the rating system is to answer the question "How worried should I
be about this vulnerability?".

Note that the rating chosen for each flaw is the worst possible case across
all architectures. In the past for example we've had flaws that have a
Critical impact on some BSD architectures, whilst no real impact on others.
To determine the exact impact of a particular vulnerability on your own
systems you will still need to read the security advisories to find out
more about the flaw.

We use the following descriptions to decide on the impact rating to give
each vulnerability:

# Critical  {#Critical}

A vulnerability rated with a Critical impact is one which could potentially
be exploited by a remote attacker to get Apache to execute arbitrary code
(either as the user the server is running as, or root). These are the sorts
of vulnerabilities that could be exploited automatically by worms.

# Important  {#Important}

A vulnerability rated as Important impact is one which could result in the
compromise of data or availability of the server. For the Apache web server
this includes issues that allow an easy remote denial of service (something
that is out of proportion to the attack or with a lasting consequence),
access to arbitrary files outside of the document root, or access to files
that should be otherwise prevented by limits or authentication.

# Moderate  {#Moderate}

A vulnerability is likely to be rated as Moderate if there is significant
mitigation to make the issue less of an impact. This might be because the
flaw does not affect likely configurations, or it is a configuration that
isn't widely used, or where a remote user must be authenticated in order to
exploit the issue. Flaws that allow Apache to serve directory listings
instead of index files are included here, as are flaws that might crash an
Apache child process in Apache 1.3

# Low  {#Low}

All other security flaws are classed as a Low impact. This rating is used
for issues that are believed to be extremely hard to exploit, or where an
exploit gives minimal consequences.

