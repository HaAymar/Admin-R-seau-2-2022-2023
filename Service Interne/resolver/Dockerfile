FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y
RUN apt-get install bind9 bind9utils bind9-doc dnsutils net-tools nano -y

COPY named.conf /etc/bind/named.conf
COPY resolv.conf /etc/resolv.conf
WORKDIR /etc/bind

CMD ["named", "-c", "/etc/bind/named.conf", "-g", "-u", "named"]
