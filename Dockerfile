FROM ubuntu:bionic
LABEL maintainer "David J. M. Karlsen <david@davidkarlsen.com>"

RUN	mkdir -p /usr/lib/jvm && \
	curl -s https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz | tar xzv -C /usr/lib/jvm && \
	sh -c 'for bin in /usr/lib/jvm/jdk-11.0.1/bin/*; do update-alternatives --install /usr/bin/$(basename $bin) $(basename $bin) $bin 100 ;done' && \
	sh -c 'for bin in /usr/lib/jvm/jdk-11.0.1/bin/*; do update-alternatives --set $(basename $bin) $bin; done'
