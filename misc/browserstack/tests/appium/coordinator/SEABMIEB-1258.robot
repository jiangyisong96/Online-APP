*** Settings ***
Library    AppiumLibrary
Resource    ../../../common/CustomAppiumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login


*** Test Cases ***
Private Centre Coordinator will see the available results display in Homepage when the result release window is open and no result is blocked

    [Setup]    Custom Setup    ${URL}

    #Login as Coordinator
    Custom Login    %{ACS_COORDINATOR_USERNAME}   %{ACS_COORDINATOR_PASSWORD}

    Custom Navigatation to Sub Menu    2    id=results

    #Select "O" Exam Level for Results
    Click Element   id=button-resultListing-GCE A-LEVEL

    #Select View Details
    Click Element     id=button-resultRelease-row0

    [Teardown]    Custom Teardown
