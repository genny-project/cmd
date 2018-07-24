#!/bin/bash
BEFILE=$1
#printf "${RED}Getting OAuth2 token from Keycloak (includes access_token, refresh_token, etc):${NORMAL}\n"
KEYCLOAK_RESPONSE=`curl -s -X POST http://keycloak.genny.life:8180/auth/realms/genny/protocol/openid-connect/token  -H "Content-Type: application/x-www-form-urlencoded" -d 'username=user1' -d 'password=password1' -d 'grant_type=password' -d 'client_id=genny'  -d 'client_secret=056b73c1-7078-411d-80ec-87d41c55c3b4'`
#printf "$KEYCLOAK_RESPONSE \n\n"

#printf "${RED}Parsing access_token field, as we don't need the other elements:${NORMAL}\n"
TOKEN=`echo "$KEYCLOAK_RESPONSE" | jq -r '.access_token'`
echo $TOKEN
curl -X POST --header 'Content-Type: application/json' --header 'Accept: application/json' --header "Authorization: Bearer $TOKEN" -d '{  "value": "295168",  "attributeCode": "PRI_PRODUCT_CATEGORY_TAG_IN_BITS",  "targetCode": "PER_SHARONCROW66_AT_GMAILCOM",  "sourceCode": "PER_USER1",  "expired": false,  "refused": false,  "weight": 1.0,  "inferred": false  }' 'http://keycloak.genny.life:8280/qwanda/answers'
