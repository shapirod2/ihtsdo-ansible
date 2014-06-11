#!/bin/bash

if [[ $( whoami ) != 'otf-mapping-service-rest' ]]; then
	echo "This script must be run as user otf-mapping-service-rest"
    exit 1
fi

export OTF_MAPPING_HOME=/opt/otf-mapping-service-admin
export OTF_MAPPING_CONFIG=/etc/opt/otf-mapping-service-rest/config.properties
csh /opt/otf-mapping-service-admin/admin/loader/src/main/scripts/load.csh

