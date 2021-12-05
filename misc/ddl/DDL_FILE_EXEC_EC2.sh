#!/bin/bash

TARGET_DATA_FOLDER="data-master"
IFS=';'

#Check env
VAR_ENV_NAME=$(aws --region ap-southeast-1 ssm get-parameter --name "/config/cpep/ENV_NAME" --output text --query Parameter.Value)
if [[ ${VAR_ENV_NAME} == 'cat' ]]
  then TARGET_DATA_FOLDER=data-robot
elif [[ ${VAR_ENV_NAME} == 'sit' ]]
  then TARGET_DATA_FOLDER=data-master
elif [[ ${VAR_ENV_NAME} == 'uat' ]]
  then TARGET_DATA_FOLDER=data-uat
elif [[ ${VAR_ENV_NAME} == 'perf' ]]
  then TARGET_DATA_FOLDER=data-spt
fi

echo Start execute ddl script.

#Release 1
source "./schema/01-RELEASE-202108/MYSQL_FILE_EXEC_EC2.sh"
for x in $TARGET_DATA_FOLDER
do
    t="./TARGET_DATA_FOLDER/01-RELEASE-202108/MYSQL_FILE_EXEC_EC2.sh"
    source "${t/TARGET_DATA_FOLDER/$x}"
done

#Release 1.1
source "./schema/02-RELEASE-202110/MYSQL_FILE_EXEC_EC2.sh"
for x in $TARGET_DATA_FOLDER
do
    t="./TARGET_DATA_FOLDER/02-RELEASE-202110/MYSQL_FILE_EXEC_EC2.sh"
    source "${t/TARGET_DATA_FOLDER/$x}"
done

#Release 1.2 additional tables and data change
source "./schema/03-RELEASE-202111/MYSQL_FILE_EXEC_EC2.sh"
for x in $TARGET_DATA_FOLDER
do
    t="./TARGET_DATA_FOLDER/03-RELEASE-202111/MYSQL_FILE_EXEC_EC2.sh"
    source "${t/TARGET_DATA_FOLDER/$x}"
done

#Release 2
source "./schema/04-RELEASE-202202/MYSQL_FILE_EXEC_EC2.sh"
for x in $TARGET_DATA_FOLDER
do
    t="./TARGET_DATA_FOLDER/04-RELEASE-202202/MYSQL_FILE_EXEC_EC2.sh"
    source "${t/TARGET_DATA_FOLDER/$x}"
done

echo Done execute ddl script.