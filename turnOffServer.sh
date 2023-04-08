#!/bin/bash

source /opt/minecraft/scripts/path
n=5
m=60
sleep 50;
while [ $m -ge 30 ];
        do
                screen -S $screenName -p 0 -X stuff "say Restart za "$m"s.^M";
                sleep 30;
                let "m-=30"
        done
while [ $n -ge 1 ];
	do
		screen -S $screenName -p 0 -X stuff "say Restart za "$n"s.^M";
		sleep 1;
		let "n-=1"
	done

screen -S $screenName -p 0 -X stuff "stop^M"
