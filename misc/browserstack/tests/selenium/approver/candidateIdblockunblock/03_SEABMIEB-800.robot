*** Settings ***
Library     SeleniumLibrary                      implicit_wait=5s
Resource    ../../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${unblockReason}   testing
${APPROVER2_USERNAME}   %{APPROVER2_USERNAME}
${APPROVER2_PASSWORD}   %{APPROVER2_PASSWORD}
${unblockNric}   S0000002A
${valid_user}   Welcome
${rejectReason}   testing
${invalid_user}   Your account is currently blocked.

*** Test Cases ***
SEABMIEB-800 Approver rejected the request from Ops Admin to unblock the Candidate with CP account, as a result the Candidate still not allowed to login to CP with Login ID and Password

        #Setup
        [Setup]   Custom Setup   ${URL}

        #Set Session name
        Custom Session Name   SEABMIEB-800

        #Opsadmin to create unblock request
        Custom OpsAdmin blockUnblock candidates Flow   ${unblockNric}   ${unblockReason}   id=input-select-approvers-list-option-3

        #Approver rejects the unblock request
        Custom Approver unblockReject Flow   ${APPROVER2_USERNAME}   ${APPROVER2_PASSWORD}   ${unblockNric}     ${rejectReason}

        #login as candidate
        Custom Login without OTP     %{CANDIDATE_ACS2_USERNAME}     %{CANDIDATE_ACS2_USERNAME}

        #Validate page details
        Page Should Contain   ${invalid_user}
        Capture Page Screenshot

        Sleep   2s

        [Teardown]   Custom Teardown
