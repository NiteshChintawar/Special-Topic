-- Lab - Conditional Split

SELECT Resourcegroup,COUNT(OperationName) AS 'Operation Count' FROM logdata_parquet
GROUP BY Resourcegroup