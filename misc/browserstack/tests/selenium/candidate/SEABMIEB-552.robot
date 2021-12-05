*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${CANDIDATE_USERNAME}   candidateAcsNric1
${CANDIDATE_PASSWORD}   P@ssw0rd1234
${USERNAME}   name=username
${PASSWORD}   name=password

*** Test Cases ***
Private Candidate with existing CP account but ineligible for SingPass logs in to CP successfully with Id and password and inputting correct 2FA code sent to sms

        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-552

        #Input username and password
        Input Text   ${USERNAME}   ${CANDIDATE_USERNAME}
        Input Text   ${PASSWORD}   ${CANDIDATE_PASSWORD}

        #Input username and password
        Click Element   id=login-button

        #Select SMS OTP option
        Click Element   id=tab-otpTabs-SMS

        Sleep   2s

        #Input OTP
        Click Element   name=otp
        Input Text   name=otp   123456

        #submit OTP
        Click Element   id=otp-submit-button

        ${NAV_RESIT}   Get Text   id=menu-resit
        ${NAV_EXAM}   Get Text   id=menu-exams
        ${NAV_RESULT}   Get Text   id=menu-results

        Should Be Equal   Applying for Exams   ${NAV_RESIT}
        Should Be Equal   Getting Ready for Exams   ${NAV_EXAM}
        Should Be Equal   Getting Exam Results   ${NAV_RESULT}

        [Teardown]   Custom Teardown


