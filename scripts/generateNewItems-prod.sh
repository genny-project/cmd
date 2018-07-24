#!/bin/bash

KEYCLOAK_RESPONSE=`curl -s -X POST https://keycloak.genny.life/auth/realms/genny/protocol/openid-connect/token  -H "Content-Type: application/x-www-form-urlencoded" -d 'username=adamcrow63@gmail.com' -d 'password=asdf1234' -d 'grant_type=password' -d 'client_id=genny'  -d 'client_secret=03db7042-1d46-4fce-abf7-8c0349ab5478'`
printf "$KEYCLOAK_RESPONSE \n\n"

TOKEN=`echo "$KEYCLOAK_RESPONSE" | jq -r '.access_token'`

curl -k -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header "Authorization: Bearer $TOKEN" -d '{  "msg_type":"EVT_MSG", "event_type":"FOCUS_RULE_GROUP", "data":{ "code":"GenerateNewItems" }   }' 'https://bridge-v3.alyson.genny.life/api/service'

