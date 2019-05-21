# pygeoapi service

Runs latest GitHub master branch of `pygeoapi` using Docker.

## Running Tests

By default this Image will start `pygeoapi` using `gunicorn`, but you can also run tests:

```
	docker run -it geopython/pygeoapi test
```