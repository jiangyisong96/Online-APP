#!/bin/bash

TARGET_DATA_FOLDER="data-master"
IFS=';'

echo Start execute ddl script.

#Release 1
source "./schema/01-RELEASE-202108/MYSQL_FILE_EXEC.sh"
for x in $TARGET_DATA_FOLDER
do
    t="./TARGET_DATA_FOLDER/01-RELEASE-202108/MYSQL_FILE_EXEC.sh"
    source "${t/TARGET_DATA_FOLDER/$x}"
done

#Release 1.1
source "./schema/02-RELEASE-202110/MYSQL_FILE_EXEC.sh"
for x in $TARGET_DATA_FOLDER
do
    t="./TARGET_DATA_FOLDER/02-RELEASE-202110/MYSQL_FILE_EXEC.sh"
    source "${t/TARGET_DATA_FOLDER/$x}"
done

#Release 1.2 additional tables and data change
source "./schema/03-RELEASE-202111/MYSQL_FILE_EXEC.sh"
for x in $TARGET_DATA_FOLDER
do
    t="./TARGET_DATA_FOLDER/03-RELEASE-202111/MYSQL_FILE_EXEC.sh"
    source "${t/TARGET_DATA_FOLDER/$x}"
done

#Release 2
source "./schema/04-RELEASE-202202/MYSQL_FILE_EXEC.sh"
for x in $TARGET_DATA_FOLDER
do
    t="./TARGET_DATA_FOLDER/04-RELEASE-202202/MYSQL_FILE_EXEC.sh"
    source "${t/TARGET_DATA_FOLDER/$x}"
done

echo Done execute ddl script.