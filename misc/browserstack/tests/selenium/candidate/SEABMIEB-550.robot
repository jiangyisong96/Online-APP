*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login

*** Test Cases ***
Private Candidate with SingPass logs in to CP after successful SingPass authentication

        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-550

        #Login as singpass user
        Custom SingPass Login   %{SINGPASS_USER_1}   %{SINGPASS_PASSWORD}

        Sleep   10s

        [Teardown]   Custom Teardown
