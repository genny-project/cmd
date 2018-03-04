#!/bin/bash
HQLFILE=$1
myip=
while IFS=$': \t' read -a line ;do
    [ -z "${line%inet}" ] && ip=${line[${#line[1]}>4?1:2]} &&
        [ "${ip#127.0.0.1}" ] && myip=$ip
  done< <(LANG=C /sbin/ifconfig)


if [ -z "${myip}" ]; then
   myip=127.0.0.1
fi


TOKEN=$(./gettoken.sh )

echo $TOKEN
curl -sS   -X POST   \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" --data-binary @${HQLFILE} \
 http://localhost:8280/qwanda/baseentitys/search2  | jq -C

