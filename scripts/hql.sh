#!/bin/bash
HQLFILE=$1

KEYCLOAK_RESPONSE=`curl -s -X POST http://keycloak.genny.life:8180/auth/realms/genny/protocol/openid-connect/token  -H "Content-Type: application/x-www-form-urlencoded" -d 'username=user1' -d 'password=password1' -d 'grant_type=password' -d 'client_id=genny'  -d 'client_secret=056b73c1-7078-411d-80ec-87d41c55c3b4'`
#printf "$KEYCLOAK_RESPONSE \n\n"

#printf "${RED}Parsing access_token field, as we don't need the other elements:${NORMAL}\n"
TOKEN=`echo "$KEYCLOAK_RESPONSE" | jq -r '.access_token'`
echo $TOKEN
curl -sS   -X POST   \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" --data-binary @${HQLFILE} \
 http://keycloak.genny.life:8280/qwanda/baseentitys/search2  | jq -C

