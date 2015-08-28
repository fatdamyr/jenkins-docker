# jenkins-slave
Docker container for running a Jenkins ssh slave. This is meant to be used with the [Jenkins Docker Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Docker+Plugin), but it can be run as a standalone slave.

 Build Tools Supported by this slave
 * [Ant 1.9.6](http://ant.apache.org/)
 * [Maven 3.2.5](http://maven.apache.org/)
 * Docker
 
## Slave Configuration
Connecting to the slave from the jenkins master is done via SSH with:
	username: jenkins
	password: jenkins
 
## Running the container

When using docker within this container you need to specify the docker host when you start the container
```bash
 docker run -d --env=DOCKER_HOST=tcp://<docker host ip>:2375 lucksolutions/jenkins-slave
```