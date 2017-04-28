USE [Cinema];

-- i.   Return movies that haven't sold tickets
SELECT [m].[MovieID], [m].[Title]
FROM [Movie] [m]
WHERE [m].[MovieID] NOT IN (
	SELECT [m].[MovieID]
	FROM [Movie] [m]
	JOIN [Showing] [s]
	ON [m].[MovieID] = [s].MovieID
	JOIN [Ticket] [t]
	ON [t].[ShowingID] = [s].[ShowingID]
	JOIN [OrderDetail] [od]
	ON [t].[TicketID] = [od].[TicketID]
	GROUP BY [m].[MovieID]
);
GO

-- ii.  Return the total sales per movie per year.
SELECT [m].[MovieID], [m].[Title], SUM([t].[Price]) AS 'Price_Sum', YEAR([o].[OrderDate]) AS 'Year'
FROM [Movie] [m]
JOIN [Showing] [s]
ON [s].[MovieID] = [m].[MovieID]
JOIN [Ticket] [t]
ON [t].[ShowingID] = [s].[ShowingID]
JOIN [OrderDetail] [od]
ON [od].[TicketID] = [t].[TicketID]
JOIN [Order] [o]
ON [o].[OrderID] = [od].OrderID
GROUP BY [m].[MovieID], [m].[Title], YEAR([o].[OrderDate]);
GO

-- iii.	Return the number of available seats for each movie per showing date.
SELECT [m].[MovieID], [m].[Title], [s].[Date], [a].[Available_Seats] - SUM([od].[No_of_Tickets]) AS 'Seats Available'
from [Showing] [s]
JOIN [Movie] [m]
ON [s].[MovieID] = [m].[MovieID]
JOIN [Auditorium] [a]
ON [s].[AuditoriumID] = [a].[AuditoriumID]
JOIN [Ticket] [t]
ON [t].[ShowingID] = [s].[ShowingID]
JOIN [OrderDetail] [od]
ON [od].[TicketID] = [t].[TicketID]
GROUP BY [s].[ShowingID], [s].[Date], [m].[MovieID], [m].[Title], [a].[Available_Seats]
GO

-- iv.	Return the number of tickets sold per year per category.
SELECT SUM([od].[no_of_tickets]) AS 'Tickets Sold', YEAR([o].[OrderDate]) AS 'Year', [c].[Name]
FROM [OrderDetail] [od]
JOIN [Order] [o]
ON [od].[OrderID] = [o].[OrderID]
JOIN [Ticket] [t]
ON [od].[TicketID] = [t].[TicketID]
Join [Category] [c]
ON [t].[CategoryID] = [c].[CategoryID]
GROUP BY YEAR([o].[OrderDate]), [c].[Name]
GO

-- v.   Return all the movies that have had sold out showings.
SELECT [m].[MovieID], [m].[Title], [s].[ShowingID], [a].[Available_Seats], SUM([od].[No_of_Tickets]) AS 'Total Tickets Sold'
FROM [Auditorium] [a]
JOIN [Showing] [s]
ON [s].[AuditoriumID] = [a].[AuditoriumID]
JOIN [Ticket] [t]
ON [t].[ShowingID] = [s].[ShowingID]
JOIN [OrderDetail] [od]
ON [od].[TicketID] = [t].[TicketID]
JOIN [Movie] [m]
ON [m].[MovieID] = [s].[MovieID]
GROUP BY [m].[MovieID], [m].[Title], [a].[Available_Seats], [s].[ShowingID]
HAVING SUM([od].[No_of_Tickets]) = [a].[Available_Seats]
GO

-- vi.  Return per category the number of moviegoers.
SELECT [c].[CategoryID], [c].[Name], SUM([od].[No_of_Tickets]) AS 'Sum_Of_Tickets'
FROM [Category] [c]
JOIN [Ticket] [t]
ON [t].[CategoryID] = [c].[CategoryID]
JOIN [OrderDetail] [od]
ON [od].[TicketID] = [t].[TicketID]
GROUP BY [c].[CategoryID], [c].[Name];
GO

-- vii. What’s the average age of the moviegoers per movie.
SELECT AVG(DATEDIFF(YEAR, [c].[DOB], GETDATE())) AS 'Average_Age_Per_Movie', [m].[MovieID], [m].[Title]
FROM [Customer] [c]
JOIN [Order] [o]
ON [o].[CustomerID] = [c].[CustomerID]
JOIN [OrderDetail] [od]
ON [od].[OrderID] = [o].[OrderID]
JOIN [Ticket] [t]
ON [t].[TicketID] = [od].[TicketID]
JOIN [Showing] [s]
ON [s].[ShowingID] = [t].[ShowingID]
JOIN [Movie] [m]
ON [m].[MovieID] = [s].[MovieID]
GROUP BY [m].[MovieID], [m].[Title];
GO
