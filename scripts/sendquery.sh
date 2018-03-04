#!/bin/bash

myip=
while IFS=$': \t' read -a line ;do
    [ -z "${line%inet}" ] && ip=${line[${#line[1]}>4?1:2]} &&
        [ "${ip#127.0.0.1}" ] && myip=$ip
  done< <(LANG=C /sbin/ifconfig)


if [ -z "${myip}" ]; then
   myip=127.0.0.1
fi
#myip=localhost

KEYCLOAK_RESPONSE=`curl -s -X POST http://${myip}:8180/auth/realms/genny/protocol/openid-connect/token  -H "Content-Type: application/x-www-form-urlencoded" -d 'username=user1' -d 'password=password1' -d 'grant_type=password' -d 'client_id=curl'  -d 'client_secret=056b73c1-7078-411d-80ec-87d41c55c3b4'`
TOKEN=`echo "$KEYCLOAK_RESPONSE" | jq -r '.access_token'`
printf "${TOKEN} \n\n"

#TOKEN=$(./gettoken.sh )
#echo "${TOKEN}"
#CALLSCRIPT=./update.sh 
#$CALLSCRIPT "$1"
echo ""
echo "curl -S -v -H 'Bearer: ${TOKEN}' http://${myip}:8280/qwanda/baseentitys/PER_USER1"
curl -S -v  -k  -H "Authorization: Bearer $TOKEN"  "http://localhost:8280/qwanda/baseentitys/PER_USER1"
#curl -S -v  -k  -H "Authorization: Bearer $TOKEN"  "http://${myip}:8280/qwanda/baseentitys/PER_USER1"
echo ""

