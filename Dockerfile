# This is my centos dockerfile
FROM centos:latest
MAINTAINER Dusan Krajcovic <dusan.krajcovic@gmail.com>

RUN yum update -y

RUN yum install mc -y
RUN yum install vim -y