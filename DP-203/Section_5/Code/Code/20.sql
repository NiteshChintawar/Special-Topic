-- Another case of lookup Activity

CREATE TABLE [dbo].[TableCopy](
	[TableID] [int] IDENTITY,
    [TableName] varchar(200) NOT NULL
)

INSERT INTO [dbo].[TableCopy] VALUES('[SalesLT].[Product]')
INSERT INTO [dbo].[TableCopy] VALUES('[SalesLT].[ProductCategory]')
INSERT INTO [dbo].[TableCopy] VALUES('[SalesLT].[ProductModel]')

SELECT [TableName] FROM [dbo].[TableCopy]