#!/bin/bash

#docker run -ti -P --name console krajcovic/centos:latest /bin/bash
docker run -d --name db training/postgres
#docker run -d -P --name node1 krajcovic/centos:latest /bin/bash
docker run -d -P --name web --link db:db training/webapp python app.py
