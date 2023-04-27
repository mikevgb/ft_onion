#!/bin/bash

service ssh start
tor -f /etc/tor/torrc &
sleep 10
nginx -g 'daemon off;'
