ARG IMAGE=daimor/intersystems-cache:2018.1
FROM $IMAGE
USER root  

COPY ./cache.key    /usr/cachesys/mgr/cache.key
COPY ./cconsole.log /usr/cachesys/mgr/cconsole.log

WORKDIR /opt/

RUN  usermod -a -G root cacheusr 

COPY cache.script /tmp/cache.script
RUN ccontrol start CACHE quietly \
    && ccontrol session CACHE < /tmp/cache.script \
    && ccontrol stop CACHE quietly