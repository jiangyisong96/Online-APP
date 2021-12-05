#!/bin/sh

#Set environment where script will run
echo "initializing environmental variables"
source ./helper-scripts/export_local_environment_variables.sh

echo "Starting automation test scripts..."

# To Test Selenium + Robot Browser Script
robot --variablefile ./variables/local.py --outputdir ./robotOutput/local/$BUILD_NUMBER ./tests/selenium/approver/candidateIdblockunblock/02_SEABMIEB-791.robot
#robot --variablefile ./variables/local.py --outputdir ./robotOutput/local/$BUILD_NUMBER ./tests/selenium/candidate/SEABMIEB-1689.robot


# To Test Appium + Robot Browser Script
# robot --variablefile ./variables/local.py --outputdir ./robotOutput/local/$BUILD_NUMBER ./tests/appium/coordinator/SEABMIEB-1709.robot
# robot --variablefile ./variables/local.py --outputdir ./robotOutput/local/$BUILD_NUMBER ./tests/appium/candidate/SEABMIEB-551.robot


echo "End of Testing..."
exit 0
