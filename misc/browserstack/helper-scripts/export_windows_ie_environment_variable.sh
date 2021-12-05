#!/bin/sh

# this file exports all environment variables to the current shell
# use the command "source ./export_windows_chrome_environment_variable.sh" to export the below variables to the current shell
echo "exporting environment variables from export_windows_ie_environment_variables.sh"

# at browserstack, tests ran with the same BUILD_NUMBER will be grouped together
CURRENTDATE=`date +"%Y-%m-%d-%H%M%S"`
export BUILD_NUMBER="Test-Windows-ie-"$CURRENTDATE

# domain env variable that should be used in robot test script
#export DOMAIN=https://seab_sit:hhGdlq58fj4BG9WxOCIH4AA3@sit.myexams.seab.gov.sg
export DOMAIN=https://seab_cat:S8n9Rpe7DgefL7FGxFrTJRXz@cat.myexams.seab.gov.sg

# OS + Browser Type
export TYPE=windows_ie
export OS=windows

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

export CANDIDATE_ACS_NRIC_SC=S1110602E
export CANDIDATE_ACS_NRIC_PR=S1110612E
export CANDIDATE_ACS_NRIC_IS=S1110622E

export CANDIDATE_SJI_NRIC_SC=S1110662E
export CANDIDATE_SJI_NRIC_SC2=S1110672E

export CANDIDATE_ITE_NRIC_SC=S1110392E
export CANDIDATE_ITE_NRIC_PR=S1110402E
export CANDIDATE_ITE_NRIC_IS=S1110412E

export CANDIDATE_PEB_NRIC_SC=S1110422E
export CANDIDATE_PEB_NRIC_PR=S1110432E
export CANDIDATE_PEB_NRIC_IS=S1110442E

export CANDIDATE_ITE_USERNAME=candidateUat712
export CANDIDATE_ITE_PASSWORD=P@ssw0rd1234

export CANDIDATE_ACS_USERNAME=candidateUat722
export CANDIDATE_ACS_PASSWORD=P@ssw0rd1234

export CANDIDATE_HCI_USERNAME=candidateUat692
export CANDIDATE_HCI_PASSWORD=P@ssw0rd1234

export CANDIDATE_YRS_USERNAME=candidateUat702
export CANDIDATE_YRS_PASSWORD=P@ssw0rd1234

# candidateNric to be blocked/unblocked
export  CANDIDATE_ID_NRIC=S0000002A

#candidate SP to be blocked/unblocked
export   CANDIDATE_SP_NRIC=S3001967I

#candidate SP to be blocked/unblocked
export   CANDIDATE_SP_NRIC=S3001967I

#cordinator to be blocked/unblocked
export   COORDINATOR_NAME=acs_coordinator1
