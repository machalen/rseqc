####################################################
#RNA-seq Tools
#Dockerfile to build a container with RSeQC package and python
#Ubuntu:latest
####################################################
#Build the image based on Ubuntu
FROM ubuntu:latest

#Maintainer and author
MAINTAINER Magdalena Arnal <marnal@imim.es>

#Install all the required packages in python
#Scripts are in: /usr/local/bin
RUN apt-get update \
	&& apt-get install -y gcc \
	&& apt-get install -y python-dev \
	&& apt-get install -y zlib1g-dev libssl-dev \
	&& apt-get install -y samtools \
	&& wget https://bootstrap.pypa.io/get-pip.py \
	&& python get-pip.py \
	&& pip install RSeQC \
	&& rm get-pip.py \
	&& rm -rf /var/lib/apt/lists/*
  
#Change working directory
WORKDIR /
