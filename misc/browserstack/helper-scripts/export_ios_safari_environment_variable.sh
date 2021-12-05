#!/bin/sh

# this file exports all environment variables to the current shell
# use the command "source ./export_windows_chrome_environment_variable.sh" to export the below variables to the current shell
echo "exporting environment variables from export_ios_safari_environment_variables.sh"

# at browserstack, tests ran with the same BUILD_NUMBER will be grouped together
export BUILD_NUMBER="build-"$BUILD_COUNTER

# domain env variable that should be used in robot test script
#export DOMAIN=https://seab_sit:hhGdlq58fj4BG9WxOCIH4AA3@sit.myexams.seab.gov.sg
export DOMAIN=https://seab_cat:S8n9Rpe7DgefL7FGxFrTJRXz@cat.myexams.seab.gov.sg

# OS + Browser Type
export TYPE=ios_safari
export OS=mac

#Administrative Account
export APPLICATION_ADMIN_USERNAME=ApplicationAdmin
export APPLICATION_ADMIN_PASSWORD=P@ssw0rd1234

#Coordinator Account
export ITE_COORDINATOR_USERNAME=ITECoordinator
export ITE_COORDINATOR_PASSWORD=P@ssw0rd1234

export HCI_COORDINATOR_USERNAME=HCICoordinator
export HCI_COORDINATOR_PASSWORD=P@ssw0rd1234

export PEB_COORDINATOR_USERNAME=PEBCoordinator
export PEB_COORDINATOR_PASSWORD=P@ssw0rd1234

export ACS_COORDINATOR_USERNAME=ACSCoordinator
export ACS_COORDINATOR_PASSWORD=P@ssw0rd1234

export SJI_COORDINATOR_USERNAME=SjiCoordinator
export SJI_COORDINATOR_PASSWORD=P@ssw0rd1234

#Candidate Account
export SINGPASS_USER_1=S3001964D
export SINGPASS_PASSWORD=Spcp1111

export CANDIDATE_ACS_NRIC_SC=S1110607E
export CANDIDATE_ACS_NRIC_PR=S1110617E
export CANDIDATE_ACS_NRIC_IS=S1110627E

export CANDIDATE_SJI_NRIC_SC=S1110667E
export CANDIDATE_SJI_NRIC_SC2=S1110677E

export CANDIDATE_ITE_NRIC_SC=S1110397E
export CANDIDATE_ITE_NRIC_PR=S1110407E
export CANDIDATE_ITE_NRIC_IS=S1110417E

export CANDIDATE_PEB_NRIC_SC=S1110427E
export CANDIDATE_PEB_NRIC_PR=S1110437E
export CANDIDATE_PEB_NRIC_IS=S1110447E

export CANDIDATE_ITE_USERNAME=candidateUat717
export CANDIDATE_ITE_PASSWORD=P@ssw0rd1234

export CANDIDATE_ACS_USERNAME=candidateUat727
export CANDIDATE_ACS_PASSWORD=P@ssw0rd1234

export CANDIDATE_HCI_USERNAME=candidateUat697
export CANDIDATE_HCI_PASSWORD=P@ssw0rd1234

export CANDIDATE_YRS_USERNAME=candidateUat707
export CANDIDATE_YRS_PASSWORD=P@ssw0rd1234
