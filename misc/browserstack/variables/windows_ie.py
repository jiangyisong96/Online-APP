#!/usr/bin/python

import sys

DC = {"os" : "Windows",
      "os_version" : "10",
      "browser" : "IE",
      "resolution" : "1920x1080",
      "browser_version" : "11.0",
      "browserstack.local" : "false",
      "browserstack.selenium_version" : "3.5.2",
      "browserstack.console" : "errors",
      "build": sys.argv[2].split(':')[1],
      "name": sys.argv[2].split(':')[2],
      "browserstack.user": sys.argv[2].split(':')[3],
      "browserstack.key": sys.argv[2].split(':')[4]}


