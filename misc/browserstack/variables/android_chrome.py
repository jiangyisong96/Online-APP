#!/usr/bin/python

import sys

DC = {"os_version" : "11.0",
      "device" : "Samsung Galaxy S21 Ultra",
      "real_mobile" : "true",
      "browserstack.local" : "false",
      "build": sys.argv[2].split(':')[1], "name": sys.argv[2].split(':')[2], "browserstack.user": sys.argv[2].split(':')[3], "browserstack.key": sys.argv[2].split(':')[4]}
