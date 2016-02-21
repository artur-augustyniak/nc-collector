# VERSION 0.1.0
# DOCKER-VERSION  1.10.1
# AUTHOR:         Artur Augustyniak
# DESCRIPTION:    TCP do FS transport
# TO_BUILD:       docker build --force-rm -t nc-collector .
# TO_RUN:         docker run --restart=always  -d -p 12300:12300  -v /tmp:/storage --name nc-collector nc-collector


FROM ubuntu:12.04

MAINTAINER Artur Augustyniak <artur@aaugustyniak.pl>, Version: 0.1.0

RUN apt-get update;
RUN apt-get -y install nmap

RUN mkdir /storage
VOLUME /storage

EXPOSE 12300

CMD ncat  -k  -l -p 12300 >> /storage/$HOSTNAME-event_pipe

