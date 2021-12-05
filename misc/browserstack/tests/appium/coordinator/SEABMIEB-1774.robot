*** Settings ***
Library    AppiumLibrary
Resource    ../../../common/CustomAppiumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login
${SALUTATION}       MR


*** Test Cases ***
Private Centre Coordinator able to update particulars

    [Setup]    Custom Setup    ${URL}
    Custom Login    %{ACS_COORDINATOR_USERNAME}   %{ACS_COORDINATOR_PASSWORD}

    #Click on user menu
    Click Element          id=menu-user

    #Select my profile from the navigation
    Click Element       id=menu-user-submenu-myProfile

    Sleep    10s
    #Click on the edit particulars 
    Click Element       id=link-editParticulars
    Sleep    10s
    Wait Until Element Is Visible   id=inputSelect-salutation
    #Click on Salutation
    Click Element    id=inputSelect-salutation

    #Input a salutation
    Click Element   id=inputSelect-salutation-option-0

    #Click Update Particular Button
    Click Element     id=button-coordinatorProfile-updateParticulars

    [Teardown]    Custom Teardown
