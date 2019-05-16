#!/bin/bash
#
# This installs all assets for pygeoapi demo services
# You must first have run ./build.sh
#
# Just van den Broecke - 2019
#

script_dir=${0%/*}


# Traditional TODO look into Upstart Way
# update-rc.d pygeoapi defaults

cp ${script_dir}/pygeoapi.service /lib/systemd/system/

systemctl disable pygeoapi.service
systemctl enable pygeoapi.service
systemctl daemon-reload

echo "READY: now start using 'systemctl start|stop pygeoapi.service'"
