*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login
${invalid_user}   Your account is currently blocked.
${Name}   %{COORDINATOR_NAME}
${rejectReason}   Testing
${blockReason}   Block for testing

*** Test Cases ***
Approver approved the request from Ops Admin to block the Private Centre Coordinator, as a result Private Centre Coordinator is not allowed to login to CP

        [Setup]   Custom Setup    ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-786

        #OpsAdmin blocks a coordinator
        Custom OpsAdmin blockUnblock coordinator Flow   id=input-select-centres-item-ACS International   ${blockReason}     id=input-select-approvers-list-option-3

        #login again as Approver
        Custom Login   %{APPROVER2_USERNAME}   %{APPROVER2_PASSWORD}

        #click on personal menu
        Click Element   id=menu-personal

        #click on 'my tasks'
        Click Element   id=menu-personal-submenu-myTasks

        #search for the coordinator
        Input Text   name=inputSearch-searchInput   ${Name}

        #Click search button
        Click Element   id=button-searchInput-search

        #validate page details
        Page Should Contain   PENDING BLOCK APPROVAL

        #click on the arrowhead
        #ToDo Need to add id for "go detail click"
        Click Element   xpath=//span[@aria-label='go-detail-click']
        Execute JavaScript   window.scrollBy(900, 900);

        #click "approve" button
        Click Element   id=button-approve

        #logout
        Custom Logout For Admin

        #login as coordinator
        Custom Login without OTP     %{ACS_COORDINATOR_USERNAME}     %{ACS_COORDINATOR_USERNAME}
        Sleep     2s

        #Validate the user
        Sleep     2s
        Page Should Contain   ${invalid_user}

        [Teardown]    Custom Teardown



