CREATE TABLE [SalesLT].[ProductCategory] (

	[ProductCategoryID] int NOT NULL, 
	[ParentProductCategoryID] int NULL, 
	[Name] varchar(max) NULL, 
	[rowguid] varchar(max) NOT NULL, 
	[ModifiedDate] datetime2(6) NOT NULL
);