#!/bin/sh

BUILD_COUNTER=409;#Build Counter
NEXT_BUILD_COUNTER=$(($BUILD_COUNTER + 1))
export BUILD_COUNTER

export BROWSERSTACK_USERNAME=anandhirv_dp8xyp
export BROWSERSTACK_ACCESS_KEY=uqcRiV1MzXF9gFxaLB8s

# To Test Selenium + Robot Browser Script
FILES="./tests/selenium/candidate/*";
# shellcheck disable=SC1073
#for f in $FILES
#do

sh ./helper-scripts/run_test_file_in_multiple_browsers.sh   coordinatorFlow  ./tests/selenium/approver/candidateSPblockunblock
#sh ./helper-scripts/run_test_file_in_multiple_browsers.sh candidate-flow ./tests/selenium/candidate
#sh ./helper-scripts/run_test_file_in_multiple_browsers.sh candidate-flow ./tests/selenium/approver
#sh ./helper-scripts/run_test_file_in_multiple_browsers.sh candidate-flow ./tests/selenium/opsadmin
#sh ./helper-scripts/run_test_file_in_multiple_browsers.sh candidate-flow ./tests/selenium/systemadmin
#done

# To Test Appium + Robot Browser Script
# sh ./helper-scripts/run_test_file_in_multiple_browsers.sh coordinator-flow ./tests/appium/coordinator
# sh ./helper-scripts/run_test_file_in_multiple_browsers.sh candidate-flow ./tests/appium/candidate
#sh ./helper-scripts/run_test_file_in_multiple_browsers.sh candidate-flow ./tests/appium/approver
#sh ./helper-scripts/run_test_file_in_multiple_browsers.sh candidate-flow ./tests/appium/opsadmin
#sh ./helper-scripts/run_test_file_in_multiple_browsers.sh candidate-flow ./tests/appium/systemadmin


sed -i "/#Build Counter$/s/=.*#/=$NEXT_BUILD_COUNTER;#/" ./browserstack.sh
