#!/bin/bash
  res=$(java -version 2>&1)
  printf  '%s' "$res"
