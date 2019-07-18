FROM evryfs/docker-baseimage
LABEL maintainer "David J. M. Karlsen <david@davidkarlsen.com>"
ARG JDK_VERSION=8u222-b10
ARG DOWNLOAD_URL=https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u212-b03/OpenJDK8U-jdk_x64_linux_hotspot_8u212b03.tar.gz

RUN	mkdir -p /usr/lib/jvm && \
	curl -Ls ${DOWNLOAD_URL} | tar xzv -C /usr/lib/jvm && \
	sh -c 'for bin in /usr/lib/jvm/jdk${JDK_VERSION}/bin/*; do update-alternatives --install /usr/bin/$(basename $bin) $(basename $bin) $bin 100 ;done' && \
	sh -c 'for bin in /usr/lib/jvm/jdk${JDK_VERSION}/bin/*; do update-alternatives --set $(basename $bin) $bin; done' && \
	java -Xshare:dump
