#!/bin/bash
#
# Restarts all, via stop.sh and start.sh.
#
# Just van den Broecke - 2019
#

script_dir=${0%/*}

pushd ${script_dir}
	./stop.sh
	./start.sh
popd
