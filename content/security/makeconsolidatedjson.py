import json
import os
from optparse import OptionParser
parser = OptionParser()
 
parser.add_option("-i","--inputdirectory",help="directory of json files",dest="directory")
(options,args) = parser.parse_args()

cves = []

for x in os.listdir(options.directory or "./"):
    if x.endswith(".json"):
        try:
            fd = open(options.directory+x)
            cve = json.load(fd)
            cves.append(cve)
        except:
            print ("Ignoring due to error parsing: "+x)
            continue

print( json.dumps(cves, indent=4))
