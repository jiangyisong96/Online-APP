#!/usr/bin/python

import sys

DC = {"os": "OS X", "os_version": "Mojave",
      "browser": "Safari",
      "safariIgnoreFraudWarning " : "true",
      "resolution" : "1920x1080",
      "browser_version": "latest",
      "browserstack.timezone" : "Singapore",
      "build": sys.argv[2].split(':')[1],
      "name": sys.argv[2].split(':')[2],
      "browserstack.console": "info",
      "browserstack.user": sys.argv[2].split(':')[3],
      "browserstack.key": sys.argv[2].split(':')[4],}
