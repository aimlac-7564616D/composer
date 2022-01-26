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

GRANT ALL PRIVILEGES ON llanwrytd.* TO 'aimlac'@'%';

FLUSH PRIVILEGES;

