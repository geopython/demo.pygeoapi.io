#!/bin/bash
#
# This shows status.
#
# Just van den Broecke - 2019
#

script_dir=${0%/*}

pushd ${script_dir}/../services
	./status.sh
popd
