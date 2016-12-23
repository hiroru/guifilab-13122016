FROM nginx:latest

MAINTAINER Sergi Barroso <hiroru@lionclan.org>
ENV REFRESHED_AT 2016-12-23

RUN echo "Europe/Berlin" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/default.conf /etc/nginx/conf.d/default.conf

# docker run -d --name=sbarroso-nginx --link=sbarroso-fpm:sbarroso-fpm-svc --link=sbarroso-mysql:sbarroso-mysql-svc -p 8080:80 hiroru/sbarroso-nginx:latest
