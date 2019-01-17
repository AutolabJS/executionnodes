#!/bin/bash
###############
# Purpose: restart autolab components that stop due to bugs
# Author: Prasad Talasila
# Date: 17-Jan-2019
# Previous Versions: 24-April-2017
# Invocation: invoked as a cron job by root user; but can also be run as
#             $sudo bash autolabjs-restart.sh
##############

stoppedList=$(docker ps -q --filter "status=exited" --format "{{.Names}}")
execRestarts=$(echo "$stoppedList" | grep -e "^execution-node")

for node in $execRestarts
do
    docker restart "$node"
done

