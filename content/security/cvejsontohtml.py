import json
import os
import re
import xml.sax.saxutils as saxutils 
from optparse import OptionParser
parser = OptionParser()
 
parser.add_option("-v","--version",help="major version to filter on",dest="filterversion")
parser.add_option("-e","--extratext",help="extra text to add to description",dest="extratext")
parser.add_option("-i","--inputdirectory",help="directory of json files",dest="directory")
(options,args) = parser.parse_args()

re_fixedin = re.compile('(released in )?(?P<released>\\d\\.\\d\\.\\d+(-\S+)?)( released)?');

def natural_sort_key(s, _nsre=re.compile('([0-9]+)')):
    return [int(text) if text.isdigit() else text.lower()
            for text in _nsre.split(s)]   
            
filterversion = options.filterversion or ""
cves = []
entries = {}

for x in os.listdir(options.directory or "./"):
    if x.endswith(".json"):
        try:
            fd = open(options.directory+x)
            cve = json.load(fd)
            cves.append(cve)
        except:
            print ("Ignoring due to error parsing: "+x)
            continue

# Filter on version and store by release(s) that fixed it
for cve in cves:
    if "timeline" in cve:
        timearray = cve["timeline"]
        cve["id"] = cve["CVE_data_meta"]["ID"]
    else:
        timearray = cve["containers"]["cna"]["timeline"]
        cve["id"] = cve["cveMetadata"]["cveId"]
    for time in timearray:
        timed = time["value"]
        matcher = re_fixedin.match(timed);
        if (matcher and matcher.group('released').startswith(filterversion)):
            fixedin = matcher.group('released')
            if (not fixedin in entries):
                entries[fixedin] = []
            entries[fixedin].append(cve)

# We want to sort on reverse number fixed, where our versions are dotted numbers, except some special cases
# like never-fixed, or -dev fixed which should always appear first
# Then we want to sort in the section by CVE name, handling numerics correctly

lastfixedv = ""
productname = ""
sections = []
for k,v in sorted(entries.items(), key=lambda s: [int(u) if u.isdigit() else 999 for u in s[0].split(',')[0].split('.')], reverse=True):
    fixedv = k.split(",")[0]

    sectioncves = []
    for cve in sorted(v, key=lambda s: [int(u) if u.isdigit() else u for u in s["id"].split('-')]):
        e = {}
        e['cveid'] = cve["id"]
        if ("cveMetadata" in cve):  # v5
            e['impact'] = cve["containers"]["cna"]["metrics"][0]["other"]["content"]["text"]
            e['title'] = cve["containers"]["cna"]["title"]
            e['desc'] = cve["containers"]["cna"]["descriptions"][0]["value"]
            e['credit'] = []
            if ("credits" in cve["containers"]["cna"]):
                for credit in cve["containers"]["cna"]["credits"]:
                    e['credit'].append(credit["type"]+": "+credit["value"])
            affects = []
            product = cve["containers"]["cna"]["affected"][0]
            productname = product['product']
            for ver in product["versions"]:
                if ("lessThanOrEqual" in ver):
                    affects.append("<="+ver["lessThanOrEqual"])
                if ("lessThan" in ver):
                    affects.append("<"+ver["lessThan"])
            # Make a natural order sort
            affects.sort(reverse=True, key=natural_sort_key)
            e['affects'] = ", ".join(affects)
            e['timetable'] = [];
            for time in cve["containers"]["cna"]["timeline"]:
                timed = time["value"]
                if ("reported" in timed):
                    timed = "Reported to security team"
                elif ("public" in timed):
                    timed = "Issue public"
                elif ("release" in timed):
                    timed = "Update "+timed
                e['timetable'].append([timed,time["time"].split('T')[0]])
            sectioncves.append(e)            
        else:
            e['impact'] = cve["impact"][0]["other"]
            e['title'] = cve["CVE_data_meta"]["TITLE"]
            e['desc'] = cve["description"]["description_data"][0]["value"]
            e['credit'] = []
            if ("credit" in cve):
                for credit in cve["credit"]:
                    e['credit'].append(credit["value"])
            affects = []
            product = cve["affects"]["vendor"]["vendor_data"][0]["product"]["product_data"][0]
            productname = product['product_name']
            for ver in product["version"]["version_data"]:
                if (ver["version_affected"]  == "="):
                    affects.append(ver["version_value"])
                elif (ver["version_affected"]  == "?="):
                    # We did ?= for "maybe affects" because no one checked
                    affects.append(ver["version_value"]+"?")
                else:
                    # Otherwise maybe we started doing things like "<2.7.8"
                    affects.append(ver["version_affected"]+ver["version_value"])
            # Make a natural order sort
            affects.sort(reverse=True, key=natural_sort_key)
            e['affects'] = ", ".join(affects)
            e['timetable'] = [];
            for time in cve["timeline"]:
                timed = time["value"]
                if ("reported" in timed):
                    timed = "Reported to security team"
                elif ("public" in timed):
                    timed = "Issue public"
                elif ("release" in timed):
                    timed = "Update "+timed
                e['timetable'].append([timed,time["time"]])
            sectioncves.append(e)
    sections.append({"cves":sectioncves,"fixed":fixedv,"product":productname})

# Everything is sorted and pretty, this should be some python template thing

# We are generating html in markdown. Add the metadata first.
print ("Title: "+productname+" "+filterversion+" vulnerabilities")
print ("asf_headings: False")
print ("")
print ("<h1>"+productname+" "+filterversion+" vulnerabilities</h1>")
print ("<p>This page lists all security vulnerabilities fixed in released versions of "+productname+" "+filterversion+". Each vulnerability is given a security <a href=\"/security/impact_levels.html\">impact rating</a> by the Apache security team - please note that this rating may well vary from platform to platform.  We also list the versions the flaw is known to affect, and where a flaw has not been verified list the version with a question mark.</p>")
print ("<p>Please note that if a vulnerability is shown below as being fixed in a \"-dev\" release then this means that a fix has been applied to the development source tree and will be part of an upcoming full release.</p>")
print ("<p>Please send comments or corrections for these vulnerabilities to the <a href=\"/security_report.html\">Security Team</a>.</p> <br/>")

if (options.extratext):
    print ("<p>"+options.extratext+"</p><br/>")

for sectioncves in sections:
    print ("\n<h1 id=\""+sectioncves["fixed"]+"\">Fixed in "+sectioncves["product"]+" "+sectioncves["fixed"]+"</h1><dl>\n")
    for e in sectioncves["cves"]:
        html = "<dt><h3 id=\""+e['cveid']+"\">"+e['impact']+": <name name=\""+e['cveid']+"\">"+saxutils.escape(e['title'])+"</name>\n";
        html += "(<a href=\"https://www.cve.org/CVERecord?id="+e['cveid']+"\">"+e['cveid']+"</a>)</h3></dt>\n";
        desc = saxutils.escape(e['desc'])
        desc = re.sub(r'\n','</p><p>', desc)
        html += "<dd><p>"+desc+"</p>\n"
        if (e['credit']):
            html += "<p>Acknowledgements:"
            if len(e['credit']) == 1:
                html += " " + saxutils.escape(e['credit'][0]) + "</p>\n"
            else:
                html += "</p>\n<ul>\n"
                for credit in e['credit']:
                    html += "<li>" + saxutils.escape(credit) + "</li>\n"
                html += "</ul>\n"
        html += "<table class=\"cve\">"
        e['timetable'].append(["Affects",e['affects']]);
        for ti in e['timetable']:
            html+= "<tr><td class=\"cve-header\">"+ti[0]+"</td><td class=\"cve-value\">"+ti[1]+"</td></tr>\n"
        html+= "</table></dd>"
        print (html)
    print ("</dl></br/>")


