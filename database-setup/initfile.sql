CREATE DATABASE IF NOT EXISTS llanwrytd;

USE llanwrytd;

CREATE TABLE carbon_dioxide(
    time DATETIME NOT NULL,

    intensity INT,
    `index` VARCHAR(16),
    location VARCHAR(64),
    fuel_gas DECIMAL(8,2),
    fuel_coal DECIMAL(8,2),
    fuel_biomass DECIMAL(8,2),
    fuel_nuclear DECIMAL(8,2),
    fuel_hydro DECIMAL(8,2),
    fuel_imports DECIMAL(8,2),
    fuel_other DECIMAL(8,2),
    fuel_wind DECIMAL(8,2),
    fuel_solar DECIMAL(8,2),

    PRIMARY KEY ( time )
);

CREATE TABLE energy_onsite(
    time DATETIME NOT NULL,

    hq_power INT,
    computing_center INT,
    wind1 INT,
    wind2 INT,
    wind3 INT,
    wind4 INT,
    windA INT,
    windB INT,

    hq_temperature DECIMAL(8,2),
    solar DECIMAL(8,2),

    PRIMARY KEY ( time )
);

CREATE TABLE metoffice_spot(
    time DATETIME NOT NULL,
    
    windDirectionFrom10m INT,
    visibility INT,
    mslp INT,
    uvIndex INT,
    significantWeatherCode INT,
    precipitationRate INT,
    totalPrecipAmount INT,
    totalSnowAmount INT,
    probOfPrecipitation INT,
    screenRelativeHumidity DECIMAL(8,2),
    windGustSpeed10m DECIMAL(8,2),
    max10mWindGust DECIMAL(8,2),
    windSpeed10m DECIMAL(8,2),
    screenTemperature DECIMAL(8,2),
    maxScreenAirTemp DECIMAL(8,2),
    minScreenAirTemp DECIMAL(8,2),
    screenDewPointTemperature DECIMAL(8,2),
    feelsLikeTemperature DECIMAL(8,2),

    PRIMARY KEY ( time )
);

CREATE TABLE openweather_data(
    time DATETIME NOT NULL,
    
    pressure INT,
    humidity INT,
    visibility INT,
    clouds INT,
    wind_deg INT,
    wind_speed DECIMAL(8,2),
    wind_gust DECIMAL(8,2),
    temperature DECIMAL(8,2), 
    temperature_min DECIMAL(8,2),
    temperature_max DECIMAL(8,2),

    PRIMARY KEY ( time )
);

GRANT ALL PRIVILEGES ON llanwrytd.* TO 'aimlac'@'%';

FLUSH PRIVILEGES;

