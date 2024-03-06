CREATE DATABASE ATL;
USE ATL;


CREATE TABLE Passengers (
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    FirstName VARCHAR(15),
    LastName VARCHAR(15),
    Age INTEGER
)


CREATE TABLE Airlines(
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Name VARCHAR(50),
)

CREATE TABLE AirlinesConcourse(
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    AirlineId INT FOREIGN KEY REFERENCES Airlines(Id) ON DELETE CASCADE,
    Concourse VARCHAR(1) CHECK(Concourse in('A','B','C', 'D', 'E', 'F','T'))
)

CREATE TABLE Flights(
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    FlightNumber INT,
    AirlineId INT FOREIGN KEY REFERENCES Airlines(Id),
    DepartingAirport VARCHAR,
    ArrivalAirport VARCHAR,
    DepartureDate DATETIME,
    ArrivalDate DATETIME
)

CREATE TABLE CheckIns(
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    CheckInDate DATETIME,
    FlightId INT FOREIGN KEY REFERENCES Flights(Id),
    PassengerId INT FOREIGN KEY REFERENCES Passengers(Id),
)


--INSERTIONS--

-- Insert rows into table 'Passengers' in schema '[dbo]'
INSERT INTO [dbo].[Passengers]
( -- Columns to insert data into
 [FirstName],[LastName],[Age]
)
VALUES
( -- First row: values for the columns in the list above
'Amelia', 'Earhart',  39
)

INSERT INTO Airlines([Name])
VALUES('Delta')

--create loop?
declare @arlineid int = select id FROM Airlines WHERE Name = 'Delta'

-- Insert rows into table 'TableName' in schema '[dbo]'
INSERT INTO [dbo].[AirlinesConcourse]
( -- Columns to insert data into
 [AirlineId], [Concourse]
)
VALUES
( -- First row: values for the columns in the list above
 @arlineid, 'A'
),
( -- Second row: values for the columns in the list above
 @arlineid, 'B'
),
( -- Second row: values for the columns in the list above
 @arlineid, 'C'
),
( -- Second row: values for the columns in the list above
 @arlineid, 'D'
),
( -- Second row: values for the columns in the list above
 @arlineid, 'T'
);

INSERT INTO Flights 
(FlightNumber,AirlineId,ArrivalAirport,DepartureDate,ArrivalDate)
VALUES (300,@arlineid,'BOS', '2023-08-03 18-46-00','2023-08-03 21-09-00');

-- Insert rows into table 'CheckIns' in schema '[dbo]'
INSERT INTO [dbo].[CheckIns]
( -- Columns to insert data into
 [CheckInDate], [FlightId], [PassengerId]
)
VALUES
( -- First row: values for the columns in the list above
 ColumnValue1, ColumnValue2, ColumnValue3
)
-- Add more rows here
GO
