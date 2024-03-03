CREATE TABLE Passengers(
passenger_id INT Identity(1, 1) PRIMARY KEY,
first_name varchar(20) NOT NULL,
last_name varchar(20) NOT NULL,
age INT
);

CREATE TABLE Airlines(
airline_id INT Identity(1, 1) PRIMARY KEY,
airline_name varchar(50),
concourse CHAR(1) CHECK (concourse IN ('A', 'B', 'C', 'D', 'E', 'F', 'T'))
);

CREATE TABLE Flights(
flight_id INT Identity(1, 1) PRIMARY KEY,
flight_number VARCHAR(20),
airline_id INT,
departure_airport_code VARCHAR(3),
destination_airport_code VARCHAR(3),
expected_departure_datetime DATETIME,
expected_arrival_datetime DATETIME,
FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id)
);

CREATE TABLE Check_Ins(
check_in_id INT Identity(1, 1) PRIMARY KEY,
check_in_datetime DATETIME,
passenger_id INT,
flight_number VARCHAR(20),
FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);

INSERT INTO Passengers (first_name, last_name, age) Values
('Amelia', 'Earhart', 39);

INSERT INTO Airlines (airline_name, concourse) VALUES
('Delta', 'A'), ('Delta', 'B'), ('Delta', 'C'), ('Delta', 'D'), ('Delta', 'T');

INSERT INTO Flights (flight_number, airline_id, departure_airport_code, destination_airport_code, expected_departure_datetime, expected_arrival_datetime) VALUES
('DL300', (SELECT TOP 1 airline_id FROM Airlines WHERE airline_name = 'Delta'), 'ATL', 'BOS', '2023-08-03 18:45:00', '2023-08-03 21:00:00');

INSERT INTO Check_Ins (passenger_id, check_in_datetime, flight_number) VALUES
((SELECT TOP 1 passenger_id FROM Passengers ORDER BY passenger_id DESC), '2023-08-03 15:07:00', 'DL300');
