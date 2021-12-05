#!/usr/bin/python

import sys

DC = {"os" : "Windows",
      "os_version" : "10",
      "browser" : "Firefox",
      "resolution" : "1920x1080",
      "browser_version" : "latest",
      "browserstack.local" : "false",
      "browserstack.selenium_version" : "3.10.0",
      "build": sys.argv[2].split(':')[1],
      "name": sys.argv[2].split(':')[2],
      "browserstack.user": sys.argv[2].split(':')[3],
      "browserstack.key": sys.argv[2].split(':')[4]}
