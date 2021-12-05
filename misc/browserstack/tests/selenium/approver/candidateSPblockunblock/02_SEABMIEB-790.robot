*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${invalid_user}   You do not have access to the portal. Please contact SEAB for more details.
${blockNric}   %{CANDIDATE_SP_NRIC}
${blockReason}   blocking for testing purpose
${APPROVER2_USERNAME}   %{APPROVER2_USERNAME}
${APPROVER2_PASSWORD}   %{APPROVER2_PASSWORD}

*** Test Cases ***
Approver approved the request from Ops Admin to block the Candidate with SingPass

        #Setup
        [Setup]   Custom Setup   ${URL}

        #Set Session name
        Custom Session Name   SEABMIEB-790

        #OpsAdmin blocks a candidate
        Custom OpsAdmin blockUnblock candidates Flow   ${blockNric}   ${blockReason}   id=input-select-approvers-list-option-3

        #Approver approves the block request
        Custom Approver blockApprove Flow   ${APPROVER2_USERNAME}   ${APPROVER2_PASSWORD}   ${blockNric}

        #Login as Candidate
        Custom SingPass Login   %{SINGPASS_USER_2}   %{SINGPASS_PASSWORD2}

        #validate page details
        Page Should Contain   ${invalid_user}
        Capture Page Screenshot

        Sleep   2s

        [Teardown]   Custom Teardown
