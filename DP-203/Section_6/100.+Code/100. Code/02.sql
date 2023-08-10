-- Lab - Reading the Blob Diagnostic data

CREATE TABLE [dbo].[BlobDiagnostics]
  (
    [TimeGenerated] datetime,
    [Category] varchar(300),
    [OperationName] varchar(300),
    [StatusCode] int,        
    [CallerIpAddress] varchar(200),
    [IdentityType] varchar(5000)
  )

SELECT
    Records.ArrayValue.time AS TimeGenerated,
    Records.ArrayValue.category AS Category,
    Records.ArrayValue.operationName AS OperationName,
    Records.ArrayValue.statusCode AS StatusCode,
    Records.ArrayValue.callerIpAddress AS CallerIpAddress,
    Records.ArrayValue.[identity].type AS IdentityType
INTO
    [BlobDiagnostics]
FROM
    [blobhub] b
    CROSS APPLY GetArrayElements(b.records) AS Records