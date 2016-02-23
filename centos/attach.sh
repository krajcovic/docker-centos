#!/bin/bash

# Variables
container_name=monet-base

docker start ${container_name}
docker attach ${container_name}
