#!/bin/bash

# stop toror container and delete toror image
docker stop toror
docker rm toror
# create image from Dockerfile in the place where this script is run
# and name the image toror 
docker build -t toror .
# run the image toror, name it toror and bind ports
docker run -p 80:80 -p 4242:22 --name toror -d toror
# retrieve .onion address
onion_address=$(docker exec -it toror cat /var/lib/tor/other_hidden_service/hostname)
#build ssh string
print_ssh='ssh -o "ProxyCommand nc -xlocalhost:9050 -X5 %h 4242" toradmin@'$onion_address
#print
echo "SSH command for connect to the tor server, make sure that Tor is running in your computer!!!"
echo "$print_ssh"
echo "Visit the onion address: $onion_address"