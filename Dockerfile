# This is my centos dockerfile
FROM centos:latest
MAINTAINER Dusan Krajcovic <dusan.krajcovic@gmail.com>

RUN yum update -y

# Oracle JDK 1.8
RUN yum install -y wget && wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25-linux-x64.rpm
RUN rpm -ivh jdk-8u25-linux-x64.rpm && rm jdk-8u25-linux-x64.rpm

# Optional tools
RUN yum install mc -y
RUN yum install vim -y