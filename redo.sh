#!/bin/bash

# stop toror container and delete toror image
docker stop toror
docker rm toror
# create image from Dockerfile in the place where this script is run
# and name the image toror 
docker build -t toror .
# run the image toror, name it toror and bind ports
docker run -p 80:80 -p 4242:22 --name toror -d toror