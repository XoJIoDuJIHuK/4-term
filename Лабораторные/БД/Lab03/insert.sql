use Lab03;
insert into CUSTOMERS (Name, Address, Account)
	values('Belwest', 'default address 1', '12345678'), ('Zte', 'default address 2', '98765432'), ('Luch', 'default address 3', '45734346');
insert into GOODS (Name, Price, Amount)
	values('Table', 25.5, 4), ('Chair', 15, 4);
insert into GOODS (Name, Price, Amount)
	values('Shelf', 20.0, 10);
insert into ORDERS (Number, Name, Price, Amount, ArrivalDate, Customer)
	values(10, 'Shelf', 22, 1, '2014-5-7', 'Belwest'), (11, 'Chair', 152, 3, '2014-5-8', 'Zte');
insert into ORDERS values(12, 'Table', 252, 1, '2014-6-7', 'Luch');