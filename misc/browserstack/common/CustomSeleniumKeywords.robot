*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s

*** Variables ***
${BROWSER_STACK_URL}   http://hub-cloud.browserstack.com/wd/hub
${IS_REMOTE_BROWSER_STACK}   bool(&{DC})
${CAT_URL}   https://seab_cat:S8n9Rpe7DgefL7FGxFrTJRXz@cat.myexams.seab.gov.sg
${CAT_BYPASS_URL}   https://cat.myexams.seab.gov.sg/cgi-bin/specialauth.pl?key=fFNOfqB8Fc5evPAThc77yVhsHFdT8XWdrzPwPgskgonB1Nl8Qg5c1cuxFvgDh2Gy

*** Keywords ***
Custom Logout For Admin
        Set Selenium Speed   0.5s
        Mouse Over   id=menu-user
        Click Element   id=menu-user-submenu-logout

Custom Coordinator View Results
        Set Selenium Speed   0.5s
        Scroll Element Into View   id=menu-results
        Click Element   id=menu-results
        Click Element   id=menu-results-submenu-results

Custom Browserstack Open Browser For All Browsers
        Open Browser   ${CAT_BYPASS_URL}   remote_url=${BROWSER_STACK_URL}    desired_capabilities=&{DC}   alias=bypass
        Execute Javascript   window.open('${CAT_URL}')
        ${handles}=    Get Window Handles
        Switch Window   ${handles}[0]
        Close Window
        Switch Window   main

Custom Browserstack Open Browser For Mac Safari
        Open Browser    ${CAT_BYPASS_URL}   remote_url=${BROWSER_STACK_URL}    desired_capabilities=&{DC}   alias=bypass
        Execute Javascript   window.open('${CAT_URL}')
        ${handles}=    Get Window Handles
        Switch Window   ${handles}[1]
        Close Window
        Switch Window   main

Check Browser Type
        ${MAC_SAFARI}=   Set Variable   mac_safari
        Run Keyword If    "%{TYPE}" == "mac_safari"    Custom Browserstack Open Browser For Mac Safari
        ...   ELSE   Custom Browserstack Open Browser For All Browsers

# Will run on Browserstack or local depending on presence of DC variable
Custom Setup
        [Arguments]   ${setup_url}
        Run Keyword If   ${IS_REMOTE_BROWSER_STACK}   Check Browser Type
        ...    ELSE   Open Browser   %{DOMAIN}   %{LOCAL_BROWSER}
        Maximize Browser Window

Custom Session Name
        [Arguments]   ${testname}
        Run Keyword If   ${IS_REMOTE_BROWSER_STACK}   Execute JavaScript   browserstack_executor: {"action": "setSessionName", "arguments": {"name":"${testname}"}}

Custom Post Success
        Run Keyword If   ${IS_REMOTE_BROWSER_STACK}   Execute JavaScript   browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed","reason": "Test case is successful"}}

Custom Post Fail
        Run Keyword If   ${IS_REMOTE_BROWSER_STACK}   Execute JavaScript   browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed","reason": "An error has been encountered"}}

Custom Teardown
        Run Keyword If Test Failed   Custom Post Fail
        # ...    ELSE    Custom Post Success
        Close Browser

Clear Text Field
        [Arguments]   ${inputField}
        Run Keyword If   "%{OS}"=="windows"   Press Keys   ${inputField}   CTRL+a+BACKSPACE
        ...     ELSE   Press Keys   ${inputField}   BACKSPACE BACKSPACE BACKSPACE BACKSPACE BACKSPACE BACKSPACE BACKSPACE

Custom SingPass Login
        [Arguments]   ${INPUT_USERNAME}  ${INPUT_PASSWORD}
        Set Selenium Speed   0.5s
        #Click on Login with Singpass button
        Click Element   id=singpass-login-button
        Sleep   10s
        #Toggle Singpass Tab to password sign in
        Click Element   id=SpQrToggle-1FATab
        #Input Singpass Id
        Input Text   id=SpLoginIdPw-singpass-id   ${INPUT_USERNAME}
        #Input Singpass Password
        Input Text   id=SpLoginIdPw-password   ${INPUT_PASSWORD}
        #Toggle Click on Singpass SignIn
        Click Element   SpLoginIdPw-login-button

Custom Login
        [Arguments]   ${INPUT_USERNAME}  ${INPUT_PASSWORD}
        Set Selenium Speed   0.5s
        ${USERNAME}   Set Variable   name=username
        ${PASSWORD}   Set Variable   name=password
        Input Text    ${USERNAME}   ${INPUT_USERNAME}
        Input Text    ${PASSWORD}   ${INPUT_PASSWORD}
        Click Element   id=login-button
        Click Element   name=otp
        Input Text   name=otp   123456
        Click Element   id=otp-submit-button

Custom Login without OTP
    [Arguments]   ${INPUT_USERNAME}  ${INPUT_PASSWORD}
        Set Selenium Speed    0.5s

        ${USERNAME}   Set Variable    name=username
        ${PASSWORD}   Set Variable    name=password
        Input Text    ${USERNAME}     ${INPUT_USERNAME}
        Input Text    ${PASSWORD}     ${INPUT_PASSWORD}
        Click Element    id=login-button


Custom Resit Group Register Validation
        [Arguments]   ${CANDIDATE_NAME}   ${CANDIDATE_NRIC}   ${CANDIDATE_SUBJECTCODE}
        Set Selenium Speed   0.5s
        #Assert Name
        Element Text Should Be   id=keyValue-candidateName-0   ${CANDIDATE_NAME}
        #Assert NRIC
        Element Text Should Be   id=keyValue-nricFinPassport-0   ${CANDIDATE_NRIC}
        #Assert Subject Code
        Element Text Should Be   id=text-subjectCode-row0   ${CANDIDATE_SUBJECTCODE}

Custom Coordinator Resit Manual Register Add Candidate
        [Arguments]   ${NRIC}
        Set Selenium Speed    0.5s
        #Click Add Candidate Button
        Click Element   id=button-candidateListing-addCandidate
        #Input First Candidate NRIC
        Input Text   name=inputSearch-addCandidate   ${NRIC}
        #Click Search
        Click Element   id=button-addCandidate-search
        #Click Add Candidate
        Click Element   id=button-addCandidate-addCandidate

Custom Coordinator Resit Bank Transfer Payment
        Set Selenium Speed    0.5s
        #Click to check declaration checkbox
        Click Element   id=checkbox-declaration
        #Click proceed to payment button
        Click Element   id=button-paymentButton-proceedToPayment
        #Click proceed to Offline Payment
        Click Element   id=button-paymentMethod-bankTransfer
        #Click Proceed with Bank Transfer Method
        Click Element    id=button-bankTransferModal-proceedBankTransfer

Custom Get CandidateId
        #Mouse Over the profile name
        Mouse Over   id=menu-user
        #Click on My Profile
        Click Element   id=menu-user-submenu-myProfile
        # Get the NRIC/FIN TODO: need to refactor the xpath because currently no id and cannot convert to css for some reason
        ${CANDIDATE_ID}=   Get Text   xpath=/html/body/div/div/div[2]/div/div[3]/div/div/div/form/div[11]/div/p
        # returns the nric valie
        [return]   ${CANDIDATE_ID}

Custom PaymentFlow
        #Click Proceed with Make Credit Card Payment Method
        Click Element   id=button-enetsModal-makePayment
        #Switch to popup
        Switch Window   new
        Sleep   10s
        #Enter Name
        Input Text   id=name   test
        #Enter CardNo
        Input Text   id=cardNo   4111111111111111
        #Enter CVV/CVV2
        Input Text   id=cvv   123
        #Select Expiry Date Month
        Select From List By Value   id=selExpiryMonth   12
        #Select Expiry Year
        Select From List By Value   id=selectYearId   2036
        #Click Submit Button
        Click Element   id=btnSubmit
        Sleep   10s
        Close Window
        Switch Window    main
        #Click View Full Summary
        Click Element   id=link-viewFullSummary
        #Click Download Summary
        Click Element   id=link-download
        Sleep   15s
        Sleep   5s
        #Click Getting Ready for Exams in Navigation Panel
        Click Element   id=menu-exams
        Sleep   8s
        #Click Registered Exams
        Click Element   id=menu-exams-submenu-registeredExams
        #Select Details of registered Exam
        Click Element   id=button-resitListing-row0

Custom CandidateResitFlow
        [Arguments]    ${SELECT_SUBJECT}
        #Hover to resit navigation
        Mouse Over   id=menu-resit
        #Click on resit
        Click Element   id=menu-resit-submenu-resit
        #Click on the button to start resit flow
        Click Element   id=button-resitInstruction-start
        #Select subject
        Click Element   ${SELECT_SUBJECT}
        #conitnue to next screen
        Click Element   id=button-selectSubject-continueToNextPage
        #confirm particulars
        Click Element   id=button-confirmParticulars-confirmParticulars
        #click on the declaration
        Click Element   id=checkbox-declaration

Custom OpsAdmin blockUnblock candidates Flow
        [Arguments]   ${nric}    ${reason}   ${approver}
        #Login as opsadmin
        Custom Login    %{OPSADMIN4_USERNAME}   %{OPSADMIN4_PASSWORD}
        Sleep   3s
        #Click on Accounts
        Mouse Over   id=menu-accounts
        #Click on submenu User Account Management
        Click Element   id=menu-accounts-submenu-userAccountManagement
        Sleep   5s
        #Select block/unblock from Dropdown
        #ToDo Need to add id for dropdown
        Click Element   xpath=//div[@role='button']
        Click Element   id=input-select-actions-item-BLOCK_UNBLOCK
        #select candidate in the radio button
        #ToDo Need to add id for radio button selection
        Click Element   xpath=(//input[@name="userSelection"])[1]
        #Enter candidate name/nric to search
        Input Text   name=inputSearch-searchInput     ${nric}
        #click search button
        Click Element   id=button-searchInput-search
        Reload Page
        Sleep   2s
        #Select block/unblock from Dropdown
        #ToDo Need to add id for dropdown
        Click Element   xpath=//div[@role='button']
        Click Element   id=input-select-actions-item-BLOCK_UNBLOCK
        #select candidate in the radio button
        #ToDo Need to add id for radiobutton selection
        Click Element   xpath=(//input[@name="userSelection"])[1]
        #Enter candidate name/nric to search
        Input Text   name=inputSearch-searchInput     ${nric}
        #click search button
        Click Element   id=button-searchInput-search
        #Checking to make sure the user has a block/unblock approval
        Page Should not contain   APPROVAL
        Sleep   2s
        #click view details of a candidate
        Click Element   id=button-candidate-viewdetails
        #select approver to approve/reject
        Click Element   id=input-select-approvers-list
        #Choose the approver
        Click element   ${approver}
        #enter reason for blocking
        Input Text   id=input-text-reason   ${reason}
        #click submit button
        #ToDo Need to add id for submit button
        Click Element   xpath=//button[@type='submit']
        #OpsAdmin Logout
        Custom Logout For Admin

Custom OpsAdmin blockUnblock coordinator Flow
        #OpsAdmin creates a block/unblock coordinator request
        [Arguments]   ${blockcentre}   ${reason}   ${approver}
        Custom Login   %{OPS_ADMIN}   %{OPS_ADMIN_PASSWORD}
        #Click on Accounts
        Click Element   id=menu-accounts
        #Click the userAccountManagement submenu in the list
        Click Element   id=menu-accounts-submenu-userAccountManagement
        #ToDo Need to add id for dropdown
        Wait Until Element Is Visible   xpath=//div[@role='button']
        #Click on the dropdown to select
        #ToDo Need to add id for dropdown
        Click Element   xpath=//div[@role='button']
        #Select "block or unblock" from the dropdown
        Click Element   id=input-select-actions-item-BLOCK_UNBLOCK
        #Select coordinator from the radio button
        #ToDo Need to add id for radiobutton selection
        Click Element   xpath=(//input[@name="userSelection"])[2]
        #Click the dropdown to select centre name
        Click Element   id=input-select-centres
        #Select centre name from the dropdown
        Click Element   ${blockcentre}
        #Click view details button
        Click Element   id=button-coordinator-viewdetails
        #Click dropdown to select Approver
        Click Element   id=input-select-approvers-list
        #Select Approver name from the dropdown values
        Click Element   ${approver}
        #Click textarea to enter reason
        Input Text   id=input-text-reason    ${reason}
        #Click block user button
        #ToDo Need to add id for submit button
        Click Element   xpath=//button[@type='submit']
        #logout
        Custom Logout For Admin

Custom Approver blockApprove Flow
        [Arguments]   ${Approver_username}   ${Approver_password}   ${Nric}
        #Login as Approver to approve the block request
        Custom Login   ${Approver_username}   ${Approver_password}
        #select Personal menu
        Click Element   //*[@id="menu-personal"]
        #Select my tasks submenu
        Click Element   id=menu-personal-submenu-myTasks
        #search for the candidate
        Input Text   //input[@name="inputSearch-searchInput"]   ${Nric}
        #ToDo Need to add id for search button
        Click Element    xpath=(//span[@class="MuiButton-label"])[3]
        Page Should Contain   PENDING BLOCK APPROVAL
        #click view details button
        #ToDo Need to add id for click details icon
        Click Element   xpath=//span[@aria-label='go-detail-click']
        Sleep   3s
        #page scroll down
        Execute JavaScript   window.scrollBy(2300, 2300);
        Sleep   3s
        Page Should Contain   Approve
        #click approve button
        Click Element   xpath=//*[@id="button-approve"]
        #logout as approver
        Custom Logout For Admin

Custom Approver unblockApprove Flow
         [Arguments]   ${Approver_username}   ${Approver_password}   ${Nric}
         #Login as Approver
         Custom Login   ${Approver_username}  ${Approver_password}
         #Select Personal menu
         Click Element   //*[@id="menu-personal"]
         #click my tasks submenu
         Click Element   id=menu-personal-submenu-myTasks
         #Select tasktype dropdown
         Click Element   id=input-select-tasktype
         #Select Unblock from tasktype
         Click Element   id=input-select-tasktype-item-UNBLOCK
         #Select the candidate to unblock
         Input Text   //input[@name="inputSearch-searchInput"]   ${unblockNric}
         #ToDo Need to add id for search button
         Click Element   xpath=(//span[@class="MuiButton-label"])[3]
         #Validate page details
         Page Should Contain   PENDING UNBLOCK APPROVAL
         #Click Details tab
         #ToDo Need to add id for details icon
         Click Element   xpath=//span[@aria-label='go-detail-click']
         Sleep   3s
         #page scroll down
         Execute JavaScript   window.scrollBy(2300, 2300);
         #Approve the Pending unblock request
         Sleep   3s
         #validate page details
         Page Should Contain   Approve
         #Click approve button
         Click Element   xpath=//*[@id="button-approve"]
         #Logout as Approver
         Custom Logout For Admin

Custom Approver blockReject Flow
         [Arguments]   ${Approver_username}   ${Approver_password}    ${Nric}     ${reason}
         #login again as Approver
         Custom Login   ${Approver_username}   ${Approver_password}
         #click on personal menu
         Click Element   id=menu-personal
         #click my tasks submenu
         Click Element   id=menu-personal-submenu-myTasks
         #search for the candidate
         Input Text   //input[@name="inputSearch-searchInput"]   ${Nric}
         #ToDo Need to add id for search button
         Click Element    xpath=(//span[@class="MuiButton-label"])[3]
         Page Should Contain   PENDING BLOCK APPROVAL
         #click view details button
         #ToDo Need to add id for search button
         Click Element   xpath=//span[@aria-label='go-detail-click']
         Sleep   3s
         #page scroll down
         Execute JavaScript   window.scrollBy(900, 900);
         #click "reject" button
         Click Element   xpath=//*[@id="button-reject"]
         #enter rejection reason
         Input Text   xpath=//textarea[@name='reason']   ${reason}
         #click submit button
         #ToDo Need to add id for "Submit button"
         Click Element   xpath=//button/span/span[text()='Submit']
         #logout as Approver
         Custom Logout For Admin

Custom Approver unblockReject Flow
         [Arguments]   ${Approver_username}   ${Approver_password}   ${Nric}   ${reason}
         #login again as Approver
         Custom Login   ${Approver_username}   ${Approver_password}
         #click on personal menu
         Click Element   id=menu-personal
         #click on 'my tasks'
         Click Element   id=menu-personal-submenu-myTasks
         #Select tasktype dropdown
         Click Element   id=input-select-tasktype
         #Select "unblock" from the dropdown options
         Click Element   id=input-select-tasktype-item-UNBLOCK
         #Select the candidate to unblock
         Input Text   //input[@name="inputSearch-searchInput"]   ${unblockNric}
         #ToDo Need to add id for search button
         Click Element   xpath=(//span[@class="MuiButton-label"])[3]
         #validate page details
         Page Should Contain   PENDING UNBLOCK APPROVAL
         #Click Details tab
         ##ToDo Need to add id for click details icon
         Click Element   xpath=//span[@aria-label='go-detail-click']
         Sleep   3s
         #Scroll page down
         Execute JavaScript   window.scrollBy(900, 900);
         #click "reject" button
         Click Element   xpath=//*[@id="button-reject"]
         #enter rejection reason
         Input Text   xpath=//textarea[@name='reason']   testing
         #Click submit button
         #ToDo Need to add id for "Submit button"
         Click Element   xpath=//button/span/span[text()='Submit']
         #logout as approver
         Custom Logout For Admin

Custom OpsAdmin Candidateblock/unblock flow
         #OpsAdmin block/unblock candidates
         [Arguments]   ${Nric}   ${Reason}
         #Login as Opsadmin
         Custom Login   %{OPSADMIN4_USERNAME}   %{OPSADMIN4_PASSWORD}
         #Click on Accounts
         Mouse Over   id=menu-accounts
         #Click on submenu User Account Management
         Click Element   id=menu-accounts-submenu-userAccountManagement
         Sleep   5s
         #Select Block/Unblock  from Dropdown
         #ToDo Need to add id for the dropdown
         Click Element   xpath=//div[@role='button']
         Click Element   id=input-select-actions-item-BLOCK_UNBLOCK
         #ToDo Need to add id for Radio button selection
         Click Element   xpath=(//input[@name="userSelection"])[1]
         #Enter candidate name/nric to search
         Input Text   name=inputSearch-searchInput   ${Nric}
         #Click search button
         Click Element   id=button-searchInput-search
         #Click view details
         Click Element   id=button-candidate-viewdetails
         #Select Approvers dropdown
         Click Element   id=input-select-approvers-list
         #select the approver
         Click element   id=input-select-approvers-list-option-3
         #Input Reason
         Input Text   id=input-text-reason   ${Reason}
         #Click submit button
         #ToDo Need to add id for "Submit button"
         Click Element   xpath=//button[@type='submit']
         #OpsAdmin Logout
         Custom Logout For Admin

