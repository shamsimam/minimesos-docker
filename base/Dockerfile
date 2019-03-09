FROM ubuntu:16.04

RUN echo "deb http://ppa.launchpad.net/openjdk-r/ppa/ubuntu xenial main" > /etc/apt/sources.list.d/openjdk.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv 86F44E2A && \
    apt-get update && \
    apt-get -y install openjdk-8-jre-headless curl unzip iptables && \
    rm -rf /var/lib/apt/lists/*

RUN curl -so /usr/bin/docker https://get.docker.com/builds/Linux/x86_64/docker-1.9.1 && chmod +x /usr/bin/docker
