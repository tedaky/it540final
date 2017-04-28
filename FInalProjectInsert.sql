-- Use Cinema
USE [Cinema];
GO

-- Insert to Genre Table
EXEC [sp_CreateGenre] @GenreName = 'Action';
GO
EXEC [sp_CreateGenre] @GenreName = 'Adventure';
GO
EXEC [sp_CreateGenre] @GenreName = 'Comedy';
GO
EXEC [sp_CreateGenre] @GenreName = 'Crime';
GO
EXEC [sp_CreateGenre] @GenreName = 'Gangster';
GO
EXEC [sp_CreateGenre] @GenreName = 'Drama';
GO
EXEC [sp_CreateGenre] @GenreName = 'Epics/Historical';
GO
EXEC [sp_CreateGenre] @GenreName = 'Horror';
GO
EXEC [sp_CreateGenre] @GenreName = 'Musical/Dance';
GO
EXEC [sp_CreateGenre] @GenreName = 'Science Fiction';
GO
EXEC [sp_CreateGenre] @GenreName = 'War';
GO
EXEC [sp_CreateGenre] @GenreName = 'Western';
GO
EXEC [sp_CreateGenre] @GenreName = 'Biography';
GO
EXEC [sp_CreateGenre] @GenreName = 'Fantasy';
GO
EXEC [sp_CreateGenre] @GenreName = 'Romance';
GO


-- Insert to Category Table
EXEC [sp_CreateCategory] @CategoryName = 'Normal', @CategoryDescription = 'Price is Ticket Price';
GO
EXEC [sp_CreateCategory] @CategoryName = 'Student', @CategoryDescription = 'Price is 5% off Ticket Price';
GO
EXEC [sp_CreateCategory] @CategoryName = 'Employee', @CategoryDescription = 'Price is 20% off Ticket Price';
GO
EXEC [sp_CreateCategory] @CategoryName = 'Veteran', @CategoryDescription = 'Price is 15% off Ticket Price';
GO
EXEC [sp_CreateCategory] @CategoryName = 'Kid', @CategoryDescription = 'Price is 5% off Ticket Price';
GO
EXEC [sp_CreateCategory] @CategoryName = 'Senior', @CategoryDescription = 'Price is 10% off Ticket Price';
GO


-- Insert to Rating Table
EXEC [sp_CreateRating] @RatingName = 'NA', @RatingDescription = 'Not Yet Rated';
GO
EXEC [sp_CreateRating] @RatingName = 'G', @RatingDescription = 'General Audiences – all ages admitted';
GO
EXEC [sp_CreateRating] @RatingName = 'PG', @RatingDescription = 'Parental Guidance Suggested – some material may not be suitable for children';
GO
EXEC [sp_CreateRating] @RatingName = 'PG-13', @RatingDescription = 'Parents Strongly Cautioned – some material may be inappropriate for children under 13';
GO
EXEC [sp_CreateRating] @RatingName = 'R', @RatingDescription = 'Restricted – under 17 requires accompanying parent or adult guardian';
GO
EXEC [sp_CreateRating] @RatingName = 'NC-17', @RatingDescription = 'No one 17 and under admitted';
GO


-- Insert to Customer Table
EXEC [sp_CreateCustomer] @FirstName = 'Bradley', @LastName = 'Kunz', @Gender = 'M', @DOB = '1999-9-18', @Email = 'bradley.kunz@mnsu.edu';
GO
EXEC [sp_CreateCustomer] @FirstName = 'Eric', @LastName = 'Tiedeken', @Gender = 'M', @DOB = '2010-12-25', @Email = 'eric.tiedeken@mnsu.edu';
GO
EXEC [sp_CreateCustomer] @FirstName = 'Emiel', @LastName = 'Smeek', @Gender = 'M', @DOB = '2003-12-6', @Email = 'emiel.smeek@mnsu.edu';
GO
EXEC [sp_CreateCustomer] @FirstName = 'Jane', @LastName = 'Doe', @Gender = 'F', @DOB = '1970-4-20', @Email = 'jane.doe@mnsu.edu';
GO
EXEC [sp_CreateCustomer] @FirstName = 'John', @LastName = 'Smith', @Gender = 'M', @DOB = '1978-5-12', @Email = 'jogn.smith@mnsu.edu';
GO


-- Insert to Auditorium Table
EXEC [sp_CreateAuditorium] @AuditoriumName = 'Auditorium A', @AvailableSeats = 150;
GO
EXEC [sp_CreateAuditorium] @AuditoriumName = 'Auditorium B', @AvailableSeats = 100;
GO
EXEC [sp_CreateAuditorium] @AuditoriumName = 'Auditorium C', @AvailableSeats = 200;
GO
EXEC [sp_CreateAuditorium] @AuditoriumName = 'Auditorium D', @AvailableSeats = 200;
GO
EXEC [sp_CreateAuditorium] @AuditoriumName = 'Auditorium E', @AvailableSeats = 250;
GO


-- Insert to Movie Table
EXEC [sp_CreateMovie] @MovieTitle = 'The Dark Knight', @MovieReleaseDate = '2008-7-18', @MovieRuntime = '2:32:00', @MovieRating = 'PG-13', @MovieGenre = 'Action,Crime,Drama';
GO
EXEC [sp_CreateMovie] @MovieTitle = 'Pulp Fiction', @MovieReleaseDate = '1994-10-14', @MovieRuntime = '2:34:00', @MovieRating = 'R', @MovieGenre = 'Crime,Drama';
GO
EXEC [sp_CreateMovie] @MovieTitle = 'Star Wars: Episode V - The Empire Strikes Back', @MovieReleaseDate = '1980-6-20', @MovieRuntime = '2:4:00', @MovieRating = 'PG', @MovieGenre = 'Action,Adventure,Fantasy';
GO
EXEC [sp_CreateMovie] @MovieTitle = 'Forrest Gump', @MovieReleaseDate = '1994-7-6', @MovieRuntime = '2:22:00', @MovieRating = 'PG-13', @MovieGenre = 'Comedy,Drama,Romance';
GO
EXEC [sp_CreateMovie] @MovieTitle = 'Goodfellas', @MovieReleaseDate = '1990-9-21', @MovieRuntime = '2:26:00', @MovieRating = 'R', @MovieGenre = 'Biography,Crime,Drama';
GO


-- Insert to Showing Table
EXEC [sp_CreateShowing] @MovieID = 1, @AuditoriumID = 1, @Date = '2009-12-20', @Time = '5:00';
GO
EXEC [sp_CreateShowing] @MovieID = 2, @AuditoriumID = 1, @Date = '1999-02-11', @Time = '7:00';
GO
EXEC [sp_CreateShowing] @MovieID = 3, @AuditoriumID = 2, @Date = '2002-05-18', @Time = '6:15';
GO
EXEC [sp_CreateShowing] @MovieID = 4, @AuditoriumID = 5, @Date = '1997-08-27', @Time = '5:30';
GO
EXEC [sp_CreateShowing] @MovieID = 5, @AuditoriumID = 3, @Date = '2013-06-05', @Time = '7:45';
GO



-- Insert to order, orderdetail, ticket | Todays date
EXEC [sp_CreateOrder] @CustomerID = 1, @OrderDate = '2007-07-14', @No_of_Tickets = 3, @ShowingID = 1, @CategoryID = 3;
GO
EXEC [sp_CreateOrder] @CustomerID = 2, @OrderDate = '2010-06-20', @No_of_Tickets = 1, @ShowingID = 3, @CategoryID = 2;
GO
EXEC [sp_CreateOrder] @CustomerID = 3, @OrderDate = '2010-06-20', @No_of_Tickets = 1, @ShowingID = 3, @CategoryID = 2;
GO
EXEC [sp_CreateOrder] @CustomerID = 4, @OrderDate = '2010-09-25', @No_of_Tickets = 2, @ShowingID = 5, @CategoryID = 1;
GO
EXEC [sp_CreateOrder] @CustomerID = 4, @OrderDate = '2010-09-25', @No_of_Tickets = 2, @ShowingID = 5, @CategoryID = 5;
GO
EXEC [sp_CreateOrder] @CustomerID = 4, @OrderDate = '2010-09-25', @No_of_Tickets = 1, @ShowingID = 5, @CategoryID = 6;
GO
EXEC [sp_CreateOrder] @CustomerID = 2, @OrderDate = '2014-09-25', @No_of_Tickets = 1, @ShowingID = 2, @CategoryID = 1;
GO

