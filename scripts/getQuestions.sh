#!/bin/bash
KEYCLOAK_RESPONSE=`curl -s -X POST https://bouncer-staging.outcome-hub.com/auth/realms/internmatch/protocol/openid-connect/token  -H "Content-Type: application/x-www-form-urlencoded" -d 'username=adamcrow63@gmail.com' -d 'password=asdf1234' -d 'grant_type=password' -d 'client_id=internmatch'  -d 'client_secret=dc7d0960-2e1d-4a78-9eef-77678066dbd3'`
#printf "$KEYCLOAK_RESPONSE \n\n"

#printf "${RED}Parsing access_token field, as we don't need the other elements:${NORMAL}\n"
TOKEN=`echo "$KEYCLOAK_RESPONSE" | jq -r '.access_token'`
echo $TOKEN
curl -X GET --header 'Accept: application/json'  --header "Authorization: Bearer $TOKEN" 'https://api-internmatch-staging.outcome-hub.com/qwanda/baseentitys/PER_ADAMCROW63_AT_GMAILCOM/asks2/QUE_ADD_INTERNSHIP_STEP_ONE_GRP/PER_ADAMCROW63_AT_GMAILCOM'