#!/bin/bash
#
# This build all assets (mainly Docker images) for Admin Platform
# You must first have installed Docker, or better have run bootstrap.sh
#
# Just van den Broecke - 2017
#

script_name=${0##*/}
script_dir=${0%/*}

DOCKER_HOME=${script_dir}/../services
DOCKERS="pygeoapi"

for DOCK in ${DOCKERS}
do
  pushd ${DOCKER_HOME}/${DOCK}
  ./build.sh
  popd
done

echo "READY"
