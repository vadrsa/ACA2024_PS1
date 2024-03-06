-- Passengers 
 CREATE TABLE Passengers ( 
	PassengerId INT PRIMARY KEY IDENTITY(1,1) NOT NULL, 
    FirstName NVARCHAR(50) NOT NULL, 
    LastName NVARCHAR(50) NOT NULL, 
    Age INT NOT NULL 
)
 --Airlines 
 CREATE TABLE Airlines(
	AirlineId INT PRIMARY KEY IDENTITY(1,1) NOT NULL, 
    AirlineName NVARCHAR(50) NOT NULL, 
    Concourse CHAR(1) NOT NULL, CHECK (Concourse IN ('A', 'B', 'C', 'D', 'E', 'F', 'T'))
 ) 
 --Concourse ENUM('A', 'B', 'C', 'D', 'E', 'F', 'T') NOT NULL );

 --Flights 
 CREATE TABLE Flights(
	FlightId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[FlightNumber] NVARCHAR(20) NOT NULL, 
    AirlineId INT NOT NULL, 
	FOREIGN KEY (AirlineId) REFERENCES Airlines(AirlineId), 
	DepartureAirportCode NVARCHAR(4) NOT NULL, 
	ArrivalAirportCode NVARCHAR(4) NOT NULL, 
    ExpectedDepartureDateTime DATETIME NOT NULL DEFAULT(GETDATE()), 
    ExpectedArrivalDateTime DATETIME NOT NULL DEFAULT(GETDATE()) 
)
 --Check-Ins 
 CREATE TABLE CheckIns(
	CheckInId INT PRIMARY KEY IDENTITY(1,1) NOT NULL, 
    CheckInDateTime DATETIME NOT NULL, 
	FlightId INT NOT NULL, 
	PassengerId INT NOT NULL, 
	FOREIGN KEY (FlightId) REFERENCES Flights(FlightId), 
	FOREIGN KEY (PassengerId) REFERENCES Passengers(PassengerId) 
 )
 
 
 INSERT INTO Passengers(FirstName, LastName, Age)
 VALUES('Amelia', 'Earhart', 39)

 INSERT INTO Airlines(AirlineName, Concourse)
 VALUES ('Delta', 'A'),('Delta' , 'B'),( 'Delta', 'C'),('Delta', 'D'),('Delta', 'T')

 INSERT INTO Flights (FlightNumber, AirlineId, DepartureAirportCode, ArrivalAirportCode, ExpectedDepartureDateTime, ExpectedArrivalDateTime)
 VALUES ('Delta Flight 300', 1, 'ATL', 'BOS', '2023-08-03T18:46:00', '2023-08-03T21:09:00')

 INSERT INTO CheckIns 
 VALUES ('2023-08-03T15:03:00', 1, 1)
 
 SELECT * FROM Passengers 
 SELECT * FROM Airlines
 SELECT * FROM Flights 
 SELECT * FROM CheckIns
