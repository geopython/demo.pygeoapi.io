#!/bin/bash


# Stop and remove possibly old containers
./stop.sh

source ./env.sh

docker compose up -d
