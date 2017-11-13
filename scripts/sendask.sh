#!/bin/bash

myip=
while IFS=$': \t' read -a line ;do
    [ -z "${line%inet}" ] && ip=${line[${#line[1]}>4?1:2]} &&
        [ "${ip#127.0.0.1}" ] && myip=$ip
  done< <(LANG=C /sbin/ifconfig)


if [ -z "${myip}" ]; then
   myip=127.0.0.1
fi
#myip=192.168.64.6

KEYCLOAK_RESPONSE=`curl -s -X POST http://${myip}:8180/auth/realms/genny/protocol/openid-connect/token  -H "Content-Type: application/x-www-form-urlencoded" -d 'username=user1' -d 'password=password1' -d 'grant_type=password' -d 'client_id=curl'  -d 'client_secret=056b73c1-7078-411d-80ec-87d41c55c3b4'`
TOKEN=`echo "$KEYCLOAK_RESPONSE" | jq -r '.access_token'`
printf "${TOKEN} \n\n"

#TOKEN=$(./gettoken.sh )
#echo "${TOKEN}"
#CALLSCRIPT=./update.sh 
#$CALLSCRIPT "$1"
echo ""
echo "curl -S -v -H 'Bearer: ${TOKEN}' http://${myip}:8280/qwanda/asks"
    curl -X POST --header "Content-Type: application/json" -H "Authorization: Bearer $TOKEN"  --header "Accept: application/json" -d '{  "id": "1",
    "created": "2017-06-30T15:41:12",  
    "name": "AskEmailId",  
    "targetCode": "PER_USER1", 
     "sourceCode": "PER_USER1",  
     "attributeCode": "PRI_FIRSTNAME" ,
     "questionCode":"QUE_EMAIL"
}' "http://${myip}:8280/qwanda/asks"
    echo ""



# {  "created": "2017-06-30T15:41:12",  
#     "value": "Bob",  
#     "expired": false,  
#     "refused": false,  
#     "weight": 1,  
#     "targetCode": "PER_USER1", 
#      "sourceCode": "PER_USER1",  
#      "attributeCode": "PRI_FIRSTNAME" 
# }

# dtype         | varchar(31)  | NO   |     | NULL    |                |
# | id            | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | ask           | tinyblob     | YES  |     | NULL    |                |
# | askId         | bigint(20)   | YES  |     | NULL    |                |
# | attributecode | varchar(255) | NO   |     | NULL    |                |
# | created       | datetime     | YES  |     | NULL    |                |
# | expired       | bit(1)       | YES  |     | NULL    |                |
# | refused       | bit(1)       | YES  |     | NULL    |                |
# | sourcecode    | varchar(255) | YES  |     | NULL    |                |
# | targetcode    | varchar(255) | YES  |     | NULL    |                |
# | updated       | datetime     | YES  |     | NULL    |                |
# | value         | varchar(255) | NO   |     | NULL    |                |
# | weight        | double       | YES  |     | NULL    |                |
# | attribute_id  | bigint(20)   | NO   | MUL | NULL    |                |
# +---------------+--------------+------+-----+---------+----------------+



# ----------------------------------------------------------------------------------------------

# +-------------+--------------+------+-----+---------+----------------+
# | Field       | Type         | Null | Key | Default | Extra          |
# +-------------+--------------+------+-----+---------+----------------+
# | dtype       | varchar(31)  | NO   |     | NULL    |                |
# | id          | bigint(20)   | NO   | PRI | NULL    | auto_increment |
# | created     | datetime     | YES  |     | NULL    |                |
# | name        | varchar(255) | YES  |     | NULL    |                |
# | updated     | datetime     | YES  |     | NULL    |                |
# | sourceCode  | varchar(255) | YES  |     | NULL    |                |
# | targetCode  | varchar(255) | YES  |     | NULL    |                |
# | question_id | bigint(20)   | NO   | MUL | NULL    |                |
# | source_id   | bigint(20)   | NO   | MUL | NULL    |                |
# | target_id   | bigint(20)   | NO   | MUL | NULL    |                |
# +-------------+--------------+------+-----+---------+----------------+

# {  "created": "2017-06-30T15:41:12",  
#     "name": "AskEmailId",  
#     "expired": false,  
#     "refused": false,  
#     "weight": 1,  
#     "targetCode": "PER_USER1", 
#      "sourceCode": "PER_USER1",  
#      "attributeCode": "PRI_FIRSTNAME" ,
#      "questionCode":"QUE_EMAIL"
# }
