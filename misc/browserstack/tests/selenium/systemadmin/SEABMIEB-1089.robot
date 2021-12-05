*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${groupname}   sampleUserGroup25
${opsadminname}   sampleOpsAdmin25
${email}   emailto0525@gmail.com

*** Test Cases ***
System admin create user group with access granted for all functionality successfully so that it can be assigned during Ops admin creation for CP ID account

        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1089

        #Login as system admin
        Custom Login   %{SYSTEM_ADMIN}   %{SYSTEM_ADMIN_PASSWORD}

        #Click the accounts menu in the top tray
        Click Element   id=menu-accounts

        #Click the userAccountManagement submenu in the list
        Click Element   id=menu-accounts-submenu-adminAccountManagement

        #wait until dropdown is visible
        Wait Until Element Is Visible   id=input-select-actions

        #Select the dropdown filter for selecting user action
        Click Element   id=input-select-actions

        #Select create user group in filter
        Click Element   id=input-select-actions-item-Create User Group

        #Enter name of the group name
        Input Text   id=user-group-id   ${groupname}

        #Click Submit button
        #ToDo Need to add id for submit button
        Click Element   xpath=//button[@type='submit']

        #Select manage user group in filter
        #Click Element   xpath=//div/ul/li[@data-value='Manage User Group']
        #Enter name of the group name
        #Input Text      name=inputSearch-searchInput      ${name}
        #Click search button
        #Click Element   id=button-searchInput-search
        #Wait Until Element Is Visible   xpath=//div[text()='sampleGroup2']
        #Click search button
        #Click Element   xpath=//div[text()='sampleGroup2']/following::span[text()='Edit Details']

        #Select the dropdown filter for selecting user action
        Click Element   id=input-select-actions

        #Select create ops admin in filter
        Click Element   id=input-select-actions-item-Create Ops Admin

        #Enter opsadmin name
        Input Text   name=name   ${opsadminname}

        #Select dropdown for id Type
        #ToDo Need to add id for id type dropdown
        Click Element   xpath=//div[text()='SingPass']

        #Select CP ID in the options
        Click Element   id=undefined-item-C

        #Enter date of birth
        Input Text   name=dateOfBirth   2020-02-02

        #Enter email
        Input Text   name=email   ${email}

        #Select mobile region
        #ToDo Need to add id for mobile region
        Click Element   xpath=//label[contains(., 'Mobile Number')]/following::input[@type='text'][1]

        #Select country code
        #ToDo Need to add id for "country code" dropdown
        Click Element   xpath=//div/ul/li[text()='Australia (+61)']

        #Enter mobile number
        Input Text   id=inputText-undefined-contactNumber   123456789

        #Click on usergroup dropdown
        #ToDo Need to add id for usergroup field
        Click Element   xpath=//input[@placeholder='Select User Group']

        #Select one usergroup
        #ToDo Need to add id for usergroup dropdown options
        Click Element   xpath=//ul/li[text()='${groupname}']

        #Click on the title to close the groupnames dropdown mainly in safari
        Click Element   xpath=//h3[text()='Account Details']

        #Click Submit button
        #ToDo Need to add id for submit button
        Click Element   xpath=//button[@type='submit']

        #Validate if page has success msg
        Page Should Contain   The account has been created.

        #logout
        [Teardown]   Custom Teardown


