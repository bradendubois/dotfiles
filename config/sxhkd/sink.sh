#!/bin/bash

sink=$(pacmd list-sinks | grep "* index" | sed 's/[^0-9]*//g')

if [ $sink -eq '0' ]; then
    sink=1
else
    sink=0
fi

pacmd list-sink-inputs | grep index | while read input
do
    pacmd move-sink-input `echo $input | cut -f2 -d' '` $sink;
done

pacmd set-default-sink $sink

