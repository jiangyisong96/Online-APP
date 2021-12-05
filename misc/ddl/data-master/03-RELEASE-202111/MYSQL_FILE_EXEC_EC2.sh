#!/bin/bash

#Retrieve the script path by cd to the script path.
SCRIPT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
#Back to previous path location.
p1=$(readlink -f "$0")
p2=$(dirname "$p1")
cd $p2

echo Start execute sql script under $SCRIPT_PATH.
find $SCRIPT_PATH -type f -name "*.sql" -print0 | sort -z | xargs -0 -I ARGS sh -c "{ echo Executing ARGS; mysql \
  -h $(aws --region ap-southeast-1 ssm get-parameter --name '/config/cpep/DB_HOST' --output text --query Parameter.Value) \
  -P 3306 \
  -u $(aws --region ap-southeast-1 ssm get-parameter --name '/config/cpep/DB_USERNAME' --output text --query Parameter.Value) \
  -p$(aws --region ap-southeast-1 ssm get-parameter --name '/config/cpep/DB_PW' --output text --query Parameter.Value --with-decryption) < ARGS;}"
echo Done execute sql script under $SCRIPT_PATH.