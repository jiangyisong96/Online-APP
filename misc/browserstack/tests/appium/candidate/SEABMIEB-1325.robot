*** Settings ***
Library    AppiumLibrary
Resource    ../../../common/CustomAppiumKeywords.robot
Library    DateTime

*** Variables ***
${URL}    %{DOMAIN}/auth/login
${START_DATE}     id=inputText-startDate
${END_DATE}     id=inputText-endDate
${CONTACT}     name=mobileContactNumber
${CONTACT_VALUE}       12345678
${END_DATE_VALUE}     12/12/2029
${CANDIDATE_USERNAME}   candidateAcsNric1
${CANDIDATE_PASSWORD}   P@ssw0rd1234


*** Test Cases ***
Ops admin setup window period so that private candidate can amend particulars during open window

    [Setup]   Custom Setup    ${URL}

    #Login as Application Admin
    Custom Login    %{APPLICATION_ADMIN_USERNAME}   %{APPLICATION_ADMIN_PASSWORD}
    
    #Get and Click Drawer Button
    ${DRAWER}   Get Webelement  class=MuiButtonBase-root
    ClickElement    ${drawer}

    #Get all Label in Drawer and ids are the same in mobile view
    ${MENULABELS}   Get Webelements  id=menu-label
    Sleep   2s

    #Click Settings to expand menu
    Click Element   ${MENULABELS}[3]

    #TODO revisit after Mobile Menu - Features Configuration ids is fixed
    #Select feature configuration from the navigation 
    Click Element       id=menu-settings-submenu-featuresconfiguration

    Sleep   2s
    #Click on feature type dropdown list
    Click Element       id=inputSelect-featureType

    #Select profile settings
    Click Element       id=inputSelect-featureType-item-k-AMEND_PROFILE

    #click on apply selection
    Click Element       id=button-featureConfiguration-applySelection

    Sleep   5s
    #Get current date
    ${CURRENT_DATE}=    Get Current Date      result_format=%d/%m/%Y
    Log To Console    ${CURRENT_DATE}}

    ${START_DATE_VALUE}   Get Element Attribute     ${START_DATE}   value
    Log To Console    ${START_DATE_VALUE}

    Clear Date Picker Field    ${START_DATE}

    #Enter StartDate for window period
    Input Text      ${START_DATE}      ${CURRENT_DATE}

    Clear Date Picker Field    ${END_DATE}
    #Enter EndDate for window period
    Input Text      ${END_DATE}      ${END_DATE_VALUE}

    Run Keyword If      '${START_DATE_VALUE}' != '${CURRENT_DATE}'    Click Element     id=button-featureConfiguration-update
    
    #Logout from the current user
    Custom Logout For Admin

    #Login as candidate
    Custom Login    ${CANDIDATE_USERNAME}  ${CANDIDATE_PASSWORD}

    #Click on user menu
    Click Element          id=menu-user

    #Select my profile from the navigation
    Click Element       id=menu-user-submenu-myProfile

    Sleep   5s
    #Click on the edit particulars 
    Click Element       id=link-editParticulars

    ${CONTACT_CURRENT_VALUE}        Get Text      ${CONTACT}
    #Try to make some changes on the contact number
	Clear Text      ${CONTACT}
    Input Text      ${CONTACT}     ${CONTACT_VALUE}

    #Click on submit button
    Click Element       id=button-candidateProfile-submit

    Click Element       id=button-candidateProfile-back

    
    ${CONTACT_NEW_VALUE}        Get Text      id=keyValue-mobileNo-0
    
    Should Be Equal	       Singapore (+65) ${CONTACT_VALUE}     ${CONTACT_NEW_VALUE}
    Should Not Be Equal    ${CONTACT_CURRENT_VALUE}             ${CONTACT_NEW_VALUE}


    [Teardown]    Custom Teardown



