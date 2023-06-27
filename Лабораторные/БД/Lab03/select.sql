use Lab03;
select * from GOODS;

select Name, Price from GOODS;

select count(*)[Count] from GOODS;

select Name[Cheap goods] from GOODS where Price < 200;

update GOODS set Price = Price + 10 where Name = 'Table';

delete from ORDERS where Name = 'Chair';
delete from GOODS where Name = 'Chair';