#!/bin/bash

# Set environment variables dependent on hostname.
export HOSTNAME

# Default is localhost, no SITE_DOMAIN SSL.
export HTTP_PORT=8000
export SITE_DOMAIN="NONE"

# Set Let's Encrypt email - customize as needed
export LETSENCRYPT_EMAIL="just@justobjects.nl"

# Set host-dependent vars
case "${HOSTNAME}" in
    # main server
    "PYGEOAPI")
        SITE_DOMAIN="demo.pygeoapi.io"
        HTTP_PORT=80
        ;;

    # TODO: other server with SSL based on HOSTNAME
    "TERRAOPS")
        SITE_DOMAIN="pygeoapi.terraops.net"
        HTTP_PORT=80
        ;;

    # TODO: other server with SSL based on HOSTNAME
    "savu")
        # SITE_DOMAIN="localhost"
        HTTP_PORT=8000
        ;;

    *)
        echo "Your host ${HOSTNAME} is unknown - PLEASE ADD YOUR HOSTNAME IN git/services/traefik/env.sh - exit"
        exit 1
esac

echo "SITE_DOMAIN=${SITE_DOMAIN} HTTP_PORT=${HTTP_PORT}"
