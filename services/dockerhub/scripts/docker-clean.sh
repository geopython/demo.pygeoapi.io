#!/bin/bash
#
# Remove all exited containers
docker rm $(docker ps -a -f status=exited -q)

# And dangling images
docker rmi $(docker images -f dangling=true -q)
