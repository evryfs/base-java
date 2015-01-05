FROM phusion/baseimage:0.9.15
MAINTAINER David J. M. Karlsen <david@davidkarlsen.com>

#avoid interactive dialouges from apt:
ENV DEBIAN_FRONTEND noninteractive

#add repo and update:
RUN add-apt-repository ppa:webupd8team/java && apt-get update && apt-get -y dist-upgrade

#make sure future images are always updated:
ONBUILD apt-get update && apt-get -y dist-upgrade

#skip java7 as it is EOL by Apr 2015: http://www.oracle.com/technetwork/java/javase/eol-135779.html
#install java7:
#RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && apt-get -y install oracle-java7-installer

#install java8:
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && apt-get -y install oracle-java8-installer

#set java8 default:
RUN apt-get install oracle-java8-set-default

#clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
