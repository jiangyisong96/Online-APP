*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login

*** Test Cases ***
Private Centre Coordinator success to manual register the Candidates for resit and make payment by Credit Card, so that Candidates can resit the mid year A-level MT exam

        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1756

        #Login as PEB coordinator
        Custom Login   %{PEB_COORDINATOR_USERNAME}   %{PEB_COORDINATOR_PASSWORD}

        #Click the Applying for Exams button in the top tray
        Click Element   id=menu-resits

        #Click the Resit button in the list
        Click Element   id=menu-resits-submenu-resit

        #Select the dropdown filter for selecting exam level
        Click Element   id=inputSelect-examLevel

        #Select GCEO in filter
        Click Element   id=inputSelect-examLevel-item-k-GCEO

        #Select Mode of Registration
        Click Element   id=radio-manual

        #Click Start Registration Process
        Click Element   id=button-resitRegister-startRegistration

        #Click Start
        Click Element   id=button-instructionConsent-start

        Custom Coordinator Resit Manual Register Add Candidate   %{CANDIDATE_PEB_NRIC_SC}

        Custom Coordinator Resit Manual Register Add Candidate   %{CANDIDATE_PEB_NRIC_PR}

        Custom Coordinator Resit Manual Register Add Candidate   %{CANDIDATE_PEB_NRIC_IS}

        #Save Candidate SC Name
        ${CANDIDATE_PEB_SC_NAME}=    Get Text   id=text-candidateName-row0

        #Save Candidate PR Name
        ${CANDIDATE_PEB_PR_NAME}=    Get Text   id=text-candidateName-row1

        #Save Candidate IS Name
        ${CANDIDATE_PEB_IS_NAME}=    Get Text   id=text-candidateName-row2

        #Click Show Details
        Click Element   id=iconButton-candidateListing-row0

        #Click to select subject
        Click Element   id=tableSelectCell-subjectSelection-row0

        #Save Selected Subject Code
        ${CANDIDATE_PEB_SC_SUBJECTCODE}=    Get Text   id=text-subjectCode-row0

        #Click Show Details
        Click Element   id=iconButton-candidateListing-row1

        #Click to select subject
        Click Element   id=tableSelectCell-subjectSelection-row0

        #Save Selected Subject Code
        ${CANDIDATE_PEB_PR_SUBJECTCODE}=    Get Text   id=text-subjectCode-row0

        #Click Show Details
        Click Element   id=iconButton-candidateListing-row2

        #Click to select subject
        Click Element   id=tableSelectCell-subjectSelection-row0

        #Save Selected Subject Code
        ${CANDIDATE_PEB_IS_SUBJECTCODE}=    Get Text   id=text-subjectCode-row0

        #Click to continue after selecting subject
        Click Element   id=button-resitAction-continue

        #Click to continue after confirming details
        Click Element   id=button-resitAction-continue

        #Select First Candidate
        Click Element   id=iconButton-candidateListing-row0

        #Assertion of First Candidate
        Custom Resit Group Register Validation   ${CANDIDATE_PEB_SC_NAME}   %{CANDIDATE_PEB_NRIC_SC}   ${CANDIDATE_PEB_SC_SUBJECTCODE}

        #Assert that Payment is 0.00
        Element Text Should Be   id=text-examFees-row0   0.00

        #Select Second Candidate
        Click Element   id=iconButton-candidateListing-row1

        #Assertion of Second Candidate
        Custom Resit Group Register Validation   ${CANDIDATE_PEB_PR_NAME}   %{CANDIDATE_PEB_NRIC_PR}   ${CANDIDATE_PEB_PR_SUBJECTCODE}

        #Select Third Candidate
        Click Element   id=iconButton-candidateListing-row2

        #Assertion of Third Candidate
        Custom Resit Group Register Validation   ${CANDIDATE_PEB_IS_NAME}   %{CANDIDATE_PEB_NRIC_IS}   ${CANDIDATE_PEB_IS_SUBJECTCODE}

        #Click to continue after confirmation page
        Click Element   id=button-resitAction-continue

        #Click to check declaration checkbox
        Click Element   id=checkbox-declaration

        #Click proceed to payment button
        Click Element   id=button-paymentButton-proceedToPayment

        #Click proceed to Credit Card Payment
        Click Element   id=button-paymentMethod-enetsCreditCard

        Sleep   5s

        #Click Proceed with Make Credit Card Payment Method
        Custom PaymentFlow

        Sleep   10s

        [Teardown]   Custom Teardown