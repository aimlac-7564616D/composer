CREATE DATABASE IF NOT EXISTS llanwrytd;

USE llanwrytd;

CREATE TABLE rseMarket (
    settlementDate DATETIME NOT NULL,
    settlementPeriod INT NOT NULL,
    clearoutPrice DECIMAL(8, 2),
    clearoutVolume DECIMAL(8, 2),
    imbalancePrice DECIMAL(8, 2),

    PRIMARY KEY (settlementDate, settlementPeriod)
);

CREATE TABLE powerPrediction (
    time DATETIME NOT NULL,

    WindSpeed DECIMAL(8, 3),
    WindPower DECIMAL(8, 3),
    SolarPower DECIMAL(8, 3),
    HQPowerDemand DECIMAL(8, 3),
    HQTemperature DECIMAL(8, 3),

    PRIMARY KEY ( time )
);

CREATE TABLE elexonDERSYdata (
    settlementDate DATETIME NOT NULL,
    settlementPeriod INT NOT NULL,

    systemSellPrice DECIMAL(8,2),
    systemBuyPrice DECIMAL(8,2),
    bSADDefault VARCHAR(16),
    priceDerivationCode VARCHAR(16),
    reserveScarcityPrice DECIMAL(8,2),
    indicativeNetImbalanceVolume DECIMAL(8,2),
    sellPriceAdjustment DECIMAL(8,2),
    buyPriceAdjustment DECIMAL(8,2),
    replacementPrice DECIMAL(8,2),
    replacementPriceCalculationVolume DECIMAL(8,2),
    totalSystemAcceptedOfferVolume DECIMAL(8,2),
    totalSystemAcceptedBidVolume DECIMAL(8,2),
    totalSystemTaggedAcceptedOfferVolume DECIMAL(8,2),
    totalSystemTaggedAcceptedBidVolume DECIMAL(8,2),
    totalSystemPricedAcceptedOfferVolume DECIMAL(8,2),
    totalSystemAdjustmentSellVolume DECIMAL(8,2),
    totalSystemAdjustmentBuyVolume DECIMAL(8,2),
    totalSystemTaggedAdjustmentSellVolume DECIMAL(8,2),
    totalSystemTaggedAdjustmentBuyVolume DECIMAL(8,2),

    PRIMARY KEY (settlementDate, settlementPeriod)
);

CREATE TABLE elexonB0620 (
    settlementDate DATETIME NOT NULL,
    settlementPeriod INT NOT NULL,

    quantity INT,
    activeFlag VARCHAR(16),

    PRIMARY KEY (settlementDate, settlementPeriod)
);

CREATE TABLE elexonB1620 (
    settlementDate DATETIME NOT NULL,
    settlementPeriod INT NOT NULL,

    biomass INT,
    hydroPumpedStorage INT,
    hydroRunofriverAndPoundage INT,
    fossilHardCoal INT,
    fossilGas INT,
    fossilOil INT,
    nuclear INT,
    windOnshore INT,
    windOffshore INT,
    solar INT,
    other INT,

    PRIMARY KEY (settlementDate, settlementPeriod)
);

CREATE TABLE userData (
    userIndex INT NOT NULL AUTO_INCREMENT,
    userID VARCHAR(128) UNIQUE NOT NULL,
    userEmail VARCHAR(128),
    userPassword VARCHAR(256),
    userRole ENUM('admin', 'non-admin', 'pending'),
    PRIMARY KEY ( userIndex )
);

-- web-view's default username/password: admin/aimlac
-- password hashed using sha256
INSERT INTO userData SET
    userID = 'admin',
    userEmail = 'admin@aimlac.com',
    userPassword = '71f3fcb0ee1407a3c49a9b2f207f68c9f21cd6dec7a516499883b4c740d01295',
    userRole = 'admin';

CREATE TABLE carbon_dioxide(
    time DATETIME NOT NULL,

    intensity INT,
    indicator VARCHAR(16),
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

