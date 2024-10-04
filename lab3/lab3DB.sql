CREATE DATABASE apiDat;

   CREATE TABLE `jsonObjs` (
      -- NOT NULL -> Can't store null values
      -- Auto Increment allows for every val to be unique
      `apiType` char(40) NOT NULL,
      jdoc JSON NOT NULL
   );

INSERT INTO jsonObjs
VALUES (1, '{"key1": "value1", "key2": "value2"}');