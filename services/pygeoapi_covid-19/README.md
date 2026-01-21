# pygeoapi COVID-19 demo service - master

This is the [configuration](pygeoapi/covid-19.config.yml) and [Docker service](docker-compose.yml) for the COVID-19 endpoint provided by `pygeoapi`.
It runs a [pygeoapi](https://pygeoapi.io) instance with a [configuration](pygeoapi/covid-19.config.yml) that fetches data
directly from ESRI backend Feature Services. In effect, we (`pygeoapi` team) provide basically a proxy with 
actualized data from official sources like the 
[Center for Systems Science and Engineering](https://systems.jhu.edu/) (CSSE) 
at Johns Hopkins University and national 
Public Health institutes like [RIVM in The Netherlands](https://rivm.nl).
The data is provided via the new [OGC API Features](https://www.ogc.org/standards/ogcapi-features) REST service
for which `pygeoapi` is a [certified OGC Compliant and an OGC Reference Implementation](https://www.ogc.org/resource/products/details/?pid=1606).

Main endpoint is: [https://demo.pygeoapi.io/covid-19](https://demo.pygeoapi.io/covid-19). Note that this is an API, with some basic
HTML rendering, **not a viewer/dashboard**.

As the OGC API Features is based on Open API Specification (Swagger), there is also a Swagger endpoint:

[https://demo.pygeoapi.io/covid-19/openapi?f=html](https://demo.pygeoapi.io/covid-19/openapi?f=html)

So no data is stored nor cached by our service.

Contact: [https://gitter.im/geopython/pygeoapi](https://gitter.im/geopython/pygeoapi) or via main website: [https://pygeoapi.io](https://pygeoapi.io)

## Auto-deploy

Via the [Updater](../update) service this service gets redeployed when a new image is available 
on Dockerhub.

## Datasources

### Global

Contact: Francesco Bartoli - [https://github.com/francbartoli](https://github.com/francbartoli)

TBS

### Italy

Contact: Francesco Bartoli - [https://github.com/francbartoli](https://github.com/francbartoli)

For The Italy COVID-19 data are released publicly on GitHub under the [CC-BY-4.0](https://creativecommons.org/licenses/by/4.0/deed.it), [https://github.com/pcm-dpc/COVID-19](https://github.com/pcm-dpc/COVID-19). These raw data are served directly from that repository storage.

Some layers are also provided by ESRI via Arcgis Feature Services.
Their data stems directly from the same source above, managed by the National Civil Protection Department under the Presidency of the Council of Ministers, the DPC [http://www.protezionecivile.gov.it/](http://www.protezionecivile.gov.it/).
So this data can be considered official and actual.

The main URL used is : [https://services6.arcgis.com/L1SotImj1AAZY1eK](https://services6.arcgis.com/L1SotImj1AAZY1eK) . 
Unfortunately many layers have no geometry, making these hard to integrate.

Layers

* `Cases in Italy - Cases Per Region over Time - Points` source: [https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-regioni/dpc-covid19-ita-regioni.csv](https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-regioni/dpc-covid19-ita-regioni.csv)
* `Cases in Italy - Latest Cases Per Region - Points` source: [https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-regioni/dpc-covid19-ita-regioni-latest.csv](https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-regioni/dpc-covid19-ita-regioni-latest.csv)
* `Cases in Italy - Cases Per Province over Time - Points` source: [https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-province/dpc-covid19-ita-province.csv](https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-province/dpc-covid19-ita-province.csv)
* `Cases in Italy - Latest Cases Per Province - Points` source: [https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-province/dpc-covid19-ita-province-latest.csv](https://raw.githubusercontent.com/pcm-dpc/COVID-19/master/dati-province/dpc-covid19-ita-province-latest.csv)
* *Same layer as above* `Cases in Italy - Total Number Per Region With Latest Variation - Points` source: [https://services6.arcgis.com/L1SotImj1AAZY1eK/ArcGIS/rest/services/dpc_regioni_covid19/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=objectid+ASC&f=json](https://services6.arcgis.com/L1SotImj1AAZY1eK/ArcGIS/rest/services/dpc_regioni_covid19/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=objectid+ASC&f=json)
* `Restricted Zones in Italy - Polygons` source: [https://services6.arcgis.com/L1SotImj1AAZY1eK/ArcGIS/rest/services/COVID19_AREE/FeatureServer/0/query?where=FID+%3D+FID&outfields=*&orderByFields=FID+ASC&f=json](https://services6.arcgis.com/L1SotImj1AAZY1eK/ArcGIS/rest/services/COVID19_AREE/FeatureServer/0/query?where=FID+%3D+FID&outfields=*&orderByFields=FID+ASC&f=json)

Excluded

* Same as `dpc_regioni_covid19` Layer: [https://services6.arcgis.com/L1SotImj1AAZY1eK/ArcGIS/rest/services/COVID19__Regioni/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=objectid+ASC&f=json](https://services6.arcgis.com/L1SotImj1AAZY1eK/ArcGIS/rest/services/COVID19__Regioni/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=objectid+ASC&f=json)

TODO (tables, no geospatial column)

Interesting pygeoapi queries:

* *Cases in the Region of Lazio over Time* : [https://demo.pygeoapi.io/covid-19/collections/cases_italy_timeseries_per_region/items?denominazione_regione=lazio&f=json](https://demo.pygeoapi.io/covid-19/collections/cases_italy_timeseries_per_region/items?denominazione_regione=lazio&f=json)
* *Cases in Southers Part of Italy at regional level over Time (bbox)* : [https://demo.pygeoapi.io/covid-19/collections/cases_italy_per_region/items?bbox=10.616226,36.721480,18.855972,41.738721&f=json](https://demo.pygeoapi.io/covid-19/collections/cases_italy_timeseries_per_region/items?bbox=10.616226,36.721480,18.855972,41.738721&f=json)
* *Cases in the Region of Lazio divided per provinces over Time* : [https://demo.pygeoapi.io/covid-19/collections/cases_italy_timeseries_per_province/items?denominazione_regione=lazio&f=json](https://demo.pygeoapi.io/covid-19/collections/cases_italy_timeseries_per_province/items?denominazione_regione=lazio&f=json)
* *Cases in the Province of Rome over Time* : [https://demo.pygeoapi.io/covid-19/collections/cases_italy_timeseries_per_province/items?denominazione_provincia=roma&f=json](https://demo.pygeoapi.io/covid-19/collections/cases_italy_timeseries_per_province/items?denominazione_provincia=roma&f=json)
* *Cases in Southers Part of Italy divided per province over Time (bbox)* : [https://demo.pygeoapi.io/covid-19/collections/cases_italy_timeseries_per_province/items?bbox=10.616226,36.721480,18.855972,41.738721&f=json](https://demo.pygeoapi.io/covid-19/collections/cases_italy_timeseries_per_province/items?bbox=10.616226,36.721480,18.855972,41.738721&f=json)

### The Netherlands

Contact: Just van den Broecke - [https://github.com/justb4](https://github.com/justb4)

For The Netherlands COVID-19 data is provided by ESRI NL via Arcgis Feature Services.
Their data stems directly from the National Institute for Public Health
and the Environment (part of Dutch Ministry of Health, Welfare and Sport), the RIVM [https://rivm.nl](https://rivm.nl).
So this data can be considered official and actual.

The main URL used is : [https://services.arcgis.com/nSZVuSZjHpEZZbRo](https://services.arcgis.com/nSZVuSZjHpEZZbRo) . 
Unfortunately many layers have no geometry, making these hard to integrate.

Layers

* `Cases in The Netherlands - Per Municipality - Points` source: [https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/CoronavirusPunten/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json](https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/CoronavirusPunten/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json) 
* `Cases in The Netherlands - Per Municipality - Polygons` source: [https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/CoronaOpenbaar/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json](https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/CoronaOpenbaar/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json)
* `Cases in The Netherlands - Hospitalized Per Municipality - Points` source: [https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_ziekenhuisopnamen_punt/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json](https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_ziekenhuisopnamen_punt/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json)
* `Cases in The Netherlands - Hospitalized Per Municipality - Polygons` source: [https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_ziekenhuisopnamen_vlak/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json](https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_ziekenhuisopnamen_vlak/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json)
* `Cases in The Netherlands - Hospitalized Per Municipality over Time - Points` source: [https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_ziekenhuisopnamen_tijd_punt/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json](https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_ziekenhuisopnamen_tijd_punt/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json)
* `Cases in The Netherlands - Hospitalized Per Municipality over Time - Polygons` source: [https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_ziekenhuisopnamen_tijd_vlak/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json](https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_ziekenhuisopnamen_tijd_vlak/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json)

Excluded

* Same as `CoronaOpenbaar` Layer: [https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Aantal_besmettingen_per_1000_inwoners/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json](https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Aantal_besmettingen_per_1000_inwoners/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json)

TODO (tables, no geospatial column)

* All numbers over time (interesting table!)  
[https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_aantallen_tabel/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json](https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_aantallen_tabel/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json)
* IC intakes, age: [https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_IC_opnamen_leeftijd/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json](https://services.arcgis.com/nSZVuSZjHpEZZbRo/ArcGIS/rest/services/Coronavirus_IC_opnamen_leeftijd/FeatureServer/0/query?where=objectid+%3D+objectid&outfields=*&orderByFields=OBJECTID+ASC&f=json)

Interesting pygeoapi queries:

* *Cases in the Municipality of Amsterdam* : [https://demo.pygeoapi.io/covid-19/collections/cases_netherlands_per_municipality/items?Gemeentenaam=Amsterdam&f=json](https://demo.pygeoapi.io/covid-19/collections/cases_netherlands_per_municipality/items?Gemeentenaam=Amsterdam&f=json)
* *Cases in the Province of Noord-Holland* : [https://demo.pygeoapi.io/covid-19/collections/cases_netherlands_per_municipality/items?Provincie=Noord-Holland&f=json](https://demo.pygeoapi.io/covid-19/collections/cases_netherlands_per_municipality/items?Provincie=Noord-Holland&f=json)
* *Cases in Southers Part of The Netherlands (bbox)* : [https://demo.pygeoapi.io/covid-19/collections/cases_netherlands_per_municipality/items?bbox=2.4,50.7,7.2,52.1&f=json](https://demo.pygeoapi.io/covid-19/collections/cases_netherlands_per_municipality/items?bbox=2.4,50.7,7.2,52.1&f=json)
* *Persons Hospitalized in Amsterdam over Time* : [https://demo.pygeoapi.io/covid-19/collections/cases_netherlands_hospitalized_per_municipality_time/items?limit=1000&Gemeentenaam=Amsterdam&f=json](https://demo.pygeoapi.io/covid-19/collections/cases_netherlands_hospitalized_per_municipality_time/items?limit=1000&Gemeentenaam=Amsterdam&f=json)


## Deployment of this Service

This service runs latest GitHub master branch of `pygeoapi` using
[Docker Image from DockerHub](https://cloud.docker.com/u/geopython/repository/docker/geopython/pygeoapi) volumer-mounted with a [local config file](covid-19.config.yml).

There is also a [stable](../pygeoapi_stable) version that runs the latest `pygeoapi` version also from DockerHub.
