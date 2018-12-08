FROM evryfs/docker-baseimage
LABEL maintainer "David J. M. Karlsen <david@davidkarlsen.com>"

#avoid interactive dialouges from apt:
ENV DEBIAN_FRONTEND noninteractive

#add repo, update, install jdk & jce extensions, set as default:
RUN apt update && apt -y install software-properties-common && \
	add-apt-repository ppa:webupd8team/java && \
	apt update && \
	echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
	apt -y install oracle-java8-installer && \
	apt -y install oracle-java8-unlimited-jce-policy && \
	apt -y install oracle-java8-set-default && \
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
