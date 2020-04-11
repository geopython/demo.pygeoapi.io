FROM geopython/pygeoapi:latest

LABEL maintainer="Francesco Bartoli <xbartolone@gmail.com>"

# Volume mapping cannot be used with webhook
# https://github.com/maccyber/micro-dockerhub-hook
# simply copy config into Image.
COPY ./covid19.config.yml /pygeoapi/local.config.yml
