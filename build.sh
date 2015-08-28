#/bin/bash

# Build the image
docker rmi lucksolutions/jenkins
docker build --force-rm=true -t lucksolutions/jenkins .