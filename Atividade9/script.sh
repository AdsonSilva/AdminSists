#!/bin/bash

curl -s --head -w "RTT %{time_total}\\n" $1 > tst.txt

hora=$(cat tst.txt | grep Date | cut -d " " -f 6)

rtt=$(cat tst.txt | grep RTT | cut -d " " -f 2)

echo "RTT: $rtt ms"
echo "Hora retornada pelo servidor: $hora GMT"
