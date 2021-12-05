#!/usr/bin/python

import sys

# do not include "browserstack.selenium_version" in DC, for some reasons, it does not work even though it's recommended
# by BrowserStack capability generator
DC = {"os" : "OS X",
      "os_version" : "Big Sur",
      "browser" : "Chrome",
      "browser_version" : 75.0,
      "browserstack.timezone" : "Singapore",
      "resolution" : "1920x1080",
      "build": sys.argv[2].split(':')[1], "name": sys.argv[2].split(':')[2], "browserstack.user": sys.argv[2].split(':')[3], "browserstack.key": sys.argv[2].split(':')[4]}

