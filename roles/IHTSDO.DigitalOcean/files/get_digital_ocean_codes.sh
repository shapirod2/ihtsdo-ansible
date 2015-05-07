#!/bin/sh
 
# Usage:
#   ./get_digital_ocean_codes.sh <client_id> <api_key>
#
# Requires:
#   jq
 
URL=https://api.digitalocean.com/v1
CLIENT_ID=$1
API_KEY=$2
 
OUTPUT=$3
 
> ${OUTPUT}
 
for q in regions sizes images; do
  echo -n "Calculating ${q} ... " 
 
  echo "# ${q}" >> ${OUTPUT}
  
  curl -X GET --silent "${URL}/${q}?client_id=${CLIENT_ID}&api_key=${API_KEY}" | \
     jq ".${q}[] | \"do_${q}_\(.slug): \(.id)\"" | \
     sed -e 's/\"//g' | \
     sed -e '/null/d' >> ${OUTPUT}
     
  echo >> ${OUTPUT}
 
  echo "done"
done
