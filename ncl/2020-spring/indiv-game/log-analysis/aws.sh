#!/bin/bash

count=1
max=`wc -l aws.bytes | awk '{print $1}'`
total=0

while [[ $count -le $max ]]
do
    temp=`sed -n "$count"p aws.bytes`
    total=$((total+temp))
    count=$((count+1))
done
echo $total
