*** Settings ***
Library    AppiumLibrary
Resource    ../../../common/CustomAppiumKeywords.robot


*** Variables ***
${URL}    %{DOMAIN}/auth/login
${CANDIDATE_USERNAME}   candidateAcsNric1
${CANDIDATE_PASSWORD}   P@ssw0rd1234
${USERNAME}       name=username
${PASSWORD}       name=password

*** Test Cases ***
Private Candidate with existing CP account but ineligible for SingPass logs in to CP successfully with Id and password and inputting correct 2FA code sent to email
    
    [Setup]   Custom Setup    ${URL}
    #Input username and password 
    Input Text    ${USERNAME}     ${CANDIDATE_USERNAME}
    Input Text    ${PASSWORD}     ${CANDIDATE_PASSWORD}
    
    #Press on login button 
    Click Element    id=login-button
    Sleep   3s
    #Select email OTP option 
    Click Element    id=tab-otpTabs-Email
    Sleep       2s
    #Input OTP 
    Click Element    name=otp
    Input Text       name=otp    123456
    
    #Click Submit Button
    Click Element    id=otp-submit-button
    Sleep   3s

    #Get and Click Drawer Button
    ${DRAWER}   Get Webelement  class=MuiButtonBase-root
    ClickElement    ${DRAWER}

    #Get all Label in Drawer and ids are the same in mobile view
    ${MENULABELS}   Get Webelements  id=menu-label
    Sleep   2s

    #Check Exact Match String 
    Element Text Should Be    ${MENULABELS}[0]    Applying for Exams
    Element Text Should Be    ${MENULABELS}[1]    Getting Ready for Exams
    Element Text Should Be    ${MENULABELS}[2]    Getting Exam Results

    [Teardown]    Custom Teardown

