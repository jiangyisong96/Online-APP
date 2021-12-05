*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot
Library    DateTime

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${START_DATE}   id=inputText-startDate
${END_DATE}   id=inputText-endDate
${END_DATE_VALUE}   12/12/2028
${CANDIDATE_USERNAME}   candidateAcsNric4
${CANDIDATE_PASSWORD}   P@ssw0rd1234

*** Test Cases ***
Singapore/PR Private Candidate can view result for O-level exam when result release window configured by Ops Admin is opened and no subject is blocked

        [Setup]   Custom Setup    ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1394

        #Login as application admin
        Custom Login   %{APPLICATION_ADMIN_USERNAME}   %{APPLICATION_ADMIN_PASSWORD}

        #Hover to the setting navigation
        Click Element   id=menu-settings

        #Select feature configure
        Click Element   id=menu-settings-submenu-featuresConfiguration

        #Click on feature type dropdown list
        Click Element   id=inputSelect-featureType

        #select reesult release from the feature type dropdown list
        Click Element   id=inputSelect-featureType-item-k-RESULT_RELEASE

        #click on exam level dropdown list
        Click Element   id=inputSelect-examLevel

        #select GEC O LEVEL
        Click Element   id=inputSelect-examLevel-item-k-GCEO

        #click on apply selection button
        Click Element   id=button-featureConfiguration-applySelection

        #get current date
        ${CURRENT_DATE} =   Get Current Date   result_format=%d/%m/%Y

        #Get start date
        ${START_DATE_VALUE}      Get Value   ${START_DATE}

        #Clear Start date field
        Press Keys   //input[@id="inputText-startDate"]   CTRL+A   BACKSPACE

        #Enter StartDate for window period
        Input Text   ${START_DATE}   ${CURRENT_DATE}

        #Clear end date field
        Run Keyword And Ignore Error   Press Keys   //input[@id="inputText-endDate"]   CTRL+A   BACKSPACE

        #Enter EndDate for window period
        Input Text   ${END_DATE}   ${END_DATE_VALUE}

        #Click update
        Run Keyword If   '${START_DATE_VALUE}' == '${CURRENT_DATE}'   Click Element   id=button-featureConfiguration-update

        #Logout from the current user
        Custom Logout For Admin

        #Login as candidate
        Custom Login   ${CANDIDATE_USERNAME}   ${CANDIDATE_PASSWORD}

        #Click GEC O level from the home screen
        Click Element   id=button-resultListing-GCE O-LEVEL

        #Hover to the result navigation
        Mouse Over   id=menu-results

        #Select view result
        Click Element   menu-results-submenu-results

        #Click on the button to view result
        Click Element   id=button-resultListing-GCE O-LEVEL

        ${CANDIDATE_NAME}   Get Text   id=keyValue-candidateName-0
        ${CANDIDATE_ID}   Get Text   id=keyValue-nricFinPassport-0
        Should Be Equal   candidate-acs-nric-4   ${CANDIDATE_NAME}
        Should Be Equal   S0000004A   ${CANDIDATE_ID}

        [Teardown]   Custom Teardown