#!/bin/bash
myip=keycloak.genny.life
TOKEN=$(./gettoken.sh )
echo "${TOKEN}"
#CALLSCRIPT=./update.sh 
#$CALLSCRIPT "$1"
echo ""
echo "curl -S -v -H 'Bearer: ${TOKEN}' http://${myip}:8280/qwanda/answers"
curl -X POST --header "Content-Type: application/json" -H "Authorization: Bearer $TOKEN"  --header "Accept: application/json" -d '{  "created": "2018-07-19T15:41:12",  "value": "288.0",  "expired": false,  "refused": false,  "weight": 1,  "targetCode": "TIB_DUMMY1",  "sourceCode": "RPI_DUMMY2",  "attributeCode": "PRI_TEMPERATURE_K"  }' "http://${myip}:8280/qwanda/answers"
echo ""

