#!/bin/sh -l

AWS_REGION=$1
AWS_ACCESS_KEY=$2
AWS_SECRET_KEY=$3
APP=$4
SVC=$5
TAG=$6

WORKDIR /copilot-ci

# AWS profile and credential settings
mkdir -p $HOME/.aws
printf "[default]\nregion = $AWS_REGION\n" > $HOME/.aws/config
printf "[default]\naws_access_key_id=$AWS_ACCESS_KEY\naws_secret_access_key=$AWS_SECRET_KEY\n" > $HOME/.aws/credentials

copilot -h

copilot init \
  --app $APP \
  --svc $SVC \
  --svc-type 'Load Balanced Web Service' \
  --dockerfile './Dockerfile' \
  --tag $TAG \
  --deploy