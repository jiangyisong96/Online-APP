#!/bin/sh

# this file exports all environment variables to the current shell
# use the command "source ./export_environment_variables.sh" to export the below variables to the current shell
echo "exporting environment variables from export_environment_variables.sh"

# at browserstack, tests ran with the same BUILD_NUMBER will be grouped together
export BUILD_NUMBER="build-one"

# domain env variable that should be used in robot test script
#export DOMAIN=https://seab_sit:hhGdlq58fj4BG9WxOCIH4AA3@sit.myexams.seab.gov.sg
export DOMAIN=https://seab_cat:S8n9Rpe7DgefL7FGxFrTJRXz@cat.myexams.seab.gov.sg

# login credentials used by robot script to perform login at web app
export COORDINATOR_1_USERNAME=coordinator1
export COORDINATOR_1_PASS=P@ssw0rd1234

export SJI_COORDINATOR_USERNAME=SjiCoordinator
export SJI_COORDINATOR_PASSWORD=P@ssw0rd1234

export ACS_COORDINATOR_USERNAME=ACSCoordinator
export ACS_COORDINATOR_PASSWORD=P@ssw0rd1234

export APPLICATIONADMIN_USERNAME=ApplicationAdmin
export APPLICATIONADMIN_PASS=P@ssw0rd1234
export SINGPASS_USER_1=S3001964D
export SINGPASS_PASSWORD=Spcp1111

export LOCAL_BROWSER=chrome
