#!/bin/bash

set -x
set -e

if [[ $( whoami ) != 'otf-mapping-service-rest' ]]; then
    exec sudo -u otf-mapping-service-rest -H $0
fi

export OTF_MAPPING_HOME=/opt/otf-mapping-service-admin
export OTF_MAPPING_CONFIG=/etc/opt/otf-mapping-service-rest/config.properties
csh /opt/otf-mapping-service-admin/admin/loader/src/main/scripts/load.csh


