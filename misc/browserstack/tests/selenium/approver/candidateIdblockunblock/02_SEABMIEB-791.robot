*** Settings ***
Library     SeleniumLibrary                                 implicit_wait=5s
Resource    ../../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${INVALID_USER}   Your account is currently blocked.
${blockNric}   %{CANDIDATE_ID_NRIC}
${blockReason}   blocking for testing purpose
${APPROVER2_USERNAME}   %{APPROVER2_USERNAME}
${APPROVER2_PASSWORD}   %{APPROVER2_PASSWORD}

*** Test Cases ***
Approver approved the request from Ops Admin to block the Candidate with Login ID

        #Setup
        [Setup]   Custom Setup   ${URL}

        #Set Session name
        Custom Session Name   SEABMIEB-791

        #OpsAdmin blocks a candidate
        Custom OpsAdmin blockUnblock candidates Flow   ${blockNric}   ${blockReason}   id=input-select-approvers-list-option-3

        #Approver approves the block request
        Custom Approver blockApprove Flow   ${APPROVER2_USERNAME}   ${APPROVER2_PASSWORD}   ${blockNric}

        #Login as Candidate
        Custom Login without OTP     %{CANDIDATE_ACS2_USERNAME}     %{CANDIDATE_ACS2_USERNAME}

        #validate page details
        Page Should Contain   ${INVALID_USER}
        Capture Page Screenshot
        Sleep   2s

        #Teardown
        [Teardown]   Custom Teardown
