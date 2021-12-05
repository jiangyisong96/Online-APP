*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login
${CANDIDATE_USERNAME}   candidateAcsNric1
${CANDIDATE_PASSWORD}   P@ssw0rd1234

*** Test Cases ***
Candidate will see the available results display in Homepage when the result release window is open and no result is blocked

        [Setup]   Custom Setup    ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1259

        #Login as candidate
        Custom Login   ${CANDIDATE_USERNAME}   ${CANDIDATE_PASSWORD}

        #select view result from home screen
        Click Element   id=button-resultListing-GCE A-LEVEL

        #hover view result from navigation bar
        Mouse Over      id=menu-results

        #select view result from the navigation
        Click Element   menu-results-submenu-results

        #click on the view result from the result listing page
        Click Element   id=button-resultListing-GCE A-LEVEL

        ${CANDIDATE_NAME}   Get Text   id=keyValue-candidateName-0
        ${CANDIDATE_ID}   Get Text   id=keyValue-nricFinPassport-0
        Should Be Equal   candidate-acs-nric-1   ${CANDIDATE_NAME}
        Should Be Equal   S0000001A   ${CANDIDATE_ID}

        [Teardown]   Custom Teardown

