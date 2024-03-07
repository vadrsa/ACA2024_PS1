CREATE TABLE Passengers(
passenger_id BIGINT Identity(1, 1) PRIMARY KEY,
first_name varchar(20) NOT NULL,
last_name varchar(20) NOT NULL,
date_of_birth DATE
);

CREATE TABLE Concourses(
concourse CHAR(1) PRIMARY KEY,
CHECK (concourse IN ('A', 'B', 'C', 'D', 'E', 'F', 'T'))
);

CREATE TABLE Airlines(
airline_id INT Identity(1, 1) PRIMARY KEY,
airline_name varchar(50)
);

CREATE TABLE Airlines_Concourses(
airline_id INT,
concourse CHAR(1),
PRIMARY KEY(airline_id, concourse),
FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id),
FOREIGN KEY (concourse) REFERENCES Concourses(concourse)
);

CREATE TABLE Flights(
flight_id INT Identity(1, 1) PRIMARY KEY,
flight_number VARCHAR(20) NOT NULL,
airline_id INT NOT NULL,
departure_airport_code VARCHAR(3) NOT NULL,
destination_airport_code VARCHAR(3) NOT NULL,
expected_departure_datetime DATETIME,
expected_arrival_datetime DATETIME,
FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id)
);

CREATE TABLE Check_Ins(
check_in_id INT Identity(1, 1) PRIMARY KEY,
check_in_datetime DATETIME NOT NULL,
passenger_id INT NOT NULL,
flight_number VARCHAR(20),
FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);

INSERT INTO Passengers (first_name, last_name, age) Values
('Amelia', 'Earhart', '1985-01-22');

INSERT INTO Concourses (concourse) VALUES
('A'), ('B'), ('C'), ('D'), ('E'), ('F'), ('T');

INSERT INTO Airlines (airline_name) VALUES ('DELTA');

INSERT INTO Airlines_Concourses (airline_id, concourse) VALUES
(1, 'A'), (1, 'B'), (1, 'C'), (1, 'D'), (1, 'T');

INSERT INTO Flights (flight_number, airline_id, departure_airport_code, destination_airport_code, expected_departure_datetime, expected_arrival_datetime) VALUES
('DL300', 1, 'ATL', 'BOS', '2023-08-03 18:45:00', '2023-08-03 21:00:00');

INSERT INTO Check_Ins (passenger_id, check_in_datetime, flight_number) VALUES
((SELECT TOP 1 passenger_id FROM Passengers ORDER BY passenger_id DESC), '2023-08-03 15:07:00', 'DL300');
