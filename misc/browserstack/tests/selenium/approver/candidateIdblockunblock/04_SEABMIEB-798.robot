*** Settings ***
Library     SeleniumLibrary                      implicit_wait=5s
Resource    ../../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${unblockReason}   testing
${APPROVER2_USERNAME}   %{APPROVER2_USERNAME}
${APPROVER2_PASSWORD}   %{APPROVER2_PASSWORD}
${unblockNric}   %{CANDIDATE_ID_NRIC}
${valid_user}   Welcome

*** Test Cases ***
Approver approved the request from Ops Admin to unblock the Candidate with CP account, so that Candidate can login to CP with Login ID and Password

    #Setup
    [Setup]   Custom Setup   ${URL}

    #Set Session name
    Custom Session Name   SEABMIEB-798

    #Opsadmin to create unblock request
    Custom OpsAdmin blockUnblock candidates Flow   ${unblockNric}   ${unblockReason}   id=input-select-approvers-list-option-3

    #Approver approves the Unblock request
    Custom Approver unblockApprove Flow   ${APPROVER2_USERNAME}   ${APPROVER2_PASSWORD}   ${unblockNric}

    #login as candidate
    Custom Login   %{CANDIDATE_ACS2_USERNAME}   %{CANDIDATE_ACS2_PASSWORD}

    #Validate page details
    Page Should Contain   ${valid_user}
    Capture Page Screenshot
    Sleep    2s

    [Teardown]   Custom Teardown
