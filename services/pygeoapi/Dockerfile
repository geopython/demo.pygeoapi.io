FROM debian:buster-slim

LABEL maintainer="Just van den Broecke <justb4@gmail.com>"

#
# ARGS
#
ARG TIMEZONE="Europe/Amsterdam"
ARG LOCALE="en_US.UTF-8"

# ARG ADD_PYTHON_DEB_PACKAGES="python-scipy python-seaborn python-matplotlib"
ARG ADD_PYTHON_DEB_PACKAGES=""
# ARG ADD_PYTHON_PIP_PACKAGES="scikit-learn==0.18"
ARG ADD_PYTHON_PIP_PACKAGES="gunicorn gevent wheel"

# Tricky: must match installed GDAL version (2.1.3 on Debian Stretch)
# TODO: we really need GDAL >= 2.3 e.g. to use OGR ESRI FeatureServer Driver
ARG GDAL_PYTHON_BINDINGS_VERSION="2.4.0"

#
# ENV settings
#
ENV TZ=${TIMEZONE} \
	DEBIAN_FRONTEND="noninteractive" \
	BUILD_DEPS="tzdata build-essential python3-setuptools python3-pip apt-utils libgdal-dev git" \
	PYTHON_CORE_PACKAGES="locales gdal-bin python3-gdal" \
	PYTHON_EXTRA_DEB_PACKAGES="${ADD_PYTHON_DEB_PACKAGES}"  \
	PYTHON_EXTRA_PIP_PACKAGES="${ADD_PYTHON_PIP_PACKAGES}" \
	PYGEOAPI_GITHUB="-b issue-127-ogrpaging https://github.com/geopython/pygeoapi.git" \
	PYGEOAPI_HOME="/pygeoapi" \
	PYGEOAPI_CONFIG="${PYGEOAPI_HOME}/local.config.yml" \
	PYGEOAPI_OPENAPI="${PYGEOAPI_HOME}/local.openapi.yml" \
	CONTAINER_NAME="pygeoapi" \
	CONTAINER_HOST="0.0.0.0" \
	CONTAINER_PORT="80" \
	WSGI_WORKERS="4" \
	WSGI_WORKER_TIMEOUT="6000" \
	WSGI_WORKER_CLASS="gevent"

# All RUNs
RUN \
	apt-get update \
	&& apt-get --no-install-recommends install  -y \
		${BUILD_DEPS} \
	    ${PYTHON_CORE_PACKAGES} \
	    ${PYTHON_EXTRA_DEB_PACKAGES} \
	# Timezone
	&& cp /usr/share/zoneinfo/${TZ} /etc/localtime\
	&& dpkg-reconfigure tzdata \
	# Locale
	&& sed -i -e "s/# ${LOCALE} UTF-8/${LOCALE} UTF-8/" /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=${LOCALE} \
    && echo "For ${TZ} date=`date`" && echo "Locale=`locale`" \
	&& pip3 install ${PYTHON_EXTRA_PIP_PACKAGES} \
	# Install pygeoapi
    && git clone ${PYGEOAPI_GITHUB} ${PYGEOAPI_HOME} \
	&& cd ${PYGEOAPI_HOME} \
	&& pip3 install -r requirements.txt \
	&& pip3 install -r requirements-dev.txt \
	&& pip3 install -e . \
	&& pip3 uninstall --yes wheel \
	&& apt-get remove --purge ${BUILD_DEPS} -y \
	&& apt autoremove -y  \
    && rm -rf /var/lib/apt/lists/*

# Not required
    # Install GDAL version matching installed binary - MESSY - need cleaner solution!
    # && pip3 install GDAL==`gdalinfo --version | cut -d' ' -f2 | cut -d',' -f1` \
#    && export CPLUS_INCLUDE_PATH=/usr/include/gdal \
#    && export C_INCLUDE_PATH=/usr/include/gdal \
#    && pip3 install GDAL==${GDAL_PYTHON_BINDINGS_VERSION} \
    # Optional packages to install via Pip

COPY local.config.yml ${PYGEOAPI_HOME}
COPY entrypoint.sh /entrypoint.sh

WORKDIR ${PYGEOAPI_HOME}

ENTRYPOINT ["/entrypoint.sh"]

