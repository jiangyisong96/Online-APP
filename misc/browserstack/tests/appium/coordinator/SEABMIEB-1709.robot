*** Settings ***
Library    AppiumLibrary
Resource    ../../../common/CustomAppiumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login



*** Test Cases ***
Private Centre Coordinator manual registers ITE Private Candidates (SC, PR and IS) with 'O' Level mid-year MTL results for MTL resit and pays with Bank Transfer

    [Setup]    Custom Setup    ${URL}
    Custom Login    %{ITE_COORDINATOR_USERNAME}   %{ITE_COORDINATOR_PASSWORD}

    #Click the Applying for Exams - Resit button in the top tray
    Custom Navigatation to Sub Menu    0    id=apply-for-resit

    #Initiate Resit Registration
    Custom Initiate Resit Registration   id=inputSelect-examLevel-item-k-GCEO

    Custom Coordinator Resit Manual Register Add Candidate    %{CANDIDATE_ITE_NRIC_SC}

    Custom Coordinator Resit Manual Register Add Candidate    %{CANDIDATE_ITE_NRIC_PR}

    Custom Coordinator Resit Manual Register Add Candidate    %{CANDIDATE_ITE_NRIC_IS}

    #Save Candidate SC Name
    ${CANDIDATE_ITE_SC_NAME}=    Get Text    id=text-candidateName-row0

    #Save Candidate PR Name
    ${CANDIDATE_ITE_PR_NAME}=    Get Text    id=text-candidateName-row1

    #Save Candidate IS Name
    ${CANDIDATE_ITE_IS_NAME}=    Get Text    id=text-candidateName-row2

    #Click Show Details
    Click Element   id=iconButton-candidateListing-row0

    #Click to select subject
    Click Element   id=tableSelectCell-subjectSelection-row0

    #Save Selected Subject Code
    ${CANDIDATE_ITE_SC_SUBJECTCODE}=    Get Text    id=text-subjectCode-row0

    #Click Show Details
    Click Element   id=iconButton-candidateListing-row1

    #Click to select subject
    Click Element   id=tableSelectCell-subjectSelection-row0

    #Save Selected Subject Code
    ${CANDIDATE_ITE_PR_SUBJECTCODE}=    Get Text    id=text-subjectCode-row0

    #Click Show Details
    Click Element   id=iconButton-candidateListing-row2

    #Click to select subject
    Click Element   id=tableSelectCell-subjectSelection-row0

    #Save Selected Subject Code
    ${CANDIDATE_ITE_IS_SUBJECTCODE}=    Get Text    id=text-subjectCode-row0

    #Click to continue after selecting subject
    Click Element   id=button-resitAction-continue
    Sleep   5s
    #Click to continue after confirming details
    Click Element   id=button-resitAction-continue

    Sleep   5s
    #Select First Candidate
    #Click Element   id=iconButton-candidateListing-row0

    #Assertion of First Candidate
    #Custom Resit Group Register Validation    ${CANDIDATE_ITE_SC_NAME}    %{CANDIDATE_ITE_NRIC_SC}    ${CANDIDATE_ITE_SC_SUBJECTCODE}

    #Assert that Payment is 0.00
    #Element Text Should Be    id=text-examFees-row0   0.00

    #Select Second Candidate
    #Click Element   id=iconButton-candidateListing-row1

    #Assertion of Second Candidate
    #Custom Resit Group Register Validation    ${CANDIDATE_ITE_PR_NAME}    %{CANDIDATE_ITE_NRIC_PR}    ${CANDIDATE_ITE_PR_SUBJECTCODE}

    #Select Third Candidate
    #Click Element   id=iconButton-candidateListing-row2

    #Assertion of Third Candidate
    #Custom Resit Group Register Validation    ${CANDIDATE_ITE_IS_NAME}    %{CANDIDATE_ITE_NRIC_IS}    ${CANDIDATE_ITE_IS_SUBJECTCODE}

    #Click to continue after confirmation page
    Click Element   id=button-resitAction-continue

    Custom Coordinator Resit Bank Transfer Payment

    #Save Selected Transaction No
    ${RESIT_TRANSACTION_NO}=    Get Text    id=keyValue-transactionNo-0

    #Save Selected Reference No
    ${RESIT_REFERENCE_NO}=    Get Text    id=keyValue-referenceNo-0

    #Click View Full Summary
    Click Element   id=link-viewFullSummary

    Sleep   5s
    #Assert Transaction No
    Element Text Should Be    id=keyValue-transactionNo-0   ${RESIT_TRANSACTION_NO}

    #Assert Reference No
    Element Text Should Be    id=keyValue-referenceNo-0   ${RESIT_REFERENCE_NO}

    #Click Download Summary
    Click Element   id=button-resitSummary-download

    #Click the Applying for Exams - Resit button in the top tray
    Custom Navigatation to Sub Menu    1    id=registered-exams

    Sleep   5s
    #Select Details of registered Exam
    Click Element   id=button-resultListing-row0

    [Teardown]    Custom Teardown
