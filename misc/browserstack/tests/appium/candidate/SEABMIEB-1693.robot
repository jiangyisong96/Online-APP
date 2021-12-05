*** Settings ***
Library    AppiumLibrary
Resource    ../../../common/CustomAppiumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login
${SELECTED_SUBJECT}     id=tableSelectCell-subjectSelection-row0


*** Test Cases ***
ITE Private Candidate (SC) with 'A' Level mid-year Chinese results directly confirms registration for MTL resit

    [Setup]   Custom Setup    ${URL}

    Custom Login        %{CANDIDATE_ITE_USERNAME}  %{CANDIDATE_ITE_PASSWORD}

    Custom Candidate Resit Flow   ${SELECTED_SUBJECT}

    #Confirm registration
    Click Element       id=button-reviewPay-confirmRegistration

    #Click View Full Summary
    Click Element       id=link-viewFullSummary

    Sleep   5s
    #Click Download Summary
    Click Element       id=link-download

    Sleep   5s

    ${CANDIDATE_NAME}   Get Text        id=keyValue-candidateName-0
    ${CANDIDATE_ID}     Get Text        id=keyValue-nricFinPassport-0
    ${EXAM_LEVEL}       Get Text        id=keyValue-examLevel-0
    ${SUBJECT_CODE}     Get Text        id=text-subjectCode-row0
    ${EXAM_FEE}         Get Text        id=text-examFees-row0



    [Teardown]    Custom Teardown


