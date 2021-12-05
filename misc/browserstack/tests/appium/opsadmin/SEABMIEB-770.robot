*** Settings ***
Library    AppiumLibrary
Resource    ../../../common/CustomAppiumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login

*** Test Cases ***

Ops Admin can reset password for Coordinator with CP account

  [Setup]    Custom Setup    ${URL}
    Custom Login    %{OPSADMIN4_USERNAME}   %{OPSADMIN4_PASSWORD}

      Custom Navigatation to Sub Menu    2    id=menu-accounts-submenu-userAccountManagement

        Sleep     5s
      # Select Reset Password from Dropdown
        Click Element       id=input-select-actions
        Click Element       id=input-select-actions-item-RESET_PASSWORD

        Sleep     5s
        #Select Coordinator
        Click Element        xpath=(//input[@name="userSelection"])[2]
        # Select centre from Coordinator dropdown
        Sleep    5s
        Click Element       id=input-select-centres
        Click Element       id=input-select-centres-item-ACS International

        #Select Coordinator and Reset Password
        Sleep    5s
        Click Element       id=button-coordinator-viewdetails
        Click Element       id=button-resetpassword-submit

