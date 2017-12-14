#!/bin/bash
myip=
while IFS=$': \t' read -a line ;do
    [ -z "${line%inet}" ] && ip=${line[${#line[1]}>4?1:2]} &&
        [ "${ip#127.0.0.1}" ] && myip=$ip
  done< <(LANG=C /sbin/ifconfig)


if [ -z "${myip}" ]; then
   myip=127.0.0.1
fi


TOKEN=$(./gettoken.sh )
CALLSCRIPT=./update.sh 
$CALLSCRIPT "$1"
TOKEN2=`echo "${TOKEN%?}"`
cp -f jsons/$1.json jsons/$1-token.json
sed -i '' -e  's|TTOKENN|'"${TOKEN2}"'|g' jsons/${1}-token.json 

java -jar ../target/gebcmd-0.0.1-SNAPSHOT-jar-with-dependencies.jar -t ${TOKEN} -d jsons/$1-token.json -a "http://${myip}:8088/api/data"

rm -f jsons/$1-token.json
