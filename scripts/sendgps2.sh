#!/bin/bash
keycloakUrl=$1
serviceUrl=$2
LAT=$3
LONG=$4

TOKEN=$(./gettoken2.sh ${keycloakUrl} )
echo "${TOKEN}"

#cp -f jsons/gps3.json jsons/gps3-temp.json
#sed -i '' -e  's|@@@@|'"${LAT}"'|g' jsons/gps3-temp.json
#sed -i '' -e  's|%%%%|'"${LONG}"'|g' jsons/gps3-temp.json
#java -jar ../target/gebcmd-0.0.1-SNAPSHOT-jar-with-dependencies.jar -t ${TOKEN} -d jsons/gps3-temp.json -a "${serviceUrl}"
