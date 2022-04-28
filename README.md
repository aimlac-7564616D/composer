# composer
Docker and docker-compose files to deploy the full software solution.

Requires a `.env` file specifying:

```
DATABASE_ROOT_PASSWORD=
AIMLAC_RSE_ADDR=
AIMLAC_RSE_KEY=
MET_SECRET_KEY=
MET_API_KEY=
OPEN_WEATHER_API=
JWT_SECRET=

# specific to llanwrytd
LOCATION_LAT=52.1051
LOCATION_LON=-3.6680
```


Start:
```
docker-compose up
```

Stop:
```
docker-compose down
```

## First time setup

NodeRed requires dependencies to be installed manually -- either boot up the image and docker exec to `npm i` in the `/data` directory, or change directory to `crawlers/flows` and `npm i` before booting the image.

First time setup for Grafana requires configuring a MySQL data source at `172.18.5.1:3306` using `llanwrytd` as the database, with user `aimlac` password `aimlac`, and importing the dashboard JSONs.
