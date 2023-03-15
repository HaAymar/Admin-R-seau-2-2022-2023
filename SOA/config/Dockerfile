FROM ubuntu:latest

RUN apt update && apt upgrade -y
RUN apt install bind9 bind9utils dnsutils net-tools -y 
RUN apt install iputils-ping -y
 
RUN apt install nano -y

COPY woodytoysa.com /etc/bind/woodytoysa.com
COPY named.conf /etc/bind/named.conf

RUN mkdir /var/log/named
RUN touch /var/log/named/misc.log /var/log/named/query.log
RUN chown -R root:bind /var/log/named

WORKDIR /etc/bind

EXPOSE 53/udp 
EXPOSE 53/tcp

#ENTRYPOINT ["tail" , "-F" , "/dev/null"]
#CMD ["named", "-c", "/etc/bind/named.conf"]
#CMD ["/usr/sbin/named", "-g"]
CMD ["named" , "-c", "/etc/bind/named.conf" , "-g"]
