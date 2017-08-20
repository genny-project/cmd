#!/bin/bash
java -jar target/gebcmd-0.0.1-SNAPSHOT-jar-with-dependencies.jar -d "cmdmsg_logout.json"  -a "http://localhost:8081/api/events"
