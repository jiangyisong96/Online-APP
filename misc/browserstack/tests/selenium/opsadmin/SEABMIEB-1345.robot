*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${SELECTED_SUBJECT}   id=tableSelectCell-subjectSelection-row1

*** Test Cases ***
Ops Admin generates MT resit registration link for Private Candidate to register for 'O' Level MT resit and paid with Credit Card

        #Setup
        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1345

        #Login as OpsAdmin
        Custom Login   %{OPS_ADMIN}   %{OPS_ADMIN_PASSWORD}

        #Go to Applications menu
        Mouse Over   id=menu-applications

        #Click on submenu resit
        Click Element   id=menu-applications-submenu-resit

        #Select Candidate
        Click Element   name=userSelection

        #Search Candidate NRIC and send email. Bank Transfer is not selected
        Input Text   name=inputSearch-searchInput   %{CANDIDATE_ACS_NRIC_SC}

        #Click search button
        Click Element   id=button-searchInput-search

        #Click Send mail
        Click Element    id=button-sendemail

        Sleep   2s

        #Validate if page has text
        Page Should Contain    Email Sent

        #Logout OpsAdmin
        Custom Logout For Admin

        #Login as Candidate ACS
        Custom Login   %{CANDIDATE_ACS_USERNAME}   %{CANDIDATE_ACS_PASSWORD}

        #Candidate Resit flow Keyword
        Custom CandidateResitFlow   ${SELECTED_SUBJECT}

        #Click on proceed to payment
        Click Element   id=button-paymentButton-proceedToPayment

        #select credit card option
        Click Element   id=button-paymentMethod-enetsCreditCard

        Sleep   10s

        #Payment flow Keyword
        Custom PaymentFlow

        #Logout
        [Teardown]   Custom Teardown


