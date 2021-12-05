*** Settings ***
Library    AppiumLibrary
Resource    ../../../common/CustomAppiumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login


*** Test Cases ***
Private Candidate with SingPass logs in to CP after successful SingPass authentication

    [Setup]    Custom Setup    ${URL}

    Custom SingPass Login  %{SINGPASS_USER_1}  %{SINGPASS_PASSWORD}

    Sleep            10s
    [Teardown]   Custom Teardown