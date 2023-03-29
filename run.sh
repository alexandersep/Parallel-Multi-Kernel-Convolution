#!/bin/bash

i=1
limit=$1
while [ $i -le $((limit)) ]
do
    printf "progress: %d / %d\r" "$i" "$limit"
    make run | head -n3 | grep -Eo '[0-9]+ ' >> output.txt 
    i=$(($i+1))
done
