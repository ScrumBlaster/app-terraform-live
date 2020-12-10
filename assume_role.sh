#!/bin/bash


ROLE_ARN=`arn:aws:iam::xxxxxxxxxxxx:role/xxxxxxxxxxxx` | sleep 1

CREDENTIALS=`aws sts assume-role --role-arn ${ROLE_ARN} --role-session-name RoleSession --duration-seconds 3600 --output=json` | sleep 5
export ORIGINAL_AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} | sleep 1
export ORIGINAL_AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} | sleep 1
export AWS_DEFAULT_REGION=eu-central-1 | sleep 1
export AWS_ACCESS_KEY_ID=`echo ${CREDENTIALS} | jq -r '.Credentials.AccessKeyId'` | sleep 1
export AWS_SECRET_ACCESS_KEY=`echo ${CREDENTIALS} | jq -r '.Credentials.SecretAccessKey'` | sleep 1
export AWS_SESSION_TOKEN=`echo ${CREDENTIALS} | jq -r '.Credentials.SessionToken'` | sleep 1
export AWS_EXPIRATION=`echo ${CREDENTIALS} | jq -r '.Credentials.Expiration'` | sleep 1
aws sts get-caller-identity
