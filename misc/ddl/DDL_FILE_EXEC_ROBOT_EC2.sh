#!/bin/bash

TARGET_DATA_FOLDER="data-robot"
IFS=';'

echo Start execute robot addition ddl scripts.

#Release 1
for x in $TARGET_DATA_FOLDER
do
    t="./TARGET_DATA_FOLDER/03-RELEASE-202111/MYSQL_FILE_EXEC_EC2.sh"
    source "${t/TARGET_DATA_FOLDER/$x}"
done

echo Done execute ddl script.