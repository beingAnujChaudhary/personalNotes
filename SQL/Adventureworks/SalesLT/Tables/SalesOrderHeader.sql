CREATE TABLE [SalesLT].[SalesOrderHeader] (

	[SalesOrderID] int NOT NULL, 
	[RevisionNumber] smallint NOT NULL, 
	[OrderDate] datetime2(6) NOT NULL, 
	[DueDate] datetime2(6) NOT NULL, 
	[ShipDate] datetime2(6) NULL, 
	[Status] smallint NOT NULL, 
	[OnlineOrderFlag] bit NULL, 
	[PurchaseOrderNumber] varchar(max) NULL, 
	[AccountNumber] varchar(max) NULL, 
	[CustomerID] int NOT NULL, 
	[ShipToAddressID] int NULL, 
	[BillToAddressID] int NULL, 
	[ShipMethod] varchar(max) NOT NULL, 
	[CreditCardApprovalCode] varchar(max) NULL, 
	[SubTotal] decimal(19,4) NOT NULL, 
	[TaxAmt] decimal(19,4) NOT NULL, 
	[Freight] decimal(19,4) NOT NULL, 
	[Comment] varchar(max) NULL, 
	[rowguid] varchar(max) NOT NULL, 
	[ModifiedDate] datetime2(6) NOT NULL
);