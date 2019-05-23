#!/bin/bash

echo "Updating pygeoapi..."

/src/scripts/docker-clean.sh

cd /srv/pygeoapi && ./stop.sh && docker pull geopython/pygeoapi:latest && ./build.sh && ./start.sh
