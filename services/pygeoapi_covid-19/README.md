# pygeoapi COVID-19 demo service - master

This is the configuration and service for the COVID-19 endpoint provided by `pygeoapi`.
It runs a pygeoapi instance with a configuration that fetches data
directly from ESRI backend Feature Services. In effect, this is basically a proxy with 
actualized data from official sources like the Center for Systems Science and Engineering (CSSE) 
at Johns Hopkins University and national Public Health institutes like RIVM in The Netherlands.
So no data is stored.

Contact: https://gitter.im/geopython/pygeoapi or via main website: https://pygeoapi.io

## Datasources

### Global

Contact: Francesco Bartoli - https://github.com/francbartoli

TBS

### Italy

Contact: Francesco Bartoli - https://github.com/francbartoli

TBS

### The Netherlands

Contact: Just van den Broecke - https://github.com/justb4

For The Netherlands COVID-19 data is provided by ESRI NL via Arcgis Feature Services.
Their data stems directly from the National Institute for Public Health
and the Environment (part of Dutch Ministry of Health, Welfare and Sport), the RIVM https://rivm.nl.
So this data can be considered official and actual.

The main URL used is : https://services.arcgis.com/nSZVuSZjHpEZZbRo . 
Unfortunately many layers have no geometry, making these hard to integrate.

Layers

* `Cases in The Netherlands - Per Municipality - Points` source: https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/CoronavirusPunten/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json 
* `Cases in The Netherlands - Per Municipality - Polygons` source: https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/CoronaOpenbaar/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json
* `Cases in The Netherlands - Hospitalized Per Municipality - Points` source: https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_ziekenhuisopnamen_punt/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json
* `Cases in The Netherlands - Hospitalized Per Municipality - Polygons` source: https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_ziekenhuisopnamen_vlak/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json
* `Cases in The Netherlands - Hospitalized Per Municipality over Time - Points` source: https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_ziekenhuisopnamen_tijd_punt/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json
* `Cases in The Netherlands - Hospitalized Per Municipality over Time - Polygons` source: https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_ziekenhuisopnamen_tijd_vlak/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json

Excluded

* Same as `CoronaOpenbaar` Layer: https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Aantal_besmettingen_per_1000_inwoners/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json

TODO (tables, no geospatial column)

* All numbers over time (interesting table!)  
https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_aantallen_tabel/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json
* IC intakes, age: https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_IC_opnamen_leeftijd/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json

## Deployment of this Service

This service runs latest GitHub master branch of `pygeoapi` using
[Docker Image from DockerHub](https://cloud.docker.com/u/geopython/repository/docker/geopython/pygeoapi).
with a [local config file](covid-19.config.yml).

A local [Docker Image](Dockerfile) is [built](build.sh) named `geopython/pygeoapi_covid-19:latest` 
that mainly copies in the [COVID-19 config](covid-19.config.yml).

This was needed (i.s.o. Volume mapping) to have [micro-dockerhub-hook](https://github.com/maccyber/micro-dockerhub-hook)
restart the service (as the webhook is done within a Docker container and Volume mapping within a Volume map does not work).

This service is restarted pulling the latest `pygeoapi` Docker Image whenever a new Image is built (via DockerHub autobuild on
the [pygeoapi GitHub master](https://github.com/geopython/pygeoapi) commit or explicitly).

There is also a [stable](../pygeoapi_stable) version that runs the latest `pygeoapi` version also from DockerHub.
