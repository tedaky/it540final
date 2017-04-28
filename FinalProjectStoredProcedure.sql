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
				RAISERROR('Genre Name Should Not Be Null', 16, 1);
			END
		END
		ELSE
		BEGIN
			DECLARE @msg VARCHAR(250);
			SET @msg = @GenreName + ' : Genre Name Already Exists';
			IF @count > 0		
			BEGIN
				RAISERROR(@msg, 16, 1);
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				RAISERROR(@msg, 16, 1);
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
	
		DECLARE @msg2 VARCHAR(250);
		SET @msg2 = @GenreName + ' : Genre Name Already Exists';
		IF @count > 0		
		BEGIN
			RAISERROR(@msg2, 16, 1);
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			RAISERROR(@msg2, 16, 1);
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
GO

-- Alter sp_CreateCategory to what we want
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
				RAISERROR('Category Name Should Not Be Null', 16, 1);
			END
		END
		ELSE
		BEGIN
		
			DECLARE @msg VARCHAR(250);
			SET @msg = @CategoryName + ' : Category Name Already Exists'
			IF @count > 0		
			BEGIN
				RAISERROR(@msg, 16, 1);
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				RAISERROR(@msg, 16, 1);
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
		DECLARE @msg2 VARCHAR(250);
		SET @msg2 = @CategoryName + ' : Category Name Already Exists';
		IF @count > 0		
		BEGIN
			RAISERROR(@msg2, 16, 1);
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			RAISERROR(@msg2, 16, 1);
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
GO

-- Alter sp_CreateRating to what we want
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
				RAISERROR('Rating Name Should Not Be Null', 16, 1);
			END
		END
		ELSE
		BEGIN
			DECLARE @msg VARCHAR(250);
			SET @msg = @RatingName + ' : Rating Name Already Exists';
			IF @count > 0		
			BEGIN
				RAISERROR(@msg, 16, 1);
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				RAISERROR(@msg, 16, 1);
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
	
		DECLARE @msg2 VARCHAR(250);
		SET @msg2 = @RatingName + ' : Rating Name Already Exists';
		IF @count > 0		
		BEGIN
			RAISERROR(@msg2, 16, 1);
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			RAISERROR(@msg2, 16, 1);
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
				RAISERROR('Values should not be Null', 16, 1);
			END
		END
		ELSE
		BEGIN
			DECLARE @msg VARCHAR(250);
			SET @msg = 'Customer with email "' + @Email + '" Already Exists';
			IF @count > 0		
			BEGIN
				RAISERROR(@msg, 16, 1);
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				RAISERROR(@msg, 16, 1);
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
		DECLARE @msg2 VARCHAR(250);
		SET @msg2 = 'Customer with email "' + @Email + '" Already Exists';
		IF @count > 0		
		BEGIN
			RAISERROR(@msg2, 16, 1);
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			RAISERROR(@msg2, 16, 1);
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO






-- Check if sp_CreateAuditorium procedure exists
IF NOT EXISTS (SELECT [name] FROM [Cinema].[sys].[procedures] WHERE [name] = 'sp_CreateAuditorium')
BEGIN
	-- Procedures in blocks have to be in EXEC
	EXEC('
		CREATE PROCEDURE [sp_CreateAuditorium]
		AS
		BEGIN
			SELECT * FROM [Auditorium];
		END
	');
	-- ^ creates a basic procedure then gets altered
END
GO

-- Alter sp_CreateAuditorium to what we want
ALTER PROCEDURE [sp_CreateAuditorium]
	-- Param as AuditoriumName, Available_Seats
	@AuditoriumName VARCHAR(255),
	@AvailableSeats INT
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
		IF NOT EXISTS (SELECT [AuditoriumName] FROM [Auditorium] WHERE [AuditoriumName] = @AuditoriumName)
		BEGIN
			IF @AuditoriumName IS NOT NULL AND @AvailableSeats IS NOT NULL
			BEGIN
				INSERT INTO [Auditorium] ([AuditoriumName], [Available_Seats])
				VALUES (@AuditoriumName, @AvailableSeats);
			END
			ELSE
			BEGIN
				RAISERROR('Values should not be Null', 16, 1);
			END
		END
		ELSE
		BEGIN
			DECLARE @msg VARCHAR(250);
			SET @msg = 'Auditorium Name "' + @AuditoriumName + '" Already Exists';
			IF @count > 0		
			BEGIN
				RAISERROR(@msg, 16, 1);
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				RAISERROR(@msg, 16, 1);
				--ROLLBACK TRANSACTION flag;
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
		DECLARE @msg2 VARCHAR(250);
		SET @msg2 = 'Auditorium Name "' + @AuditoriumName + '" Already Exists';
		IF @count > 0		
		BEGIN
			RAISERROR(@msg2, 16, 1);
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			RAISERROR(@msg2, 16, 1);
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO






-- Check if sp_CreateMovie procedure exists
IF NOT EXISTS (SELECT [name] FROM [Cinema].[sys].[procedures] WHERE [name] = 'sp_CreateMovie')
BEGIN
	-- Procedures in blocks have to be in EXEC
	EXEC('
		CREATE PROCEDURE [sp_CreateMovie]
		AS
		BEGIN
			SELECT * FROM [Movie];
		END
	');
	-- ^ creates a basic procedure then gets altered
END
GO


-- Check if fn_MoveGenre function exists
IF NOT EXISTS (
		SELECT 1
		FROM [INFORMATION_SCHEMA].[ROUTINES]
		WHERE [SPECIFIC_SCHEMA] = 'dbo' AND
		[SPECIFIC_NAME] = 'fn_MoveGenre' AND
		[ROUTINE_TYPE] = 'FUNCTION'
	) 
BEGIN
	-- Function in blocks have to be in EXEC
	EXEC('
		CREATE FUNCTION fn_MoveGenre()
			RETURNS @table TABLE (
				[GenreItem] INT
			)
		AS
		BEGIN
			INSERT INTO @table VALUES(1)
			RETURN;
		END
	')
END
GO

-- Alter fn_MoveGenre to what we want
ALTER FUNCTION fn_MoveGenre(@String VARCHAR(255))
	-- Return genre names as table
	RETURNS @table TABLE (
		[GenreItem] VARCHAR(255)
	)
AS
BEGIN
	DECLARE @Item VARCHAR(255);
    DECLARE @ItemList VARCHAR(255);
	DECLARE @DelimIndex INT;

	SET @ItemList = @String;
	SET @DelimIndex = CHARINDEX(',', @ItemList, 0);
	WHILE (@DelimIndex != 0)
	BEGIN
		SET @Item = SUBSTRING(@ItemList, 0, @DelimIndex);
		INSERT INTO @table
		VALUES (@Item);

		SET @ItemList = SUBSTRING(@ItemList, @DelimIndex + 1, LEN(@ItemList) - @DelimIndex);
		SET @DelimIndex = CHARINDEX(',', @ItemList, 0);
	END

	IF @Item IS NOT NULL
	BEGIN
		SET @Item = @ItemList
		INSERT INTO @table VALUES (@Item);
	END
	ELSE
	BEGIN
		INSERT INTO @table VALUES (@String);
	END

    RETURN;
END;
GO

-- Alter sp_CreateMovie to what we want
ALTER PROCEDURE [sp_CreateMovie]
	-- Param as Title, ReleaseDate, Runtime, RatingID
	--RatingID will be varchar since a rating name is unique
	@MovieTitle VARCHAR(255),
	@MovieReleaseDate DATE,
	@MovieRuntime TIME,
	@MovieRating VARCHAR(255),
	@MovieGenre VARCHAR(255)
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
		IF NOT EXISTS (
				SELECT [m].[Title], [m].[ReleaseDate], [m].[Runtime], [m].[RatingID]
				FROM [Movie] [m]
				JOIN [Rating] [r]
				ON [r].[RatingID] = [m].[RatingID]
				WHERE [m].[Title] = @MovieTitle AND
				[m].[ReleaseDate] = @MovieReleaseDate AND
				[m].[Runtime] = @MovieRuntime AND
				[r].[RatingName] = @MovieRating
			)
		BEGIN
			IF @MovieTitle IS NOT NULL AND @MovieRating IS NOT NULL
			BEGIN
				
				IF NOT EXISTS (
						SELECT [g].[GenreName]
						FROM [Genre] [g]
						JOIN ( SELECT * from dbo.fn_MoveGenre(@MovieGenre) ) [itb1]
						ON [itb1].[GenreItem] = [g].[GenreName]
					)
				BEGIN
					RAISERROR('Use the appropriate Genre(s)', 16, 1);
				END
				ELSE
				BEGIN
					DECLARE @GenreTbl TABLE
                                                 (GenreName VARCHAR(100));
					insert into @GenreTbl
					SELECT * from [dbo].[fn_MoveGenre](@MovieGenre);

					DECLARE @RatingID INT
					SET @RatingID = (
							SELECT [r].[RatingID]
							FROM [Rating] [r]
							WHERE [r].[RatingName] = @MovieRating
						);
					INSERT INTO [Movie] ([Title], [ReleaseDate], [Runtime], [RatingID])
					VALUES (@MovieTitle, @MovieReleaseDate, @MovieRuntime, @RatingID);
					
					DECLARE @id INT;
					SET @id = @@IDENTITY;
					DECLARE @GenreID INT;
					WHILE (SELECT COUNT(*) FROM @GenreTbl) > 0
					BEGIN
						SELECT @GenreID = GenreID from Genre where GenreName = (SELECT TOP 1 GenreName from @GenreTbl);
						INSERT INTO [MovieGenre] ([MovieID], [GenreID])
						VALUES (@id, @GenreID);
						delete from @GenreTbl
						where GenreName = (SELECT TOP 1 GenreName from @GenreTbl);
					END
				END
			END
			ELSE
			BEGIN
				RAISERROR('Values should not be Null', 16, 1);
			END
		END
		ELSE
		BEGIN
		
			DECLARE @msg VARCHAR(250);
			SET @msg = 'The Movie "' + @MovieTitle + '" Already Exists';
			IF @count > 0
			BEGIN
				RAISERROR(@msg, 16, 1);
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				RAISERROR(@msg, 16, 1);
				--ROLLBACK TRANSACTION flag;
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

		DECLARE @msg2 VARCHAR(250);
		SET @msg2 = 'The Movie "' + @MovieTitle + '" Already Exists';
		IF @count > 0		
		BEGIN
			RAISERROR(@msg2, 16, 1);
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			RAISERROR(@msg2, 16, 1);
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO

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
			DECLARE @ReleaseDate Date
			SELECT @ReleaseDate = ReleaseDate
			FROM Movie
			WHERE MovieID = @MovieID
				IF (@ReleaseDate <= @Date)
				BEGIN
					INSERT INTO [Showing] ([MovieID], [AuditoriumID], [Date], [Time])
					VALUES (@MovieID, @AuditoriumID, @Date, @Time);
				END
				ELSE
				BEGIN
					RAISERROR('Cannot show movie before it is released', 16, 1);
				END
			END
			ELSE
			BEGIN
				RAISERROR('Values should not be Null', 16, 1);
			END
		END
		ELSE
		BEGIN
			IF @count > 0		
			BEGIN
				RAISERROR('This Showing Already Exists', 16, 1);
				--ROLLBACK TRANSACTION flag;
				-- Can commit because no changes
			END
			ELSE
			BEGIN
				RAISERROR('This Showing Already Exists', 16, 1);
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
			RAISERROR('This Showing Already Exists', 16, 1);
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			RAISERROR('This Showing Already Exists', 16, 1);
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
GO

-- Alter sp_CreateShowing to what we want
ALTER PROCEDURE [sp_CreateOrder]
	-- Param as 
	-- Order Table
	@CustomerID INT,
	@OrderDate DATE,

	-- OrderDetail Table
	@No_of_Tickets INT,

	-- Ticket Table
	@ShowingID INT,
	@CategoryID INT
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
		DECLARE @ticketdefault MONEY;
		SET @ticketdefault = '10.00';

		DECLARE @orderid int;
		DECLARE @pricecalc MONEY;
		DECLARE @pricetotal MONEY;
		DECLARE @ticketid INT;

		IF EXISTS (
			SELECT [r].[RatingID]
			FROM [Rating] [r]
			JOIN [Movie] [m]
			ON [m].[RatingID] = [r].[RatingID]
			JOIN [Showing] [s]
			ON [s].[MovieID] = [m].[MovieID]
			WHERE [r].[RatingID] = 5 AND
				[s].[ShowingID] = @ShowingID
		)
		BEGIN
			IF (
				17 <= (SELECT DATEDIFF(year, [c].[DOB], GETDATE())
				FROM [Customer] [c]
				WHERE [c].[CustomerID] = @CustomerID)
			)
			BEGIN

				INSERT INTO [Order] ([CustomerID], [OrderDate])
				VALUES (@CustomerID, @OrderDate);
				SET @orderid = @@IDENTITY;
		
				IF @CategoryID = '1'
				BEGIN
					SET @pricecalc = @ticketdefault;
				END
				ELSE IF @CategoryID = '2'
				BEGIN
					SET @pricecalc = @ticketdefault * 0.95;
				END
				ELSE IF @CategoryID = '3'
				BEGIN
					SET @pricecalc = @ticketdefault * 0.8;
				END
				ELSE IF @CategoryID = '4'
				BEGIN
					SET @pricecalc = @ticketdefault * 0.85;
				END
				ELSE IF @CategoryID = '5'
				BEGIN
					SET @pricecalc = @ticketdefault * 0.95;
				END
				ELSE IF @CategoryID = '6'
				BEGIN
					SET @pricecalc = @ticketdefault * 0.90;
				END
		
				SET @pricetotal = @pricecalc * @No_of_Tickets;

				INSERT INTO [Ticket] ([ShowingID], [CategoryID], [Price])
				VALUES (@ShowingID, @CategoryID, @pricetotal);
				SET @ticketid = @@IDENTITY;

				INSERT INTO [OrderDetail] ([OrderID], [TicketID], [No_of_Tickets])
				VALUES (@orderid, @ticketid, @No_of_Tickets);
			END
			ELSE
			BEGIN
				RAISERROR('A minor cannot purchase a rated R movie', 20, 1);
			END
		END
		ELSE
		BEGIN
			INSERT INTO [Order] ([CustomerID], [OrderDate])
			VALUES (@CustomerID, @OrderDate);
			SET @orderid = @@IDENTITY;
		
			IF @CategoryID = '1'
			BEGIN
				SET @pricecalc = @ticketdefault;
			END
			ELSE IF @CategoryID = '2'
			BEGIN
				SET @pricecalc = @ticketdefault * 0.95;
			END
			ELSE IF @CategoryID = '3'
			BEGIN
				SET @pricecalc = @ticketdefault * 0.8;
			END
			ELSE IF @CategoryID = '4'
			BEGIN
				SET @pricecalc = @ticketdefault * 0.85;
			END
			ELSE IF @CategoryID = '5'
			BEGIN
				SET @pricecalc = @ticketdefault * 0.95;
			END
			ELSE IF @CategoryID = '6'
			BEGIN
				SET @pricecalc = @ticketdefault * 0.90;
			END
		
			SET @pricetotal = @pricecalc * @No_of_Tickets;

			INSERT INTO [Ticket] ([ShowingID], [CategoryID], [Price])
			VALUES (@ShowingID, @CategoryID, @pricetotal);
			SET @ticketid = @@IDENTITY;

			INSERT INTO [OrderDetail] ([OrderID], [TicketID], [No_of_Tickets])
			VALUES (@orderid, @ticketid, @No_of_Tickets);

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
			RAISERROR('A minor cannot purchase a rated R movie', 16, 1);
			ROLLBACK TRANSACTION flag;
		END
		ELSE
		BEGIN
			RAISERROR('A minor cannot purchase a rated R movie', 14, 1);
			ROLLBACK TRANSACTION;
		END
	END
	END CATCH
	-- Template last end
END
GO


IF NOT EXISTS (select [name] from [Cinema].[sys].[objects] where type = 'TR' and [name] = 'Cust13')
BEGIN
	EXEC('
		CREATE TRIGGER Cust13
		ON [Order]
		INSTEAD OF Insert
		AS
		BEGIN
			SELECT * FROM [Order]
		END
	')
END
GO

ALTER TRIGGER Cust13
ON [Order]
INSTEAD OF Insert
AS
BEGIN
	DECLARE @rowaffected int;
	SET @rowaffected = @@ROWCOUNT

	IF @rowaffected > 0
	BEGIN
		IF EXISTS (
			SELECT i.CustomerID
			FROM inserted i
			where 13 <= (
				SELECT DATEDIFF(year, c.DOB, GETDATE())
				FROM Customer c
				WHERE c.CustomerID = i.CustomerID
			)
		)
		BEGIN
			insert into [Order]
			select [CustomerID], [OrderDate] from [inserted];
		END
		ELSE
		BEGIN
			RAISERROR('Have to be older than 13 years of age to purchase a ticket', 16, 1);
		END;
	END;
END