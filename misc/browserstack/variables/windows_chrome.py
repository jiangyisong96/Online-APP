#!/usr/bin/python

import sys

DC = {"os": "Windows",
      "os_version": 10,
      "browser": "Chrome",
      "resolution" : "1920x1080",
      "browser_version": 93.0,
      "build": sys.argv[2].split(':')[1],
      "project":sys.argv[2].split(':')[2],
      "browserstack.user": sys.argv[2].split(':')[3],
      "browserstack.key": sys.argv[2].split(':')[4]
      }
