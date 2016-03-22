#!/bin/bash

res=$(service --status-all 2>&1 | egrep 'apache|nginx|postgresql|mysql|mongod|tomcat7|zabbix-server|dnsmasq|beat|postfix|exim|clamav|jenkins|sonarqube')

#res=$(service --status-all 2>&1)

printf  '%s' "$res"
