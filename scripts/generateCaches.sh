#!/bin/bash
myip=keycloak.genny.life
KEYCLOAK_RESPONSE=`curl -s -X POST http://${myip}:8180/auth/realms/genny/protocol/openid-connect/token  -H "Content-Type: application/x-www-form-urlencoded" -d 'username=adamcrow63@gmail.com' -d 'password=asdf1234' -d 'grant_type=password' -d 'client_id=genny'  -d 'client_secret=056b73c1-7078-411d-80ec-87d41c55c3b4'`
printf "$KEYCLOAK_RESPONSE \n\n"

TOKEN=`echo "$KEYCLOAK_RESPONSE" | jq -r '.access_token'`

curl -k -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header "Authorization: Bearer $TOKEN" -d '{  "msg_type":"EVT_MSG", "event_type":"FOCUS_RULE_GROUP", "data":{ "code":"GenerateBucketCaches" }   }' 'http://keycloak.genny.life:8088/api/service'

