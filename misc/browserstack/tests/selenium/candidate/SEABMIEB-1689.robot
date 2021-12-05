*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${SELECTED_SUBJECT}   id=tableSelectCell-subjectSelection-row0

*** Test Cases ***
YRS Private Candidate (IS) with 'O' Level mid-year Tamil results registers for MTL resit and pays with Credit Card

        [Setup]   Custom Setup    ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1689

        #Login as candidate
        Custom Login   %{CANDIDATE_YRS_USERNAME}   %{CANDIDATE_YRS_PASSWORD}

        #resit flow
        Custom CandidateResitFlow   ${SELECTED_SUBJECT}

        #click on proceed to payment
        Click Element   id=button-paymentButton-proceedToPayment

        #select credit card option
        Click Element   id=button-paymentMethod-enetsCreditCard

        #Payment flow
        Custom PaymentFlow

        [Teardown]   Custom Teardown
