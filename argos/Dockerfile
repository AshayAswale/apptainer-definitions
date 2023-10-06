FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q -y update
RUN apt-get install -q -y locales

# Set the locale
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get -q -y install git bc gdb
RUN apt-get install -q -y cmake libfreeimage-dev libfreeimageplus-dev \
    freeglut3-dev libxi-dev libxmu-dev build-essential
RUN apt-get clean
