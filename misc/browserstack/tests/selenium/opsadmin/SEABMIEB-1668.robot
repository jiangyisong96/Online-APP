*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${name}   Coordinatortestsample
${email}   cpepusersample9@gmail.com
${msg}   Enter the 6-digit One-Time Password (OTP) sent to your email
${success_msg}   Your request has been submitted for approval.

*** Test Cases ***
Ops admin create private centre coordinator so that coordinator is able to login to view/edit personal details and set default 2FA as email

        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1668

        #Login as ops admin
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
        #ToDo Need to add id for salutation dropdown
        Click Element   xpath=//label/div[contains(., 'Salutation')]/following::input[@type='text'][1]

        #Select value from dropdown options
        #ToDo Need to add id for dropdown options
        Click Element   xpath=//div/ul/li[text()='MISS']

        #Enter name of the Private coordinator
        Input Text   name=coordinatorName		${name}

        #Select School
        #ToDo Need to add id for "School" dropdown
        Click Element   xpath=//label/div[contains(., 'Private Centre/School')]/following::input[@type='text'][1]

        #Select "pathlight" school
        #ToDo Need to add id for "School" dropdown options
        Click Element   xpath=//div/ul/li[text()='Pathlight']

        #Select designation
        #ToDo Need to add id for designation dropdown
        Click Element   xpath=//label/div[contains(., 'Designation')]/following::input[@type='text'][1]

        #Select "head of the department" option
        #ToDo Need to add id for designation dropdown options
        Click Element   xpath=//div/ul/li[text()='Head of Department']

        #Select Email
        #ToDo Need to add id for email field
        Click Element   xpath=//label/div[contains(., 'Email')]/following::input[@type='text'][1]

        #Enter email address
        #ToDo Need to add id for email field
        Input Text   xpath=//label/div[contains(., 'Email')]/following::input[@type='text'][1]   ${email}

        #Select mobile region
        #ToDo Need to add id for mobile no field
        Click Element   xpath=//label[contains(., 'Mobile No.')]/following::input[@type='text'][1]

        #Select "Australia" from the dropdown
        #ToDo Need to add id for country code dropdown
        Click Element   xpath=//div/ul/li[text()='Australia (+61)']

        #Enter contact number
        Input Text   name=contactNumber   123456789

        #Enter date of birth
        Input Text   id=input-text-dateOfBirth   02022020

        #Select Approver dropdown
        Click Element   id=input-select-approver

        #Select "approver1" from dropdown
        #ToDo Need to add id for approver options
        Click Element   xpath=//div/ul/li[text()='approver1']

        #Click Submit button
        #ToDo Need to add id for submit button
        Click Element   xpath=//button[@type='submit']

        #Validate if page has success msg
        Page Should Contain   ${success_msg}

        #logout
        Custom Logout For Admin

        #login as approver
        Custom Login   %{APPROVER1_USERNAME}   %{APPROVER1_PASSWORD}

        #Click on menu "personal"
        Click Element   id=menu-personal

        #Click on submenu "tasks"
        Click Element   id=menu-personal-submenu-myTasks

        #click on the dropdown
        Click Element   id=input-select-tasktype

        #Select 'create' from the dropdown
        Click Element   id=input-select-tasktype-item-CREATE

        #Page scroll down
        Execute JavaScript   window.scrollTo(0,400)

        #search the candidate and click search button
        Input Text   name=inputSearch-searchInput   ${name}

        #click search button
        Click Element   id=button-searchInput-search

        #click on the arrowhead to get details
        #ToDo Need to add id for 'go detail check'
        Click Element   xpath=//span[@aria-label='go-detail-click']

        Wait Until Element Is Visible   id=button-approve

        #page scroll down
        Execute JavaScript   window.scrollBy(900, 900);

        #click "approve" button
        Click Element   id=button-approve

        #logout as approver
        [Teardown]    Custom Teardown

