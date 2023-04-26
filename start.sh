#!/bin/bash

service ssh start
tor -f /etc/tor/torrc &
sleep 20
nginx -g 'daemon off;'
