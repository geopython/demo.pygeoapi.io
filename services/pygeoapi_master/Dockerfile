FROM geopython/pygeoapi:latest

LABEL maintainer="Just van den Broecke <justb4@gmail.com>"

# Volume mapping cannot be used with webhook
# https://github.com/maccyber/micro-dockerhub-hook
# simply copy config into Image.
COPY ./local.config.yml /pygeoapi/local.config.yml
ADD ./data /pygeoapi/data
