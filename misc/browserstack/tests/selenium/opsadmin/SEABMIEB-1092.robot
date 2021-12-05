*** Settings ***
Library    SeleniumLibrary    implicit_wait=5s
Resource    ../../../common/CustomSeleniumKeywords.robot

*** Variables ***
${URL}   %{DOMAIN}/auth/login
${username}   CandidateNricTestSample10
${hanyupinyinName}   Test1120
${nric}   S1050284E
${dateofBirth}   10/10/1988
${nationalityissueDate}   01/01/2019
${email}   cpepuser1+candidateNrictestSample10@email.com
${mobileNumber}   12341234
${telephoneContactNumber}   12341234
${houseOrBlkNo}   120
${streetName}   Block 55 test street
${floor}   10
${unit}   20
${postalCode}   540255
${foreignAddress1}   teststreet1
${foreignAddress2}   teststreet2
${foreignAddress3}   testcity
${nextOfKinName}    John
${nextOfKinContactNumber}    12341234

*** Test Cases ***
OpsAdmin Create Private Candidate

      [Setup]   Custom Setup   ${URL}

      #Set session name
      Custom Session Name   SEABMIEB-1092

      #Login as ops admin
      Custom Login   %{OPS_ADMIN}   %{OPS_ADMIN_PASSWORD}

      #Click on Accounts
      Mouse Over    id=menu-accounts

      #Click on submenu User Account Management
      Click Element   id=menu-accounts-submenu-userAccountManagement

      Sleep   5s

      #Click on the dropdown
      Click Element   id=input-select-actions

      #Select Candidate Creation from Dropdown
      Click Element   id=input-select-actions-item-CANDIDATE_ACCOUNT_CREATION

      #Input Name
      Input Text   name=name   ${username}

      #Input hanyupinyinName
      Input Text   name=hanyupinyinName   ${hanyupinyinName}

      #Input NRIC
      Input Text   name=NricFin   ${nric}

      #Input DOB
      Input Text   name=dateOfBirth   ${dateofBirth}

      #Select Gender
      Click Element   id=input-select-gender

      #Select first element in the dropdown
      Click Element   id=input-select-gender-option-0

      #Select Race
      Click Element   id=input-select-race

      #Select first element in the dropdown
      Click Element   id=input-select-race-option-1

      #Select Citizenship
      Click Element   id=input-select-citizenship

      #Select first element in the dropdown
      Click Element   id=input-select-citizenship-option-1

      #Select Nationality
      Click Element   id=input-select-nationality

      #Select first element in the dropdown
      Click Element   id=input-select-nationality-option-1

      #Select PR Status
      Click Element   id=input-select-prStatus

      #Select first element in the dropdown
      Click Element   id=input-select-prStatus-option-1

      #Select Occupation and School
      Click Element   id=input-select-occupation

      #Select first element in the dropdown
      Click Element   id=input-select-occupation-option-0

      #Select School
      Click Element   id=input-select-school

      #Select fifth element in the dropdown
      Click Element   id=input-select-school-option-5

      #Select Nationality Issue Date
      Input Text   name="nationalityIssueDate   ${nationalityissueDate}

      #Input email address
      Input Text   name=email   ${email}

      #Input Mobile Number
      Click Element   id=inputSelect-candidateProfileMobile-contactCountry

      #Select country code option
      Click Element   id=inputSelect-candidateProfileMobile-contactCountry-option-164

      #Input Telephone number
      Click Element   id=inputSelect-candidateProfileTelephone-contactCountry

      #Select country code option
      Click Element   id=inputSelect-candidateProfileTelephone-contactCountry-option-164

      #Input contact number
      Input Text   name=telephoneContactNumber   ${telephoneContactNumber}

      #Input Block number
      Input Text   name=houseOrBlkNo   ${houseOrBlkNo}

      #Input Street name
      Input Text   name=streetName   ${streetName}

      #Input floor number
      Input Text   name=floor   ${floor}

      #Input unit number
      Input Text   name=unit   ${unit}

      #Input postal code
      Input Text   name=postalCode   ${postalCode}

      #Input foreign address1
      Input Text   name=foreignAddress1   ${foreignAddress1}

      #Input foreign address2
      Input Text   name=foreignAddress2   ${foreignAddress2}

      #Input foreign address3
      Input Text   name=foreignAddress3   ${foreignAddress3}

      #Input Relationship Details
      Input Text   name=nextOfKinName   ${nextOfKinName}

      #Click on the next of Kin dropdown
      Click Element   id=input-select-nextOfKinRelationshipToCandidate

      #Select option 1 in next of Kin
      Click Element   id=input-select-nextOfKinRelationshipToCandidate-option-1

      #Click country dropdown
      Click Element   id=inputSelect-nextOfKinCountryCode-contactCountry

      #Choose option for country code
      Click Element   id=inputSelect-nextOfKinCountryCode-contactCountry-option-164

      #Inout mobile number
      Input Text   name=mobileContactNumber   ${mobileNumber}

      #Input next of Kin contact number
      Input Text   name=nextOfKinContactNumber   ${nextOfKinContactNumber}

      #Submit Candidate Details to create a new account
      Click Element    id=button-candidateProfile-submit

      Sleep   5s

      #Verify whether new account is created
      Page Should Contain   The account has been created.

      #Logout
      [Teardown]   Custom Teardown





