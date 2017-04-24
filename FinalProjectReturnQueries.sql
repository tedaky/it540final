USE [Cinema];

-- Return movies that haven't sold tickets
SELECT [m].[MovieID], [m].[Title]
FROM [Movie] [m]
WHERE NOT EXISTS (
	SELECT *
	FROM [Showing] [s]
	JOIN [Ticket] [t]
	ON [t].[ShowingID] = [s].[ShowingID]
	JOIN [OrderDetail] [od]
	ON [t].[TicketID] = [od].[TicketID]
);
GO

-- Return all the movies that have had sold out showings.
SELECT [m].[MovieID], [m].[Title]
FROM [Movie] [m]
WHERE EXISTS (
	SELECT [a].[Available_Seats]
	FROM [Auditorium] [a]
	JOIN [Showing] [s]
	ON [s].[AuditoriumID] = [a].[AuditoriumID]
	JOIN [Ticket] [t]
	ON [t].[ShowingID] = [s].[ShowingID]
	JOIN [OrderDetail] [od]
	ON [od].[TicketID] = [t].TicketID
	WHERE [od].[No_of_Tickets] = [a].[Available_Seats]
);
GO

-- What’s the average age of the moviegoers per movie.
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

-- Return per category the number of moviegoers.
SELECT [c].[CategoryID], [c].[Name], SUM([od].[No_of_Tickets]) AS 'Sum_Of_Tickets'
FROM [Category] [c]
JOIN [Ticket] [t]
ON [t].[CategoryID] = [c].[CategoryID]
JOIN [OrderDetail] [od]
ON [od].[TicketID] = [t].[TicketID]
GROUP BY [c].[CategoryID], [c].[Name]