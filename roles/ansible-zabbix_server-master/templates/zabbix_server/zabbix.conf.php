<?php
//{{ ansible_managed }}
// Zabbix GUI configuration file
global $DB;

$DB['TYPE']     = '{{zabbix_php_db}}';
$DB['SERVER']   = '{{zabbixserver_db_host}}';
$DB['PORT']     = '{{zabbixserver_db_port}}';
$DB['DATABASE'] = '{{zabbixserver_db_name}}';
$DB['USER']     = '{{zabbixserver_db_user}}';
$DB['PASSWORD'] = '{{zabbixserver_db_pass}}';

// SCHEMA is relevant only for IBM_DB2 database
$DB['SCHEMA'] = '';

$ZBX_SERVER      = '{{zabbixserver_host}}';
$ZBX_SERVER_PORT = '{{zabbixserver_port}}';
$ZBX_SERVER_NAME = '{{zabbixserver_name}}';

$IMAGE_FORMAT_DEFAULT = IMAGE_FORMAT_PNG;
?>

