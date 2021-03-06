#!/bin/bash

myip=
while IFS=$': \t' read -a line ;do
    [ -z "${line%inet}" ] && ip=${line[${#line[1]}>4?1:2]} &&
        [ "${ip#127.0.0.1}" ] && myip=$ip
  done< <(LANG=C /sbin/ifconfig)


if [ -z "${myip}" ]; then
   myip=127.0.0.1
fi
#myip=192.168.64.6

KEYCLOAK_RESPONSE=`curl -s -X POST http://${myip}:8180/auth/realms/genny/protocol/openid-connect/token  -H "Content-Type: application/x-www-form-urlencoded" -d 'username=user1' -d 'password=password1' -d 'grant_type=password' -d 'client_id=genny'  -d 'client_secret=056b73c1-7078-411d-80ec-87d41c55c3b4'`
TOKEN=`echo "$KEYCLOAK_RESPONSE" | jq -r '.access_token'`
printf "${TOKEN} \n\n"

#TOKEN=$(./gettoken.sh )
#echo "${TOKEN}"
#CALLSCRIPT=./update.sh 
#$CALLSCRIPT "$1"
echo ""
echo "curl -S -v -H 'Bearer: ${TOKEN}' http://${myip}:8280/qwanda/answers"
curl -X POST --header "Content-Type: application/json" -H "Authorization: Bearer $TOKEN"  --header "Accept: application/json" -d '{  "created": "2016-06-30T15:41:12",  "value": TRUE,  "expired": false,  "refused": false,  "weight": 1,  "targetCode": "BEG_BEGONE",  "sourceCode": "PER_USER1",  "attributeCode": "PRI_EDU_PROVIDER_ACCEPTED"  }' "http://${myip}:8280/qwanda/answers"
echo "hello"
