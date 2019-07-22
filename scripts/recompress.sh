#!/bin/bash
# VisiData needs the data to be in gzip format, not .zip. Let's fix that.

if [ ! -f od_cntrbtn_audt_e.zip ]; then
  echo "First, download od_cntrbtn_audt_e.zip from https://www.elections.ca/content.aspx?section=fin&dir=oda&document=index&lang=e"
  exit 1
fi

if [ -f od_cntrbtn_audt_e.csv.gz ]; then
  echo "Skipping; od_cntrbtn_audt_e.csv.gz already exists"
  exit 1
fi

unzip -p od_cntrbtn_audt_e.zip PoliticalFinance/od_cntrbtn_audt_e.csv | gzip > od_cntrbtn_audt_e.csv.gz
