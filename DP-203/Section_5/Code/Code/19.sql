--Stored Procedures
-- What are stored procedures
-- https://learn.microsoft.com/en-us/sql/relational-databases/stored-procedures/stored-procedures-database-engine?view=sql-server-ver16

CREATE PROCEDURE GetCustomerDetails
    @CustomerID int
AS      
    SELECT CompanyName, SalesPerson
    FROM [DimCustomer]
    WHERE CustomerID = @CustomerID


EXEC GetCustomerDetails @CustomerID=277
 