FROM ubuntu:bionic


RUN apt update && apt upgrade -y
RUN apt install samba -y
RUN apt install nano -y
RUN apt install net-tools -y

RUN apt install samba -y
COPY smb.conf /etc/samba/smb.conf

EXPOSE 136:136
EXPOSE 445:445

ENTRYPOINT ["tail", "-F", "/dev/null"]