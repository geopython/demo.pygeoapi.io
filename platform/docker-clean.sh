#!/bin/bash
#
# Remove all containers
docker rm $(docker ps -a -f status=exited -q)

# And dangling images
docker rmi $(docker images -f dangling=true -q)
