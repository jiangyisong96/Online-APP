*** Settings ***
Library    AppiumLibrary
Resource    ../../../common/CustomAppiumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login


*** Test Cases ***
Private Centre Coordinator success to manual register the Candidates for resit and make payment by Credit Card, so that Candidates can resit the mid year A-level MT exam

    [Setup]    Custom Setup    ${URL}

    Custom Login    %{ACS_COORDINATOR_USERNAME}   %{ACS_COORDINATOR_PASSWORD}

    #Click the Applying for Exams - Resit button in the top tray
    Custom Navigatation to Sub Menu    0    id=apply-for-resit

    Custom Initiate Resit Registration   id=inputSelect-examLevel-item-k-GCEA

    Custom Coordinator Resit Manual Register Add Candidate   %{CANDIDATE_ACS_NRIC_SC}

    Custom Coordinator Resit Manual Register Add Candidate   %{CANDIDATE_ACS_NRIC_PR}

    Custom Coordinator Resit Manual Register Add Candidate   %{CANDIDATE_ACS_NRIC_IS}

    #Save Candidate SC Name
    ${CANDIDATE_ACS_SC_NAME}=    Get Text    id=text-candidateName-row0

    #Save Candidate PR Name
    ${CANDIDATE_ACS_PR_NAME}=    Get Text    id=text-candidateName-row1

    #Save Candidate IS Name
    ${CANDIDATE_ACS_IS_NAME}=    Get Text    id=text-candidateName-row2

    #Click Show Details
    Click Element   id=iconButton-candidateListing-row0

    #Click to select subject
    Click Element   id=tableSelectCell-subjectSelection-row0

    #Save Selected Subject Code
    ${CANDIDATE_ACS_SC_SUBJECTCODE}=    Get Text    id=text-subjectCode-row0

    #Click Show Details
    Click Element   id=iconButton-candidateListing-row1

    #Click to select subject
    Click Element   id=tableSelectCell-subjectSelection-row0

    #Save Selected Subject Code
    ${CANDIDATE_ACS_PR_SUBJECTCODE}=    Get Text    id=text-subjectCode-row0

    #Click Show Details
    Click Element   id=iconButton-candidateListing-row2

    #Click to select subject
    Click Element   id=tableSelectCell-subjectSelection-row0

    #Save Selected Subject Code
    ${CANDIDATE_ACS_IS_SUBJECTCODE}=    Get Text    id=text-subjectCode-row0

    #Click to continue after selecting subject
    Click Element   id=button-resitAction-continue

    #Click to continue after confirming details
    Click Element   id=button-resitAction-continue

    Sleep   5s
    #Select First Candidate
    #Click Element   id=iconButton-candidateListing-row0

    #Assertion of First Candidate
    #Custom Resit Group Register Validation    ${CANDIDATE_ACS_SC_NAME}    %{CANDIDATE_ACS_NRIC_SC}    ${CANDIDATE_ACS_SC_SUBJECTCODE}

    #Select Second Candidate
    #Click Element   id=iconButton-candidateListing-row1

    #Assertion of Second Candidate
    #Custom Resit Group Register Validation    ${CANDIDATE_ACS_PR_NAME}    %{CANDIDATE_ACS_NRIC_PR}    ${CANDIDATE_ACS_PR_SUBJECTCODE}

    #Select Third Candidate
    #Click Element   id=iconButton-candidateListing-row2

    #Assertion of Third Candidate
    #Custom Resit Group Register Validation    ${CANDIDATE_ACS_IS_NAME}    %{CANDIDATE_ACS_NRIC_IS}    ${CANDIDATE_ACS_IS_SUBJECTCODE}

    #Click to continue after confirmation page
    Click Element   id=button-resitAction-continue

    #Click to check declaration checkbox
    Click Element   id=checkbox-declaration

    #Click proceed to payment button
    Click Element   id=button-paymentButton-proceedToPayment

    #Click proceed to Credit Card Payment
    Click Element   id=button-paymentMethod-enetsCreditCard

    Sleep   20s

    Custom Coordinator Credit Card Payment Flow

    #Click Getting Ready for Exams in Navigation Panel
    Click Element   id=menu-exams

    #Click Registered Exams
    Click Element   id=menu-exams-submenu-registeredExams

    #Select Details of registered Exam
    Click Element   id=button-resultListing-row0

    [Teardown]    Custom Teardown