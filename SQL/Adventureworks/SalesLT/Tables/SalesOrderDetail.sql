CREATE TABLE [SalesLT].[SalesOrderDetail] (

	[SalesOrderID] int NOT NULL, 
	[SalesOrderDetailID] int NOT NULL, 
	[OrderQty] smallint NOT NULL, 
	[ProductID] int NOT NULL, 
	[UnitPrice] decimal(19,4) NOT NULL, 
	[UnitPriceDiscount] decimal(19,4) NOT NULL, 
	[rowguid] varchar(max) NOT NULL, 
	[ModifiedDate] datetime2(6) NOT NULL
);