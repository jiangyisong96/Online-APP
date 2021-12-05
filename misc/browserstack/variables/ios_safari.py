#!/usr/bin/python

import sys

DC = {"os_version" : "14",
      "device" : "iPhone 12",
        "browser": "Safari",
      "real_mobile" : "true",
      "browserstack.local" : "false",
      "safariInitialUrl": "",
      "browserstack.appium_version" : "1.21.0",
      "build": sys.argv[2].split(':')[1], "name": sys.argv[2].split(':')[2], "browserstack.user": sys.argv[2].split(':')[3], "browserstack.key": sys.argv[2].split(':')[4]}
