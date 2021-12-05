*** Settings ***
Library    AppiumLibrary

*** Variables ***
${BROWSER_STACK_URL}    http://hub-cloud.browserstack.com/wd/hub
${IS_REMOTE_BROWSER_STACK}    bool(&{DC})
${CAT_URL}    https://seab_cat:S8n9Rpe7DgefL7FGxFrTJRXz@cat.myexams.seab.gov.sg
${CAT_BYPASS_URL}   https://cat.myexams.seab.gov.sg/cgi-bin/specialauth.pl?key=fFNOfqB8Fc5evPAThc77yVhsHFdT8XWdrzPwPgskgonB1Nl8Qg5c1cuxFvgDh2Gy
#Change to your own appium url (note:=not able to commit the url link with pass, will just put as dummy for now)
${BROWSER_STACK_APPIUM_URL}    https://{TO_BE_REPLACED}}}@hub-cloud.browserstack.com/wd/hub
${LOCAL_APPIUM_URL}    http://localhost:4723/wd/hub

*** Keywords ***
# Will run on Browserstack or local depending on presence of DC variable
# For Appium local, open local emulator and chrome browser
Custom Setup
    [Arguments]          ${SETUP_URL}
#check if running on browser stack or local
    Run Keyword If  ${IS_REMOTE_BROWSER_STACK}  Custom BrowserStack Launch Application   ${BROWSER_STACK_APPIUM_URL}
    ...    ELSE    Custom Launch Application   ${LOCAL_APPIUM_URL}
    Sleep   2s
    Go To URL	${CAT_URL}
    Sleep   10s

#check desire browser run diff command
Custom BrowserStack Launch Application
    [Arguments]   ${APPIUM_URL}
    #TODO Params below may taken from DC
    Run Keyword If    "%{TYPE}" == "ios_safari"    Open Application    ${APPIUM_URL}    platformName=IOS    deviceName=iPhone12    browserName=Safari
  ...   ELSE    Open Application    ${APPIUM_URL}    platformName=Android    deviceName=Samsung Galaxy S21 Ultra    browserName=chrome  automationName=Uiautomator2

#for local (might differ)
Custom Launch Application
    [Arguments]   ${APPIUM_URL}
    Open Application    ${APPIUM_URL}    platformName=Android    platformVersion=10  deviceName=emulator-5554    browserName=chrome    automationName=Uiautomator2
    Sleep   10s

Custom SingPass Login
    [Arguments]   ${INPUT_USERNAME}  ${INPUT_PASSWORD}
    #Click on Login with Singpass button
    Click Element     id=singpass-login-button
    Sleep   10s

    #Toggle Singpass Tab to password sign in
    Click Element     id=SpQrToggle-1FATab

    #Input Singpass Id
    Input Text        id=SpLoginIdPw-singpass-id    ${INPUT_USERNAME}

    #Input Singpass Password
    Input Text        id=SpLoginIdPw-password       ${INPUT_PASSWORD}

    #Toggle Click on Singpass SignIn
    Click Element     id=SpLoginIdPw-login-button

Custom Post Success
    Run Keyword If    ${IS_REMOTE_BROWSER_STACK}    Execute Script    browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed","reason": "Test case is successful"}}

Custom Post Fail
    Run Keyword If    ${IS_REMOTE_BROWSER_STACK}    Execute Script    browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed","reason": "An error has been encountered"}}

Custom Teardown
    Run Keyword If Test Failed    Custom Post Fail
    # ...    ELSE    Custom Post Success
    Close All Applications

Custom Login
    [Arguments]   ${INPUT_USERNAME}  ${INPUT_PASSWORD}

    ${USERNAME}   Set Variable    name=username
    ${PASSWORD}   Set Variable    name=password
    Input Text    ${USERNAME}     ${INPUT_USERNAME}
    Input Text    ${PASSWORD}     ${INPUT_PASSWORD}
    Click Element    id=login-button
    
    Sleep   5s
    Input Text       name=otp    123456
    Click Element    id=otp-submit-button
    Sleep   5s

Custom Logout For Admin
    Click Element          id=menu-user
    Click Element   id=menu-user-submenu-logout
    Sleep   5s

Clear Date Picker Field
    [Arguments]   ${INPUT_FIELD}
    Click Element   ${INPUT_FIELD}
    Press Keycode    67
    Press Keycode    67
    Press Keycode    67
    Press Keycode    67
    Press Keycode    67
    Press Keycode    67
    Press Keycode    67
    Press Keycode    67
    Press Keycode    67
    Press Keycode    67

Custom Credit Card Payment Flow
    #Click Proceed with Make Credit Card Payment Method
    Click Element   id=button-enetsModal-makePayment

    Sleep   5s
    #Enter Name
    Input Text    id=name   test

    #Enter CardNo
    Input Text    id=cardNo   4111111111111111

    #Enter CVV/CVV2
    Input Text    id=cvv    123

    #Select Expiry Date Month
    Select From List By Value   id=selExpiryMonth   12

    #Select Expiry Year
    Select From List By Value   id=selectYearId   2036

    #Click Submit Button
    Click Element   id=btnSubmit

    Sleep   10s

    #Click View Full Summary
    Click Element   id=link-viewFullSummary

    #Click Download Summary
    Click Element   id=link-download

    #Click Getting Ready for Exams in Navigation Panel
    Click Element   id=menu-exams

    #Click Registered Exams
    Click Element   id=menu-exams-submenu-registeredExams

    #Select Details of registered Exam
    Click Element   id=button-resitListing-row0

Custom Candidate Resit Flow
    [Arguments]    ${SELECT_SUBJECT}
    Custom Navigatation to Sub Menu    0    id=apply-for-resit
    Sleep   5s
    #Click on the button to start resit flow 
    Wait Until Page Contains Element    id=button-resitInstruction-start
    Click Element       id=button-resitInstruction-start
    Sleep   5s
    #Select subject
    Click Element       ${SELECT_SUBJECT}
    Sleep   5s
    #continue to next screen 
    Click Element       id=button-selectSubject-continueToNextPage
    Sleep   5s
    #confirm particulars 
    Click Element       id=button-confirmParticulars-confirmParticulars
    Sleep   5s
    #click on the declaration 
    #this scenario coincidencely will have the react dev tool blocked when running in local. to disabled it comment line 32 at index.tsx for web-candidate
    Click Element       id=checkbox-declaration
    Sleep   5s
    
Custom Resit Group Register Validation
    [Arguments]   ${CANDIDATE_NAME}   ${CANDIDATE_NRIC}   ${CANDIDATE_SUBJECTCODE}

    #Assert Name
    Element Text Should Be    id=keyValue-candidateName-0   ${CANDIDATE_NAME}
    #Assert NRIC
    Element Text Should Be    id=keyValue-nricFinPassport-0   ${CANDIDATE_NRIC}
    #Assert Subject Code
    Element Text Should Be    id=text-subjectCode-row0    ${CANDIDATE_SUBJECTCODE}

Custom Coordinator Resit Manual Register Add Candidate
    [Arguments]   ${NRIC}
    #Click Add Candidate Button
    Sleep   5s
    Click Element   id=button-candidateListing-addCandidate
    #Input First Candidate NRIC
    Sleep   5s
    Input Text    name=inputSearch-addCandidate   ${NRIC}
    #Click Search
    Sleep   5s
    Click Element   id=button-addCandidate-search
    #Click Add Candidate
    Sleep   5s
    Click Element   id=button-addCandidate-addCandidate
    Sleep   5s

Custom Navigatation to Sub Menu
    [Arguments]   ${MENU_INDEX}    ${SUBMENU_ID}

    ${DRAWER}   Get Webelement  class=MuiButtonBase-root
    ClickElement    ${DRAWER}

    #Get all Label in Drawer and ids are the same in mobile view
    ${MENULABELS}   Get Webelements  id=menu-label
    Sleep   2s

    #Click Settings to expand menu
    Click Element   ${MENULABELS}[${MENU_INDEX}]

    #Click the Resit button in the list
    #Change to ID when it has been added to button
    Click Element   ${SUBMENU_ID}

Custom Initiate Resit Registration
    [Arguments]   ${EXAM_LEVEL_DROPDOWN_ID}
    #Select the dropdown filter for selecting exam level
    Click Element   id=inputSelect-examLevel

    Sleep   5s
    #Select GCEA in filter
    Click Element   ${EXAM_LEVEL_DROPDOWN_ID}

    Sleep   5s

    #Select Mode of Registration
    Click Element    id=radio-manual

    #Click Start Registration Process
    Click Element   id=button-resitRegister-startRegistration

    Wait Until Element Is Visible   id=button-instructionConsent-start
    #Click Start
    Click Element   id=button-instructionConsent-start

Custom Coordinator Resit Bank Transfer Payment

    Sleep   5s
    #Click to check declaration checkbox
    Click Element   id=checkbox-declaration
    #Click proceed to payment button
    Click Element   id=button-paymentButton-proceedToPayment
    #Click proceed to Offline Payment
    Click Element   id=button-paymentMethod-bankTransfer
    #Click Proceed with Bank Transfer Method
    Sleep    10s
    Click Element    id=button-bankTransferModal-proceedBankTransfer
    Sleep    10s

Custom Coordinator Credit Card Payment Flow
#Click Proceed with Make Credit Card Payment Method
    Click Element   id=button-enetsModal-makePayment

    #Switch to popup
    Switch Window    new

    #Enter Name
    Input Text    id=name   test

    #Enter CardNo
    Input Text    id=cardNo   4111111111111111

    #Enter CVV/CVV2
    Input Text    id=cvv    123

    #Select Expiry Date Month
    Select From List By Value   id=selExpiryMonth   12

    #Select Expiry Year
    Select From List By Value   id=selectYearId   2036

    #Click Submit Button
    Click Element   id=btnSubmit

    Sleep   10s

    #Switch back to main window
    Close Window

    Switch Window   main

    #Save Selected Transaction No
    ${RESIT_TRANSACTION_NO}=    Get Text    id=keyValue-transactionNo-0

    #Save Selected Reference No
    ${RESIT_REFERENCE_NO}=    Get Text    id=keyValue-referenceNo-0

    #Click View Full Summary
    Click Element   id=link-viewFullSummary

    #Assert Transaction No
    Element Text Should Be    id=keyValue-transactionNo-0   ${RESIT_TRANSACTION_NO}

    #Assert Reference No
    Element Text Should Be    id=keyValue-referenceNo-0   ${RESIT_REFERENCE_NO}

    #Click Download Summary
    Click Element   id=button-resitSummary-download