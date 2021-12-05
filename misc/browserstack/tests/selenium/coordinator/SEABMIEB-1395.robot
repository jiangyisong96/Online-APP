*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Library    DateTime
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${RESULT_RELEASE_OPTION}   id=inputSelect-featureType-item-k-RESULT_RELEASE
${A-LEVEL_OPTION}   id=inputSelect-examLevel-item-k-GCEA
${START_DATE}   id=inputText-startDate
${END_DATE}   id=inputText-endDate
${END_DATE_VALUE}   14/10/2024


*** Test Cases ***
Private Centre Coordinator can view and download the result slip that his/her centre's candidates has sat for when result release window configured by Ops Admin is opened and no subject is blocked

        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1395

        Custom Login   %{APPLICATION_ADMIN_USERNAME}   %{APPLICATION_ADMIN_PASSWORD}

        #Click on Settings in navigation drawer
        Mouse Over   id=menu-settings

        #Click on Features Configuration
        Click Element   id=menu-settings-submenu-featuresConfiguration

        #Click on Feature Type
        Click Element   id=inputSelect-featureType

        #Select from Feature Type List
        Click Element   ${RESULT_RELEASE_OPTION}

        #Click on Exam Level List
        Click Element   id=inputSelect-examLevel

        #Select from Exam Level List
        Click Element   ${A-LEVEL_OPTION}

        #Click on Apply Selection
        Click Element   id=button-featureConfiguration-applySelection

        #Get Current Date
        ${CURRENT_DATE}=   Get Current Date   result_format=%d/%m/%Y
        Log To Console    'Current Date is ' + ${CURRENT_DATE}

        #Get Start Date Value
        ${START_DATE_VALUE}   Get Value   ${START_DATE}
        Log To Console    'Start Date is ' + ${START_DATE_VALUE}

        #Clear Start date field
        #Press Keys       //input[@id="inputText-startDate"]    CTRL+A       BACKSPACE

        #Enter StartDate for window period
        Input Text    ${START_DATE}   ${CURRENT_DATE}

        #TODO Please change for windows(CTRL)/mac safari(CMD) before run
        #Clear End date field
        Run Keyword And Ignore Error   Press Keys   //input[@id="inputText-endDate"]    CMD+A
        #Run Keyword And Ignore Error    Press Keys       //input[@id="inputText-endDate"]    CTRL+A    BACKSPACE

        Press Keys   ${END_DATE}   CTRL+A   BACKSPACE

        #Enter EndDate for window period
        Input Text   ${END_DATE}   ${END_DATE_VALUE}

        #Click on Submit Button
        Run Keyword If   '${START_DATE_VALUE}' == '${CURRENT_DATE}'   Click Element   id=button-featureConfiguration-update

        Custom Logout For Admin

        Custom Login   %{ACS_COORDINATOR_USERNAME}   %{ACS_COORDINATOR_PASSWORD}

        Custom Coordinator View Results

        #Select "A" Exam Level for Results
        Click Element   id=button-resultListing-GCE A-LEVEL

        #Select first candidate
        Click Element   id=tableSelectCell-undefined-row0

        #Click Download Button
        Click Element   id=button-resultRelease-download

        Sleep   20s

        #click results menu
        Click Element   id=menu-results

        #view results
        Custom Coordinator View Results

        #Select "A" Exam Level for Results
        Click Element   id=button-resultListing-GCE A-LEVEL

        Sleep   5s

        #Select View Details
        Click Element   id=button-resultRelease-row0

        [Teardown]   Custom Teardown
