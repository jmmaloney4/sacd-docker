FROM ubuntu:20.04

RUN apt-get update; apt-get -y install cmake libc6-dev; apt-get -y upgrade;

COPY . /root/sacd-ripper
WORKDIR /root/sacd-ripper/tools/sacd_extract/
RUN cmake .; make
ENTRYPOINT ["./sacd_extract"]