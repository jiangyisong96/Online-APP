*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login

*** Test Cases ***
Private Centre Coordinator manual registers ITE Private Candidates (SC, PR and IS) with 'O' Level mid-year MTL results for MTL resit and pays with Bank Transfer

        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1709

        #Login as ITE coodinator
        Custom Login   %{ITE_COORDINATOR_USERNAME}   %{ITE_COORDINATOR_PASSWORD}

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

        Custom Coordinator Resit Manual Register Add Candidate   %{CANDIDATE_ITE_NRIC_SC}

        Custom Coordinator Resit Manual Register Add Candidate   %{CANDIDATE_ITE_NRIC_PR}

        Custom Coordinator Resit Manual Register Add Candidate   %{CANDIDATE_ITE_NRIC_IS}

        #Save Candidate SC Name
        ${CANDIDATE_ITE_SC_NAME}=    Get Text   id=text-candidateName-row0

        #Save Candidate PR Name
        ${CANDIDATE_ITE_PR_NAME}=    Get Text   id=text-candidateName-row1

        #Save Candidate IS Name
        ${CANDIDATE_ITE_IS_NAME}=    Get Text   id=text-candidateName-row2

        #Click Show Details
        Click Element   id=iconButton-candidateListing-row0

        #Click to select subject
        Click Element   id=tableSelectCell-subjectSelection-row0

        #Save Selected Subject Code
        ${CANDIDATE_ITE_SC_SUBJECTCODE}=   Get Text   id=text-subjectCode-row0

        #Click Show Details
        Click Element   id=iconButton-candidateListing-row1

        #Click to select subject
        Click Element   id=tableSelectCell-subjectSelection-row0

        #Save Selected Subject Code
        ${CANDIDATE_ITE_PR_SUBJECTCODE}=   Get Text   id=text-subjectCode-row0

        #Click Show Details
        Click Element   id=iconButton-candidateListing-row2

        #Click to select subject
        Click Element   id=tableSelectCell-subjectSelection-row0

        #Save Selected Subject Code
        ${CANDIDATE_ITE_IS_SUBJECTCODE}=    Get Text   id=text-subjectCode-row0

        #Click to continue after selecting subject
        Click Element   id=button-resitAction-continue

        #Click to continue after confirming details
        Click Element   id=button-resitAction-continue

        #Select First Candidate
        Click Element   id=iconButton-candidateListing-row0

        #Assertion of First Candidate
        Custom Resit Group Register Validation   ${CANDIDATE_ITE_SC_NAME}   %{CANDIDATE_ITE_NRIC_SC}   ${CANDIDATE_ITE_SC_SUBJECTCODE}

        #Assert that Payment is 0.00
        Element Text Should Be   id=text-examFees-row0   0.00

        #Select Second Candidate
        Click Element   id=iconButton-candidateListing-row1

        #Assertion of Second Candidate
        Custom Resit Group Register Validation   ${CANDIDATE_ITE_PR_NAME}   %{CANDIDATE_ITE_NRIC_PR}   ${CANDIDATE_ITE_PR_SUBJECTCODE}

        #Select Third Candidate
        Click Element   id=iconButton-candidateListing-row2

        #Assertion of Third Candidate
        Custom Resit Group Register Validation   ${CANDIDATE_ITE_IS_NAME}   %{CANDIDATE_ITE_NRIC_IS}   ${CANDIDATE_ITE_IS_SUBJECTCODE}

        #Click to continue after confirmation page
        Click Element   id=button-resitAction-continue

        Custom Coordinator Resit Bank Transfer Payment

        #Save Selected Transaction No
        ${RESIT_TRANSACTION_NO}=    Get Text   id=keyValue-transactionNo-0

        #Save Selected Reference No
        ${RESIT_REFERENCE_NO}=    Get Text   id=keyValue-referenceNo-0

        #Click View Full Summary
        Click Element   id=link-viewFullSummary

        #Assert Transaction No
        Element Text Should Be   id=keyValue-transactionNo-0   ${RESIT_TRANSACTION_NO}

        #Assert Reference No
        Element Text Should Be   id=keyValue-referenceNo-0   ${RESIT_REFERENCE_NO}

        #Click Download Summary
        Click Element   id=button-resitSummary-download

        #Click Getting Ready for Exams in Navigation Panel
        Click Element   id=menu-exams

        #Click Registered Exams
        Click Element   id=menu-exams-submenu-registeredExams

        #Select Details of registered Exam
        Click Element   id=button-resultListing-row0

        [Teardown]   Custom Teardown
