#!/bin/bash

if [ ! -f od_cntrbtn_audt_e.csv.gz ]; then
  echo "od_cntrbtn_audt_e.csv.gz must be created first"
fi

# Extract the original common headers
head -n65536 od_cntrbtn_audt_e.csv.gz | gzip -d | head -n1 > headers.csv

# Extract only the 42nd general election (with column headers)
if [ -f 42nd_general_election.csv.gz ]; then
  echo "Skipping; 42nd_general_election.csv.gz already exists"
  exit 1
fi
cat headers.csv <(zgrep '42nd general election' od_cntrbtn_audt_e.csv.gz) | gzip > '42nd_general_election.csv.gz'
