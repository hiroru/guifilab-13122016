FROM mysql:latest

MAINTAINER Sergi Barroso <hiroru@lionclan.org>
ENV REFRESHED_AT 2016-12-23

ENV MYSQL_DATABASE wordpress
ENV MYSQL_USER wordpress
ENV MYSQL_PASSWORD "BHiUoXaK&jgmwkxiv7pN9q7mk"
ENV MYSQL_ROOT_PASSWORD contrasenya

RUN echo "Europe/Berlin" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

COPY files/my.cnf /etc/mysql/conf.d/my.cnf

# docker run -d --name sbarroso-mysql -p 3306:3306 sbarroso-mysql

# docker run -d --name sbarroso-mysql -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress -e MYSQL_PASSWORD="BHiUoXaK&jgmwkxiv7pN9q7mk" -e MYSQL_ROOT_PASSWORD=contrasenya -p 3306:3306 sbarroso-mysql
