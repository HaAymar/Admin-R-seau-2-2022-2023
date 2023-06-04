FROM php:7.4-apache

RUN apt-get update && \
    apt-get install -y default-mysql-client && \
    docker-php-ext-install mysqli && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get install apache2 -y
RUN apt-get update -y
RUN apt-get install -y mutt dnsutils iputils-ping net-tools

COPY /www/html/index.html /var/www/html/index.html
COPY /sites-available/www.conf /etc/apache2/sites-available
COPY /sites-available/b2b.conf /etc/apache2/sites-available

RUN apt-get install -y software-properties-common
RUN apt-get install -y python3-certbot-apache

COPY apache2.conf /etc/apache2/apache2.conf

RUN a2ensite b2b.conf
RUN a2ensite www.conf

RUN service apache2 start

RUN a2enmod ssl

RUN service apache2 start