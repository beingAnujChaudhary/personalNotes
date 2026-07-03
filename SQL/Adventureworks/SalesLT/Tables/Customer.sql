CREATE TABLE [SalesLT].[Customer] (

	[CustomerID] int NOT NULL, 
	[NameStyle] bit NULL, 
	[Title] varchar(max) NULL, 
	[FirstName] varchar(max) NULL, 
	[MiddleName] varchar(max) NULL, 
	[LastName] varchar(max) NULL, 
	[Suffix] varchar(max) NULL, 
	[CompanyName] varchar(max) NULL, 
	[SalesPerson] varchar(max) NULL, 
	[EmailAddress] varchar(max) NULL, 
	[Phone] varchar(max) NULL, 
	[PasswordHash] varchar(max) NOT NULL, 
	[PasswordSalt] varchar(max) NOT NULL, 
	[rowguid] varchar(max) NOT NULL, 
	[ModifiedDate] datetime2(6) NOT NULL
);