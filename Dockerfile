FROM ubuntu:bionic
LABEL maintainer "David J. M. Karlsen <david@davidkarlsen.com>"

#avoid interactive dialouges from apt:
ENV DEBIAN_FRONTEND noninteractive

RUN apt update && \
	apt -y install openjdk-11-jdk && \
	apt clean && \
        apt autoclean && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	find /var/cache/ -type f -delete

