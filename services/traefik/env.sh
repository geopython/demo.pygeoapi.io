#!/bin/bash

# Set environment variables
export HOSTNAME
export HTTP_PORT=8000
export SITE_DOMAIN=localhost

# Set Let's Encrypt email - customize as needed
export LETSENCRYPT_EMAIL="just@justobjects.nl"

# Set host-dependent vars
case "${HOSTNAME}" in
    # main server
    "PYGEOAPI")
        SITE_DOMAIN="demo.pygeoapi.io"
        HTTP_PORT=80
        ;;

    # TODO: other server with SSL
    "TERRAOPS")
        SITE_DOMAIN="pygeoapi.terraops.net"
        HTTP_PORT=80
        ;;

    *)
        echo "Your host ${HOSTNAME} is unknown - PLEASE ADD YOUR HOSTNAME IN git/services/traefik/env.sh - exit"
        exit 1
esac

# Note: acme.json is now stored in Docker volume 'acme_certificates'
# No need to create/chmod acme.json file anymore
