-- Lab - Not adding duplicate rows

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
