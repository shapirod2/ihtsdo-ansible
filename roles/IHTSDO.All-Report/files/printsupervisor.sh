#!/bin/bash

SUPER=/usr/bin/supervisorctl

if [ -f $SUPER ]; then
 res=$($SUPER status 2>&1)
   printf  '%s' "$res"
else
   printf  '%s' "$SUPER' Does Not Exist"
fi

