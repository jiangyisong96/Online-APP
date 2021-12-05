#!/bin/sh
docker kill $(docker ps -q)
docker run -e "SERVICES=s3,sqs,secretsmanager,sns" -e "DATA_DIR=/tmp/localstack/data" -p 0.0.0.0:4566:4566/tcp -p 0.0.0.0:4571:4571/tcp -p 0.0.0.0:5678:5678/tcp -p 0.0.0.0:8080:8080/tcp localstack/localstack:0.12.13 &

sudo systemctl restart rc-local.service
echo "systemctl restart successful"
cd /
cd /vagrant/misc/localstack/

awslocal sqs delete-queue --queue-url http://192.168.101.10:4566/000000000000/candidate-service-sftp-queue
awslocal sqs delete-queue --queue-url http://192.168.101.10:4566/000000000000/candidate-financial-event-queue
awslocal sqs delete-queue --queue-url http://192.168.101.10:4566/000000000000/candidate-user-event-queue

awslocal s3 rb s3://template --force
awslocal s3 rb s3://dirty --force
awslocal s3 rb s3://clean --force
awslocal s3 rb s3://quarantine --force
awslocal s3 rb s3://results --force
awslocal s3 rb s3://sftp --force
awslocal s3 rb s3://captcha --force
awslocal s3 rb s3://application --force

#Not working for some reason
awslocal secretsmanager delete-secret --secret-id="quartzSecretId" --force-delete-without-recovery
awslocal secretsmanager delete-secret --secret-id="captchaSiteKeyId" --force-delete-without-recovery
awslocal secretsmanager delete-secret --secret-id="captchaApiKeyId" --force-delete-without-recovery

awslocal s3 mb s3://template
awslocal s3 mb s3://dirty
awslocal s3 mb s3://clean
awslocal s3 mb s3://quarantine
awslocal s3 mb s3://results
awslocal s3 mb s3://sftp
awslocal s3 mb s3://captcha
awslocal s3 mb s3://application

awslocal sqs create-queue --queue-name document-service-clean-queue
awslocal sqs create-queue --queue-name document-service-quarantine-queue
awslocal sqs create-queue --queue-name document-service-results-queue
awslocal sqs create-queue --queue-name candidate-service-sftp-queue
awslocal sqs create-queue --queue-name candidate-service-financial-event-queue
awslocal sqs create-queue --queue-name candidate-user-event-queue
awslocal sqs create-queue --queue-name reporting-service-financial-event-queue

awslocal sns create-topic --name financial-event
awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:000000000000:financial-event --protocol sqs --notification-endpoint http://localhost:4566/000000000000/reporting-service-financial-event-queue
awslocal sns subscribe --topic-arn arn:aws:sns:us-east-1:000000000000:financial-event --protocol sqs --notification-endpoint http://localhost:4566/000000000000/candidate-service-financial-event-queue

awslocal s3api put-bucket-cors --bucket clean --cors-configuration file://cors.json
awslocal s3api put-bucket-cors --bucket dirty --cors-configuration file://cors.json
awslocal s3api put-bucket-cors --bucket quarantine --cors-configuration file://cors.json
awslocal s3api put-bucket-cors --bucket template --cors-configuration file://cors.json
awslocal s3api put-bucket-cors --bucket results --cors-configuration file://cors.json

awslocal s3api put-bucket-notification-configuration --bucket clean --notification-configuration file://notification_clean.json
awslocal s3api put-bucket-notification-configuration --bucket quarantine --notification-configuration file://notification_quarantine.json
awslocal s3api put-bucket-notification-configuration --bucket results --notification-configuration file://notification_results.json
awslocal s3api put-bucket-notification-configuration --bucket sftp --notification-configuration file://notification_sftp.json

find ./template/ -type f -name "*.*" -print0 | sort -z | xargs -0 -I ARGS sh -c '{ awslocal s3 cp ARGS s3://template;}'

awslocal secretsmanager create-secret --name="quartzSecretId" --secret-string="4b6d900e-7050-4957-ad60-28e765cb4a24"

#awslocal s3 cp ./sftp/XE2_CP_GCE_CDDT_SUBJRESULT_2019_N_YE_A_20210518_110915.TXT s3://sftp
#awslocal s3 cp ./sftp/XE2_CP_GCE_CDDTREG_2019_N_YE_A_20210518_105639.TXT s3://sftp
#awslocal s3 cp ./sftp/XE2_CP_GCE_SUBJPAPER_2019_20210617_100057.TXT s3://sftp
#awslocal s3 cp ./sftp/XE2_CP_PSLE_AGGREGATE_2021_20210908_223121.TXT s3://sftp

awslocal s3 cp ./captcha/siteKey.txt s3://captcha
awslocal s3 cp ./captcha/apiKey.txt s3://captcha

awslocal secretsmanager create-secret --name="captchaSiteKeyId" --secret-string=$(awslocal s3 cp s3://captcha/siteKey.txt -)
awslocal secretsmanager create-secret --name="captchaApiKeyId" --secret-string=$(awslocal s3 cp s3://captcha/apiKey.txt - | base64 --decode)

awslocal s3 rb s3://captcha --force

exit 0
