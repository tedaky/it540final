-- All RAISERROR are commented and replaced with PRINT

-- Start with Master
USE [master];
GO
-- Check if Cinema database already exists
IF NOT EXISTS (SELECT [name] FROM [master].[sys].[databases] WHERE [name] = 'Cinema')
BEGIN
	-- Create Cinema database
	CREATE DATABASE [Cinema];
END
GO
-- Use Cinema
USE [Cinema];
GO

-- Check if Rating table already exists
IF NOT EXISTS (SELECT [TABLE_NAME] FROM [Cinema].[INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = 'Rating')
BEGIN
	-- Create Rating table
	CREATE TABLE [Rating] (
		[RatingID] INT IDENTITY(1, 1),
		[RatingName] VARCHAR(55),
		[RatingDescription] VARCHAR(255),
		-- contraints --
		-- Primary and Foreign
		CONSTRAINT [PK_Rating] PRIMARY KEY ([RatingID])
	);
END
GO

-- Check if Movie table already exists
IF NOT EXISTS (SELECT [TABLE_NAME] FROM [Cinema].[INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = 'Movie')
BEGIN
	-- Create Movie table
	CREATE TABLE [Movie] (
		[MovieID] INT IDENTITY(1, 1),
		[Title] VARCHAR(255),
		[ReleaseDate] DATE,
		[Runtime] TIME,
		[RatingID] INT,
		-- contraints --
		-- Primary and Foreign
		CONSTRAINT [PK_Movie] PRIMARY KEY ([MovieID]),
		CONSTRAINT [FK_RatingMovie] FOREIGN KEY ([RatingID]) REFERENCES [Rating]([RatingID])
	);
END
GO

-- Check if Genre table already exists
IF NOT EXISTS (SELECT [TABLE_NAME] FROM [Cinema].[INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = 'Genre')
BEGIN
	-- Create Genre table
	CREATE TABLE [Genre] (
		[GenreID] INT IDENTITY(1, 1),
		[GenreName] VARCHAR(255),
		-- contraints --
		-- Primary and Foreign
		CONSTRAINT [PK_Genre] PRIMARY KEY ([GenreID])
	);
END
GO

-- Check if MovieGenre table already exists
IF NOT EXISTS (SELECT [TABLE_NAME] FROM [Cinema].[INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = 'MovieGenre')
BEGIN
	-- Create MovieGenre table
	CREATE TABLE [MovieGenre] (
		[MovieGenreID] INT IDENTITY(1, 1),
		[MovieID] INT,
		[GenreID] INT,
		-- contraints --
		-- Primary and Foreign
		CONSTRAINT [PK_MovieGenre] PRIMARY KEY ([MovieGenreID]),
		CONSTRAINT [FK_MovieMovieGenre] FOREIGN KEY ([MovieID]) REFERENCES [Movie]([MovieID]),
		CONSTRAINT [FK_GenreMovieGenre] FOREIGN KEY ([GenreID]) REFERENCES [Genre]([GenreID])
	);
END
GO

-- Check if Auditorium table already exists
IF NOT EXISTS (SELECT [TABLE_NAME] FROM [Cinema].[INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = 'Auditorium')
BEGIN
	-- Create Auditorium table
	CREATE TABLE [Auditorium] (
		[AuditoriumID] INT IDENTITY(1, 1),
		[AuditoriumName] VARCHAR(255),
		[Available_Seats] INT,
		-- contraints --
		-- Primary and Foreign
		CONSTRAINT [PK_Auditorium] PRIMARY KEY ([AuditoriumID])
	);
END
GO

-- Check if Showing table already exists
IF NOT EXISTS (SELECT [TABLE_NAME] FROM [Cinema].[INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = 'Showing')
BEGIN
	-- Create Showing table
	CREATE TABLE [Showing] (
		[ShowingID] INT IDENTITY(1, 1),
		[MovieID] INT,
		[AuditoriumID] INT,
		[Date] DATE,
		[Time] TIME
		-- contraints --
		-- Primary and Foreign
		CONSTRAINT [PK_Showing] PRIMARY KEY ([ShowingID]),
		CONSTRAINT [FK_MovieShowing] FOREIGN KEY ([MovieID]) REFERENCES [Movie]([MovieID]),
		CONSTRAINT [FK_AuditoriumShowing] FOREIGN KEY ([AuditoriumID]) REFERENCES [Auditorium]([AuditoriumID]),
		CONSTRAINT [UN_Showing] UNIQUE ([AuditoriumID], [Date], [Time])
	);
END
GO

-- Check if Customer table already exists
IF NOT EXISTS (SELECT [TABLE_NAME] FROM [Cinema].[INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = 'Customer')
BEGIN
	-- Create Customer table
	CREATE TABLE [Customer] (
		[CustomerID] INT IDENTITY(1, 1),
		[FirstName] VARCHAR(255),
		[LastName] VARCHAR(255),
		[Gender] CHAR(1),
		[DOB] DATE,
		[Email] VARCHAR(255),
		-- contraints --
		-- Primary and Foreign
		CONSTRAINT [PK_Customer] PRIMARY KEY ([CustomerID]),
		-- check
		CONSTRAINT [CHK_Gender] CHECK ([Gender] = 'F' OR [Gender] = 'M'),
		-- unique
		CONSTRAINT [UNQ_Email] UNIQUE ([Email])
	);
END
GO

-- Check if Order table already exists
IF NOT EXISTS (SELECT [TABLE_NAME] FROM [Cinema].[INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = 'Order')
BEGIN
	-- Create Order table
	CREATE TABLE [Order] (
		[OrderID] INT IDENTITY(1, 1),
		[CustomerID] INT,
		[OrderDate] DATE,
		-- contraints --
		-- Primary and Foreign
		CONSTRAINT [PK_Order] PRIMARY KEY ([OrderID]),
		CONSTRAINT [FK_CustomerOrder] FOREIGN KEY ([CustomerID]) REFERENCES [Customer]([CustomerID])
	);
END
GO

-- Check if Category table already exists
IF NOT EXISTS (SELECT [TABLE_NAME] FROM [Cinema].[INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = 'Category')
BEGIN
	-- Create Category table
	CREATE TABLE [Category] (
		[CategoryID] INT IDENTITY(1, 1),
		[Name] VARCHAR(255),
		[Description] VARCHAR(255),
		-- contraints --
		-- Primary and Foreign
		CONSTRAINT [PK_Category] PRIMARY KEY ([CategoryID])
	);
END
GO

-- Check if Ticket table already exists
IF NOT EXISTS (SELECT [TABLE_NAME] FROM [Cinema].[INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = 'Ticket')
BEGIN
	-- Create Ticket table
	CREATE TABLE [Ticket] (
		[TicketID] INT IDENTITY(1, 1),
		[ShowingID] INT,
		[CategoryID] INT,
		[Price] MONEY,
		-- contraints --
		-- Primary and Foreign
		CONSTRAINT [PK_Ticket] PRIMARY KEY ([TicketID]),
		CONSTRAINT [FK_ShowingTicket] FOREIGN KEY ([ShowingID]) REFERENCES [Showing]([ShowingID]),
		CONSTRAINT [FK_CategoryTicket] FOREIGN KEY ([CategoryID]) REFERENCES [Category]([CategoryID])
	);
END
GO

-- Check if OrderDetail table already exists
IF NOT EXISTS (SELECT [TABLE_NAME] FROM [Cinema].[INFORMATION_SCHEMA].[TABLES] WHERE [TABLE_NAME] = 'OrderDetail')
BEGIN
	-- Create OrderDetail table
	CREATE TABLE [OrderDetail] (
		[OrderID] INT,
		[TicketID] INT,
		[No_of_Tickets] INT,
		-- contraints --
		-- Primary and Foreign
		CONSTRAINT [PK_OrderDetail] PRIMARY KEY ([OrderID], [TicketID]),
		CONSTRAINT [FK_OrderOrderDetail] FOREIGN KEY ([OrderID]) REFERENCES [Order]([OrderID]),
		CONSTRAINT [FK_TicketOrderDetail] FOREIGN KEY ([TicketID]) REFERENCES [Ticket]([TicketID])
	);
END
GO
