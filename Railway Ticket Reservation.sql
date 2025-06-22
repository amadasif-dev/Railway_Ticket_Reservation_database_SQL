create database RailwayTicketReservation;
use RailwayTicketReservation;
----Admin Table--------------------------
create table tbl_admin(
ad_ID int identity primary key not null,
ad_Email varchar(50) not null,
ad_Password varchar (50) not null,
);
----Inserte Value in Admin Table-----------
insert into tbl_admin(ad_Email , ad_Password)
values('amad' , 'admin123'),('Hmayz' , 'admin123'),('Esha' , 'admin123'),('Nameer' , 'admin123')

----Passanger Table------------------------
create table tbl_Passanger(
pass_ID int identity primary key not null, 
pass_NIC int not null unique,
Pass_Password varchar(50) not null,
pass_Name varchar(50) not null,
Pass_Lname varchar(50) not null,
pass_Address varchar(50) not null,
pass_Gender varchar(50) not null,
);
----Train Table--------------------------
create table Train(
tr_ID int identity primary key not null,
tr_Number int not null,
tr_Name varchar(20) not null,
ticket_price varchar(50) not null,
);
----INSERTE TO ADD DATA------------------
insert into Train(tr_Name , tr_Number,ticket_price)
values('Babu Passenger' , 100,1200),('Badar Express' , 101,1500),
('Badin Express' , 102,1400),('Bahauddin Express' , 103,1000),
('Faisal Express' , 104,1250),('Faisalabad Express' , 105,1450),
('Faiz Ahmad Express' , 106,1300),('Fareed Express' , 107,1200)

SELECT * FROM Train;

----Train Compartment-------------------
create table Train_Compartment(
tc_ID int identity primary key not null,
tc_Number int not null,
tc_capcity int not null,
);
----INSERTE TO ADD DATA------------------
insert into Train_Compartment(tc_Number ,tc_capcity)
values(10,50),(11,50),(12,50),(13,50),(14,50),(15,50),(16,50),(17,50),(18,50),(19,50),(20,50),(21,50),
(22,50),(23,50),(24,50),(25,50)

SELECT*FROM Train_Compartment;
----Seats Table--------------------------
create table Seats(
st_ID int identity primary key not null,
st_Number int not null,
);
----INSERTE TO ADD DATA------------------
insert into Seats(st_Number)
values (50),(50),(50),(50),(50),(50),(50),
(50),(50),(50),(50),(50),(50),(50),
(50),(50),(50),(50),(50),(50),(50),
(50),(50),(50),(50),(50),(50),(50),
(50),(50),(50),(50),(50),(50),(50),
(50),(50),(50),(50),(50),(50),(50)
 select *from Seats;

----Bridge Table Compartment and Seat assigning---
create table Bridge(
br_ID int identity primary key not null,
st_FK_ID int foreign key references Seats(st_ID),
tc_FK_ID int foreign key references Train_Compartment(tc_ID),
);
----INSERTE TO ADD DATA----------------
insert into Bridge(st_FK_ID,tc_FK_ID)
values ('1','1'),('2','2'),('3','3'),('4','4'),('5','5'),('6','6'),('7','7'),('8','8'),('9','9'),('10','10'),
('11','11'),('12','12'),('13','13'),('14','14'),('15','15'),('16','16')

select * from Bridge;

----Full join use----------------------

select * from Train join Brigade1 on Train.tr_ID = Brigade1.tr_FK_ID
join Train_Compartment on Brigade1.tc_FK_ID = Train_Compartment.tc_ID
join Bridge on Bridge.tc_FK_ID = Train_Compartment.tc_ID
join Seats on Bridge.st_FK_ID = Seats.st_ID







----Bridage Table Compartment assigning To Train---
create table Brigade1(
b_ID int identity primary key not null,
tr_FK_ID int foreign key references Train(tr_ID),
tc_FK_ID int foreign key references Train_Compartment(tc_ID),
);
insert into Brigade1(tc_FK_ID,tr_FK_ID)
values ('1','28'),('2','28'),('3','28'),('4','28'),('5','28'),
('1','29'),('2','29'),('3','29'),('4','29'),('5','29'),
('1','30'),('2','30'),('3','30'),('4','30'),('5','30'),
('1','31'),('2','31'),('3','31'),('4','31'),('5','31'),
('1','32'),('2','32'),('3','32'),('4','32'),('5','32'),
('1','33'),('2','33'),('3','33'),('4','33'),('5','33'),
('1','34'),('2','34'),('3','34'),('4','34'),('5','34'),
('1','35'),('2','35'),('3','35'),('4','35'),('5','35')

delete from Brigade1
select * from Brigade1
----Route------------------------------------
create table tbl_Route(
route_ID int identity primary key not null,
route_Name varchar(25) not null,
);

insert into tbl_Route(route_Name)
values('Islamabad'),('Faisalabad'),('Hyderabad'),('Larkana'),('Rawalpindi'),('Bahawalpur'),('Multan'),('Sahiwal'),
('Peshawar'),('Sukkur'),('Mirpur Khas'),('Sargodha'),('Gujranwala'),('Hazara'),('Makran'),('Dera Ghazi Khan'),('Dera Ismail Khan'),('Rahim Yar Khan')
,('Nawabshah'),('Sadiqabad')
select * from tbl_Route;


----Trains Scheduale-------------------------
create table Trains_Schedule(
ts_ID int identity primary key not null,
tr_FK_ID int foreign key references Train(tr_ID),
route_FK_ID int foreign key references tbl_Route(Route_ID),
arival_city varchar(50) not null,
departure_city varchar (50) not null,
arival_Time time not null,
departure_Time time not null,
available_seats varchar(25) null,
scheduale_Date date not null,
--tr_FK_Name varchar(20) foreign key references Train(tr_Name),
);
----Ticket_Booking---------------------------
create table Ticket_Booking(
tb_ID int identity primary key not null,
pass_FK_ID int foreign key references tbl_Passanger(pass_ID),
ts_FK_ID int foreign key references Trains_Schedule(ts_ID),
tc_FK_ID int foreign key references Train_Compartment(tc_ID),
--tc_FK_Number int foreign key references Train_Compartment(tc_Number),
st_FK_ID int foreign key references Seats(st_ID),
--st_FK_Number int foreign key references Seats(st_Number),
tr_FK_ID int foreign key references Train(tr_ID),
--tr_FK_Name varchar(20) foreign key references Train(tr_Name),
tb_Booking_date date not null,
tb_Travelling date not null,
tb_Depature_date date not null,
tb_Destination varchar(50),
tb_total_seats int null,
tb_Total_amount varchar(50) not null,
);
