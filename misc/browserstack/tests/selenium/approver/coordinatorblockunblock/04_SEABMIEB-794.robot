*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${Name}   %{COORDINATOR_NAME}
${valid_user}   Welcome
${unblockReason}   UnBlock for testing

*** Test Cases ***
Approver approved the request from Ops Admin to unblock the blocked Private Centre Coordinator, so that Private Centre Coordinator can login to CP

        [Setup]   Custom Setup   ${URL}

        #Set Session Name
        Custom Session Name   SEABMIEB-794

        #OpsAdmin blocks a coordinator
        Custom OpsAdmin blockUnblock coordinator Flow   id=input-select-centres-item-ACS International   ${unblockReason}     id=input-select-approvers-list-option-3

        #login again as Approver
        Custom Login   %{APPROVER2_USERNAME}   %{APPROVER2_PASSWORD}

        #click on personal menu
        Click Element   id=menu-personal

        #click on 'my tasks'
        Click Element   id=menu-personal-submenu-myTasks

        #Select Unblock from tasktype
        Click Element   id=input-select-tasktype
        Click Element   id=input-select-tasktype-item-UNBLOCK

        #Select the candidate to unblock
        Input Text   name=inputSearch-searchInput   ${Name}

        #Click search button
        Click Element   id=button-searchInput-search

        #validate page details
        Page Should Contain   PENDING UNBLOCK APPROVAL

        #click on the arrowhead
        #ToDo Need to add id for "go detail click"
        Click Element   xpath=//span[@aria-label='go-detail-click']

        #page scroll down
        Execute JavaScript   window.scrollBy(2300, 2300);

        #Approve the Pending unblock request
        Sleep   3s
        Wait Until Element Is Visible   id=button-approve

        #Validate page details
        Page Should Contain   Approve

        #Click approve button
        Click Element   id=button-approve

        #logout as approver
        Custom Logout For Admin

        #login as coordinator
        Custom Login   %{ACS_COORDINATOR_USERNAME}   %{ACS_COORDINATOR_PASSWORD}
        Page Should Contain   ${valid_user}
        Capture Page Screenshot
        Sleep   2s

        [Teardown]   Custom Teardown

