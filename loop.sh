#!/bin/bash
java -jar target/gebcmd-0.0.1-SNAPSHOT-jar-with-dependencies.jar -d cmdmsg_layout.json  -a "http://localhost:8081/commander"
while :
do
java -jar target/gebcmd-0.0.1-SNAPSHOT-jar-with-dependencies.jar -d "qaskmsg-withdata.json"  -a "http://localhost:8081/commander"
sleep 3
java -jar target/gebcmd-0.0.1-SNAPSHOT-jar-with-dependencies.jar -d "qaskmsg-nodata.json"  -a "http://localhost:8081/commander"
done

