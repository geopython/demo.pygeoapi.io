#!/bin/bash

echo "Updating pygeoapi..."

cd /srv/pygeoapi && docker-compose pull && docker-compose up -d
