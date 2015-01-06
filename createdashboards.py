#!/bin/python
import json
import sys
import urllib
import os

for d, l, files in os.walk("./dashboards"):
	for f in files:
		if f[-5:] == ".json":
			jason = json.dumps(json.load(open('%s/%s'%("./dashboards/", f), 'r')))
			post = "state=" + urllib.quote(jason)
			result = json.load(urllib.urlopen('http://localhost:8000/dashboard/save/%s' % (f[:-5]), data=post))
			if "success" in result and result["success"] is True:
				print "[+] %s dashboard created." % f[:-5]
