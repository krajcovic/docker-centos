#!/bin/bash

#docker run -ti -P --name console krajcovic/centos:latest /bin/bash
#ocker run -d --name db postgres:latest
docker run -d --name db mysql:latest
#docker run -d -P --name node1 krajcovic/centos:latest /bin/bash
docker run -d -P --name web --link db:db krajcovic/centos:latest python app.py
