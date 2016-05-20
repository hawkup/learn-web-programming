FROM ubuntu:16.04

MAINTAINER hawkup <https://github.com/hawkup>

RUN apt-get update

RUN apt-get install -y build-essential

# python2
RUN apt-get install -y python

# http://stackoverflow.com/questions/24958140/docker-copy-vs-add
# if you want to add a xx.tar.gz to a /usr/local in container,unzip it,then remove the useless compressed package.
#
# for COPY:
#
# COPY resources/jdk-7u79-linux-x64.tar.gz /tmp/
# RUN tar -zxvf /tmp/jdk-7u79-linux-x64.tar.gz -C /usr/local
# RUN rm /tmp/jdk-7u79-linux-x64.tar.gz
# for ADD:
#
# ADD resources/jdk-7u79-linux-x64.tar.gz /usr/local/
# ADD supports local-only tar extraction. beside it,COPY will use 3 layers, but ADD only use 1 layer.
ADD thrift-0.9.3.tar.gz /

RUN cd /thrift-0.9.3/ && ./configure && make && make install

RUN cd /thrift-0.9.3/lib/py && python setup.py install

RUN apt-get install -y nodejs
RUN apt-get install -y npm
