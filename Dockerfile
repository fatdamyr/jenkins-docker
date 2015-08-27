# Pull base image
# ---------------
FROM jenkins:latest

# Maintainer
# ----------
MAINTAINER Jason Luck <jason.luck@lucksolutions.com>

# Software Versions
ENV DOCKER_VERSION 1.6.0

# Install Docker
RUN apt-get update && \
	apt-get install -y docker.io
	
# Install Subversion



