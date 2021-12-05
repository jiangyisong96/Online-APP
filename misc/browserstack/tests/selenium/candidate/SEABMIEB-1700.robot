*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login
${SELECTED_SUBJECT}   id=tableSelectCell-subjectSelection-row0

*** Test Cases ***
HCI Int Private Candidate (PR) with 'O' Level mid-year Malay results (absent for MTL Oral/Aural) registers for MTLB resit and pays with Credit Card

        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1700

        #Login as candidate
        Custom Login   %{CANDIDATE_HCI_USERNAME2}   %{CANDIDATE_HCI_PASSWORD2}

        #Resit flow
        Custom CandidateResitFlow   ${SELECTED_SUBJECT}

        #click on proceed to payment
        Click Element   id=button-paymentButton-proceedToPayment

        #select credit card option
        Click Element   id=button-paymentMethod-enetsCreditCard

        #Payment flow
        Custom PaymentFlow

        [Teardown]   Custom Teardown
