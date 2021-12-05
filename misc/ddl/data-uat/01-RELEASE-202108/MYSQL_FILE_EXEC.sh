#!/bin/bash

#Retrieve the script path by cd to the script path.
SCRIPT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
#Back to previous path location.
p1=$(readlink -f "$0")
p2=$(dirname "$p1")
cd $p2

MYSQL_CONFIG_PATH="$SCRIPT_PATH/MYSQL.conf"

echo Start execute sql script under $SCRIPT_PATH.
find $SCRIPT_PATH -type f -name "*.sql" -print0 | sort -z | xargs -0 -I ARGS sh -c '{ echo Executing ARGS; mysql --defaults-extra-file=$0 < ARGS;}' $MYSQL_CONFIG_PATH
echo Done execute sql script under $SCRIPT_PATH.