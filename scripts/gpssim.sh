#!/bin/bash
keycloakUrl=$1
serviceUrl=$2
./sendgps2.sh ${keycloakUrl} ${serviceUrl}   -37.873510 144.966479
sleep 10
./sendgps2.sh  ${keycloakUrl} ${serviceUrl} -37.802874 144.966623
sleep 10
./sendgps2.sh  ${keycloakUrl} ${serviceUrl} -37.802306 144.966720
sleep 10
./sendgps2.sh  ${keycloakUrl} ${serviceUrl} -37.801815 144.966699
