# composer
Docker and docker-compose files to deploy the full software solution.

Requires a `.env` file specifying:

```
DATABASE_ROOT_PASSWORD=
AIMLAC_RSE_ADDR=
MET_SECRET_KEY=
MET_API_KEY=
OPEN_WEATHER_API=

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