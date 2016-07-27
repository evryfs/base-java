FROM ubuntu:xenial
MAINTAINER David J. M. Karlsen <david@davidkarlsen.com>

#avoid interactive dialouges from apt:
ENV DEBIAN_FRONTEND noninteractive

#add repo, update, install jdk & jce extensions, set as default:
RUN apt-get update && apt-get -y install software-properties-common && \
	add-apt-repository ppa:webupd8team/java && \
	apt-get update && \
	echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
	apt-get -y install oracle-java8-installer && \
	apt-get -y install oracle-java8-unlimited-jce-policy && \
	apt-get -y install oracle-java8-set-default

#make sure future images are always updated:
ONBUILD RUN apt-get update && apt-get -y dist-upgrade && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
