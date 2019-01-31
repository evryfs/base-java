FROM evryfs/docker-baseimage
LABEL maintainer "David J. M. Karlsen <david@davidkarlsen.com>"
ARG JDK_VERSION=11.0.2

RUN	mkdir -p /usr/lib/jvm && \
	curl -s https://download.java.net/java/GA/jdk11/7/GPL/openjdk-${JDK_VERSION}_linux-x64_bin.tar.gz | tar xzv -C /usr/lib/jvm && \
	sh -c 'for bin in /usr/lib/jvm/jdk-${JDK_VERSION}/bin/*; do update-alternatives --install /usr/bin/$(basename $bin) $(basename $bin) $bin 100 ;done' && \
	sh -c 'for bin in /usr/lib/jvm/jdk-${JDK_VERSION}/bin/*; do update-alternatives --set $(basename $bin) $bin; done' && \
	java -Xshare:dump
