#!/bin/bash

# Variables
container_name=monet-base

# Check container exist.
container_id=$(docker ps -a -q -f name=${container_name})
# echo $container_id

if [ $container_name ]; then
	echo 'Stopping container'
	docker stop ${container_name}
	echo 'Removing container'
	docker rm $container_name
fi

echo 'Running container'
docker run -it --name=$container_name --dns=193.33.22.33 --dns-search=monetplus.cz krajcovic/centos-base:local /bin/bash
# docker run -it --name=$container_name krajcovic/centos-base:local /bin/bash
# --rm=true

#docker run -ti -P --name console krajcovic/centos:latest /bin/bash
#ocker run -d --name db postgres:latest
#docker run -d --name db mysql:latest
#docker run -d -P --name node1 krajcovic/centos:latest /bin/bash
#docker run -d -P --name web --link db:db krajcovic/centos:latest python app.py
