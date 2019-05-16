#!/bin/bash
#
# This lists status all service components for pygeoapi stack
#
# Just van den Broecke - 2019
#

SCRIPT_DIR=${0%/*}

echo "Containers"
echo "=========="
docker ps

echo "Networks"
echo "========"
docker network ls

echo "Volumes"
echo "======="
docker volume ls
