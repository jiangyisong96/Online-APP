*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s

Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login


*** Test Cases ***
Private Centre Coordinator success to bulk register the Candidates for resit and make payment by Credit Card, so that Candidates can resit the mid year O-level MT exam

    [Setup]    Custom Setup    ${URL}

    Custom Login    %{ACS_COORDINATOR_USERNAME}   %{ACS_COORDINATOR_PASSWORD}

    #Click the Applying for Exams button in the top tray
    Click Element   id=menu-resits

    #Click the Resit button in the list
    Click Element   id=menu-resits-submenu-resit

    #Select the dropdown filter for selecting exam level
    Click Element   id=inputSelect-examLevel

    #Select GCEO in filter
    Click Element   id=inputSelect-examLevel-item-k-GCEA

    Wait Until Element Is Enabled   id=radio-bulkUpload

    #Select Mode of Registration
    Click Element    id=radio-bulkUpload

    Press Key       Ctrl+O
	
	Choose File		  xpath=(//input)[4]  		C:\\Users\\Ufinity\\Music\\ResitCSVTemplate.csv
	#Execute JavaScript      window.scrollTo(0,600)
	Sleep     5s
    # Click Start Registration Process
    Click Element   id=button-resitRegister-startRegistration
    Sleep       33s

    #Click Start
    Click Element   id=button-instructionConsent-start
    Sleep       5s

    #Click to select subject
    Click Element   id=tableSelectCell-candidateListing-row0

    #Click Show Details
    Click Element   id=iconButton-candidateListing-row0

    #Click to continue after confirming details
    Click Element   id=button-resitAction-continue
    #Click to continue after confirming details
    Click Element   id=button-resitAction-continue

    #Click to continue after confirmation page
    Click Element   id=button-resitAction-continue

    #Click to check declaration checkbox
    Click Element   id=checkbox-declaration

    #Click proceed to payment button
    Click Element   id=button-paymentButton-proceedToPayment

    #Click proceed to Credit Card Payment
    Click Element   id=button-paymentMethod-enetsCreditCard

    #Click Proceed with Make Credit Card Payment Method
    Click Element   id=button-enetsModal-makePayment

    #Switch to popup
    Switch Window    new

    #Enter Name
    Input Text    id=name   test

    #Enter CardNo
   Input Text    id=cardNo   4111111111111111
#
    #Enter CVV/CVV2
    Input Text    id=cvv    123

    #Select Expiry Date Month
    Select From List By Value   id=selExpiryMonth   12

    #Select Expiry Year
    Select From List By Value   id=selectYearId   2036

    #Click Submit Button
    Click Element   id=btnSubmit

    #Switch back to main window
    Switch Window    main

    #Click View Full Summary
    Click Element   id=link-viewFullSummary

    [Teardown]    Custom Teardown

#    #sample code for verfication
#    Click Element   id=button-instructionConsent-start
#
#    Custom Coordinator Resit Manual Register Add Candidate   %{CANDIDATE_ACS_NRIC_SC}
#
#    Custom Coordinator Resit Manual Register Add Candidate   %{CANDIDATE_ACS_NRIC_PR}
#
#    Custom Coordinator Resit Manual Register Add Candidate   %{CANDIDATE_ACS_NRIC_IS}
#
#    #Save Candidate SC Name
#    ${CANDIDATE_ACS_SC_NAME}=    Get Text    id=text-candidateName-row0
#
#    #Save Candidate PR Name
#    ${CANDIDATE_ACS_PR_NAME}=    Get Text    id=text-candidateName-row1
#
#    #Save Candidate IS Name
#    ${CANDIDATE_ACS_IS_NAME}=    Get Text    id=text-candidateName-row2
#
#    #Click Show Details
#    Click Element   id=iconButton-candidateListing-row0
#
#    #Click to select subject
#    Click Element   id=tableSelectCell-subjectSelection-row0
#
#    #Save Selected Subject Code
#    ${CANDIDATE_ACS_SC_SUBJECTCODE}=    Get Text    id=text-subjectCode-row0
#
#    #Click Show Details
#    Click Element   id=iconButton-candidateListing-row1
#
#    #Click to select subject
#    Click Element   id=tableSelectCell-subjectSelection-row0
#
#    #Save Selected Subject Code
#    ${CANDIDATE_ACS_PR_SUBJECTCODE}=    Get Text    id=text-subjectCode-row0
#
#    #Click Show Details
#    Click Element   id=iconButton-candidateListing-row2
#
#    #Click to select subject
#    Click Element   id=tableSelectCell-subjectSelection-row0
#
#    #Save Selected Subject Code
#    ${CANDIDATE_ACS_IS_SUBJECTCODE}=    Get Text    id=text-subjectCode-row0
#
#    #Click to continue after selecting subject
#    Click Element   id=button-resitAction-continue
#
#    #Click to continue after confirming details
#    Click Element   id=button-resitAction-continue
#
#    #Select First Candidate
#    Click Element   id=iconButton-candidateListing-row0
#
#    #Assertion of First Candidate
#    Custom Resit Group Register Validation    ${CANDIDATE_ACS_SC_NAME}    %{CANDIDATE_ACS_NRIC_SC}    ${CANDIDATE_ACS_SC_SUBJECTCODE}
#
#    #Select Second Candidate
#    Click Element   id=iconButton-candidateListing-row1
#
#    #Assertion of Second Candidate
#    Custom Resit Group Register Validation    ${CANDIDATE_ACS_PR_NAME}    %{CANDIDATE_ACS_NRIC_PR}    ${CANDIDATE_ACS_PR_SUBJECTCODE}
#
#    #Select Third Candidate
#    Click Element   id=iconButton-candidateListing-row2
#
#    #Assertion of Third Candidate
#    Custom Resit Group Register Validation    ${CANDIDATE_ACS_IS_NAME}    %{CANDIDATE_ACS_NRIC_IS}    ${CANDIDATE_ACS_IS_SUBJECTCODE}
#
#    #Click to continue after confirmation page
#    Click Element   id=button-resitAction-continue
#
#    #Click to check declaration checkbox
#    Click Element   id=checkbox-declaration
#
#    #Click proceed to payment button
#    Click Element   id=button-paymentButton-proceedToPayment
#
#    #Click proceed to Credit Card Payment
#    Click Element   id=button-paymentMethod-enetsCreditCard
#
#    #Click Proceed with Make Credit Card Payment Method
#    Click Element   id=button-enetsModal-makePayment
#
#    #Switch to popup
#    Switch Window    new
#
#    #Enter Name
#    Input Text    id=name   test
#
#    #Enter CardNo
#    Input Text    id=cardNo   4111111111111111
#
#    #Enter CVV/CVV2
#    Input Text    id=cvv    123
#
#    #Select Expiry Date Month
#    Select From List By Value   id=selExpiryMonth   12
#
#    #Select Expiry Year
#    Select From List By Value   id=selectYearId   2036
#
#    #Click Submit Button
#    Click Element   id=btnSubmit
#
#    #Switch back to main window
#    Switch Window    main
#
#    #Save Selected Transaction No
#    ${RESIT_TRANSACTION_NO}=    Get Text    id=keyValue-transactionNo-0
#
#    #Save Selected Reference No
#    ${RESIT_REFERENCE_NO}=    Get Text    id=keyValue-referenceNo-0
#
#    #Click View Full Summary
#    Click Element   id=link-viewFullSummary
#
#    #Assert Transaction No
#    Element Text Should Be    id=keyValue-transactionNo-0   ${RESIT_TRANSACTION_NO}
#
#    #Assert Reference No
#    Element Text Should Be    id=keyValue-referenceNo-0   ${RESIT_REFERENCE_NO}
#
#    #Click Download Summary
#    Click Element   id=button-resitSummary-download
#
#    #Click Getting Ready for Exams in Navigation Panel
#    Click Element   id=menu-exams
#
#    #Click Registered Exams
#    Click Element   id=menu-exams-submenu-registeredExams
#
#    #Select Details of registered Exam
#    Click Element   id=button-resultListing-row0
#
#    [Teardown]    Custom Teardown
