-- Using a query to transfer data
CREATE TABLE [dbo].[FactSales](
	[ProductID] [int] NOT NULL,
	[SalesOrderID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[OrderQty] [smallint] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[OrderDate] [datetime] NULL,
	[TaxAmt] [money] NULL
)
WITH  
(   
    DISTRIBUTION = HASH (CustomerID)
)

SELECT dt.[ProductID],dt.[SalesOrderID],dt.[OrderQty],dt.[UnitPrice],hd.[OrderDate],hd.[CustomerID],hd.[TaxAmt]
  FROM [SalesLT].[SalesOrderDetail] dt
  LEFT JOIN [SalesLT].[SalesOrderHeader] hd
  ON dt.[SalesOrderID]=hd.[SalesOrderID]