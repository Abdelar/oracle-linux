# Dockerfile for creating a Docker image based on Oracle Linux

FROM oraclelinux

MAINTAINER Abdellatif ELAROUSSI <elaroussi@outlook.com> 

RUN yum install -y httpd perl wget unzip && yum clean all
RUN wget https://github.com/igameproject/Breakout/archive/master.zip
RUN unzip /master.zip && rm /master.zip
RUN cp -a /Breakout-master/. /var/www/html && rm -rf Breakout-master

EXPOSE 80

CMD /usr/sbin/httpd -D FOREGROUND