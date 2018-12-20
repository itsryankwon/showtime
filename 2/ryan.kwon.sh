#!/bin/bash

if [ "$#" -ne 2 ]
then
  echo $#
  echo "missing arguments, should be command [path with txt files] [path for output file]"
  exit 1
fi

# if output file already exists, delete it
if [ -f $2/hwOutputFile.log ]
then
    rm $2/hwOutputFile.log
fi

# for all txt files in given path, append to given output file in given output directory
for i in $1/*.txt
do
    (cat "${i}"; echo) | grep . >> $2/temp.log
done

#sort by IP address
cat $2/temp.log | sort -o $2/temp.log -t '.' -k1,1 -k2,2 -k3,3 -k4,4 

#grab unique IPs and for each unique IP, get the lines that match the unique IP so we can have them grouped by IP. And within each group, sort by date and time. Output to hwOutputFile.log
awk '{print $1}' $2/temp.log | awk -F '-' '{print $1}' | uniq -c | awk '{print $2'} | while read x; do grep $x $2/temp.log | sort -t' ' -k3.9,3.12n -k3.5,3.7M -k3.2,3.3n -k3.14,3.15n -k3.17,3.18n -k3.20,3.21n ; done > hwOutputFile.log

#remove temp file
rm $2/temp.log




