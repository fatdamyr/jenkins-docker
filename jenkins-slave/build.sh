#/bin/bash

# Build the image
docker rmi jenkins-slave
docker build -t jenkins-slave .