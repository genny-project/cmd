#!/bin/bash
BEFILE=$1
#printf "${RED}Getting OAuth2 token from Keycloak (includes access_token, refresh_token, etc):${NORMAL}\n"
KEYCLOAK_RESPONSE=`curl -s -X POST https://keycloak.genny.life/auth/realms/genny/protocol/openid-connect/token  -H "Content-Type: application/x-www-form-urlencoded" -d 'username=user1' -d 'password=WelcomeToTheTruck121!!' -d 'grant_type=password' -d 'client_id=genny'  -d 'client_secret=03db7042-1d46-4fce-abf7-8c0349ab5478'`
#printf "$KEYCLOAK_RESPONSE \n\n"

#printf "${RED}Parsing access_token field, as we don't need the other elements:${NORMAL}\n"
TOKEN=`echo "$KEYCLOAK_RESPONSE" | jq -r '.access_token'`
echo $TOKEN
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header "Authorization: Bearer $TOKEN" -d '{  "value": "https://uppych40.alyson.genny.life",  "attributeCode": "PRI_UPPY_URL",  "targetCode": "PRJ_GENNY",  "sourceCode": "PER_USER1",  "expired": false,  "refused": false,  "weight": 1.0,  "inferred": false  }' 'https://qwanda-service.alyson.genny.life/qwanda/answers'



