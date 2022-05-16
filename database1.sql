create table Car_Dealership(
	Dealership_id serial primary key
	dealership_name varchar(150)
);

alter table car_dealership 
add Dealership_name varchar(150);

--Adding Data(car_dealership)--

insert into car_dealership (dealership_name)
values('Fast Cars Dealership'),
('European Cars Dealership');

--Adding Data(car_dealership)--

--test--

select * from car_dealership;

--test--

create table Cars(
	serial_number serial primary key,
	service_hisotry varchar(1000),
	model varchar(50),
	make varchar(50),
	color varchar(50),
	year_ integer 
);
alter table cars  
alter column year_  type integer using year_::integer;

--Adding Data( Cars )

insert into cars(service_history, model, make, color, year_)
values('Turbo Added','Supra','Toyota','black ','1998'),
('Oil change','RX','Lexus','grey','2021')
;
--Adding Data( Cars )

--test--

select * from cars;

--test--

create table customer(
	Customer_id serial primary key,
	first_name varchar(150) not null,
	last_name varchar(150) not null,
	serial_number integer,
	foreign key(serial_number) references cars(serial_number)
);

--Adding Data( customer )
insert into customer(first_name, last_name)
values('Jose','Viloria'),
('Julio','Leon');
--Adding Data( customer )

--test--

select * from customer; 

--test--
create table sales_person(
	salesperson_id serial primary key,
	first_name varchar(50) not null,
	last_name varchar (150)not null,
	total_sales numeric(8,2)not null,
	dealership_id integer not null,
	foreign key(dealership_id) references car_dealership(dealership_id)
);
--test--

select * from sales_person;

--test--
create table invoice(
	invoice_id serial primary key,
	amount numeric(8,2) not null,
	date_ date  not null,
	serial_number integer,
	foreign key (serial_number) references cars(serial_number),
	salesperson_id integer,
	foreign key (salesperson_id) references sales_person(salesperson_id)
);

--test--

select * from invoice;

--test--
create table mechanic (
	mechanic_id serial primary key,
	first_name varchar(150) not null,
	last_name varchar(150) not null,
	Dealership_id integer,
	foreign key (Dealership_id) references Car_Dealership(Dealership_id)
);

--Adding Data( mechanic )
insert into mechanic (first_name, last_name, dealership_id)
values ('Paulo','Londra','1'),
('Benito','Martinez','2');
--Adding Data( mechanic )
--test--

select * from mechanic;

--test--
create table services (
	services_id serial,
	service_ticket varchar(1000),
	hourly_rate numeric(5,2),
	parts_id integer,
	serial_number integer,
	foreign key (serial_number) references cars(serial_number),
	mechanic_id integer,
	foreign key (mechanic_id) references mechanic(mechanic_id)
);

--Adding Data( services )
insert into services (service_ticket, hourly_rate, parts_id, serial_number, mechanic_id)
values('New turbo was added','20.00',23,1,1),
('Oil changed','20.00',0,2,2);
--Adding Data( services )

--test--

select* from services;

--test--
--Here I start to add value -- 



--Mi loco all you need to do from now is add data