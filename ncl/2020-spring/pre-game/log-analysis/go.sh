#!/bin/bash

count=1
max=300

while [[ $count -le $max ]]
do
    temp=`sed -n "$count"p names.temp`
    num=$((`echo $temp | wc -m | awk '{print $1}'` - 2))
    temp=`echo $temp | cut -c 2-$num`
    cat merge.log | sort | grep "$temp" > count.temp
    count2=1
    max2=`wc -l count.temp | awk '{print $1}'`
    while [[ $count2 -le $max2 ]]
    do
        if [[ `sed -n "$count2"p count.temp` == *"Access"* ]] && [[ $count2 != 1 ]] && [[ `sed -n "$((count2 - 1))"p count.temp` == *"Swipe Out"* ]]
        then 
            echo "$temp line $count2"
#            echo $count2
#            echo $((count2 - 1))
        fi
        count2=$((count2+1))
    done
#    cat badge.log | grep "$temp" | awk '{print $6}' | uniq -c | awk '{print $1}' | uniq > count.temp
#    echo $temp `cat count.temp`
#    if [[ $(cat count.temp | grep -v 1) ]]
#        then echo $temp
#    fi
#    read check
    count=$((count+1))
done
