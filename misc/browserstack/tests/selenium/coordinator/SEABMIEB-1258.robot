*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login

*** Test Cases ***
Private Centre Coordinator will see the available results display in Homepage when the result release window is open and no result is blocked

        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1258

        #Login as Coordinator
        Custom Login   %{ACS_COORDINATOR_USERNAME}   %{ACS_COORDINATOR_PASSWORD}

        Custom Coordinator View Results

        #Select "O" Exam Level for Results
        Click Element   id=button-resultListing-GCE A-LEVEL

        #Select View Details
        Click Element   id=button-resultRelease-row0

        [Teardown]   Custom Teardown
