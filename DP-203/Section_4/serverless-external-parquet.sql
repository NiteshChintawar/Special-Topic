--create DATABASE appdb

-- CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Summer2023$' ;

CREATE DATABASE SCOPED CREDENTIAL SasToken
WITH IDENTITY = 'SHARED ACCESS SIGNATURE' ,
  SECRET = 'sv=2022-11-02&ss=b&srt=sco&sp=rwla&se=2023-06-21T06:27:14Z&st=2023-06-19T22:27:14Z&spr=https&sig=3AcwtFRJiXigHfzUAqFJ6%2BafN3hOMbHuntjkuxjb9hY%3D';
-- DROP DATABASE SCOPED CREDENTIAL SasToken;

CREATE EXTERNAL DATA SOURCE log_data_parquet
WITH
  ( LOCATION = 'https://datalake24424.blob.core.windows.net/parquet' ,
    CREDENTIAL = SasToken
  ) ;
-- DROP EXTERNAL DATA SOURCE log_data_parquet

CREATE EXTERNAL FILE FORMAT ParquetFileFormat
WITH (FORMAT_TYPE = PARQUET,
      DATA_COMPRESSION='org.apache.hadoop.io.compress.SnappyCodec'
);
-- DROP EXTERNAL FILE FORMAT ParquetFileFormat

--remove spaces in column names in parquet file
CREATE EXTERNAL TABLE [logdata_parquet] (
[Correlationid] [varchar](200) NULL, 
[Operationname] [varchar](200) NULL, 
[Status] [varchar](100) NULL, 
[Eventcategory] [varchar](100) NULL, 
[Level] [varchar](100) NULL, 
[Time] [varchar](100) NULL, 
[Subscription] [varchar](200) NULL, 
[Eventinitiatedby] [varchar](1000) NULL, 
[Resourcetype] [varchar](1000) NULL, 
[Resourcegroup] [varchar](1000) NULL,
 [Resource] [varchar](2000) NULL) 
 WITH (
    LOCATION = '/log.parquet',
    DATA_SOURCE=log_data_parquet,
    FILE_FORMAT=ParquetFileFormat
 )

--  drop external table [logdata_parquet]

 SELECT * from logdata_parquet

