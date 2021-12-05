*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Library     DateTime
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login

*** Test Cases ***
Ops Admin can reset password for Coordinator with CP account

        [Setup]    Custom Setup    ${URL}

        #Set Session name
        Custom Session Name   SEABMIEB-770

        #login as ops admin
        Custom Login   %{OPSADMIN4_USERNAME}   %{OPSADMIN4_PASSWORD}

        #Click on Accounts
        Mouse Over   id=menu-accounts

        #Click on submenu User Account Management
        Click Element   id=menu-accounts-submenu-userAccountManagement

        #Select Reset Password from Dropdown
        Click Element   id=input-select-actions
        Click Element   id=input-select-actions-item-RESET_PASSWORD

        #Select Coordinator
        #ToDo Need to add id for radio butotons
        Click Element   xpath=(//input[@name="userSelection"])[2]

        #Select centre from Coordinator dropdown
        Click Element   id=input-select-centres
        Click Element   id=input-select-centres-item-ACS International

        #Select Coordinator and Reset Password
        Click Element   id=button-coordinator-viewdetails

        #Click reset password button
        Click Element   id=button-resetpassword-submit

        #Logout
        Custom Logout For Admin
        [Teardown]   Custom Teardown
