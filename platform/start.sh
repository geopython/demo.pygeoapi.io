#!/bin/bash
#
# This runs all assets (mainly Docker containers) for pygeoapi demo services.
#
# Just van den Broecke - 2019
#

script_dir=${0%/*}

pushd ${script_dir}/../services
	./start.sh
popd

