CREATE DATABASE IF NOT EXISTS llanwrytd;

USE llanwrytd;

CREATE TABLE energy_onsite(
    entry_id INT NOT NULL AUTO_INCREMENT,

    time DATETIME,

    hq_power INT,
    computing_center INT,
    wind1 INT,
    wind2 INT,
    wind3 INT,
    wind4 INT,
    windA INT,
    windB INT,

    hq_temperature DECIMAL(4,2),
    solar DECIMAL(8,2),

    PRIMARY KEY ( entry_id )
);

CREATE TABLE metoffice_spot(
    entry_id INT NOT NULL AUTO_INCREMENT,

    time DATETIME,
    
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
    screenTemperature DECIMAL(4,2),
    maxScreenAirTemp DECIMAL(4,2),
    minScreenAirTemp DECIMAL(4,2),
    screenDewPointTemperature DECIMAL(4,2),
    feelsLikeTemperature DECIMAL(4,2),

    PRIMARY KEY ( entry_id )
);

GRANT ALL PRIVILEGES ON llanwrytd.* TO 'aimlac'@'%';

FLUSH PRIVILEGES;

