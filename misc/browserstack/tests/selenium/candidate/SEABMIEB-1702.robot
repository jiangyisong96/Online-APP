*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${SELECTED_SUBJECT}   id=tableSelectCell-subjectSelection-row1

*** Test Cases ***
ACS Int Private Candidate (SC) with 'A' Level mid-year Chinese results (present for MTL Oral/Aural) registers for MTLB resit and pays with Credit Card

        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   EABMIEB-1702

        #Login as candidate
        Custom Login   %{CANDIDATE_ACS_USERNAME}   %{CANDIDATE_ACS_PASSWORD}

        #Resit flow
        Custom CandidateResitFlow   ${SELECTED_SUBJECT}

        #click on proceed to payment
        Click Element   id=button-paymentButton-proceedToPayment

        #select credit card option
        Click Element   id=button-paymentMethod-enetsCreditCard

        #payment flow
        Custom PaymentFlow

        [Teardown]   Custom Teardown
