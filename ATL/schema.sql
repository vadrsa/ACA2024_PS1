----------------  Table Creation ---------------
--CREATE TABLE Passengers
--(
--Id INT IDENTITY(1, 1) NOT NULL,
--FirstName VARCHAR(50) NOT NULL,
--LastName VARCHAR(50) NOT NULL,
--Age SMALLINT NOT NULL
--PRIMARY KEY(Id)
--);

--CREATE TABLE Airlines
--(
--AirLineId INT IDENTITY(1, 1) NOT NULL,
--AirlineName VARCHAR(100) NOT NULL,
--Concourse CHAR(1) NOT NULL,
--PRIMARY KEY(AirlineId),
--CHECK(Concourse in ('A', 'B', 'C', 'D', 'E', 'F', 'T') )
--);

--CREATE TABLE Flights
--(
--Id INT IDENTITY(1, 1) NOT NULL, 
--FlightNumber VARCHAR(30) NOT NULL, 
--AirlineId INT NOT NULL,
--DepartureCode VARCHAR(3) NOT NULL,
--DestinationCode VARCHAR(3) NOT NULL,
--DepartureDate DATETIME NOT NULL,
--ArrivalDate DATETIME NOT NULL,
--PRIMARY KEY(Id),
--FOREIGN KEY(AirlineId) REFERENCES Airlines(AirlineId), 

--);

--CREATE TABLE CheckIns
--(
--Id INT IDENTITY NOT NULL,
--PassengerId INT NOT NULL,
--FlightId INT NOT NULL,
--CheckInDate DATETIME NOT NULL,
--PRIMARY KEY(Id),
--FOREIGN KEY(FlightId) REFERENCES Flights(Id),
--FOREIGN KEY(PassengerId) REFERENCES Passengers(Id)
--);

----------------  End Creation ---------------

-------------------- Fill Tables -------------

--INSERT INTO Passengers (FirstName, LastName, Age) VALUES
--('John', 'Doe', 30),
--('Alice', 'Smith', 25),
--('Michael', 'Johnson', 40),
--('Emily', 'Brown', 35),
--('David', 'Lee', 28)

--INSERT INTO Airlines (AirlineName, Concourse) VALUES
--('Air France', 'C'),
--('Korean Air', 'D'),
--('American Airlines', 'E'),
--('Lufthansa', 'F'),
--('Emirates', 'T');

--INSERT INTO Flights (FlightNumber, AirlineId, DepartureCode, DestinationCode, DepartureDate, ArrivalDate) VALUES
--('BA456', 2, 'ATL', 'LHR', '2024-03-02 10:00:00', '2024-03-02 12:30:00'),
--('AF789', 3, 'ATL', 'CDG', '2024-03-03 12:00:00', '2024-03-03 15:30:00'),
--('KE012', 4, 'ATL', 'ICN', '2024-03-04 14:00:00', '2024-03-04 18:30:00'),
--('AA345', 5, 'ATL', 'DFW', '2024-03-05 16:00:00', '2024-03-05 18:30:00'),
--('LH678', 6, 'ATL', 'FRA', '2024-03-06 18:00:00', '2024-03-06 21:30:00'),
--('EK901', 7, 'ATL', 'DXB', '2024-03-07 20:00:00', '2024-03-08 02:30:00'),
--('DL456', 1, 'ATL', 'JFK', '2024-03-08 08:30:00', '2024-03-08 10:00:00'),
--('BA789', 2, 'ATL', 'MAN', '2024-03-09 10:30:00', '2024-03-09 12:00:00'),
--('AF123', 3, 'ATL', 'AMS', '2024-03-10 12:30:00', '2024-03-10 14:00:00');

--INSERT INTO CheckIns (PassengerId, FlightId, CheckInDate) VALUES
--(3, 3, '2024-02-29 11:30:00'),
--(4, 4, '2024-02-29 13:30:00'),
--(5, 5, '2024-02-29 15:30:00'),
--(6, 6, '2024-02-29 17:30:00')

-------------------- End Fill -------------------------

-------------------- Sample Data ----------------------
--- A passenger, Amelia Earhart, who is 39 years old
SELECT FirstName + ' ' + LastName, Age
FROM Passengers
WHERE Id = 1

-- An airline, Delta, which operates out of concourses A, B, C, D, and T
SELECT *
FROM Airlines
WHERE AirlineName = 'Delta'
/* A flight, Delta Flight 300, which is expected to depart from ATL on August 3rd, 
   2023 at 6:46 PM and arrive at BOS on August 3rd, 2023 at 9:09 PM */
SELECT Id 
FROM Flights
WHERE FlightNumber = 'DL300' AND AirlineId = 1 AND DepartureDate = '2023-08-03 18:46:00'
-- A check-in for Amelia Earhart, for Delta Flight 300, on August 3rd, 2023 at 3:03 PM

SELECT (p.FirstName + ' ' + p.LastName) AS FullName, FlightNumber, CheckInDate, DepartureCode, DestinationCode
FROM Passengers p
INNER JOIN CheckIns c ON P.Id = C.PassengerId
INNER JOIN Flights f ON C.FlightId = f.Id
WHERE P.FirstName = 'Amelia' AND LastName = 'Earhart' AND f.FlightNumber = 'DL300' AND c.CheckInDate = '2023-08-03 15:03:00'
------------------- End Sample Data -------------------