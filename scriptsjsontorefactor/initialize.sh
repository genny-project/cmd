#!/bin/bash
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

if [ -z "${1}" ]; then
java -jar target/gebcmd-0.0.1-SNAPSHOT-jar-with-dependencies.jar -t ${TOKEN} -d init.json  -a "http://${myip}:8081/commander"
else
java -jar target/gebcmd-0.0.1-SNAPSHOT-jar-with-dependencies.jar -t ${1} -d init.json  -a "http://${myip}:8081/commander"
fi
