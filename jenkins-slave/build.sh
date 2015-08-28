#/bin/bash

# Build the image
docker rmi lucksolutions/jenkins-slave
docker build -t lucksolutions/jenkins-slave .