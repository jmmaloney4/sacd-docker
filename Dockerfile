FROM ubuntu@sha256:b6b83d3c331794420340093eb706a6f152d9c1fa51b262d9bf34594887c2c7ac
RUN apt-get update; apt-get -y install cmake libc6-dev; apt-get -y autoremove
COPY . /root/sacd-ripper
WORKDIR /root/sacd-ripper/tools/sacd_extract/
RUN cmake .; make

FROM ubuntu:20.04
RUN mkdir -p /root/bin/
COPY --from=0 /root/sacd-ripper/tools/sacd_extract/sacd_extract /root/bin/sacd_extract
ENTRYPOINT ["/root/bin/sacd_extract"]

# For GitHub container registry
LABEL org.opencontainers.image.source https://github.com/jmmaloney4/sacd-ripper
