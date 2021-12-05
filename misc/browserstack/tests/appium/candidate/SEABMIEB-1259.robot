*** Settings ***
Library    AppiumLibrary
Resource    ../../../common/CustomAppiumKeywords.robot

*** Variables ***
${URL}    %{DOMAIN}/auth/login
${CANDIDATE_USERNAME}   candidateAcsNric1
${CANDIDATE_PASSWORD}   P@ssw0rd1234

*** Test Cases ***
Candidate will see the available results display in Homepage when the result release window is open and no result is blocked

    [Setup]   Custom Setup    ${URL}

    #Candidate Login 
    Custom Login    ${CANDIDATE_USERNAME}  ${CANDIDATE_PASSWORD}
    #Navigate to Getting Exam Results
    Custom Navigatation to Sub Menu    2    id=results

    #click on the view result from the result listing page
    Click Element   id=button-resultListing-GCE A-LEVEL

    Sleep   5s
    #Check Exact Match String 
    ${CANDIDATE_NAME}     Get Text                  id=keyValue-candidateName-0
    Log To Console  ${CANDIDATE_NAME}
    ${CANDIDATE_ID}       Get Text                  id=keyValue-nricFinPassport-0
    Log To Console  ${CANDIDATE_ID}
    Should Be Equal	      candidate-acs-nric-1      ${CANDIDATE_NAME}
    Should Be Equal	      S0000001A                 ${CANDIDATE_ID}

    [Teardown]    Custom Teardown


