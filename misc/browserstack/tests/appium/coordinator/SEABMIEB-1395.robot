*** Settings ***
Library    DateTime
Library    AppiumLibrary
Resource    ../../../common/CustomAppiumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login
${RESULT_RELEASE_OPTION}    id=inputSelect-featureType-item-k-RESULT_RELEASE
${A-LEVEL_OPTION}   id=inputSelect-examLevel-item-k-GCEA
${START_DATE}     id=inputText-startDate
${END_DATE}     id=inputText-endDate
${END_DATE_VALUE}     12/12/2029

*** Test Cases ***
Private Centre Coordinator can view and download the result slip that his/her centre's candidates has sat for when result release window configured by Ops Admin is opened and no subject is blocked

    [Setup]    Custom Setup    ${URL}

    Custom Login    %{APPLICATION_ADMIN_USERNAME}   %{APPLICATION_ADMIN_PASSWORD}

    #Click the Applying for Exams - Resit button in the top tray
    Custom Navigatation to Sub menu    3    id=menu-settings-submenu-featuresConfiguration

    Sleep   2s
    #Click on Feature Type
    Click Element   id=inputSelect-featureType

    #Select from Feature Type List
    Click Element    ${RESULT_RELEASE_OPTION}

    #Click on Exam Level List
    Click Element   id=inputSelect-examLevel

    #Select from Exam Level List
    Click Element   ${A-LEVEL_OPTION}

    #Click on Apply Selection
    Click Element   id=button-featureConfiguration-applySelection

    #Get Current Date
    ${CURRENT_DATE}=    Get Current Date    result_format=%d/%m/%Y
    Log To Console    'Current Date is ' + ${CURRENT_DATE}

    #Get Start Date Value
    ${START_DATE_VALUE}   Get Value   ${START_DATE}
    Log To Console    'Start Date is ' + ${START_DATE_VALUE}

    Clear Text Field    ${START_DATE}

    #Enter StartDate for window period
    Input Text    ${START_DATE}   ${CURRENT_DATE}

    #Enter EndDate for window period
    Input Text    ${END_DATE}   ${END_DATE_VALUE}

    #Click on Submit Button
    Run Keyword If    '${START_DATE_VALUE}' == '${CURRENT_DATE}'   Click Element   id=button-featureConfiguration-update

    Custom Logout For Admin

    Custom Login    %{ACS_COORDINATOR_USERNAME}   %{ACS_COORDINATOR_PASSWORD}

    Custom Navigatation to Sub Menu    2    id=results

    #Select "A" Exam Level for Results
    Click Element   id=button-resultListing-GCE A-LEVEL

    #Select first candidate
    Click Element     id=tableSelectCell-undefined-row0

    #Select second candidate
    Click Element     id=tableSelectCell-undefined-row1

    #Select third candidate
    Click Element     id=tableSelectCell-undefined-row2

    #Click Download Button
    Click Element   id=button-resultRelease-download

    Custom Navigatation to Sub Menu    2    id=results

    #Select "A" Exam Level for Results
    Click Element   id=button-resultListing-GCE A-LEVEL

    #Select View Details
    Click Element   id=button-resultRelease-row0

    [Teardown]    Custom Teardown
