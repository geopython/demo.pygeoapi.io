# Traefik 

This directory contains Traefik, the HTTP(S) proxy that routes to 
the various services like pygeoapi.

Most of the Traefik configuration is contained in the
[docker-compose.yml](docker-compose.yml) file.

## Dynamic Configuration

The `config/dynamic` directory contains:
- `tls.yml` - TLS security options with strong cipher suites (TLS 1.2+ minimum)
- `middlewares.yml` - HTTP security headers and CORS configuration
