# Pull base image
# ---------------
FROM centos:latest

# Maintainer
# ----------
MAINTAINER Jason Luck <jason.luck@lucksolutions.com>

# Software Versions
ENV MVN_VERSION 3.2.5
ENV ANT_VERSION 1.9.6
ENV JENKINS_SWARM_VERSION 1.22
ENV JENKINS_SLAVE_HOME /opt/jenkins_slave
ENV JENKINS_SWARM_HOME /opt/jenkins_swarm

#Update packages and install the required packages
# - JDK 1.6
RUN yum -y update && \
	yum -y install wget java-1.6.0-openjdk-devel
	
#Install Ant
RUN wget http://mirror.cogentco.com/pub/apache//ant/binaries/apache-ant-$ANT_VERSION-bin.tar.gz && \
	tar xvf apache-ant-$ANT_VERSION-bin.tar.gz && \
	mv apache-ant-$ANT_VERSION /usr/local/apache-ant && \
	rm apache-ant-$ANT_VERSION-bin.tar.gz
	
#Install Maven
RUN wget http://archive.apache.org/dist/maven/maven-3/$MVN_VERSION/binaries/apache-maven-$MVN_VERSION-bin.tar.gz && \
	tar xvf apache-maven-$MVN_VERSION-bin.tar.gz && \
	mv apache-maven-$MVN_VERSION /usr/local/apache-maven && \
	rm apache-maven-$MVN_VERSION-bin.tar.gz
	
#Install Docker
	

#############################################################
#
# Install Jenkins Swarm Plugin
#
#############################################################

#Create Jenkins User
RUN useradd -c "Jenkins Slave user" -d $JENKINS_SLAVE_HOME -m jenkins

# Add swarm jar
ADD http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/$JENKINS_SWARM_VERSION/swarm-client-$JENKINS_SWARM_VERSION-jar-with-dependencies.jar $JENKINS_SWARM_HOME/swarm-slave.jar

# Add startup script
ADD swarm-slave.sh $JENKINS_SWARM_HOME/swarm-slave.sh

#Set Directory permissions
RUN chown -R jenkins:jenkins $JENKINS_SWARM_HOME && \
	chmod 755 $JENKINS_SWARM_HOME/swarm-slave.jar $JENKINS_SWARM_HOME/swarm-slave.sh
	
USER jenkins
VOLUME $JENKINS_SLAVE_HOME

# Set Environment for connection
ENV LANG C.UTF-8
ENV JENKINS_MASTER_HOST *** Auto Discovery ***
ENV JENKINS_MASTER_PORT 8080
ENV JENKINS_MASTER_USERNAME *** Optional ***
ENV JENKINS_MASTER_PASSWORD *** Optional ***
ENV JENKINS_SLAVE_LABELS slave linux centos maven ant
ENV JENKINS_SLAVE_EXECUTORS 3
ENV JENKINS_SLAVE_NAME *** Optional ***

WORKDIR $JENKINS_SLAVE_HOME


#Setup Environment
RUN ls -l -a /opt
RUN echo "export M2_HOME=/usr/local/apache-maven" >> ~/.bashrc && \
	echo "export M2=$M2_HOME/bin" >>  ~/.bashrc && \
	echo "export PATH=/usr/local/apache-ant/bin:$M2:$PATH" >> ~/.bashrc
	
# Start Slave
ENTRYPOINT exec /var/jenkins-swarm/swarm-slave.sh

