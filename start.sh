#/bin/bash

#Find the Docker Host IP
DOCKER_IP=`vagrant ssh-config | grep HostName | awk {'print $2 '}`
echo "Docker Host IP is ${DOCKER_IP}"

# Start Jenkins Master
docker run -d --name jenkins-master -p 8080:8080 -p 5000:5000 --add-host=docker:${DOCKER_IP} -v /jenkins:/var/jenkins_home jenkins