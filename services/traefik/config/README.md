# Traefik v3.5.2 Configuration

This directory contains the Traefik v3.x configuration files and dynamic configurations.

## Configuration Files

The main configuration files are named after the host's hostname:
- `traefik.PYGEOAPI.yml` - Production config with HTTPS and Let's Encrypt
- `traefik.default.yml` - Development/default config (HTTP only)
- `default.nusa.yml` - Nusa-specific configuration

## Dynamic Configuration

The `dynamic/` directory contains:
- `tls.yml` - TLS security options with strong cipher suites (TLS 1.2+ minimum)
- `middlewares.yml` - HTTP security headers and CORS configuration

## Certificates

- `acme.json` - Let's Encrypt certificates (created automatically, permissions 600)