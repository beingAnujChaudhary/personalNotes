CREATE TABLE [SalesLT].[Product] (

	[ProductID] int NOT NULL, 
	[Name] varchar(max) NULL, 
	[ProductNumber] varchar(max) NOT NULL, 
	[Color] varchar(max) NULL, 
	[StandardCost] decimal(19,4) NOT NULL, 
	[ListPrice] decimal(19,4) NOT NULL, 
	[Size] varchar(max) NULL, 
	[Weight] decimal(8,2) NULL, 
	[ProductCategoryID] int NULL, 
	[ProductModelID] int NULL, 
	[SellStartDate] datetime2(6) NOT NULL, 
	[SellEndDate] datetime2(6) NULL, 
	[DiscontinuedDate] datetime2(6) NULL, 
	[ThumbNailPhoto] varbinary(max) NULL, 
	[ThumbnailPhotoFileName] varchar(max) NULL, 
	[rowguid] varchar(max) NOT NULL, 
	[ModifiedDate] datetime2(6) NOT NULL
);