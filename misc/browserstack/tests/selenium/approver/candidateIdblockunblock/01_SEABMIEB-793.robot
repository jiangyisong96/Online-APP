*** Settings ***
Library     SeleniumLibrary                                 implicit_wait=5s
Resource    ../../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${INVALID_USER}   Your account is currently blocked.
${blockNric}   %{CANDIDATE_ID_NRIC}
${blockReason}   blocking for testing purpose
${rejectReason}   testing
${valid_user}   Welcome
${APPROVER2_USERNAME}   %{APPROVER2_USERNAME}
${APPROVER2_PASSWORD}   %{APPROVER2_PASSWORD}

*** Test Cases ***
SEABMIEB-793 Approver rejected the request from Ops Admin to block the Candidate with CP account, as a result the Candidate still allowed to login to CP with Login ID and Password

         #Setup
         [Setup]   Custom Setup   ${URL}

         #Set Session name
         Custom Session Name   SEABMIEB-793

         #OpsAdmin blocks a candidate
         Custom OpsAdmin blockUnblock candidates Flow   ${blockNric}   ${blockReason}   id=input-select-approvers-list-option-3

         Sleep      5s

         #Approver rejects the block candidate request
         Custom Approver blockReject Flow   ${APPROVER2_USERNAME}   ${APPROVER2_PASSWORD}   ${blockNric}   ${rejectReason}

         #login as Candidate
         Custom Login   %{CANDIDATE_ACS2_USERNAME}   %{CANDIDATE_ACS2_PASSWORD}

         #validate page details
         Page Should Contain   ${valid_user}

         #logout
         Custom Logout For Admin
         [Teardown]   Custom Teardown



