#!/bin/bash
HQLFILE=jsons/$1.json
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
#curl  -X POST   \
#  -H "Content-Type: application/json" \
#   --data-binary @${HQLFILE} \
# http://localhost:8083/graphql  

curl -sS   -X POST   \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN" --data-binary @${HQLFILE} \
 http://localhost:8083/graphql  | jq -C
