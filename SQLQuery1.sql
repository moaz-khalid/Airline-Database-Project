Create database Airline

Create table Aircraft(
id nvarchar(10) not null,
Model nvarchar(15) not null,
Capacity Int not null,
Major_pilot nvarchar(20) not null,
Assistant_pilot nvarchar(20) not null,
Host_1 nvarchar(25) not null,
Host_2 nvarchar(25) not null,
 Primary key (id),
);
Create table Route_(
id nvarchar(10) not null,
Classification nvarchar(15) not null,
Distance decimal(10,3) not null,
Destination nvarchar(15) not null,
Origin nvarchar(15) not null,
Primary key (id),
);
Create table Aircraft_route(
Aircraft_id nvarchar(10)not null,
Route_id nvarchar(10) not null,
Number_of_Passenger Int not null,
Arrival date not null,
departure date not null,
Price decimal(10,3),
Primary key(Aircraft_id , Route_id),
Foreign key (Aircraft_id) References Aircraft
on update cascade
on delete cascade,
Foreign key (Route_id) References Route_
on update cascade
on delete cascade,
);
create table Employee
(
Id nvarchar(10) not null,
position nvarchar(50) not null,
gender nvarchar(20) not null,
year int not null,
month int not null,
day int not null,
address nvarchar(40),
primary key (Id)
) 

create table Employee_qualification
(
Employee_Id nvarchar(10) not null,
qualification nvarchar(50) not null,
primary key(Employee_Id),
foreign key (Employee_Id) references employee
on update cascade
on delete cascade,
)


create table transaction_
(
Id nvarchar(10) not null,
description nvarchar(50) not null,
date date not null,
amount decimal(10,3) not null,
primary key(Id)
)

create table airline
(
Id nvarchar(10) not null,
name nvarchar(50) not null,
contact_person nvarchar(50) not null,
address nvarchar(40) not null,
primary key(Id)
)

create table airline_phones
(
airline_Id nvarchar(10) not null,
phone nvarchar(11) not null,
primary key (airline_Id, phone),
foreign key (airline_Id) references airline
on update cascade
on delete cascade,
)

create table transaction_
(
Id nvarchar(10) not null,
description nvarchar(50) not null,
date date not null,
amount decimal(10,3) not null,
primary key(Id)
);

create table airline
(
Id nvarchar(10) not null,
name nvarchar(50) not null,
contact_person nvarchar(50) not null,
address nvarchar(40) not null,
primary key(Id)
);

create table airline_phones
(
airline_Id nvarchar(10) not null,
phone nvarchar(11) not null,
primary key (airline_Id, phone),
foreign key (airline_Id) references airline
on update cascade
on delete cascade,
);
alter table Aircraft add Airline_id nvarchar(10) references Airline;
alter table Transaction_ add Airline_id nvarchar(10) references Airline;
alter table Employee add Airline_id nvarchar(10) references Airline;

INSERT INTO Airline (Id, Name, Contact_person, Address)
VALUES 
('AL01', 'SkyWings Airlines', 'Oliver Reed', '123 Aviation Blvd, NY'),
('AL02', 'Horizon Air', 'Charlotte King', '456 Skyview Road, LA'),
('AL03', 'Pacific Blue Airways', 'George Harris', '789 Coastal Way, Seattle');

INSERT INTO Aircraft (Id, Model, Capacity, Major_pilot, Assistant_pilot, Host_1, Host_2, Airline_id)
VALUES 
('A101', 'Boeing 737', 180, 'John Smith', 'Emily Carter', 'Sarah Lee', 'Tom Brown', 'AL01'),
('A102', 'Airbus A320', 160, 'Mike Davis', 'Hannah White', 'Lisa Green', 'Alan Jones', 'AL02'),
('A103', 'Embraer 190', 100, 'Laura Wilson', 'Kevin Moore', 'Sophie Black', 'Jack Taylor', 'AL03');

INSERT INTO Route_ (Id, Classification, Distance, Destination, Origin)
VALUES 
('R001', 'Domestic', 800.000, 'New York (JFK)', 'Chicago (ORD)'),
('R002', 'International', 7200.000, 'London (LHR)', 'LosAngeles(LAX)'),
('R003', 'Domestic', 500.000, 'Houston (IAH)', 'Dallas (DFW)');

INSERT INTO Aircraft_route (Aircraft_id, Route_id, Number_of_Passenger, Arrival, Departure, Price)
VALUES 
('A101', 'R001', 170, '2024-11-24', '2024-11-24', 150.000),
('A102', 'R002', 150, '2024-11-25', '2024-11-25', 700.000),
('A103', 'R003', 90, '2024-11-26', '2024-11-26', 100.000);



INSERT INTO Airline_Phones (Airline_Id, Phone)
VALUES 
('AL01', '+121255501'),
('AL01', '+121250202'),
('AL02', '+131050303'),
('AL03', '+120650404');

INSERT INTO Transaction_ (Id, Description, Date, Amount, Airline_id)
VALUES 
('T001', 'Ticket Sale', '2024-11-20', 2000.000, 'AL01'),
('T002', 'Maintenance Expense', '2024-11-21', 1500.000, 'AL02'),
('T003', 'Fuel Cost', '2024-11-22', 3000.000, 'AL03');

INSERT INTO Employee (Id, Position, Gender, Year, Month, Day, Address, Airline_Id)
VALUES 
('E001', 'Pilot', 'Male', 1980, 5, 20, '12 Cloud St, NY', 'AL01'),
('E002', 'Flight Attendant', 'Female', 1992, 8, 14, '34 Wind Rd, LA', 'AL02'),
('E003', 'Engineer', 'Male', 1985, 3, 10, '56 Jet Way, Seattle', 'AL03');

INSERT INTO Employee_qualification (Employee_Id, Qualification)
VALUES 
('E001', 'Commercial Pilot License'),
('E002', 'Cabin Crew Training'),
('E003', 'Aircraft Maintenance Certification');