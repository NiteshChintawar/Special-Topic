-- Lab - Cache Sink

DROP TABLE [dbo].[DimCustomer]

CREATE TABLE [dbo].[DimCustomer](
    [CustomerSK] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
    [CompanyName] varchar(200) NOT NULL,
	[SalesPerson] varchar(300) NOT NULL
)
    WITH  
(   
    DISTRIBUTION = REPLICATE
)		


SELECT MAX([CustomerSK]) as CustomerSK FROM [dbo].[DimCustomer]

CustomerSK + CustomerSKSink#outputs()[1].CustomerSK

