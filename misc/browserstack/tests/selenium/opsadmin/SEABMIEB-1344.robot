*** Settings ***
Library     SeleniumLibrary                                 implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${SELECTED_SUBJECT}   id=tableSelectCell-subjectSelection-row1

*** Test Cases ***
Ops Admin generates MT resit registration link for Private Candidate to register for 'A' Level MT resit and Bank Transfer selected for payment

        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1344

        #Login as OpsAdmin
        Custom Login   %{OPS_ADMIN}   %{OPS_ADMIN_PASSWORD}

        #Go to Applications
        Mouse Over   id=menu-applications

        #Click on sub menu resit
        Click Element   id=menu-applications-submenu-resit

        #Select Candidate
        Click Element   name=userSelection

        #Enter candidate nric to search
        Input Text   name=inputSearch-searchInput   %{CANDIDATE_ACS2_NRIC_SC}

        #Click on search button
        Click Element   id=button-searchInput-search

        #Click checkbox for "bank transfer"
        Click Element   name=oop-admin-resit-candidate-banktransfer"

        #Click send email button
        Click Element   id=button-sendemail

        Sleep   2s

        #Validate if page has text
        Page Should Contain    Email Sent

        Sleep   2s

        #Logout
        [Teardown]    Custom Teardown



