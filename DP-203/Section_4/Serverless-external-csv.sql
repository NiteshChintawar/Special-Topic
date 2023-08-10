--create DATABASE appdb

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Summer2023$' ;

-- DROP MASTER KEY;


CREATE DATABASE SCOPED CREDENTIAL SasToken
WITH IDENTITY = 'SHARED ACCESS SIGNATURE' ,
  SECRET = 'sv=2022-11-02&ss=b&srt=sco&sp=rwlx&se=2023-06-20T05:54:40Z&st=2023-06-19T21:54:40Z&spr=https&sig=K71gvAop0RqH5twMrS%2BpbaE3r7VykDdt%2B78EP6aqcwo%3D';

-- DROP DATABASE SCOPED CREDENTIAL SasToken;


CREATE EXTERNAL DATA SOURCE log_data
WITH
  ( LOCATION = 'https://datalake24424.blob.core.windows.net/csv/Log.csv' ,
    CREDENTIAL = SasToken
  ) ;
-- DROP EXTERNAL DATA SOURCE log_data

  CREATE EXTERNAL FILE FORMAT TextFileFormat
WITH (FORMAT_TYPE = DELIMITEDTEXT,
      FORMAT_OPTIONS(
          FIELD_TERMINATOR = ',',
          FIRST_ROW = 2
         )
);

-- DROP EXTERNAL FILE FORMAT TextFileFormat

CREATE EXTERNAL TABLE [logdata] (
[Correlation id] [varchar](200) NULL, 
[Operation name] [varchar](200) NULL, 
[Status] [varchar](100) NULL, 
[Event category] [varchar](100) NULL, 
[Level] [varchar](100) NULL, 
[Time] [datetime] NULL, 
[Subscription] [varchar](200) NULL, 
[Event initiated by] [varchar](1000) NULL, 
[Resource type] [varchar](1000) NULL, 
[Resource group] [varchar](1000) NULL,
 [Resource] [varchar](2000) NULL) 
 WITH (
    LOCATION = '/Log.csv',
    DATA_SOURCE=log_data,
    FILE_FORMAT=TextFileFormat
 )

-- drop external table logdata

SELECT * from [logdata]
