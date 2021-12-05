*** Settings ***
Library     SeleniumLibrary                      implicit_wait=5s
Resource    ../../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${invalid_user}   You do not have access to the portal. Please contact SEAB for more details.
${valid_user}   Welcome
${unblockNric}   %{CANDIDATE_SP_NRIC}
${unblockReason}   Unblocking for testing purpose
${APPROVER2_USERNAME}   %{APPROVER2_USERNAME}
${APPROVER2_PASSWORD}   %{APPROVER2_PASSWORD}
${rejectReason}   testing

*** Test Cases ***
SEABMIEB-799 Approver rejected the request from Ops Admin to unblock the Candidate with SingPass, so that the Candidate can login to CP via SingPass

        #Setup
        [Setup]   Custom Setup    ${URL}

        #Set Session name
        Custom Session Name   SEABMIEB-799

        #Opsadmin to create unblock request
        Custom OpsAdmin blockUnblock candidates Flow   ${unblockNric}   ${unblockReason}   id=input-select-approvers-list-option-3

        Sleep   5s

        #Approver rejects the unblock request
        Custom Approver unblockReject Flow   ${APPROVER2_USERNAME}   ${APPROVER2_PASSWORD}   ${unblockNric}   ${rejectReason}

        #login as candidate
        Custom SingPass Login   %{SINGPASS_USER_2}   %{SINGPASS_PASSWORD2}

        #validate page details
        Page Should Contain   ${invalid_user}
        Capture Page Screenshot

        Sleep   2s
        [Teardown]   Custom Teardown

