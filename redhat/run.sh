#!/bin/bash

# Variables
container_name=maven-repository

# Check container exist.
container_id=$(docker ps -a -q -f name=${container_name})
echo "Container ID: " $container_id

if [ $container_name ]; then
	echo 'Stopping container'
	docker stop ${container_name}
	echo 'Removing container'
	docker rm $container_name
fi

echo 'Running container'
docker run -t -i --name=$container_name --dns=193.33.22.33 --dns-search=monetplus.cz monet/maven-repository:latest
