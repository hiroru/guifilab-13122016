FROM php:fpm

MAINTAINER Sergi Barroso <hiroru@lionclan.org>
ENV REFRESHED_AT 2016-12-23

COPY files/wordpress.conf /usr/local/etc/php/conf.d/wordpress.conf

ADD files/wordpress-4.7.tar.gz /
COPY files/wp-config.php /wordpress/wp-config.php

WORKDIR /wordpress

CMD [ "php-fpm", "--nodaemonize" ]

# docker run -d --name=sbarroso-fpm --link=sbarroso-mysql:sbarroso-mysql-svc -p 9000:9000 hiroru/sbarroso-fpm:latest
