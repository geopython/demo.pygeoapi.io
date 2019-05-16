#!/usr/bin/env ash

# Runs the Flask app with gunicorn

echo "START /entry.sh"
echo "Running ${CONTAINER_NAME} WSGI on ${CONTAINER_HOST}:${CONTAINER_PORT} with ${WSGI_WORKERS} workers"

cd /app

gunicorn --workers ${WSGI_WORKERS} \
		--worker-class=${WSGI_WORKER_CLASS} \
		--timeout ${WSGI_WORKER_TIMEOUT} \
		--name=${CONTAINER_NAME} \
		--bind ${CONTAINER_HOST}:${CONTAINER_PORT} \
		index:app

echo "END /entry.sh"
