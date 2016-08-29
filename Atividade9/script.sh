#!/bin/bash
curl --head -w "RTT %{time_total}\\n" google.com > tst