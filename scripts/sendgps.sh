#!/bin/bash
NUM=$1
TOKEN=$(./gettoken.sh )
echo "${TOKEN}"
myip=
while IFS=$': \t' read -a line ;do
    [ -z "${line%inet}" ] && ip=${line[${#line[1]}>4?1:2]} &&
        [ "${ip#127.0.0.1}" ] && myip=$ip
  done< <(LANG=C /sbin/ifconfig)


if [ -z "${myip}" ]; then
   myip=127.0.0.1
fi

if [ -z "${2}" ]; then
echo "HERE ${1}"
cp -f jsons/gps2.json jsons/gps2-temp.json
sed -i '' -e  's|@@@@|'"${NUM}"'|g' jsons/gps2-temp.json
java -jar ../target/gebcmd-0.0.1-SNAPSHOT-jar-with-dependencies.jar -t ${TOKEN} -d jsons/gps2-temp.json -a "http://${myip}:8088/api/service"
else
  echo "not this"
fi
