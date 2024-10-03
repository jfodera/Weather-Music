CREATE DATABASE apiDat;

CREATE TABLE `jsonObjs` (
   -- NOT NULL -> Can't store null values
   `callid` int(10) unsigned NOT NULL AUTO_INCREMENT,
   `jObs` JSON NOT NULL,
   PRIMARY KEY (`callid`)
);

INSERT INTO jsonObjs
VALUES ('{"key1": "value1", "key2": "value2"}');