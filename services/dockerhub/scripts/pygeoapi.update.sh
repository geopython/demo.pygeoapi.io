#!/bin/bash

echo "Updating pygeoapi..."

cd /srv/pygeoapi && docker pull geopython/pygeoapi:latest && ./build.sh && ./stop.sh && ./start.sh
