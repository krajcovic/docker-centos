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
# RUN yum -y swap -- remove fakesystemd -- install systemd systemd-libs
# RUN yum -y update; yum clean all; \
# (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
# rm -f /lib/systemd/system/multi-user.target.wants/*;\
# rm -f /etc/systemd/system/*.wants/*;\
# rm -f /lib/systemd/system/local-fs.target.wants/*; \
# rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
# rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
# rm -f /lib/systemd/system/basic.target.wants/*;\
# rm -f /lib/systemd/system/anaconda.target.wants/*;

# RUN yum install -y vim, mc
# RUN yum install -y mc

# Initialization
#CMD echo 'Welcome to your Toy ${hostname} container!' >> /etc/motd

# RUN echo 'kurnik' >> /etc/resolv.conf
# RUN echo 'nameserver 193.33.22.33' > /etc/resolv.conf;\
# echo 'nameserver 193.33.23.33' >> /etc/resolv.conf;\
# echo 'search monetplus.cz' >> /etc/resolv.conf

# RUN yum -y install httpd; yum clean all; systemctl enable httpd.service
#RUN systemctl restart network.service

# RUN systemctl restart network.service
# RUN yum -y install httpd; systemctl enable httpd.service
#RUN ping maven.monetplus.cz


################## BEGIN INSTALLATION ######################

COPY yum.repos.d/* /etc/yum.repos.d/

# RUN echo 'nameserver 193.33.22.33' > /etc/resolv.conf;\
# echo 'nameserver 193.33.23.33' >> /etc/resolv.conf;\
# echo 'search monetplus.cz' >> /etc/resolv.conf; yum -y update --skip-broken;yum install -y vim, mc

RUN yum -y update --skip-broken;yum install -y vim, mc;

# RUN yum -y jdk-env

# Personal application 
# RUN yum -y update;yum install -y vim, mc
# RUN yum install -y mc


##################### INSTALLATION END #####################

# Expose the default port
# EXPOSE 27017

# Default port to execute the entrypoint (MongoDB)
# CMD ["--port 27017"]
# CMD ["/usr/sbin/init"]

# VOLUME [ "/sys/fs/cgroup" ]

WORKDIR ~/

ENTRYPOINT ["/bin/bash"]

