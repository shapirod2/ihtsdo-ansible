#!/bin/bash
UFW=/usr/sbin/ufw 
if [ -f $UFW ]; then
# res=($($UFW status verbose 2>&1))
# echo  "${res[*]}"
  res=$($UFW status verbose 2>&1)
  printf  '%s' "$res"
else
   printf  '%s' "$UFW Does Not Exist"
fi
