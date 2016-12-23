FROM php:fpm

MAINTAINER Sergi Barroso <hiroru@lionclan.org>
ENV REFRESHED_AT 2016-12-23

# ENV DEBIAN_FRONTEND noninteractive

# RUN apt-get update && apt-get upgrade -y
# RUN apt-get install -y \
#   php5-fpm \
#   php5-enchant
#
# RUN rm -rf /var/lib/apt/lists/*

# RUN mv /etc/php-fpm.d/www.conf /etc/php-fpm.d/www.disabled

COPY files/wordpress.conf /etc/php-fpm.d/wordpress.conf

ADD files/wordpress-4.7.tar.gz /
COPY files/wp-config.php /wordpress/wp-config.php

WORKDIR /wordpress

CMD [ "php-fpm", "--nodaemonize" ]

# docker run -d --name=sbarroso-fpm --link=sbarroso-mysql:sbarroso-mysql-svc -p 9000:9000 sbarroso-fpm:latest
