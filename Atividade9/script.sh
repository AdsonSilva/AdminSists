#!/bin/bash

curl -s --head -w "RTT %{time_total}\\n" $1 > tst.txt

hora=$(cat tst.txt | grep Date | cut -d " " -f 6)

rtt=$(cat tst.txt | grep RTT | cut -d " " -f 2)

echo "$rtt ms"
echo "$hora GMT"

echo "$(date -u | cut -d " " -f 4) GMT"
echo "$(date | cut -d " " -f 4) GMT-3"