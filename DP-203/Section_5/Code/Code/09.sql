-- Lab - Surrogate Keys - Dimension tables

DROP TABLE [dbo].[DimProduct]

CREATE TABLE [dbo].[DimProduct](
    [ProductSK] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductModelID] [int] NOT NULL,
	[ProductcategoryID] [int] NOT NULL,
	[ProductName] varchar(50) NOT NULL,	
	[ProductModelName] varchar(50) NULL,
	[ProductCategoryName] varchar(50) NULL
)
WITH  
(   
    DISTRIBUTION = REPLICATE
)