#!/bin/bash
if [ -z "${1}" ]; then
  echo "usage: ./synch-layouts.sh <realm>"
  exit;
else
 echo "sync layouts"
fi
realm=$1
TOKEN=$(./gettoken.sh )
echo "${TOKEN}"
echo $TOKEN
curl -X GET --header 'Accept: application/json'  --header "Authorization: Bearer $TOKEN" "http://qwanda-service.genny.life/service/synchronizelayouts?realm=${realm}&branch=master"


