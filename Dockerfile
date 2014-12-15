# This is my centos dockerfile
FROM centos:latest
MAINTAINER Dusan Krajcovic <dusan.krajcovic@gmail.com>

RUN yum update

RUN yum install mc
RUN yum install vim
