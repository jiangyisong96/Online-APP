*** Settings ***
Library     SeleniumLibrary                                 implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${CANDIDATE_NAME}   candidate-acs-nric-1
${CANDIDATE_NRIC}   S0000001A
${CANDIDATE_INDEX_NO}   20010001

*** Test Cases ***
Ops Admin search for candidate's Index no. and views and downloads his/her 'A' Levels results slip that is not blocked

        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1082

        #Login as ops admin
        Custom Login   %{OPS_ADMIN}   %{OPS_ADMIN_PASSWORD}

        #Click on Applications menu
        Click Element   id=menu-applications

        #Click on submenu results
        Click Element   id=menu-applications-submenu-results

        Sleep   5s

        #Wait until search button is visible
        Wait Until Element Is Visible   name=inputSearch-searchInput

        #Search for a candidate
        Input Text   name=inputSearch-searchInput   ${CANDIDATE_NAME}

        #Click search button
        Click Element   id=button-searchInput-search

        Wait Until Element Is Visible   name=inputSearch-searchInput

        #Click view details button
        Click Element    id=button-resultRelease-row0

        ${CANDIDATE_FIELD_NAME}   Get Text   id=keyValue-candidateName-0
        ${CANDIDATE_FIELD_NRIC}   Get Text   id=keyValue-nricFinPassport-0
        ${CANDIDATE_FIELD_INDEX_NO}   Get Text   id=keyValue-indexNo-0
        Should Be Equal   ${CANDIDATE_NAME}   ${CANDIDATE_FIELD_NAME}
        Should Be Equal   ${CANDIDATE_NRIC}   ${CANDIDATE_FIELD_NRIC}
        Should Be Equal   ${CANDIDATE_INDEX_NO}   ${CANDIDATE_FIELD_INDEX_NO}

        #Click to go back
        #ToDo Need to add id for breadcrumbs
        Click Element   xpath=//li/a[text()='Result Release']

        #Search for a candidate
        Input Text   name=inputSearch-searchInput   ${CANDIDATE_NAME}

        #Click search button
        Click Element   id=button-searchInput-search

        #Select first element
        Click Element   id=tableSelectCell-undefined-row0

        #click download button
        #ToDo Need to add id for download button
        Click Element   xpath=//button/span[text()='Download']

        Sleep   20s

        #Logout
        [Teardown]    Custom Teardown





