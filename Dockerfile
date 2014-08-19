FROM debian:wheezy
MAINTAINER Paddy Carey <patrick@rehabstudio.com>

# no tty
ENV DEBIAN_FRONTEND noninteractive

# get up to date
ADD ops/files/sources.list /etc/apt/sources.list
RUN apt-get update --fix-missing
RUN apt-get upgrade -y

# install packages from apt
RUN apt-get install -y build-essential git wget unzip
RUN apt-get install -y python python-dev python-virtualenv
RUN apt-get install -y python-imaging python-numpy

# Download and install the Appengine Python SDK
RUN wget https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.9.zip
RUN unzip google_appengine_1.9.9.zip
RUN rm google_appengine_1.9.9.zip
ENV PATH /google_appengine:$PATH

VOLUME ["/.appengine_storage"]

ADD ops/files/.bashrc /.bashrc

# install test/documentation dependencies
ADD ops/test/requirements.txt /tmp/test-requirements.txt
RUN virtualenv /.venv --system-site-packages
RUN /.venv/bin/pip install -r /tmp/test-requirements.txt

# default run command
CMD bash

# expose ports (application server & admin server)
EXPOSE 8080
EXPOSE 8000
