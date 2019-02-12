#!/bin/bash
KEYCLOAK_RESPONSE=`curl -s -X POST https://bouncer-staging.outcome-hub.com/auth/realms/internmatch/protocol/openid-connect/token  -H "Content-Type: application/x-www-form-urlencoded" --data-urlencode 'username=adamcrow63@gmail.com' --data-urlencode 'password=asdf1234' -d 'grant_type=password' -d 'client_id=internmatch'  -d 'client_secret=dc7d0960-2e1d-4a78-9eef-77678066dbd3'`
printf "kc = $KEYCLOAK_RESPONSE \n\n"

TOKEN=`echo "$KEYCLOAK_RESPONSE" | jq -r '.access_token'`
echo $TOKEN

curl -k -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header "Authorization: Bearer $TOKEN"  -d @jsons/send_be_theme_padding.json 'https://bridge-internmatch-staging.outcome-hub.com/api/service?channel=webdata'
