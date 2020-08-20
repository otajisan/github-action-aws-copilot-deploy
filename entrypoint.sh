#!/bin/sh -l

#AWS_REGION=$1
#AWS_ACCESS_KEY=$2
#AWS_SECRET_KEY=$3
#APP=$4
#SVC=$5
#TAG=$6
#AWS_ACCOUNT=$7

APP=$1
SVC=$2
TAG=$3

RUN mkdir /copilot-ci
WORKDIR /copilot-ci


#echo "::add-mask::${AWS_ACCOUNT}"
#echo "::add-mask::${AWS_ACCESS_KEY}"
#echo "::add-mask::${AWS_SECRET_KEY}"

# AWS profile and credential settings
#mkdir -p $HOME/.aws
#printf "[default]\nregion = $AWS_REGION\n" > $HOME/.aws/config
#printf "[default]\naws_access_key_id=$AWS_ACCESS_KEY\naws_secret_access_key=$AWS_SECRET_KEY\n" > $HOME/.aws/credentials

copilot -h

# debug
copilot svc ls
copilot app ls

if [ -z `copilot svc ls | grep $SVC` ]; then
  echo "service not found. please make service initially."
  echo "e.g.) $ copilot init"
#  copilot init \
#  --app $APP \
#  --svc $SVC \
#  --svc-type 'Load Balanced Web Service' \
#  --dockerfile './Dockerfile' \
#  --tag $TAG \
#  --deploy \
#  > /dev/null
  exit 1
else
  echo "service $SVC is found. start deploy by copilot."
  copilot svc deploy --name $SVC --env test
fi

exit 0
