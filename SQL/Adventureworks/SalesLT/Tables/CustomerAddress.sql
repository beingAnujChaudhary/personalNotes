CREATE TABLE [SalesLT].[CustomerAddress] (

	[CustomerID] int NOT NULL, 
	[AddressID] int NOT NULL, 
	[AddressType] varchar(max) NULL, 
	[rowguid] varchar(max) NOT NULL, 
	[ModifiedDate] datetime2(6) NOT NULL
);