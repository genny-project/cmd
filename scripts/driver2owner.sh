#!/bin/bash
USER_CODE=$1
#printf "${RED}Getting OAuth2 token from Keycloak (includes access_token, refresh_token, etc):${NORMAL}\n"
KEYCLOAK_RESPONSE=`curl -s -X POST https://bouncer.channel40.com.au/auth/realms/channel40/protocol/openid-connect/token  -H "Content-Type: application/x-www-form-urlencoded" -d 'username=user1' -d 'password=password1' -d 'grant_type=password' -d 'client_id=channel40'  -d 'client_secret=03db7042-1d46-4fce-abf7-8c0349ab5478'`
#printf "$KEYCLOAK_RESPONSE \n\n"

#printf "${RED}Parsing access_token field, as we don't need the other elements:${NORMAL}\n"
TOKEN=`echo "$KEYCLOAK_RESPONSE" | jq -r '.access_token'`
echo $TOKEN
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header "Authorization: Bearer $TOKEN" -d '{  "value": "TRUE",  "attributeCode": "PRI_OWNER",  "targetCode": "'${USER_CODE}'",  "sourceCode": "PER_USER1",  "expired": false,  "refused": false,  "weight": 1.0,  "inferred": false  }' 'https://qwanda-service.channel40.com.au/qwanda/answers'
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header "Authorization: Bearer $TOKEN" -d '{  "value": "FALSE",  "attributeCode": "PRI_DRIVER",  "targetCode": "'${USER_CODE}'",  "sourceCode": "PER_USER1",  "expired": false,  "refused": false,  "weight": 1.0,  "inferred": false  }' 'https://qwanda-service.channel40.com.au/qwanda/answers'



