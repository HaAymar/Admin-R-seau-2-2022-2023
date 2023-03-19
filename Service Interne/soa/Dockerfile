FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y 
RUN apt-get install bind9 bind9utils bind9-doc net-tools dnsutils nano -y
RUN apt-get update -y

WORKDIR /etc/bind

COPY named.conf /etc/bind/named.conf
COPY resolv.conf /etc/resolv.conf
COPY intranet.mes-woodytoys.lab /etc/bind/intranet.mes-woodytoys.lab
COPY 0.168.192.in-addr.arpa /etc/bind/0.168.192.in-addr.arpa

#CMD ["named", "-g"]
ENTRYPOINT ["tail", "-F" , "/dev/null"]