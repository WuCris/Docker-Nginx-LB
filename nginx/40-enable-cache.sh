#!/bin/sh

if [ "$NODE_ENV" = "enabled" ]; then
    sed -i 's/#include/include/g' /etc/nginx/conf.d/default.conf
fi