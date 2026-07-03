CREATE TABLE [SalesLT].[Address] (

	[AddressID] int NOT NULL, 
	[AddressLine1] varchar(max) NOT NULL, 
	[AddressLine2] varchar(max) NULL, 
	[City] varchar(max) NOT NULL, 
	[StateProvince] varchar(max) NULL, 
	[CountryRegion] varchar(max) NULL, 
	[PostalCode] varchar(max) NOT NULL, 
	[rowguid] varchar(max) NOT NULL, 
	[ModifiedDate] datetime2(6) NOT NULL
);