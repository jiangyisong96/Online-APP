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
Ops admin setup window period so that private candidate can amend particulars during open window

        [Setup]   Custom Setup    ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1452

        #Login as Ops admin
        Custom Login   %{OPS_ADMIN}   %{OPS_ADMIN_PASSWORD}

        #Hover to the setting navigation
        Mouse Over   id=menu-settings

        #Select feature configure
        Click Element   id=menu-settings-submenu-featuresConfiguration

        #Click on feature type dropdown list
        Click Element   id=inputSelect-featureType

        #select Candidate profile amendment from the feature type dropdown list
        Click Element   id=inputSelect-featureType-item-k-AMEND_PROFILE

        #click on apply selection button
        Click Element   id=button-featureConfiguration-applySelection

        #get current date
        ${CURRENT_DATE} =   Get Current Date   result_format=%d/%m/%Y

        #Get start date
        ${START_DATE_VALUE}   Get Value   ${START_DATE}

        #Clear Start date
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
        Custom Login   ${CANDIDATE_USERNAME}  ${CANDIDATE_PASSWORD}

        #Click on the profile avatar
        Click Element   xpath=//div[@data-testid='avatar']

        #Select profile submenu
        Click Element   id=menu-user-submenu-myProfile

        Wait Until Element Is Visible   id=link-editParticulars

        #Select profile submenu
        Click Element   id=link-editParticulars

        #Update contact number
        Input Text      id=inputText-candidateProfileTelephone-contactNumber    98345678

        #Update postal code
        Input Text   name=postalCode     100058

        #Click submit to update changes
        Click Element   id=button-candidateProfile-submit

        Sleep   3s

        [Teardown]   Custom Teardown