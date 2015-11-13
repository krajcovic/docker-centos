############################################################
# Dockerfile to build Monet+ container images
# Based on CentOS 7
############################################################

# Base images
FROM centos:latest

MAINTAINER Dusan Krajcovic

# Variables
#ENV hostname node.base.docker.monetplus.cz
ENV container docker

# Update the repository sources list
# RUN yum -y update 
RUN yum -y swap -- remove fakesystemd -- install systemd systemd-libs
RUN yum -y update; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN yum install -y vim
RUN yum install -y mc

# Initialization
#CMD echo 'Welcome to your Toy ${hostname} container!' >> /etc/motd

# RUN echo 'kurnik' >> /etc/resolv.conf
# RUN echo 'nameserver 193.33.22.33' >> /etc/resolv.conf;echo 'nameserver 193.33.23.33' >> /etc/resolv.conf;echo 'search monetplus.cz' >> /etc/resolv.conf

# RUN systemctl restart network.service
# RUN yum -y install httpd; systemctl enable httpd.service
#RUN ping maven.monetplus.cz


################## BEGIN INSTALLATION ######################

# CMD rpm -Uhv https://w3test.monetplus.cz/~urepo/rhel6_64/rhel-6-server-rpms
# CMD rpm -Uhv https://w3test.monetplus.cz/~urepo/rhel6_64/rhel-ha-for-rhel-6-server-rpms
# CMD rpm -Uhv https://w3test.monetplus.cz/~urepo/rhel6_64/rhel-lb-for-rhel-6-server-rpms
# CMD rpm -Uhv https://w3test.monetplus.cz/~urepo/rhel6_64/rhel-rs-for-rhel-6-server-rpms
# CMD rpm -Uhv https://w3test.monetplus.cz/~urepo/rhel6_64/rhel-sjis-for-rhel-6-server-rpms
# CMD rpm -Uhv http://maven.monetplus.cz/content/groups/public
# CMD rpm -Uhv http://maven.monetplus.cz/content/groups/public-snapshots
# CMD rpm -Uhv http://gerald.monetplus.cz/smartshop
# CMD rpm -Uhv http://repo.mysql.com/yum/mysql-connectors-community/el/6/x86_64/
# CMD rpm -Uhv http://repo.mysql.com/yum/mysql-tools-community/el/6/x86_64/
# CMD rpm -Uhv http://repo.mysql.com/yum/mysql-5.6-community/el/6/x86_64/
 COPY yum.repos.d/* /etc/yum.repos.d/

#RUN yum -y update 

# Personal application 
# RUN yum install -y vim
# RUN yum install -y mc


##################### INSTALLATION END #####################

# Expose the default port
# EXPOSE 27017

# Default port to execute the entrypoint (MongoDB)
# CMD ["--port 27017"]

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]

ENTRYPOINT /bin/bash

WORKDIR ~/