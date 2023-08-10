
-- Lab - Mapping Data Flow - Dimension Table - DimCustomer

SELECT ct.[CustomerID],ct.[CompanyName],ct.[SalesPerson]
  FROM [SalesLT].[Customer] as ct  


CREATE TABLE [dbo].[DimCustomer](
	[CustomerID] [int] NOT NULL,
    [CompanyName] varchar(200) NOT NULL,
	[SalesPerson] varchar(300) NOT NULL
)
    WITH  
(   
    DISTRIBUTION = REPLICATE
)		

-- Lab - Mapping Data Flow - Dimension Table - DimProduct

SELECT prod.[ProductID],prod.[Name] as ProductName,model.[ProductModelID],model.[Name] as ProductModelName,category.[ProductcategoryID],category.[Name] AS ProductCategoryName
FROM [SalesLT].[Product] prod
LEFT JOIN [SalesLT].[ProductModel] model ON prod.[ProductModelID] = model.[ProductModelID]
LEFT JOIN [SalesLT].[ProductCategory] category ON prod.[ProductcategoryID]=category.[ProductcategoryID]


CREATE TABLE [dbo].[DimProduct](
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