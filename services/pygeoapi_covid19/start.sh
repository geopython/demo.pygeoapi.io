#!/bin/bash

# https://github.com/docker-library/elasticsearch/issues/111
sudo sysctl -w vm.max_map_count=262144

./stop.sh
docker-compose up -d
