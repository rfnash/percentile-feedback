#!/bin/sh
echo "$1" | sed -E -e 's/0([[:digit:]]+)/\1/g' | sed -e 's/\([^:]*\):\([^-]*\)-\([^:]*\):\(.*\)/echo $(date +%F) $(qc 3600*\1+60*\2) $(qc 3600*\3+60*\4)/g' | sh >> periods.txt
./data.py -l periods.txt -m 10:30
