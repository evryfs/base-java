FROM quay.io/evryfs/base-ubuntu:jammy-20220815
LABEL maintainer "David J. M. Karlsen <david@davidkarlsen.com>"
ARG JDK_VERSION=19+36
ARG DOWNLOAD_URL=https://objects.githubusercontent.com/github-production-release-asset-2e65be/437830137/6dea2487-3cc7-4f03-acdb-2ae818b3760e?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20220927%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20220927T175854Z&X-Amz-Expires=300&X-Amz-Signature=d030b96f561aafc0bd5bed4a41d0c41f314fdbd17e58d025400b9d4f5ff5542c&X-Amz-SignedHeaders=host&actor_id=18299&key_id=0&repo_id=437830137&response-content-disposition=attachment%3B%20filename%3DOpenJDK19U-jdk_x64_linux_hotspot_19_36.tar.gz&response-content-type=application%2Foctet-stream
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN	mkdir -p /usr/lib/jvm && \
	curl -Ls ${DOWNLOAD_URL} | tar xzv -C /usr/lib/jvm && \
	sh -c 'for bin in /usr/lib/jvm/jdk-${JDK_VERSION}/bin/*; do update-alternatives --install /usr/bin/$(basename $bin) $(basename $bin) $bin 100 ;done' && \
	sh -c 'for bin in /usr/lib/jvm/jdk-${JDK_VERSION}/bin/*; do update-alternatives --set $(basename $bin) $bin; done' && \
	java -Xshare:dump
