*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${FORGET_PASSWORD_MSG}   A Password Reset email has been sent to c*************************@gmail.com.
${EMPTY}


*** Test Cases ***
Private Centre Coordinator with CP account reset password successfully, so that he/she can login to CP with new password

        [Setup]   Custom Setup    ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-607

        #Click Link Forgot Password
        Click Element   id=link-forgotPassword

        #Select Username Text-field
        ${USERNAME}   Set Variable   name=username

        #Input Text into username text-field
        Input Text   ${USERNAME}   %{ACS_COORDINATOR_USERNAME}

        #Select Date Of Birth Text-field
        ${DATE_OF_BIRTH}   Set Variable   name=dateOfBirth

        #Input Text into Date of Birth Text-Field
        Input Text   ${DATE_OF_BIRTH}   02/02/2020

        #Click Reset Password Button
        Click Element   id=button-forgotPassword-resetPassword

        Sleep   2s

        ${FORGET_PASSWORD_MESSAGE}   Get Text   id=successText-resetPassword
        Should Be Equal   ${FORGET_PASSWORD_MSG}   ${FORGET_PASSWORD_MESSAGE}

        [Teardown]   Custom Teardown
