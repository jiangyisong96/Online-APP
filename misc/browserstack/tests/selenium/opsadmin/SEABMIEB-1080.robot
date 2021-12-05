*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${candidate_name}   candidateUat729

*** Test Cases ***
Ops Admin search for candidate's NRIC/FIN/Passport no. and views and downloads his/her 'O' Levels results slip that is not blocked

      [Setup]   Custom Setup   ${URL}

      #Set session name
      Custom Session Name   SEABMIEB-1080

      #login as ops admin
      Custom Login   %{OPS_ADMIN}   %{OPS_ADMIN_PASSWORD}

      #Click on Applications menu
      Click Element   id=menu-applications

      #Click on submenu results
      Click Element   id=menu-applications-submenu-results

      #Wait until search button is visible
      Wait Until Element Is Visible   name=inputSearch-searchInput

      #Search for a candidate
      Input Text   name=inputSearch-searchInput   ${candidate_name}

      #Click search button
      Click Element   id=button-searchInput-search

      #Wait until search input is visible
      Wait Until Element Is Visible   name=inputSearch-searchInput

      #Click view details button
      Click Element   id=button-resultRelease-row0

      ${candidate_name}   Get Text   id=keyValue-candidateName-0
      ${candidate_nric}   Get Text   id=keyValue-nricFinPassport-0
      Should Be Equal   candidateUat729   ${candidate_name}
      Should Be Equal   S1210729E   ${candidate_nric}

      #Click to go back
      #ToDo Need to add id for breadcrumbs
      Click Element   xpath=//li/a[text()='Result Release']

      #Search for a candidate
      Input Text   name=inputSearch-searchInput   ${candidate_name}

      #Click search button
      Click Element   id=button-searchInput-search

      #Select first element
      Click Element   id=tableSelectCell-undefined-row0

      #Click download button
      #ToDo Need to add id for download button
      Click Element   xpath=//button/span[text()='Download']

      Sleep   20s

      #Logout
      [Teardown]   Custom Teardown





