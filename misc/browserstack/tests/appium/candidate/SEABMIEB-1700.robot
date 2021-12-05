*** Settings ***
Library    AppiumLibrary
Resource    ../../../common/CustomAppiumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login
${SELECTED_SUBJECT}     id=tableSelectCell-subjectSelection-row0


*** Test Cases ***
HCI Int Private Candidate (PR) with 'O' Level mid-year Malay results (absent for MTL Oral/Aural) registers for MTLB resit and pays with Credit Card

    [Setup]   Custom Setup    ${URL}

    Custom Login        %{CANDIDATE_HCI_USERNAME}  %{CANDIDATE_HCI_PASSWORD}

    Custom Candidate Resit Flow   ${SELECTED_SUBJECT}

    #click on proceed to payment
    Click Element       id=button-paymentButton-proceedToPayment

    #select credit card option
    Click Element       id=button-paymentMethod-enetsCreditCard

    Custom Credit Card Payment Flow

    [Teardown]    Custom Teardown
