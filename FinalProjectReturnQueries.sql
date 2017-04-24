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
