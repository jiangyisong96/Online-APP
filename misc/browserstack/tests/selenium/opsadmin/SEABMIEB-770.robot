*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Library     DateTime
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login

*** Test Cases ***
Ops Admin can reset password for Coordinator with CP account

        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-770

        #Login as ops admin
        Custom Login   %{OPS_ADMIN}   %{OPS_ADMIN_PASSWORD}

        #Click on Accounts
        Mouse Over   id=menu-accounts

        #Click on submenu User Account Management
        Click Element   id=menu-accounts-submenu-userAccountManagement

        #Click on the dropdown
        Click Element   id=input-select-actions

        #Select Reset Password from Dropdown
        Click Element   id=input-select-actions-item-RESET_PASSWORD

        #Select Coordinator radio button
        #ToDo Need to add id for radio butotons
        Click Element   xpath=(//input[@name="userSelection"])[2]

        #Click on Coordinator dropdown
        Click Element   id=input-select-centres

        #Select ACS centre from Coordinator dropdown
        Click Element   id=input-select-centres-item-ACS International

        #Select Coordinator
        Click Element   id=button-coordinator-viewdetails

        #Click on reset button
        Click Element   id=button-resetpassword-submit

        Sleep   5s

        #Logout
        [Teardown]   Custom Teardown
