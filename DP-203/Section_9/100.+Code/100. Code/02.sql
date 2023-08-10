-- Lab - Azure Synapse - Data Masking

CREATE LOGIN newusr
	WITH PASSWORD = 'Azure123' 
GO

CREATE USER newusr
	FOR LOGIN newusr
	WITH DEFAULT_SCHEMA = dbo


EXEC sp_addrolemember 'db_datareader', 'newusr';  

DATABASE=pooldb