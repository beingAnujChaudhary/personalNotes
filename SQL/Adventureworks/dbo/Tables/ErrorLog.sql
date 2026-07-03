CREATE TABLE [dbo].[ErrorLog] (

	[ErrorLogID] int NOT NULL, 
	[ErrorTime] datetime2(6) NOT NULL, 
	[UserName] varchar(max) NOT NULL, 
	[ErrorNumber] int NOT NULL, 
	[ErrorSeverity] int NULL, 
	[ErrorState] int NULL, 
	[ErrorProcedure] varchar(max) NULL, 
	[ErrorLine] int NULL, 
	[ErrorMessage] varchar(max) NOT NULL
);