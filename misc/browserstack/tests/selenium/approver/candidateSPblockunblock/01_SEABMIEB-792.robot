*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login
${blockNric}   %{CANDIDATE_SP_NRIC}
${blockReason}    reason for testing
${rejectReason}   testing
${valid_user}    Welcome
${invalid_user}   You do not have access to the portal. Please contact SEAB for more details.
${APPROVER2_USERNAME}   %{APPROVER2_USERNAME}
${APPROVER2_PASSWORD}   %{APPROVER2_PASSWORD}

*** Test Cases ***
SEABMIEB-792 Approver rejected the request from Ops Admin to block the Candidate with SingPass, as a result the Candidate still allowed to login to CP via SingPass

      #Setup
      [Setup]   Custom Setup   ${URL}

      #Set Session name
      Custom Session Name   SEABMIEB-792

      #OpsAdmin blocks a candidate
      Custom OpsAdmin blockUnblock candidates Flow   ${blockNric}   ${blockReason}   id=input-select-approvers-list-option-3

      Sleep   5s

      #Approver rejects the block candidate request
      Custom Approver blockReject Flow   ${APPROVER2_USERNAME}   ${APPROVER2_PASSWORD}   ${blockNric}   ${rejectReason}

      #login as Candidate
      Custom SingPass Login   %{SINGPASS_USER_2}   %{SINGPASS_PASSWORD2}

      Sleep   10s

      #validate page details
      Page Should Contain   ${valid_user}

      #Logout
      Custom Logout For Admin

      [Teardown]   Custom Teardown
