CREATE TABLE [dbo].[BuildVersion] (

	[SystemInformationID] smallint NOT NULL, 
	[DatabaseVersion] varchar(max) NOT NULL, 
	[VersionDate] datetime2(6) NOT NULL, 
	[ModifiedDate] datetime2(6) NOT NULL
);