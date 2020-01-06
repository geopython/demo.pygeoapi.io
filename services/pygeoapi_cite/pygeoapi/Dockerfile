FROM geopython/pygeoapi:latest

LABEL maintainer="Just van den Broecke <justb4@gmail.com>"

# Volume mapping cannot be used with webhook
# https://github.com/maccyber/micro-dockerhub-hook
# simply copy config into Image.
COPY ./cite.config.yml /pygeoapi/local.config.yml
