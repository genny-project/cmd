#!/bin/bash
BEFILE=$1
#printf "${RED}Getting OAuth2 token from Keycloak (includes access_token, refresh_token, etc):${NORMAL}\n"
KEYCLOAK_RESPONSE=`curl -s -X POST https://bouncer.channel40.com.au/auth/realms/channel40/protocol/openid-connect/token  -H "Content-Type: application/x-www-form-urlencoded" -d 'username=adamcrow63@gmail.com' -d 'password=asdf1234' -d 'grant_type=password' -d 'client_id=channel40'  -d 'client_secret=03db7042-1d46-4fce-abf7-8c0349ab5478'`
#printf "$KEYCLOAK_RESPONSE \n\n"

#printf "${RED}Parsing access_token field, as we don't need the other elements:${NORMAL}\n"
TOKEN=`echo "$KEYCLOAK_RESPONSE" | jq -r '.access_token'`
echo $TOKEN
curl -sS   -X POST   \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" --data-binary @${BEFILE} \
 https://qwanda-service.channel40.com.au/qwanda/baseentitys/search  | jq -C

