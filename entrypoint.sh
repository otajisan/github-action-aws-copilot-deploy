#!/bin/sh -l

SVC=$1
TAG=$2

copilot -h

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
  copilot svc deploy \
  --name $SVC \
  --tag $TAG \
  --env test
fi

exit 0
