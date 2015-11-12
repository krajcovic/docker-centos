FROM centos:latest

RUN yum -y update 
RUN yum install -y vim
RUN yum install -y mc