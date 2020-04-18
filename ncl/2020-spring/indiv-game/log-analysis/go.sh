#!/bin/bash


cat transfer_log.json | awk -F':' '{print $7}' | sed 's/}//g' > bytes.temp

count=1
max=`wc -l bytes.temp | awk '{print $1}'`

while [[ $count -le $max ]]
do
    temp=`sed -n "$count"p bytes.temp`
    total=$((total + temp))
    count=$((count + 1))
done
echo $total > total.bytes
