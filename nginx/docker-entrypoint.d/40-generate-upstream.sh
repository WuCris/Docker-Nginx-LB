#!/bin/bash

#TODO (CAN THIS BECOME SH)

set -e

frontend=()
frontend+=($(env | grep HOST_FRONTEND | sed 's/HOST_FRONTEND_.=//g'))

backend=()
backend+=($(env | grep HOST_BACKEND | sed 's/HOST_BACKEND_.=//g'))

COUNTER=0

for FRONTEND in $(env | grep HOST_FRONTEND); do

        echo "    ${frontend[$COUNTER]} ${backend[$COUNTER]};" >> /etc/nginx/conf.d/upstream-map.conf
        COUNTER=$((COUNTER+1))

done

echo "}" >> /etc/nginx/conf.d/upstream-map.conf