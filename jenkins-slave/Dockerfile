#Official java image based on Debian
FROM java:8u45-jdk


# Make sure the package repository is up to date.
RUN apt-get update
RUN apt-get -y upgrade

# Install a basic SSH server
RUN apt-get install -y openssh-server
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

# Add user jenkins to the image
RUN adduser --quiet jenkins
# Set password for the jenkins user (you may want to alter this).
RUN echo "jenkins:jenkins" | chpasswd

# Standard SSH port
EXPOSE 22

#Before starting SSH Daemon, dump the environment variable to /etc/environment so they will be reflected in the SSH session.
#If we don't do this, then we cannot set DOCKER_HOST and DOCKER_OPTS via the run command --env option
CMD env | grep _ >> /etc/environment && /usr/sbin/sshd -D

## Jenkins slave features can be freely added or removed by adding or removing sections below

# Install Docker
ENV DOCKER_HOST ""
ENV DOCKER_OPTS ""
RUN apt-get update && \
	apt-get install -y docker.io
	
#Install Ant
ENV ANT_VERSION 1.9.6
RUN wget http://mirror.cogentco.com/pub/apache//ant/binaries/apache-ant-$ANT_VERSION-bin.tar.gz && \
	tar xvf apache-ant-$ANT_VERSION-bin.tar.gz && \
	mv apache-ant-$ANT_VERSION /usr/local/apache-ant && \
	rm apache-ant-$ANT_VERSION-bin.tar.gz && \
	ln -s /usr/local/apache-ant/bin/ant /usr/bin/ant
	
#Install Maven
ENV MVN_VERSION 3.2.5
RUN wget http://archive.apache.org/dist/maven/maven-3/$MVN_VERSION/binaries/apache-maven-$MVN_VERSION-bin.tar.gz && \
	tar xvf apache-maven-$MVN_VERSION-bin.tar.gz && \
	mv apache-maven-$MVN_VERSION /usr/local/apache-maven && \
	rm apache-maven-$MVN_VERSION-bin.tar.gz && \
	ln -s /usr/local/apache-maven/bin/mvn /usr/bin/mvn
	
