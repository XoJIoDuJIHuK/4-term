use Lab03;
create table GOODS
(
Name nvarchar(20) primary key,
Price real unique not null,
Amount int
) on FG1;
create table CUSTOMERS
(
Name nvarchar(20) primary key,
Address nvarchar(50),
Account nvarchar(20)
) on FG1;
create table ORDERS
(
Number int primary key,
Name nvarchar(20) foreign key references GOODS(Name),
Price real,
Amount int,
ArrivalDate date,
Customer nvarchar(20) foreign key references CUSTOMERS(Name)
) on FG1;
