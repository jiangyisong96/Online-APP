#!/usr/bin/python

import sys

DC = {'unhandledPromptBehavior': 'ignore',
      "os" : "Windows",
      "os_version" : "10",
      "browser" : "Edge",
      "resolution" : "1920x1080",
      "browser_version" : "latest",
      "build": sys.argv[2].split(':')[1],
      "name": sys.argv[2].split(':')[2],
      "browserstack.user": sys.argv[2].split(':')[3],
      "browserstack.key": sys.argv[2].split(':')[4]}


