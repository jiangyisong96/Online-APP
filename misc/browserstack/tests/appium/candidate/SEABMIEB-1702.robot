*** Settings ***
Library    AppiumLibrary
Resource    ../../../common/CustomAppiumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login
${SELECTED_SUBJECT}     id=tableSelectCell-subjectSelection-row1

*** Test Cases ***
ACS Int Private Candidate (SC) with 'A' Level mid-year Chinese results (present for MTL Oral/Aural) registers for MTLB resit and pays with Credit Card


    [Setup]   Custom Setup    ${URL}

    Custom Login    %{CANDIDATE_ACS_USERNAME}  %{CANDIDATE_ACS_PASSWORD}

    Custom Candidate Resit Flow   ${SELECTED_SUBJECT}
    Sleep    10s
    #click on proceed to payment
    Click Element       id=button-paymentButton-proceedToPayment
    Sleep    10s
    #select credit card option
    Click Element       id=button-paymentMethod-enetsCreditCard
    Sleep    10s
    Custom Credit Card Payment Flow

    [Teardown]    Custom Teardown
