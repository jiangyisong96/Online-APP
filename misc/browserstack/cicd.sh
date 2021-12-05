#!/bin/sh

## this file install all dependencies required by cicd and in the end run browserstack.sh

# browserstack service access credentials, to be replaced with correct username and access key
# check here on how to get: https://www.browserstack.com/docs/automate/api-reference/selenium/authentication
export BROWSERSTACK_USERNAME=eugenetanqiyuan_dVaCDq
export BROWSERSTACK_ACCESS_KEY=yZeai5pHLmbF22Ah5s5z

# install python and pip by following instruction at https://packaging.python.org/tutorials/installing-packages/
echo "installing python 3.9.+"
sudo yum install python39
echo "check python version: "
python3 --version
echo "installing pip"
sudo yum install python-pip
echo "check pip version: "
python3 -m pip --version

# install robot framework dependencies
pip install robotframework
pip install --upgrade robotframework-seleniumlibrary
echo "check robot version: "
robot --version

# run tests
echo "start script ./browserstack.sh"
sh ./browserstack.sh
