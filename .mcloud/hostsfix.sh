#!/bin/bash

if [[ -z "$1" || -z "$2" ]]; then
    echo 'Enter app & container name: ./hostsfix.sh [app-name] [host]'
else
    if [ $1 == '--ip' ]; then
        NGINX="$2 $3"
        echo "$NGINX" >> /etc/hosts
        echo "Fixed /etc/hosts: $NGINX"
    else
        IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' "apachephp.$1")
        echo "Start fixing: apachephp.$1"
        docker exec "apachephp.$1" .mcloud/hostsfix.sh --ip "$IP" "$2"
    fi
fi