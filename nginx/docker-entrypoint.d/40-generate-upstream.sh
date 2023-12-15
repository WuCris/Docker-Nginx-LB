#!/bin/bash

#TODO (CAN THIS BECOME SH)

set -e

frontend=()
frontend+=($(env | grep HOST_FRONTEND | sed 's/HOST_FRONTEND_.=//g'))

backend=()
backend+=($(env | grep HOST_BACKEND | sed 's/HOST_BACKEND_.=//g'))

COUNTER=0

cp /etc/default/templates/upstream-map.conf /etc/nginx/conf.d/upstream-map.conf
sed 's/ALGORITHM=/$ALGORITHM/g' -i /etc/nginx/conf.d/upstream-map.conf

# find and replace on results

for FRONTEND in $(env | grep HOST_FRONTEND); do

        echo -e "\t${frontend[$COUNTER]} ${backend[$COUNTER]};" >> /etc/nginx/conf.d/upsteam-map.conf
        COUNTER=$((COUNTER+1))

done

echo "}" >> /etc/nginx/conf.d/upsteam-map.conf