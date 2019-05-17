FROM python:3.6.7-alpine3.8

LABEL maintainer="Just van den Broecke <justb4@gmail.com>"

# These are default values,
# Override when running container via docker(-compose)

# General ENV settings
ENV LC_ALL="en_US.UTF-8" \
	LANG="en_US.UTF-8" \
	LANGUAGE="en_US.UTF-8" \
	CONTAINER_NAME="home" \
	CONTAINER_HOST=0.0.0.0 \
	CONTAINER_PORT=80 \
	WSGI_WORKERS=4 \
	WSGI_WORKER_TIMEOUT=6000 \
	WSGI_WORKER_CLASS="sync"

# Add entry-script and app to root dir
ADD app /app
COPY docker/*.sh /

# Make executable
RUN chmod a+x /*.sh && /build.sh

EXPOSE ${CONTAINER_PORT}

ENTRYPOINT /entry.sh
