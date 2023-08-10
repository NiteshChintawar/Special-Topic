-- For Each Activity

DROP TABLE [dbo].[DimCustomer]

CREATE TABLE [dbo].[DimCustomer](
	[CustomerID] [int] NOT NULL,
    [CompanyName] varchar(200) NOT NULL,
	[SalesPerson] varchar(300) NOT NULL
)
    WITH  
(   
    DISTRIBUTION = REPLICATE
)