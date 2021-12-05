# BrowserStack-Robot
This is a sample project that uses Robot Framework with Selenium Library. The test cases written here also use services provided by Browser Stack i.e. running tests on different OS and browsers hosted at Browser Stack.

## Confluence Link (WIP)
https://confluence.ship.gov.sg/pages/viewpage.action?pageId=478414015

## Preface
For Windows user, please use bash terminal to run all of the commands below.

## Setup
* Install Python v3.+ and pip
    * Windows: https://www.liquidweb.com/kb/how-to-install-python-on-windows/
    * Mac OS: Some OS comes with default Python 2. Do not remove system's Python, instead use pyenv to manage different python versions. Follow instructions at https://opensource.com/article/19/5/python-3-default-mac
* Install Robot Framework dependencies  `pip install robotframework`  &&  `pip install --upgrade robotframework-seleniumlibrary`
* Install Appium - https://appium.io/docs/en/about-appium/getting-started/index.html
  Via NPM `npm install -g appium`

  Via Desktop App Download
  Simply download the latest version of Appium Desktop from the https://github.com/appium/appium-desktop/releases.

Verifying Appium Installation
To verify that all of Appium's dependencies are met you can use `appium-doctor`. Install it with `npm install -g appium-doctor`, then run the `appium-doctor` command, supplying the `--ios` or `--android` flags to verify that all of the dependencies are set up correctly.

  eg. `appium doctor --ios`

* If you would like to run robot using browsers on you local computer, install the appropriate browser and its web driver and put them in your execution path
  * By default, chrome will be opened, if you would like to change default browser, change `LOCAL_BROWSER` value at `./helper-scripts/export_local_environment_variables.sh`
  * Chrome web driver can be downloaded at https://chromedriver.chromium.org/downloads
    * set permission status for chrome web driver at mac: https://stackoverflow.com/questions/60362018/macos-catalinav-10-15-3-error-chromedriver-cannot-be-opened-because-the-de/64019725
* To check whether you have installed Robot Framework and web driver correctly (on local), run the below command at the root of this folder using bash terminal. It should open a browser, navigate to our website and complete tests.
    ``` 
    sh local.sh
    ```
  
For reference, full installation instructions are available at https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#installation-instructions

## Run Test Scripts at BrowserStack
* For users with BrowserStack account, you can find your username and access key following the instructions here: https://www.browserstack.com/docs/automate/api-reference/selenium/authentication
* To run test scripts using BrowserStack services, export you BrowserStack username and access key as environment variables as shown below

  ```
  export BROWSERSTACK_USERNAME=<browserstack-username> &&
  export BROWSERSTACK_ACCESS_KEY=<browserstack-access-key>
  ```
* To run test at BrowserStack, at the root of this folder, run

    ``` 
    sh browserstack.sh
    ```
