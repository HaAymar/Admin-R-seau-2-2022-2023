FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get upgrade -y

# Installation des outils
RUN apt-get install -y nano telnet mutt dnsutils net-tools mailutils openssl certbot
RUN apt-get install sudo -y


# OpenSSL(utilisé que pour le build de l'image pour avoir un certificat auto-signé)
# utiliser certbot pour avoir un certificat valide
RUN openssl req -new -x509 -days 365 -nodes -newkey rsa:4096 -out /etc/ssl/certs/mailserver.pem -keyout /etc/ssl/private/mailserver.pem -subj "/C=BE/ST=Braban-wallon/L=Wavre/O=Ephec/OU=IT/CN=mail.l1-4.ephec-ti.be"

# Certificat SSL via cerbot(letsencypt)
# utiliser l'email brichant.vincent@l1-4.ephec-ti.be et redémarer les service postfix et dovecot après avoir modifier 10-ssl.conf(dovecot) et main.cf(postfix)
# sudo certbot certonly --standalone -d mail.l1-4.ephec-ti.be
# sudo certbot certonly --standalone -d smtp.l1-4.ephec-ti.be

# Installation Database
RUN apt-get install mariadb-server -y

#Configuration - MariaDB

COPY config/SQL/create-db.sql config/SQL/create-db.sql
COPY config/SQL/create-table.sql config/SQL/create-table.sql


# Installation de Postfix + config

RUN apt-get install -y postfix postfix-mysql

RUN groupadd -g 5000 vhosts && useradd -g vhosts -u 5000 vhosts -d /var/mail/vhosts -s /bin/false -m

COPY config/postfix/main.cf /etc/postfix/main.cf
COPY config/postfix/master.cf /etc/postfix/master.cf
COPY config/postfix/generic /etc/postfix/generic
COPY config/postfix/vmailbox /etc/postfix/vmailbox

COPY config/postfix/mysql-virtual-mailbox-domains.cf /etc/postfix/mysql-virtual-mailbox-domains.cf
COPY config/postfix/mysql-virtual-mailbox-maps.cf /etc/postfix/mysql-virtual-mailbox-maps.cf

RUN postmap /etc/postfix/generic
RUN postmap /etc/postfix/vmailbox

# Installation Dovecot + config

RUN apt-get install -y dovecot-core dovecot-imapd dovecot-mysql
RUN apt-get install -y dovecot-sieve dovecot-managesieved

COPY config/dovecot/10-auth.conf /etc/dovecot/conf.d/10-auth.conf
COPY config/dovecot/10-mail.conf /etc/dovecot/conf.d/10-mail.conf
COPY config/dovecot/10-ssl.conf /etc/dovecot/conf.d/10-ssl.conf
COPY config/dovecot/20-lmtp.conf /etc/dovecot/conf.d/20-lmtp.conf
COPY config/dovecot/10-master.conf /etc/dovecot/conf.d/10-master.conf
COPY config/dovecot/10-logging.conf /etc/dovecot/conf.d/10-logging.conf
COPY config/dovecot/auth-sql.conf.ext /etc/dovecot/conf.d/auth-sql.conf.ext
COPY config/dovecot/default.sieve /var/lib/dovecot/sieve/default.sieve
COPY config/dovecot/dovecot.conf /etc/dovecot/dovecot.conf
COPY config/dovecot/dovecot-sql.conf.ext /etc/dovecot/dovecot-sql.conf.ext

RUN sievec /var/lib/dovecot/sieve/default.sieve
RUN chown -R vhosts:vhosts /var/lib/dovecot/sieve/*
RUN chmod a+x /var/lib/dovecot

# Installation spamassasin + config
RUN apt-get install -y spamassassin spamc

RUN groupadd spamd
RUN useradd -g spamd -s /bin/false -d /var/log/spamassassin spamd
RUN mkdir /var/log/spamassassin
RUN chown spamd:spamd /var/log/spamassassin

COPY config/spamassassin/spamassassin /etc/default/spamassassin
COPY config/spamassassin/local.cf /etc/spamassassin/local.cf

# Log

COPY /log/mail.log /var/log/mail.log


# Commande à exécuter lors du lancement du container mail
CMD ["sh", "-c", "service mysql start; mysql -u root < config/SQL/create-db.sql; mysql -u root < config/SQL/create-table.sql; service postfix start; service spamassassin start; service dovecot start; tail -F /var/log/mail.log"]