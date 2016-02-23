 #!/bin/bash


containers=( $(docker ps -q) );
#echo ${containers[@]};

if [ ${#containers[@]} -ne 0 ]; then
	echo 'Stopping all dockers'
	docker stop $(docker ps -q)
else
	echo 'No containers'
fi