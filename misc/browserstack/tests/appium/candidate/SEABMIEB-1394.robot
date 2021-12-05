*** Settings ***
Library    AppiumLibrary
Resource    ../../../common/CustomAppiumKeywords.robot
Library    DateTime

*** Variables ***
${URL}    %{DOMAIN}/auth/login
${START_DATE}     id=inputText-startDate
${END_DATE}     id=inputText-endDate
${END_DATE_VALUE}     12/12/2029
${CANDIDATE_USERNAME}   candidateAcsNric4
${CANDIDATE_PASSWORD}   P@ssw0rd1234

*** Test Cases ***
Singapore/PR Private Candidate can view result for O-level exam when result release window configured by Ops Admin is opened and no subject is blocked
    
    
    [Setup]   Custom Setup    ${URL}


    #Login as application admin
    Custom Login        %{APPLICATION_ADMIN_USERNAME}   %{APPLICATION_ADMIN_PASSWORD}
    
    #Click the Features Configuration button in the top tray
    Custom Navigatation to Sub Menu    3    id=menu-settings-submenu-featuresConfiguration
    Sleep   2s
    #Click on feature type dropdown list
    Click Element       id=inputSelect-featureType

    #select reesult release from the feature type dropdown list
    Click Element       id=inputSelect-featureType-item-k-RESULT_RELEASE
    
    #click on exam level dropdown list
    Click Element       id=inputSelect-examLevel
    Sleep   2s
    #select GEC O LEVEL 
    Click Element       id=inputSelect-examLevel-item-k-GCEO
    Sleep   2s
    #click on apply selection button
    Click Element       id=button-featureConfiguration-applySelection


    Sleep   5s
    #Get current date
    ${CURRENT_DATE}=    Get Current Date      result_format=%d/%m/%Y
    Log To Console    ${CURRENT_DATE}}

    ${START_DATE_VALUE}   Get Element Attribute     ${START_DATE}   value
    Log To Console    ${START_DATE_VALUE}

    Clear Date Picker Field    ${START_DATE}

    #Enter StartDate for window period
    Input Text      ${START_DATE}      ${CURRENT_DATE}

    Clear Date Picker Field    ${END_DATE}
    #Enter EndDate for window period
    Input Text      ${END_DATE}      ${END_DATE_VALUE}

    Run Keyword If      '${START_DATE_VALUE}' != '${CURRENT_DATE}'    Click Element      id=button-featureConfiguration-update

    #Logout from the current user
    Custom Logout For Admin

    #Login as candidate
    Custom Login    ${CANDIDATE_USERNAME}  ${CANDIDATE_PASSWORD}
    
    #Get and Click Drawer Button
    ${DRAWER}   Get Webelement  class=MuiButtonBase-root
    ClickElement    ${DRAWER}

    #Get all Label in Drawer and ids are the same in mobile view
    ${MENULABELS}   Get Webelements  id=menu-label
    Sleep   2s

    #Click Getting Exam Results to expand menu
    Click Element   ${MENULABELS}[2]

    #TODO revisit after Mobile Menu - Registered Exams is fixed
    Wait Until Page Contains Element    id=results
    #select view result from the navigation   
    Click Element    id=results

    #Click on the button to view result
    Click Element   id=button-resultListing-GCE O-LEVEL

    Sleep   5s
    ${CANDIDATE_NAME}     Get Text                  id=keyValue-candidateName-0
    ${CANDIDATE_ID}       Get Text                  id=keyValue-nricFinPassport-0
    Should Be Equal	      candidate-acs-nric-4      ${CANDIDATE_NAME}
    Should Be Equal	      S0000004A                 ${CANDIDATE_ID}


    [Teardown]    Custom Teardown