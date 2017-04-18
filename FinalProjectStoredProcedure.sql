-- Use Cinema
USE [Cinema];
GO

-- Check if sp_CreateGenre procedure exists
IF NOT EXISTS (SELECT [name] FROM [Cinema].[sys].[procedures] WHERE [name] = 'sp_CreateGenre')
BEGIN
	-- Procedures in blocks have to be in EXEC
	EXEC('
		CREATE PROCEDURE [sp_CreateGenre]
		AS
		BEGIN
			SELECT * FROM [Genre];
		END
	');
	-- ^ creates a basic procedure then gets altered
END
ELSE
BEGIN
	--RAISERROR('Stored Procedure sp_CreateGenre Already exist', 16, 1);
	PRINT 'Stored Procedure sp_CreateGenre Already exists';
END
GO

-- Alter sp_CreateGenre to what we want
ALTER PROCEDURE [sp_CreateGenre]
	-- Param as GenreName
	@GenreName VARCHAR(255)
AS
BEGIN
	-- Template head start
	DECLARE @count INT;
	SET @count = @@TRANCOUNT;
	IF @count > 0
	BEGIN
		SAVE TRANSACTION flag;
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION;
	END
	BEGIN TRY
	BEGIN
	-- Template head end

		-- Template body start
		IF NOT EXISTS (SELECT [GenreName] FROM [Genre] WHERE [GenreName] = @GenreName)
		BEGIN
			IF @GenreName IS NOT NULL
			BEGIN
				INSERT INTO [Genre] ([GenreName])
				VALUES (@GenreName);
			END
			ELSE
			BEGIN
				--RAISERROR('Genre Name Should Not Be Null', 16, 1);
				PRINT 'Genre Name Should Not Be Null';
			END
		END
		ELSE
		BEGIN
			IF @count > 0		
			BEGIN
				--RAISERROR(@GenreName + ' : Genre Name Already Exists', 16, 1);
				PRINT @GenreName + ' : Genre Name Already Exists';
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				--RAISERROR(@GenreName + ' : Genre Name Already Exists', 16, 1);
				PRINT @GenreName + ' : Genre Name Already Exists';
				--ROLLBACK TRANSACTION;
				-- Can commit because no changes
			END
		END
		-- Template body end

		-- Template middle start
		IF @count = 0
		BEGIN
			COMMIT TRANSACTION;
		END
		-- Template last end

	-- Template last start
	END
	END TRY
	BEGIN CATCH
	BEGIN
		IF @count > 0		
		BEGIN
			--RAISERROR(@GenreName + ' : Genre Name Already Exists', 16, 1);
			PRINT @GenreName + ' : Genre Name Already Exists';
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			--RAISERROR(@GenreName + ' : Genre Name Already Exists', 16, 1);
			PRINT @GenreName + ' : Genre Name Already Exists';
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO





-- Check if sp_CreateCategory procedure exists
IF NOT EXISTS (SELECT [name] FROM [Cinema].[sys].[procedures] WHERE [name] = 'sp_CreateCategory')
BEGIN
	-- Procedures in blocks have to be in EXEC
	EXEC('
		CREATE PROCEDURE [sp_CreateCategory]
		AS
		BEGIN
			SELECT * FROM [Category];
		END
	');
	-- ^ creates a basic procedure then gets altered
END
ELSE
BEGIN
	--RAISERROR('Stored Procedure sp_CreateCategory Already exist', 16, 1);
	PRINT 'Stored Procedure sp_CreateCategory Already exists';
END
GO

-- Alter sp_CreateGenre to what we want
ALTER PROCEDURE [sp_CreateCategory]
	-- Params as Name, Description
	@CategoryName VARCHAR(255),
	@CategoryDescription VARCHAR(255)
AS
BEGIN
	-- Template head start
	DECLARE @count INT;
	SET @count = @@TRANCOUNT;
	IF @count > 0
	BEGIN
		SAVE TRANSACTION flag;
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION;
	END
	BEGIN TRY
	BEGIN
	-- Template head end

		-- Template body start
		IF NOT EXISTS (SELECT [Name] FROM [Category] WHERE [Name] = @CategoryName)
		BEGIN
			IF @CategoryName IS NOT NULL
			BEGIN
				INSERT INTO [Category] ([Name], [Description])
				VALUES (@CategoryName, @CategoryDescription);
			END
			ELSE
			BEGIN
				--RAISERROR('Category Name Should Not Be Null', 16, 1);
				PRINT 'Category Name Should Not Be Null';
			END
		END
		ELSE
		BEGIN
			IF @count > 0		
			BEGIN
				--RAISERROR(@CategoryName + ' : Category Name Already Exists', 16, 1);
				PRINT @CategoryName + ' : Category Name Already Exists';
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				--RAISERROR(@CategoryName + ' : Category Name Already Exists', 16, 1);
				PRINT @CategoryName + ' : Category Name Already Exists';
				--ROLLBACK TRANSACTION;
				-- Can commit because no changes
			END
		END
		-- Template body end

		-- Template middle start
		IF @count = 0
		BEGIN
			COMMIT TRANSACTION;
		END
		-- Template last end

	-- Template last start
	END
	END TRY
	BEGIN CATCH
	BEGIN
		IF @count > 0		
		BEGIN
			--RAISERROR(@CategoryName + ' : Category Name Already Exists', 16, 1);
			PRINT @CategoryName + ' : Category Name Already Exists';
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			--RAISERROR(@CategoryName + ' : Category Name Already Exists', 16, 1);
			PRINT @CategoryName + ' : Category Name Already Exists';
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO





-- Check if sp_CreateRating procedure exists
IF NOT EXISTS (SELECT [name] FROM [Cinema].[sys].[procedures] WHERE [name] = 'sp_CreateRating')
BEGIN
	-- Procedures in blocks have to be in EXEC
	EXEC('
		CREATE PROCEDURE [sp_CreateRating]
		AS
		BEGIN
			SELECT * FROM [Rating];
		END
	');
	-- ^ creates a basic procedure then gets altered
END
ELSE
BEGIN
	--RAISERROR('Stored Procedure sp_CreateRating Already exist', 16, 1);
	PRINT 'Stored Procedure sp_CreateRating Already exists';
END
GO

-- Alter sp_CreateGenre to what we want
ALTER PROCEDURE [sp_CreateRating]
	-- Param as RatingName, RatingDescription
	@RatingName VARCHAR(255),
	@RatingDescription VARCHAR(255)
AS
BEGIN
	-- Template head start
	DECLARE @count INT;
	SET @count = @@TRANCOUNT;
	IF @count > 0
	BEGIN
		SAVE TRANSACTION flag;
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION;
	END
	BEGIN TRY
	BEGIN
	-- Template head end

		-- Template body start
		IF NOT EXISTS (SELECT [RatingName] FROM [Rating] WHERE [RatingName] = @RatingName)
		BEGIN
			IF @RatingName IS NOT NULL
			BEGIN
				INSERT INTO [Rating] ([RatingName], [RatingDescription])
				VALUES (@RatingName, @RatingDescription);
			END
			ELSE
			BEGIN
				--RAISERROR('Rating Name Should Not Be Null', 16, 1);
				PRINT 'Rating Name Should Not Be Null';
			END
		END
		ELSE
		BEGIN
			IF @count > 0		
			BEGIN
				--RAISERROR(@RatingName + ' : Rating Name Already Exists', 16, 1);
				PRINT @RatingName + ' : Rating Name Already Exists';
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				--RAISERROR(@RatingName + ' : Rating Name Already Exists', 16, 1);
				PRINT @RatingName + ' : Rating Name Already Exists';
				--ROLLBACK TRANSACTION;
				-- Can commit because no changes
			END
		END
		-- Template body end

		-- Template middle start
		IF @count = 0
		BEGIN
			COMMIT TRANSACTION;
		END
		-- Template last end

	-- Template last start
	END
	END TRY
	BEGIN CATCH
	BEGIN
		IF @count > 0		
		BEGIN
			--RAISERROR(@RatingName + ' : Rating Name Already Exists', 16, 1);
			PRINT @RatingName + ' : Rating Name Already Exists';
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			--RAISERROR(@RatingName + ' : Rating Name Already Exists', 16, 1);
			PRINT @RatingName + ' : Rating Name Already Exists';
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO






-- Check if sp_CreateCustomer procedure exists
IF NOT EXISTS (SELECT [name] FROM [Cinema].[sys].[procedures] WHERE [name] = 'sp_CreateCustomer')
BEGIN
	-- Procedures in blocks have to be in EXEC
	EXEC('
		CREATE PROCEDURE [sp_CreateCustomer]
		AS
		BEGIN
			SELECT * FROM [Customer];
		END
	');
	-- ^ creates a basic procedure then gets altered
END
ELSE
BEGIN
	--RAISERROR('Stored Procedure sp_CreateCustomer Already exist', 16, 1);
	PRINT 'Stored Procedure sp_CreateCustomer Already exists';
END
GO

-- Alter sp_CreateCustomer to what we want
ALTER PROCEDURE [sp_CreateCustomer]
	-- Param as FirstName, LastName, Gender, DOB, Email
	@FirstName VARCHAR(255),
	@LastName VARCHAR(255),
	@Gender CHAR(1),
	@DOB DATE,
	@Email VARCHAR(255)
AS
BEGIN
	-- Template head start
	DECLARE @count INT;
	SET @count = @@TRANCOUNT;
	IF @count > 0
	BEGIN
		SAVE TRANSACTION flag;
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION;
	END
	BEGIN TRY
	BEGIN
	-- Template head end

		-- Template body start
		IF NOT EXISTS (SELECT [Email] FROM [Customer] WHERE [Email] = @Email)
		BEGIN
			IF @FirstName IS NOT NULL AND @Gender IS NOT NULL AND @DOB IS NOT NULL AND @Email IS NOT NULL
			BEGIN
				INSERT INTO [Customer] ([FirstName], [LastName], [Gender], [DOB], [Email])
				VALUES (@FirstName, @LastName, @Gender, @DOB, @Email);
			END
			ELSE
			BEGIN
				--RAISERROR('Values should not be Null', 16, 1);
				PRINT 'Values Should Not Be Null';
			END
		END
		ELSE
		BEGIN
			IF @count > 0		
			BEGIN
				--RAISERROR('Customer with email "' + @Email + '" Already Exists', 16, 1);
				PRINT 'Customer with email "' + @Email + '" Already Exists';
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				--RAISERROR('Customer with email "' + @Email + '" Already Exists', 16, 1);
				PRINT 'Customer with email "' + @Email + '" Already Exists';
				--ROLLBACK TRANSACTION;
				-- Can commit because no changes
			END
		END
		-- Template body end

		-- Template middle start
		IF @count = 0
		BEGIN
			COMMIT TRANSACTION;
		END
		-- Template last end

	-- Template last start
	END
	END TRY
	BEGIN CATCH
	BEGIN
		IF @count > 0		
		BEGIN
			--RAISERROR('Customer with email "' + @Email + '" Already Exists', 16, 1);
			PRINT 'Customer with email "' + @Email + '" Already Exists';
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			--RAISERROR('Customer with email "' + @Email + '" Already Exists', 16, 1);
			PRINT 'Customer with email "' + @Email + '" Already Exists';
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO



/*
-- Check if sp_CreateMovieGenre procedure exists
IF NOT EXISTS (SELECT [name] FROM [Cinema].[sys].[procedures] WHERE [name] = 'sp_CreateMovieGenre')
BEGIN
	-- Procedures in blocks have to be in EXEC
	EXEC('
		CREATE PROCEDURE [sp_CreateMovieGenre]
		AS
		BEGIN
			SELECT * FROM [MoviGenre];
		END
	');
	-- ^ creates a basic procedure then gets altered
END
ELSE
BEGIN
	--RAISERROR('Stored Procedure sp_CreateMovieGenre Already exist', 16, 1);
	PRINT 'Stored Procedure sp_CreateMovieGenre Already exists';
END
GO

-- Alter sp_CreateMovieGenre to what we want
ALTER PROCEDURE [sp_CreateMovieGenre]
	-- Param as MovieID, GenreID
	@MovieID INT,
	@GenreID INT
AS
BEGIN
	-- Template head start
	DECLARE @count INT;
	SET @count = @@TRANCOUNT;
	IF @count > 0
	BEGIN
		SAVE TRANSACTION flag;
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION;
	END
	BEGIN TRY
	BEGIN
	-- Template head end

		-- Template body start
		IF NOT EXISTS (SELECT [MovieID] FROM [MovieGenre] WHERE [MovieID] = @MovieID)
		BEGIN
			IF @MovieID IS NOT NULL
			BEGIN
				INSERT INTO [MovieGenre] ([MovieID], [GenreID])
				VALUES (@MovieID, @GenreID);
			END
			ELSE
			BEGIN
				--RAISERROR('MovieID Should Not Be Null', 16, 1);
				PRINT 'MovieID Should Not Be Null';
			END
		END
		ELSE
		BEGIN
			IF @count > 0		
			BEGIN
				--RAISERROR(@MovieID + ' : MovieID Already Exists', 16, 1);
				PRINT @MovieID + ' : MovieID Already Exists';
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				--RAISERROR(@MovieID + ' : MovieID Already Exists', 16, 1);
				PRINT @MovieID + ' : MovieID Already Exists';
				--ROLLBACK TRANSACTION;
				-- Can commit because no changes
			END
		END
		-- Template body end

		-- Template middle start
		IF @count = 0
		BEGIN
			COMMIT TRANSACTION;
		END
		-- Template last end

	-- Template last start
	END
	END TRY
	BEGIN CATCH
	BEGIN
		IF @count > 0		
		BEGIN
			--RAISERROR(@MovieID + ' : MovieID Already Exists', 16, 1);
			PRINT @MovieID + ' : MovieID Already Exists';
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			--RAISERROR(@MovieID + ' : MovieID Already Exists', 16, 1);
			PRINT @MovieID + ' : MovieID Already Exists';
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO




-- Check if sp_CreateOrder procedure exists
IF NOT EXISTS (SELECT [name] FROM [Cinema].[sys].[procedures] WHERE [name] = 'sp_CreateOrder')
BEGIN
	-- Procedures in blocks have to be in EXEC
	EXEC('
		CREATE PROCEDURE [sp_CreateOrder]
		AS
		BEGIN
			SELECT * FROM [Order];
		END
	');
	-- ^ creates a basic procedure then gets altered
END
ELSE
BEGIN
	--RAISERROR('Stored Procedure sp_CreateOrder Already exist', 16, 1);
	PRINT 'Stored Procedure sp_CreateOrder Already exists';
END
GO

-- Alter sp_CreateOrder to what we want
ALTER PROCEDURE [sp_CreateOrder]
	-- Param as CustomerID, OrderDate
	@CustomerID INT,
	@OrderDate Date
AS
BEGIN
	-- Template head start
	DECLARE @count INT;
	SET @count = @@TRANCOUNT;
	IF @count > 0
	BEGIN
		SAVE TRANSACTION flag;
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION;
	END
	BEGIN TRY
	BEGIN
	-- Template head end

		-- Template body start
		IF NOT EXISTS (SELECT [CustomerID] FROM [Order] WHERE [CustomerID] = @CustomerID)
		BEGIN
			IF @CustomerID IS NOT NULL
			BEGIN
				INSERT INTO [Order] ([CustomerID], [OrderDate])
				VALUES (@CustomerID, @OrderDate);
			END
			ELSE
			BEGIN
				--RAISERROR('CustomerID Should Not Be Null', 16, 1);
				PRINT 'CustomerID Should Not Be Null';
			END
		END
		ELSE
		BEGIN
			IF @count > 0		
			BEGIN
				--RAISERROR(@CustomerID + ' : CustomerID Already Exists', 16, 1);
				PRINT @CustomerID + ' : CustomerID Already Exists';
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				--RAISERROR(@CustomerID + ' : CustomerID Already Exists', 16, 1);
				PRINT @CustomerID + ' : CustomerID Already Exists';
				--ROLLBACK TRANSACTION;
				-- Can commit because no changes
			END
		END
		-- Template body end

		-- Template middle start
		IF @count = 0
		BEGIN
			COMMIT TRANSACTION;
		END
		-- Template last end

	-- Template last start
	END
	END TRY
	BEGIN CATCH
	BEGIN
		IF @count > 0		
		BEGIN
			--RAISERROR(@CustomerID + ' : CustomerID Already Exists', 16, 1);
			PRINT @CustomerID + ' : CustomerID Already Exists';
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			--RAISERROR(@CustomerID + ' : CustomerID Already Exists', 16, 1);
			PRINT @CustomerID + ' : CustomerID Already Exists';
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO




-- Check if sp_CreateTicket procedure exists
IF NOT EXISTS (SELECT [name] FROM [Cinema].[sys].[procedures] WHERE [name] = 'sp_CreateTicket')
BEGIN
	-- Procedures in blocks have to be in EXEC
	EXEC('
		CREATE PROCEDURE [sp_CreateTicket]
		AS
		BEGIN
			SELECT * FROM [Ticket];
		END
	');
	-- ^ creates a basic procedure then gets altered
END
ELSE
BEGIN
	--RAISERROR('Stored Procedure sp_CreateTicket Already exist', 16, 1);
	PRINT 'Stored Procedure sp_CreateTicket Already exists';
END
GO

-- Alter sp_CreateTicket to what we want
ALTER PROCEDURE [sp_CreateTicket]
	-- Param as CustomerID, OrderDate
	@ShowingID INT,
	@CategoryID INT,
	@Price		MONEY
AS
BEGIN
	-- Template head start
	DECLARE @count INT;
	SET @count = @@TRANCOUNT;
	IF @count > 0
	BEGIN
		SAVE TRANSACTION flag;
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION;
	END
	BEGIN TRY
	BEGIN
	-- Template head end

		-- Template body start
		IF NOT EXISTS (SELECT [TicketID] FROM [TICKET] WHERE [ShowingID] = @ShowingID)
		BEGIN
			IF @ShowingID IS NOT NULL
			BEGIN
				INSERT INTO [Ticket] ([ShowingID], [CategoryID], [Price])
				VALUES (@ShowingID, @CategoryID, Price);
			END
			ELSE
			BEGIN
				--RAISERROR('ShowingID Should Not Be Null', 16, 1);
				PRINT 'ShowingID Should Not Be Null';
			END
		END
		ELSE
		BEGIN
			IF @count > 0		
			BEGIN
				--RAISERROR(@ShowingID + ' : ShowingID Already Exists', 16, 1);
				PRINT @ShowingID + ' : ShowingID Already Exists';
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				--RAISERROR(@ShowingID + ' : ShowingID Already Exists', 16, 1);
				PRINT @ShowingID + ' : ShowingID Already Exists';
				--ROLLBACK TRANSACTION;
				-- Can commit because no changes
			END
		END
		-- Template body end

		-- Template middle start
		IF @count = 0
		BEGIN
			COMMIT TRANSACTION;
		END
		-- Template last end

	-- Template last start
	END
	END TRY
	BEGIN CATCH
	BEGIN
		IF @count > 0		
		BEGIN
			--RAISERROR(@ShowingID + ' : ShowingID Already Exists', 16, 1);
			PRINT @ShowingID + ' : ShowingID Already Exists';
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			--RAISERROR(@ShowingID + ' : ShowingID Already Exists', 16, 1);
			PRINT @ShowingID + ' : ShowingID Already Exists';
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO
*/

-- Check if sp_CreateShowing procedure exists
IF NOT EXISTS (SELECT [name] FROM [Cinema].[sys].[procedures] WHERE [name] = 'sp_CreateShowing')
BEGIN
	-- Procedures in blocks have to be in EXEC
	EXEC('
		CREATE PROCEDURE [sp_CreateShowing]
		AS
		BEGIN
			SELECT * FROM [Showing];
		END
	');
	-- ^ creates a basic procedure then gets altered
END
ELSE
BEGIN
	--RAISERROR('Stored Procedure sp_CreateShowing Already exist', 16, 1);
	PRINT 'Stored Procedure sp_CreateShowing Already exists';
END
GO

-- Alter sp_CreateShowing to what we want
ALTER PROCEDURE [sp_CreateShowing]
	-- Param as MovieID, AuditoriumID, Date, Time
	@MovieID INT,
	@AuditoriumID INT,
	@Date		Date,
	@Time		Time
AS
BEGIN
	-- Template head start
	DECLARE @count INT;
	SET @count = @@TRANCOUNT;
	IF @count > 0
	BEGIN
		SAVE TRANSACTION flag;
	END
	ELSE
	BEGIN
		BEGIN TRANSACTION;
	END
	BEGIN TRY
	BEGIN
	-- Template head end

			-- Template body start
		IF NOT EXISTS (SELECT [MovieID], [AuditoriumID], [Time] FROM [Showing] WHERE [Date] = @Date)
		BEGIN
			IF @MovieID IS NOT NULL AND @AuditoriumID IS NOT NULL AND @Date IS NOT NULL AND @Time IS NOT NULL
			BEGIN
				INSERT INTO [Showing] ([MovieID], [AuditoriumID], [Date], [Time])
				VALUES (@MovieID, @AuditoriumID, @Date, @Time);
			END
			ELSE
			BEGIN
				--RAISERROR('Values should not be Null', 16, 1);
				PRINT 'Values Should Not Be Null';
			END
		END
		ELSE
		BEGIN
			IF @count > 0		
			BEGIN
				--RAISERROR('This Showing Already Exists', 16, 1);
				PRINT 'This Showing Already Exists';
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				--RAISERROR('This Showing Already Exists', 16, 1);
				PRINT 'This Showing Already Exists';
				--ROLLBACK TRANSACTION;
				-- Can commit because no changes
			END
		END
		-- Template body end

		-- Template middle start
		IF @count = 0
		BEGIN
			COMMIT TRANSACTION;
		END
		-- Template last end

	-- Template last start
	END
	END TRY
	BEGIN CATCH
	BEGIN
		IF @count > 0		
		BEGIN
			--RAISERROR('This Showing Already Exists', 16, 1);
			PRINT 'This Showing Already Exists';
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			--RAISERROR('This Showing Already Exists', 16, 1);
			PRINT 'This Showing Already Exists';
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO
