#!/bin/sh
LogFile="./log/log.txt"

if [ ! -e ${LogFile} ]; then
  touch ${LogFile}
fi

date > log/log.txt
echo ""
echo "---------------------------------------------------------------------------------------------------------------------------------------"
echo ""
docker-compose up & > log/log.txt
