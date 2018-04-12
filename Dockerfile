FROM ubuntu:xenial
LABEL maintainer "David J. M. Karlsen <david@davidkarlsen.com>"

#avoid interactive dialouges from apt:
ENV DEBIAN_FRONTEND noninteractive

#add repo, update, install jdk & jce extensions, set as default:
RUN apt update && apt -y install software-properties-common && \
	add-apt-repository ppa:linuxuprising/java && \
	apt update && \
	echo oracle-java10-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
	apt -y install oracle-java10-installer && \
	apt -y install oracle-java10-set-default && \
        apt -y full-upgrade && \
	apt clean && \
        apt autoclean && \
        rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
	find /var/cache/ -type f -delete

#make sure future images are always updated:
ONBUILD RUN apt update && \
		apt -y full-upgrade && \
		apt clean && \
		rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
		find /var/cache/ -type f -delete
