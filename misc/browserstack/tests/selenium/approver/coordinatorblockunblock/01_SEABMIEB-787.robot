*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${Name}   %{COORDINATOR_NAME}
${rejectReason}   Testing
${valid_user}   Welcome
${blockReason}   Block for testing

*** Test Cases ***
Approver rejected the request from Ops Admin to block the Private Centre Coordinator, as a result Private Centre Coordinator still allowed to login to CP

        [Setup]   Custom Setup   ${URL}

        #Set Session name
        Custom Session Name   SEABMIEB-787

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

        Wait Until Element Is Visible   xpath=//button[@type='submit']
        Execute JavaScript   window.scrollBy(900, 900);

        #click "reject" button
        Click Element   id=button-reject

        #Enter rejection reason
        Input Text   name=reason   ${rejectReason}

        #Click submit button
        #ToDo Need to add id for "submit" button
        Click Element   xpath=//button/span/span[text()='Submit']

        #logout
        Custom Logout For Admin

        #login as coordinator
        Custom Login   %{ACS_COORDINATOR_USERNAME}   %{ACS_COORDINATOR_PASSWORD}

        #validate page details
        Page Should Contain   ${valid_user}

        [Teardown]   Custom Teardown


