#!/bin/bash
myip=$1
./gpssim.sh http://${myip}:8180 http://${myip}:8088/api/service
