#!/bin/bash

#TODO (CAN THIS BECOME SH)

set -e

frontend=()
frontend+=($(env | grep HOST_FRONTEND | sed 's/HOST_FRONTEND_.=//g'))

backend=()
backend+=($(env | grep HOST_BACKEND | sed 's/HOST_BACKEND_.=//g'))

COUNTER=0

# Create mappings
for FRONTEND in $(env | grep HOST_FRONTEND); do

        echo "    ${frontend[$COUNTER]} ${frontend[$COUNTER]}-backend;" >> /etc/nginx/conf.d/upstream-map.conf
        COUNTER=$((COUNTER+1))

done

echo -e "}\n" >> /etc/nginx/conf.d/upstream-map.conf

COUNTER=0

# Create upstreams
for FRONTEND in $(env | grep HOST_FRONTEND); do

        echo "upstream ${frontend[$COUNTER]}-backend {" >> /etc/nginx/conf.d/upstream-map.conf
        echo "    $ALGORITHM;" >> /etc/nginx/conf.d/upstream-map.conf
        echo "    server ${backend[$COUNTER]};" >> /etc/nginx/conf.d/upstream-map.conf
        echo -e "}\n" >> /etc/nginx/conf.d/upstream-map.conf
        COUNTER=$((COUNTER+1))

done
