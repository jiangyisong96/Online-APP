*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${groupname}   sampleUserGroup25
${opsadminname}   sampleOpsAdmin26
${nric}   S7075756G
${dob}   2020-02-02
${email}   emailto0526@gmail.com

*** Test Cases ***
System admin assign approver during new ops admin creation for SingPass account

        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1090

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

        #Select create ops admin in filter
        Click Element   id=input-select-actions-item-Create Ops Admin

        #Enter opsadmin name
        Input Text   name=name   ${opsadminname}

        #Select dropdown for id Type
        #ToDo Need to add id for id type dropdown
        Click Element   xpath=//div[text()='SingPass']

        #Select Sungpass in the options
        Click Element   id=undefined-item-I

        #Input nric
        Input Text   name=NricFin   ${nric}

        #Enter date of birth
        Input Text   name=dateOfBirth   ${dob}

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

        #select checkbox for approver
        Click Element   name=approver

        #Click Submit button
        #ToDo Need to add id for submit button
        Click Element   xpath=//button[@type='submit']

        #Validate if page has success msg
        Page Should Contain   The account has been created.

        #logout
        [Teardown]   Custom Teardown