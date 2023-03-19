FROM ubuntu:latest

RUN apt-get update &&  apt-get install -y 
RUN apt-get install smbclient nano dnsutils net-tools -y 

COPY resolv.conf /etc

ENTRYPOINT ["tail", "-f", "/dev/null"]