#!/bin/sh

IP=`curl -s icanhazip.com`

DYN_UPDATE_URL="https://{{ dnspark_username }}:{{ dnspark_password }}@control.dnspark.com/api/dynamic/update.php?hostname={{ domain_name }}&ip=$IP&mx=OFF"

curl -s $DYN_UPDATE_URL
