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