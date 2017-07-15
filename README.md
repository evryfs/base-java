docker-java
===========

[![](https://images.microbadger.com/badges/version/davidkarlsen/docker-java.svg)](https://microbadger.com/images/davidkarlsen/docker-java "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/davidkarlsen/docker-java.svg)](https://microbadger.com/images/davidkarlsen/docker-java "Get your own image badge on microbadger.com")
[![Anchore Image Overview](https://anchore.io/service/badges/image/df218095771ff7f914717422b4f396197d2149e32b39a4b9d74a26e1a2bd0458)](https://anchore.io/image/dockerhub/davidkarlsen%2Fdocker-java%3Amaster)

Basic java image based on ubuntu LTS (ubuntu:xenial).

Installs java 8 through webupd8: https://launchpad.net/~webupd8team/+archive/ubuntu/java .
Java8 is set as default java though use of alternatives: http://manpages.ubuntu.com/manpages/saucy/man8/update-alternatives.8.html
Adds JCE.
