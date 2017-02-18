#!/bin/bash

sleep 10;

echo "**************************************************"
echo ""
echo "Running APP: $(date +"%d.%m.%Y %r")"
echo ""

echo "Waiting while mysql starts.."
while ! mysql -h mysql -u root -p123123 -e > /dev/null 2>&1 ";" ; do
    echo "."
    sleep 3;
done

echo "Mysql started"

echo "CREATE DATABASE IF NOT EXISTS terrcomua \
      CHARACTER SET utf8 COLLATE utf8_general_ci;" | mysql -h mysql -u root -p123123


echo ""
echo "APP Started: $(date +"%d.%m.%Y %r")"
echo ""
echo "**************************************************"

#logs for apache container
if [ ! -d "cache/logs" ]; then
  mkdir cache/logs
fi

@me ready in 3s

source /etc/apache2/envvars
exec apache2 -D FOREGROUND