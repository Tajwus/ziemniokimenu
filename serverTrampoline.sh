#!/bin/bash

source /opt/minecraft/scripts/path
[ `ps -ef | grep java | wc -l` -eq 1 ] && screen -dmS $screenName bash -c 'cd '$server' ; '$server'start.sh'
