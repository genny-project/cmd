#!/bin/bash
rm -Rf ../../rulesservice/.vertx/*
TOKEN=$(./gettoken.sh )
echo "${TOKEN}"
CALLSCRIPT=./update.sh 
$CALLSCRIPT "$1"
myip=
while IFS=$': \t' read -a line ;do
    [ -z "${line%inet}" ] && ip=${line[${#line[1]}>4?1:2]} &&
        [ "${ip#127.0.0.1}" ] && myip=$ip
  done< <(LANG=C /sbin/ifconfig)


if [ -z "${myip}" ]; then
   myip=127.0.0.1
fi

if [ -z "${2}" ]; then
java -jar ../target/gebcmd-0.0.1-SNAPSHOT-jar-with-dependencies.jar -t ${TOKEN} -d $1.json -a "http://${myip}:8088/api/service"
else
  echo "not this"
#java -jar ../target/gebcmd-0.0.1-SNAPSHOT-jar-with-dependencies.jar -t ${1} -d $1.json -a "http://${myip}:8081/commander"
fi
