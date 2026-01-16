# Called by the various start/stop.sh scripts but within the container...
# need to set the proper vars, as no constant HOSTNAME is present.
export SITE_DOMAIN="demo.pygeoapi.io"
export HTTP_PORT=80
echo "SITE_DOMAIN=${SITE_DOMAIN} HTTP_PORT=${HTTP_PORT}"
