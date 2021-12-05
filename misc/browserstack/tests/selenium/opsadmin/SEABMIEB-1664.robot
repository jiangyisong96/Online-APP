*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login

*** Test Cases ***
Ops Admin can reset password for Candidate with CP account, so that the Candidate can login to CP with new password

        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1664

        #Login as ops admin
        Custom Login   %{OPS_ADMIN}   %{OPS_ADMIN_PASSWORD}

        #Click on Accounts
        Mouse Over   id=menu-accounts

        #Click on submenu User Account Management
        Click Element   id=menu-accounts-submenu-userAccountManagement

        Sleep   5s

        #CLick actions dropdown
        Click Element   id=input-select-actions

        #Select Reset Password from Dropdown
        Click Element   id=input-select-actions-item-RESET_PASSWORD

        #Select Coordinator
        #ToDo Need to add id for candidate radio button
        Click Element   xpath=(//input[@name="userSelection"])[1]

        Sleep   5s

        #Enter candidate nric to search
        Input Text   name=inputSearch-searchInput   S0000002A

        #Click on search button
        Click Element   id=button-searchInput-search

        #Click on view details
        Click Element   id=button-candidate-viewdetails

        #Click reset password button
        Click Element   id=button-resetpassword-submit

        #Logout
        [Teardown]    Custom Teardown
