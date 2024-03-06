create table Passengers
(PassengersId int identity primary key,
[Name] varchar(20) not null,
[LastName] varchar(30) not null,
[Age] int not null,
)
create table Airlines
(AirlineId int identity primary key,
 [Name] varchar(20) not null,
-- Concourse varchar(1) not null,?
)
create table Flights
(FlightID int identity primary key,
 FlightNumber int not null,
 AirlineId int foreign key references Airlines(AirlineID) not null,
 DepartAirportCode varchar(3) not null,
 ArriveAirportCode varchar(3) not null,
 DepartDate datetime not null,
 ArriveDate datetime not null,
)
create table Check_Ins
(Check_InId int identity primary key,
 ExactDate datetime not null,
 PassengersId int foreign key references Passengers(PassengersId) not null,
 FlightID int foreign key references Flights(FlightID) not null,
)


Insert Passengers
values
('Hrach','Barseghyan',21),
('Poxos','Poxosyan',34)

Insert Airlines
values
('Delta'),
('Alfa'),
('Beta')

Insert Flights
values
(100,1,'ATL','UGC','2023-08-03 18:46:00', '2023-08-03 21:09:00'),
(200,2,'ARM','ATL','2023-08-03 18:46:00', '2023-08-03 21:09:00')

Insert Check_Ins
values
('2023-08-03 18:46:00',1,1),
('2023-08-03 21:09:00',2,2)

select * from TnayinDas8.dbo.Check_Ins
join Passengers on Passengers.Id=Check_Ins.PassengersId
join TnayinDas8.dbo.Flights on TnayinDas8.dbo.Flights.FlightID=Check_Ins.FlightID