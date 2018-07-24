#!/bin/bash
key=$1
myip=
while IFS=$': \t' read -a line ;do
    [ -z "${line%inet}" ] && ip=${line[${#line[1]}>4?1:2]} &&
        [ "${ip#127.0.0.1}" ] && myip=$ip
  done< <(LANG=C /sbin/ifconfig)


if [ -z "${myip}" ]; then
   myip=127.0.0.1
fi
if [[ "$OSTYPE" == "linux-gnu" ]]; then
        SEDFIX=
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
        SEDFIX='""'
elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
        SEDFIX=
elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
        SEDFIX=
elif [[ "$OSTYPE" == "win32" ]]; then
        # I'm not sure this can happen.
        SEDFIX=
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        # ...
        SEDFIX=
else
        # Unknown.
        SEDFIX=
fi
#printf "${RED}Getting OAuth2 token from Keycloak (includes access_token, refresh_token, etc):${NORMAL}\n"
KEYCLOAK_RESPONSE=`curl -s -X POST https://keycloak.genny.life/auth/realms/genny/protocol/openid-connect/token  -H "Content-Type: application/x-www-form-urlencoded" -d 'username=sharoncrow66@gmail.com' -d 'password=asdf1234' -d 'grant_type=password' -d 'client_id=genny'  -d 'client_secret=03db7042-1d46-4fce-abf7-8c0349ab5478'`
#printf "$KEYCLOAK_RESPONSE \n\n"

#printf "${RED}Parsing access_token field, as we don't need the other elements:${NORMAL}\n"
TOKEN=`echo "$KEYCLOAK_RESPONSE" | jq -r '.access_token'`
echo $TOKEN
json=$(curl -sS   -X GET   \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $TOKEN"  \
 https://bridge.alyson.genny.life/read/${key}  | jq -C -r '.value')
newjson=${json//\\"/"}
echo $newjson | jq -C . | less -R
#myout=$(echo $newjson | jq -C  .)
#echo $myout | less -R
