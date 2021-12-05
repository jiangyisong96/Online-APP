*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${SALUTATION}   MR

*** Test Cases ***
Private Centre Coordinator able to update particulars

        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1774

        #Login as ACS coordinator
        Custom Login   %{ACS_COORDINATOR_USERNAME}   %{ACS_COORDINATOR_PASSWORD}

        #Click on navigation drawer
        Mouse Over   id=menu-user

        #Click on Profile Tab
        Click Element   id=menu-user-submenu-myProfile

        #Click on Edit Particular
        Click Element   link=Edit Particulars

        #Click on Salutation
        Click Element   id=inputSelect-salutation

        #Input a salutation
        Click Element   id=inputSelect-salutation-option-0

        #Click Update Particular Button
        Click Element   id=button-coordinatorProfile-updateParticulars

        [Teardown]   Custom Teardown
