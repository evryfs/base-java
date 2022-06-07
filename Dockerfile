FROM quay.io/evryfs/base-ubuntu:jammy-20220531
LABEL maintainer "David J. M. Karlsen <david@davidkarlsen.com>"
ARG JDK_VERSION=8u332-b09
ARG DOWNLOAD_URL=https://github.com/adoptium/temurin8-binaries/releases/download/jdk8u332-b09/OpenJDK8U-jdk_x64_linux_hotspot_8u332b09.tar.gz
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN	mkdir -p /usr/lib/jvm && \
	curl -Ls ${DOWNLOAD_URL} | tar xzv -C /usr/lib/jvm && \
	sh -c 'for bin in /usr/lib/jvm/jdk${JDK_VERSION}/bin/*; do update-alternatives --install /usr/bin/$(basename $bin) $(basename $bin) $bin 100 ;done' && \
	sh -c 'for bin in /usr/lib/jvm/jdk${JDK_VERSION}/bin/*; do update-alternatives --set $(basename $bin) $bin; done' && \
	java -Xshare:dump
