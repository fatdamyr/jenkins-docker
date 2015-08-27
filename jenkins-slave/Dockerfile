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

CMD ["/usr/sbin/sshd", "-D"]

#Create Jenkins slave directory
RUN mkdir /jenkins && \
	chown jenkins /jenkins

## Jenkins slave features can be freely added or removed by adding or removing sections below

# Software Versions
ENV MVN_VERSION 3.2.5
ENV ANT_VERSION 1.9.6