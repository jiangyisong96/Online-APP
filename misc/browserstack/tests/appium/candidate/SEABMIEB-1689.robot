*** Settings ***
Library    AppiumLibrary
Resource    ../../../common/CustomAppiumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login
${SELECTED_SUBJECT}     id=tableSelectCell-subjectSelection-row0


*** Test Cases ***
YRS Private Candidate (IS) with 'O' Level mid-year Tamil results registers for MTL resit and pays with Credit Card

    [Setup]   Custom Setup    ${URL}

    Custom Login   %{CANDIDATE_YRS_USERNAME}    %{CANDIDATE_YRS_PASSWORD}

    Custom Candidate Resit Flow   ${SELECTED_SUBJECT}

    #click on proceed to payment
    Click Element       id=button-paymentButton-proceedToPayment

    #select credit card option
    Click Element       id=button-paymentMethod-enetsCreditCard
    Sleep   5s
    Custom Credit Card Payment Flow

    [Teardown]    Custom Teardown
