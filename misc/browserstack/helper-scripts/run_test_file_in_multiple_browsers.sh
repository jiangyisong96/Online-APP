#!/bin/sh

# pass in test file name as first argument
# test file path as second argument

echo "running test scripts at different browsers..."

# Windows OS different browsers
#Running Windows Chrome Variable
echo "running at: windows_chrome"
source ./helper-scripts/export_windows_chrome_environment_variable.sh
robot --variablefile ./variables/windows_chrome.py:$BUILD_NUMBER:$1:$BROWSERSTACK_USERNAME:$BROWSERSTACK_ACCESS_KEY  --outputdir ./robotOutput/$BUILD_NUMBER/windows_chrome/$1 $2

#echo "running at: windows edge"
#source ./helper-scripts/export_windows_edge_environment_variable.sh
#robot --variablefile ./variables/windows_edge.py:$BUILD_NUMBER:$1:$BROWSERSTACK_USERNAME:$BROWSERSTACK_ACCESS_KEY --outputdir ./robotOutput/$BUILD_NUMBER/windows_edge/$1 $2

#echo "running at: windows ie"
#source ./helper-scripts/export_windows_ie_environment_variable.sh
#robot --variablefile ./variables/windows_ie.py:$BUILD_NUMBER:$1:$BROWSERSTACK_USERNAME:$BROWSERSTACK_ACCESS_KEY --outputdir ./robotOutput/$BUILD_NUMBER/windows_ie/$1 $2

#echo "running at: windows firefox"
#source ./helper-scripts/export_windows_firefox_environment_variable.sh
#robot --variablefile ./variables/windows_firefox.py:$BUILD_NUMBER:$1:$BROWSERSTACK_USERNAME:$BROWSERSTACK_ACCESS_KEY --outputdir ./robotOutput/$BUILD_NUMBER/windows_firefox/$1 $2

#Mac OS different browsers
#echo "running at: mac_safari"
#source ./helper-scripts/export_mac_safari_environment_variable.sh
#robot --variablefile ./variables/mac_safari.py:$BUILD_NUMBER:$1:$BROWSERSTACK_USERNAME:$BROWSERSTACK_ACCESS_KEY    --outputdir ./robotOutput/$BUILD_NUMBER/mac_safari/$1 $2

# echo "running at: mac_chrome"

#source ./helper-scripts/export_mac_chrome_environment_variable.sh
#FILES="${2}/*";
#for f in $FILES
#do

    #echo $f
#robot --variablefile ./variables/mac_chrome.py:$BUILD_NUMBER:$f:$BROWSERSTACK_USERNAME:$BROWSERSTACK_ACCESS_KEY --outputdir ./robotOutput/CoordinatorFlowTest-26102021-2/mac_chrome/$f $f
#done

#echo "running at: mac_firefox"
#source ./helper-scripts/export_mac_firefox_environment_variable.sh
#robot --variablefile ./variables/mac_firefox.py:$BUILD_NUMBER:$1:$BROWSERSTACK_USERNAME:$BROWSERSTACK_ACCESS_KEY --outputdir ./robotOutput/$BUILD_NUMBER/mac_firefox/$1 $2

#mobile phone android and iOS
# echo "running at: android_chrome"
# loop through file in dir
# source ./helper-scripts/export_android_chrome_environment_variable.sh
# FILES="${2}/*";

# for f in $FILES
# do
#     echo $f
#     robot --variablefile ./variables/android_chrome.py:$BUILD_NUMBER:$f:$BROWSERSTACK_USERNAME:$BROWSERSTACK_ACCESS_KEY --outputdir ./robotOutput/$BUILD_NUMBER/android_chrome/$f $f
# done

# echo "running at: ios_safari"
# source ./helper-scripts/export_ios_safari_environment_variable.sh
# robot --variablefile ./variables/ios_safari.py:$BUILD_NUMBER:$1:$BROWSERSTACK_USERNAME:$BROWSERSTACK_ACCESS_KEY --outputdir ./robotOutput/$BUILD_NUMBER/ios_safari/$1 $2

echo "End of script"
