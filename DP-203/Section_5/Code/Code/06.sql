-- Lab - Mapping Data Flow - Fact Table

SELECT dt.[ProductID],dt.[SalesOrderID],dt.[OrderQty],dt.[UnitPrice],hd.[OrderDate],hd.[CustomerID],hd.[TaxAmt]
  FROM [SalesLT].[SalesOrderDetail] dt
  LEFT JOIN [SalesLT].[SalesOrderHeader] hd
  ON dt.[SalesOrderID]=hd.[SalesOrderID]


  