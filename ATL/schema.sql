-- Create Passengers table
CREATE TABLE Passengers (
    PassengerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Age INT
);

-- Create Airlines table
CREATE TABLE Airlines (
    AirlineID INT IDENTITY(1,1) PRIMARY KEY,
    AirlineName NVARCHAR(100) NOT NULL,
    Concourse CHAR(1) NOT NULL CHECK (Concourse IN ('A', 'B', 'C', 'D', 'E', 'F', 'T'))
);

-- Create Flights table
CREATE TABLE Flights (
    FlightID INT IDENTITY(1,1) PRIMARY KEY,
    FlightNumber NVARCHAR(50) NOT NULL,
    AirlineID INT NOT NULL,
    DepartureAirportCode NVARCHAR(3) NOT NULL,
    ArrivalAirportCode NVARCHAR(3) NOT NULL,
    DepartureDateTime DATETIME NOT NULL,
    ArrivalDateTime DATETIME NOT NULL,
    CONSTRAINT FK_Airlines_Flights FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
);

-- Create CheckIns table
CREATE TABLE CheckIns (
    CheckInID INT IDENTITY(1,1) PRIMARY KEY,
    PassengerID INT NOT NULL,
    FlightID INT NOT NULL,
    CheckInDateTime DATETIME NOT NULL,
    CONSTRAINT FK_Passengers_CheckIns FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    CONSTRAINT FK_Flights_CheckIns FOREIGN KEY (FlightID) REFERENCES Flights(FlightID)
);

-- Insert sample data for Passengers
INSERT INTO Passengers (FirstName, LastName, Age)
VALUES ('Amelia', 'Earhart', 39);

-- Insert sample data for Airlines
INSERT INTO Airlines (AirlineName, Concourse)
VALUES ('Delta', 'A'), ('Delta', 'B'), ('Delta', 'C'), ('Delta', 'D'), ('Delta', 'T');

-- Retrieve the AirlineID for Delta
DECLARE @DeltaAirlineID INT;
SELECT @DeltaAirlineID = AirlineID FROM Airlines WHERE AirlineName = 'Delta';

-- Insert sample data for Flights
INSERT INTO Flights (FlightNumber, AirlineID, DepartureAirportCode, ArrivalAirportCode, DepartureDateTime, ArrivalDateTime)
VALUES ('Delta Flight 300', @DeltaAirlineID, 'ATL', 'BOS', '2023-08-03 18:46:00', '2023-08-03 21:09:00');

-- Retrieve the FlightID for Delta Flight 300
DECLARE @DeltaFlightID INT;
SELECT @DeltaFlightID = FlightID FROM Flights WHERE FlightNumber = 'Delta Flight 300';

-- Insert sample data for CheckIns
INSERT INTO CheckIns (PassengerID, FlightID, CheckInDateTime)
VALUES ((SELECT PassengerID FROM Passengers WHERE FirstName = 'Amelia' AND LastName = 'Earhart'), @DeltaFlightID, '2023-08-03 15:03:00');
