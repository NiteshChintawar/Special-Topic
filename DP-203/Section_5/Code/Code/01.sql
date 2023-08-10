-- Lab - Azure Data Lake to Azure Synapse - Log.csv file
-- Drop the existing tables

DROP EXTERNAL TABLE logdata
DROP EXTERNAL TABLE logdata_parquet

DROP TABLE DimCustomer
DROP TABLE DimProduct
DROP TABLE FactSales
DROP TABLE logdata_new
DROP TABLE pool_logdata
DROP TABLE pool_logdata_parquet


CREATE TABLE [logdata]
(
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
    [Resource] [varchar](2000) NULL
)
