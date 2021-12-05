*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${coordinator_name}   AcsCoordinator14
${coordinator_email}   sample_email14@gmail.com
${coordinator_dob}   02022020
${coordinator_contact}   123456789
${success_message}   Your request has been submitted for approval.
${rejection_reason}   rejection_reason_testing

*** Test Cases ***
Approver rejected the Private Centre Coordinator account creation, as a result Ops Admin failed to create account for Private Centre Coordinator

        [Setup]   Custom Setup   ${URL}

        #Set session name
         Custom Session Name   SEABMIEB-760

        #Login as opsadmin
        Custom Login   %{OPS_ADMIN}   %{OPS_ADMIN_PASSWORD}

        #Click the accounts menu in the top tray
        Click Element   id=menu-accounts

        #Click the userAccountManagement submenu in the list
        Click Element   id=menu-accounts-submenu-userAccountManagement

        Wait Until Element Is Visible   id=input-select-actions

        #Select the dropdown filter for selecting user action
        Click Element   id=input-select-actions

        #Select COORDINATOR_CREATION in filter
        Click Element   id=input-select-actions-item-COORDINATOR_CREATION

        #Select Salutation
        #ToDo Need to add id for "salutation" dropdown and options
        Click Element   xpath=//label/div[contains(., 'Salutation')]/following::input[@type='text'][1]
        Click Element   xpath=//div/ul/li[text()='MISS']

        #Enter name of the Private coordinator
        Input Text   name=coordinatorName   ${coordinator_name}

        #Select School
        #ToDo Need to add id for "school" dropdown and options
        Click Element   xpath=//label/div[contains(., 'Private Centre/School')]/following::input[@type='text'][1]
        Click Element   xpath=//div/ul/li[text()='Pathlight']

        #Select designation
        #ToDo Need to add id for "Designation" dropdown and options
        Click Element   xpath=//label/div[contains(., 'Designation')]/following::input[@type='text'][1]
        Click Element   xpath=//div/ul/li[text()='Head of Department']

        #Select Email
        #ToDo Need to add id for "email" field
        Click Element   xpath=//label/div[contains(., 'Email')]/following::input[@type='text'][1]
        Input Text   xpath=//label/div[contains(., 'Email')]/following::input[@type='text'][1]   ${coordinator_email}

        #Select mobile region
        #ToDo Need to add id for "mobile" region
        Click Element	xpath=//label[contains(., 'Mobile No.')]/following::input[@type='text'][1]
        Click Element   xpath=//div/ul/li[text()='Australia (+61)']
        Input Text   xpath=//input[@name='contactNumber']   ${coordinator_contact}

        #Enter date of birth
        Input Text   id=input-text-dateOfBirth   ${coordinator_dob}

        #Select Approver
        Click Element   id=input-select-approver
        #ToDo Need to add id for "approver" dropdown options
        Click Element   xpath=//div/ul/li[text()='approver2']

        #Click Submit button
        #ToDo Need to add id for submit button
        Click Element   xpath=//button[@type='submit']

        #validate page details
        Page Should Contain   ${success_message}

        #logout as ops admin
        Custom Logout For Admin

        #Login as approver
        Custom Login   %{APPROVER2_USERNAME}   %{APPROVER2_PASSWORD}

        #click on personal menu
        Click Element   id=menu-personal

        #click on 'my tasks'
        Click Element   id=menu-personal-submenu-myTasks
        Wait Until Element Is Visible   id=input-select-tasktype

        #click on the task type dropdown
        Click Element   id=input-select-tasktype

        #Select 'create' from the dropdown
        Click Element   id=input-select-tasktype-item-CREATE

        #scroll page down
        Execute JavaScript   window.scrollTo(0,400)

        #search for coordinator
        Input Text   name=inputSearch-searchInput   ${coordinator_name}

        #click search button
        Click Element   id=button-searchInput-search

        #click on the arrowhead
        #ToDo Need to add id for "go detail click"
        Click Element   xpath=//span[@aria-label='go-detail-click']

        #validate page details
        Page Should Contain   ${coordinator_name}

        #click "reject" button
        Click Element   id=button-reject

        #Enter rejection reason
        Input Text   name=reason   ${rejection_reason}

        #click submit
        #ToDo Need to add id for "submit" button
        Click Element   xpath=//button/span/span[text()='Submit']

        #logout as ops admin
        Custom Logout For Admin

        #Login as opsadmin
        Custom Login   %{OPS_ADMIN}   %{OPS_ADMIN_PASSWORD}

        #click on personal menu
        Click Element   id=menu-personal

        #click on 'my requests'
        Click Element   id=menu-personal-submenu-myRequests
        #ToDo Need to add id for "Request type" dropdown
        Wait Until Element Is Visible   xpath=//div/h5[text()='Request Type']

        #click on the dropdown
        #ToDo Need to add id for "Request type" dropdown
        Click Element   xpath=//div[@data-testid='customSelect']

        #Select 'create' from the dropdown
        #ToDo Need to add id for dropdown options
        Click Element   xpath=//div/ul/li[text()='CREATE']

        #select archived button
        Click Element   id=tab-undefined-Archived

        #search for coordinator
        Input Text   name=inputSearch-searchInput   ${coordinator_name}

        #click search button
        Click Element   id=button-searchInput-search

        #click on the arrowhead
        #ToDo Need to add id for "go detail click"
        Click Element   xpath=//span[@aria-label='go-detail-click']

        #validate page details
        Page Should Contain   REJECTED

        [Teardown]   Custom Teardown