*** Settings ***
Library    AppiumLibrary
Resource    ../../../common/CustomAppiumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login

*** Test Cases ***
Private Centre Coordinator success to manual register the Candidates for resit and make payment by Bank Transfer, so that Candidates can resit the mid year A-level MT exam

    [Setup]    Custom Setup    ${URL}

    #Login as Coordinator
    Custom Login    %{SJI_COORDINATOR_USERNAME}   %{SJI_COORDINATOR_PASSWORD}

    #Click the Applying for Exams - Resit button in the top tray
    Custom Navigatation to Sub Menu    0    id=apply-for-resit

    #Initiate Resit Registration
    Custom Initiate Resit Registration   id=inputSelect-examLevel-item-k-GCEA

    Custom Coordinator Resit Manual Register Add Candidate   %{CANDIDATE_SJI_NRIC_SC}

    Custom Coordinator Resit Manual Register Add Candidate   %{CANDIDATE_SJI_NRIC_SC2}

    #Save Candidate SC Name
    ${CANDIDATE_SJI_SC_NAME}=    Get Text    id=text-candidateName-row0

    #Save Candidate PR Name
    ${CANDIDATE_SJI_SC2_NAME}=    Get Text    id=text-candidateName-row1

    #Click Show Details
    Click Element   id=iconButton-candidateListing-row0

    #Click to select subject
    Click Element   id=tableSelectCell-subjectSelection-row1

    #Save Selected Subject Code
    ${CANDIDATE_SJI_SC_SUBJECTCODE}=    Get Text    id=text-subjectCode-row1

    #Click Show Details
    Click Element   id=iconButton-candidateListing-row1

    #Click to select subject
    Click Element   id=tableSelectCell-subjectSelection-row1

    #Save Selected Subject Code
    ${CANDIDATE_SJI_SC2_SUBJECTCODE}=    Get Text    id=text-subjectCode-row1

    #Click to continue after selecting subject
    Click Element   id=button-resitAction-continue

    #Click to continue after confirming details
    Click Element   id=button-resitAction-continue

    #Select First Candidate
    Click Element   id=iconButton-candidateListing-row0

    #Assertion of First Candidate
    Custom Resit Group Register Validation    ${CANDIDATE_SJI_SC_NAME}    %{CANDIDATE_SJI_NRIC_SC}    ${CANDIDATE_SJI_SC_SUBJECTCODE}

    #Select Second Candidate
    Click Element   id=iconButton-candidateListing-row1

    #Assertion of Second Candidate
    Custom Resit Group Register Validation    ${CANDIDATE_SJI_SC2_NAME}    %{CANDIDATE_SJI_NRIC_SC2}    ${CANDIDATE_SJI_SC2_SUBJECTCODE}

    #Click to continue after confirmation page
    Click Element   id=button-resitAction-continue

    Custom Coordinator Resit Bank Transfer Payment

    #Save Selected Transaction No
    ${RESIT_TRANSACTION_NO}=    Get Text    id=keyValue-transactionNo-0

    #Save Selected Reference No
    ${RESIT_REFERENCE_NO}=    Get Text    id=keyValue-referenceNo-0

    #Click View Full Summary
    Click Element   id=link-viewFullSummary

    #Assert Transaction No
    Element Text Should Be    id=keyValue-transactionNo-0   ${RESIT_TRANSACTION_NO}

    #Assert Reference No
    Element Text Should Be    id=keyValue-referenceNo-0   ${RESIT_REFERENCE_NO}

    #Click Download Summary
    Click Element   id=button-resitSummary-download

    #Click Getting Ready for Exams in Navigation Panel
    Click Element   id=menu-exams

    #Click Registered Exams
    Click Element   id=menu-exams-submenu-registeredExams

    #Select Details of registered Exam
    Click Element   id=button-resultListing-row0

    [Teardown]    Custom Teardown