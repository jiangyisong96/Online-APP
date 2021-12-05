*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${SELECTED_SUBJECT}   id=tableSelectCell-subjectSelection-row0

*** Test Cases ***
ITE Private Candidate (SC) with 'A' Level mid-year Chinese results directly confirms registration for MTL resit

        [Setup]   Custom Setup   ${URL}

        #Set session name
        Custom Session Name   SEABMIEB-1693

        #Login as candidate
        Custom Login   %{CANDIDATE_ITE_USERNAME}  %{CANDIDATE_ITE_PASSWORD}

        #Resit flow
        Custom CandidateResitFlow   ${SELECTED_SUBJECT}

        #Confirm registration
        Click Element   id=button-reviewPay-confirmRegistration

        #Click View Full Summary
        Click Element   id=link-viewFullSummary

        #Click Download Summary
        Click Element   id=link-download

        ${CANDIDATE_NAME}   Get Text   id=keyValue-candidateName-0
        ${CANDIDATE_ID}     Get Text   id=keyValue-nricFinPassport-0
        ${EXAM_LEVEL}       Get Text   id=keyValue-examLevel-0
        ${SUBJECT_CODE}     Get Text   id=text-subjectCode-row0
        ${EXAM_FEE}         Get Text   id=text-examFees-row0

        [Teardown]   Custom Teardown



