-- Lab - Azure Synapse - Azure AD Authentication - Creating a user

CREATE USER [powerbi@techsup4000gmail.onmicrosoft.com]
FROM EXTERNAL PROVIDER 
WITH DEFAULT_SCHEMA = dbo;

EXEC sp_addrolemember N'db_datareader', N'powerbi@techsup4000gmail.onmicrosoft.com'

