*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${invalid_user}   Your account is currently blocked.
${Name}   %{COORDINATOR_NAME}
${valid_user}   Welcome
${unblockReason}   UnBlock for testing

*** Test Cases ***
Approver rejected the request from Ops Admin to unblock the blocked Private Centre Coordinator, as a result Private Centre Coordinator still not allowed to login to CP

        [Setup]   Custom Setup   ${URL}

        #Set Session Name
        Custom Session Name   SEABMIEB-795

        #OpsAdmin blocks a coordinator
        Custom OpsAdmin blockUnblock coordinator Flow   id=input-select-centres-item-ACS International   ${unblockReason}     id=input-select-approvers-list-option-3

        #login again as Approver
        Custom Login   %{APPROVER2_USERNAME}   %{APPROVER2_PASSWORD}

        #click on personal menu
        Click Element   id=menu-personal

        #click on 'my tasks'
        Click Element   id=menu-personal-submenu-myTasks

        #Select Unblock from tasktype
        Click Element    id=input-select-tasktype
        Click Element    id=input-select-tasktype-item-UNBLOCK

        #Select the candidate to unblock
        Input Text   name=inputSearch-searchInput   ${Name}

        #Click search button
        Click Element   id=button-searchInput-search

        #validate page details
        Page Should Contain   PENDING UNBLOCK APPROVAL

        #click on the arrowhead
        #ToDo Need to add id for "go detail click"
        Click Element   xpath=//span[@aria-label='go-detail-click']
        Sleep   3s

        #Scroll down
        Execute JavaScript   window.scrollBy(900, 900);

        #click "reject" button
        Click Element   id=button-reject

        #enter rejection reason
        Input Text   name=reason   testing

        #ToDo Need to add id for "submit" button
        Click Element   xpath=//button/span/span[text()='Submit']

        #logout as approver
        Custom Logout For Admin

        #login as coordinator
        Custom Login without OTP     %{ACS_COORDINATOR_USERNAME}     %{ACS_COORDINATOR_USERNAME}

        #Invalid login error message to be displayed
        Page Should Contain   ${invalid_user}
        Capture Page Screenshot
        Sleep   2s

        [Teardown]   Custom Teardown

