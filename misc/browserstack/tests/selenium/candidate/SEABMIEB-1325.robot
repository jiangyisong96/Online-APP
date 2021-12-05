*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot
Library    DateTime

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${START_DATE}   id=inputText-startDate
${END_DATE}   id=inputText-endDate
${CONTACT}   name=mobileContactNumber
${CONTACT_VALUE}   12345678
${END_DATE_VALUE}   12/12/2028
${CANDIDATE_USERNAME}   candidateAcsNric1
${CANDIDATE_PASSWORD}   P@ssw0rd1234

*** Test Cases ***
Ops admin setup window period so that private candidate can amend particulars during open window

        [Setup]   Custom Setup    ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1325

        #Login as Application Admin
        Custom Login   %{OPS_ADMIN}   %{OPS_ADMIN_PASSWORD}

        #Hover over to setting on navigation bar
        Mouse Over   id=menu-settings

        #Select feature configuration from the navigation
        Click Element   id=menu-settings-submenu-featuresConfiguration

        #Click on feature type dropdown list
        Click Element   id=inputSelect-featureType

        #Select profile settings
        Click Element   id=inputSelect-featureType-item-k-AMEND_PROFILE

        #click on apply selection
        Click Element   id=button-featureConfiguration-applySelection

        #Get current date
        ${CURRENT_DATE}=   Get Current Date   result_format=%d/%m/%Y
        Log To Console   ${CURRENT_DATE}}

        #get start date
        ${START_DATE_VALUE}   Get Value   ${START_DATE}
        Log To Console    ${START_DATE_VALUE}

        #Clear Element Text
        Press Keys   //input[@id="inputText-startDate"]   CTRL+A   BACKSPACE

        #Enter current date as StartDate for window period
        Input Text   ${START_DATE}   ${CURRENT_DATE}

        #Clear Element in textarea
        Run Keyword And Ignore Error   Press Keys   //input[@id="inputText-endDate"]   CTRL+A   BACKSPACE

        Sleep   5s

        #Enter EndDate for window period
        Input Text   //input[@id="inputText-endDate"]   22/04/2023

        #Click on submit button if the current date not equal to the start date
        Run Keyword If   '${START_DATE_VALUE}' == '${CURRENT_DATE}'   Click Element   id=button-featureConfiguration-update

        #Logout from the current user
        Custom Logout For Admin

        #Login as candidate
        Custom Login   ${CANDIDATE_USERNAME}  ${CANDIDATE_PASSWORD}

        #Hover to to the profile navigation
        Mouse Over   id=menu-user

        #Select my profile from the navigation
        Click Element   id=menu-user-submenu-myProfile

        #Click on the edit particulars
        Click Element   id=link-editParticulars

        #Get contact number
        ${CONTACT_CURRENT_VALUE}   Get Text   ${CONTACT}

        #Try to make some changes on the contact number
        Input Text   ${CONTACT}   ${CONTACT_VALUE}

        #Click on submit button
        Click Element   id=button-candidateProfile-submit

        #Click back button
        Click Element   id=button-candidateProfile-back

        ${CONTACT_NEW_VALUE}   Get Text   id=keyValue-mobileNo-0
        Should Be Equal   Singapore (+65) ${CONTACT_VALUE}   ${CONTACT_NEW_VALUE}
        Should Not Be Equal   ${CONTACT_CURRENT_VALUE}   ${CONTACT_NEW_VALUE}

        [Teardown]   Custom Teardown



