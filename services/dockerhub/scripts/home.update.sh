#!/bin/bash

echo "Updating pygeoapi..."

/src/scripts/docker-clean.sh

cd /srv/home && ./stop.sh && docker pull geopython/demo.pygeoapi.io:latest && ./start.sh
