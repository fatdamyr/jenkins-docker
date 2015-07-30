# jenkins-swarm-slave
Docker container for running a Jenkins swarm slave

 Build Tools Supported by this slave
 * [Ant 1.9.6](http://ant.apache.org/)
 * [Maven 3.2.5](http://maven.apache.org/)
 * Docker
 
## Building the Docker Image
To build the docker images locally, run the following command:

```bash
 docker build -t lucksolutions/jenkins-swarm-slave .
```

docker run --rm=true -i -t lucksolutions/jenkins-swarm-slave bash
