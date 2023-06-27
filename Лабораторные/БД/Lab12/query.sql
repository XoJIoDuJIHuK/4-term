use UNIVER;

--task 1
--Разработать сценарий, демонстрирующий работу в режиме неявной транзакции.


set nocount on
if exists(select * from SYS.objects where OBJECT_ID = object_id(N'dbo.ExampleTable'))
	drop table ExampleTable;

declare @c int, @flag char = 'r';

SET IMPLICIT_TRANSACTIONS ON
create table ExampleTable(K int);
	insert ExampleTable values (1), (2), (3);
	set @c = (select count(*) from ExampleTable);
	print 'Number of rows: ' + cast(@c as nvarchar(100));
	if @flag = 'c' commit;
	else rollback;
SET IMPLICIT_TRANSACTIONS OFF

if exists(select * from SYS.objects where OBJECT_ID = object_id(N'dbo.ExampleTable'))
	print 'Exists';
	else print 'Does not exist';

--task 2
--Разработать сценарий, демонстрирующий свойство атомарности явной транзакции на примере базы данных UNIVER. 
--В блоке CATCH предусмотреть выдачу соответствующих сообщений об ошибках. 
--Опробовать работу сценария при использовании различных операторов модификации таблиц.

begin try
	begin tran
		delete PROGRESS where NOTE = 5;
		insert PROGRESS values('NULL', 1024, '2022-01-01', 5);
	commit tran
end try

begin catch
	print 'error: ' + case
	when error_number() = 2627 and patindex('%PK_PROGRESS%', error_message()) > 0
		then 'progress double'
		else 'unknown error: ' + cast(error_number() as varchar(5)) + error_message()
	end;

if @@TRANCOUNT > 0 rollback tran;
end catch;

--task 3
--Разработать сценарий, демонстрирующий применение оператора SAVE TRAN на примере базы данных UNIVER. 
--В блоке CATCH предусмотреть выдачу соответствующих сообщений об ошибках. 
--Опробовать работу сценария при использовании различных контрольных точек и различных операторов модификации таблиц.

declare @point varchar(32);
begin try
	begin tran
		insert PROGRESS values('ОАиП', 1025, '2021-01-01', 8);
		set @point = 'p1'; save tran @point;
		delete PROGRESS where IDSTUDENT = 1025 and PDATE = '2021-01-01';
		set @point = 'p2'; save tran @point;
	commit tran;
end try

begin catch
	print 'error: ' + case when error_number() = 2627 and patindex('%PK_PROGRESS%', error_message()) > 0
		then 'progress double'
		else 'unknown error: ' + cast(error_number() as varchar(5)) + error_message()
	end;
	if @@TRANCOUNT > 0
		begin
			print 'point: ' + @point;
			rollback tran @point;
			commit tran
		end;
end catch;

--task 4
--Разработать два сценария A и B на примере базы данных UNIVER.
--Сценарий A представляет собой явную транзакцию с уровнем изолированности READ UNCOMMITED, сценарий B – явную транзакцию с уровнем изолированности READ COMMITED (по умолчанию). 
--Сценарий A должен демонстрировать, что уровень READ UNCOMMITED допускает неподтвержденное, неповторяющееся и фантомное чтение. 


--A--
delete PROGRESS where IDSTUDENT = 1025;
update STUDENT set BDAY = '1993-06-12' where IDSTUDENT = 1025;
go

set transaction isolation level READ UNCOMMITTED
begin transaction
--t1--
select @@SPID, 'insert PROGRESS' 'result', * from PROGRESS where IDSTUDENT = 1025;
select @@SPID, 'update STUDENTS' 'result', NAME, BDAY from STUDENT where IDSTUDENT = 1025;
commit;
--t2--
--B--
begin transaction
select @@SPID
insert PROGRESS values('ОАиП', 1025, '2021-01-01', 8);
update STUDENT set BDAY = '1994-01-01' where IDSTUDENT = 1025;--1993-06-12
--t1--
--t2--
rollback

--task 5
--Разработать два сценария A и B на примере базы данных UNI-VER. 
--Сценарии A и В представля-ют собой явные транзакции с уровнем изолированности READ COMMITED. 
--Сценарий A должен демон-стрировать, что уровень READ COMMITED не допускает не-подтвержденного чтения, но при этом возможно неповторя-ющееся и фантомное чтение. 


update STUDENT set BDAY = '1993-06-12' where IDSTUDENT = 1025;
rollback
go
-- A ---
	set transaction isolation level READ COMMITTED 
	begin transaction 
	select * from STUDENT where IDSTUDENT = 1025
	-------------------------- t1 -----------------
	-------------------------- t2 -----------------
	select  'update STUDENT' 'результат', * from STUDENT where IDSTUDENT = 1025
	commit transaction

	--- B ---	
	begin transaction 	  
	-------------------------- t1 --------------------
          update STUDENT set BDAY = '1994-01-01' where IDSTUDENT = 1025; 
		  rollback transaction
		  commit
	-------------------------- t2 --------------------	

	          set transaction isolation level READ COMMITTED 
	begin transaction 
	select * from STUDENT where IDSTUDENT = 1025



--task 6
--Разработать два сценария A и B на примере базы данных UNIVER. 
--Сценарий A представляет собой явную транзакцию с уров-нем изолированности REPEATABLE READ. Сценарий B – явную транзакцию с уровнем изолированности READ COMMITED. 
--Сценарий A должен демонстрировать, что уровень REAPETABLE READ не допускает неподтвержденного чтения и неповторяющегося чтения, но при этом возможно фантомное чтение. 


delete PROGRESS where IDSTUDENT = 1025;
-- A ---
set transaction isolation level  REPEATABLE READ 
begin transaction 
select IDSTUDENT from PROGRESS where NOTE = 7;
-------------------------- t1 ------------------ 
-------------------------- t2 -----------------
select 
	case
		when IDSTUDENT = 1025 then 'insert  Заказы'  else 'not' 
	end 'результат', IDSTUDENT from PROGRESS  where NOTE = 7;
commit; 

--- B ---	
begin transaction 	  
-------------------------- t1 --------------------
	insert PROGRESS values ('ОАиП', 1025, '01.12.2014', 7);
-------------------------- t2 --------------------
commit; 

--task 7
--Разработать два сценария A и B на примере базы данных UNIVER. 
--Сценарий A представляет собой явную транзакцию с уровнем изолированности SERIALIZABLE. 
--Сценарий B – явную транзакцию с уровнем изолированности READ COMMITED.
--Сценарий A должен демонстрировать отсутствие фантомного, неподтвержденного и неповторяющегося чтения.


-- A ---
set transaction isolation level SERIALIZABLE
begin transaction
	delete PROGRESS where IDSTUDENT = 1001;  
	insert PROGRESS values ('ОАиП', 1001, '2013-10-02', 7);
    update PROGRESS set IDSTUDENT = 1001 where PDATE = '2013-10-02';
    select IDSTUDENT from PROGRESS where SUBJECT = 'ОАиП';
	-------------------------- t1 -----------------
	select IDSTUDENT from PROGRESS where SUBJECT = 'ОАиП';
	-------------------------- t2 ------------------ 
commit; 	

--- B ---	
begin transaction
	delete PROGRESS where IDSTUDENT = 1001;  
	insert PROGRESS values ('ОАиП', 1001, '2013-10-02', 7);
    update PROGRESS set SUBJECT = 'КГ' where IDSTUDENT = 1001;
    select IDSTUDENT from PROGRESS where SUBJECT = 'ОАиП';
	-------------------------- t1 -----------------
commit; 
    select IDSTUDENT from PROGRESS where SUBJECT = 'ОАиП';
    -------------------------- t2 --------------------
	rollback


--task 8
--Разработать сценарий, демонстрирующий свойства вложенных транзакций, на примере базы данных UNIVER. 

delete PROGRESS where IDSTUDENT = 1025;

begin tran -- внешняя транзакция
insert PROGRESS values ('ОАиП', 1025, '2013-10-02', 7);
begin tran -- внутренняя транзакция
update PROGRESS set PDATE = '2013-10-03' where IDSTUDENT = 1025;
commit;
select PDATE from PROGRESS where IDSTUDENT = 1025;
-- внутренняя транзакция
if @@trancount > 0 rollback; -- внешняя транзакция
select
	(select count(*) from PROGRESS where IDSTUDENT = 1025) 'PROGRESS',
	(select count(*) from STUDENT where IDSTUDENT = 1025) 'STUDENT';


--task 9

use To_MyBase;

--task 1

set nocount on
if exists(select * from SYS.objects where OBJECT_ID = object_id(N'dbo.ExampleTable'))
	drop table ExampleTable;

declare @c int, @flag char = 'c';

SET IMPLICIT_TRANSACTIONS ON
create table ExampleTable(K int);
	insert ExampleTable values (1), (2), (3);
	set @c = (select count(*) from ExampleTable);
	print 'Number of rows: ' + cast(@c as nvarchar(100));
	if @flag = 'c' commit;
	else rollback;
SET IMPLICIT_TRANSACTIONS OFF

if exists(select * from SYS.objects where OBJECT_ID = object_id(N'dbo.ExampleTable'))
	print 'Exists';
	else print 'Does not exist';

--task 2

begin try
	begin tran
		delete Сотрудники where [ID сотрудника] = 1;
		insert Сотрудники values('Драгун', 'Татьяна', 'Петровна', '1973-04-04', 'жен');
	commit tran
end try

begin catch
	print 'error: ' + case
	when error_number() = 2627 and patindex('%PK_PROGRESS%', error_message()) > 0
		then 'progress double'
		else 'unknown error: ' + cast(error_number() as varchar(5)) + error_message()
	end;

if @@TRANCOUNT > 0 rollback tran;
end catch;

--task 3

declare @point varchar(32);
begin try
	begin tran
		insert Назначения values('2023-01-01', '1-1', '2027-01-01', 1, 3);
		set @point = 'p1'; save tran @point;
		delete Назначения where [ID сотрудника] = 1 and [ID назначения] = 3;
		set @point = 'p2'; save tran @point;
	commit tran;
end try

begin catch
	print 'error: ' + case when error_number() = 2627 and patindex('%PK_PROGRESS%', error_message()) > 0
		then 'progress double'
		else 'unknown error: ' + cast(error_number() as varchar(5)) + error_message()
	end;
	if @@TRANCOUNT > 0
		begin
			print 'point: ' + @point;
			rollback tran @point;
			commit tran
		end;
end catch;

--task 4

--A--
delete Назначения where [Дата назначения] = '2023-01-01';
update Сотрудники set [Дата рождения] = '1970-10-10' where [ID сотрудника] = 2;
go

set transaction isolation level READ UNCOMMITTED
begin transaction
--t1--
select @@SPID, 'insert PROGRESS' 'result', * from Назначения where [Дата назначения] = '2023-01-01';
select @@SPID, 'update STUDENTS' 'result', [Имя сотрудника], [Дата рождения] from Сотрудники where [Дата рождения] = '1970-10-10';
commit;
--t2--
--B--
begin transaction
select @@SPID
insert Назначения values('2023-01-01', '1-1', '2027-01-01', 1, 3)
update Сотрудники set [Дата рождения] = '1994-01-01' where [Дата рождения] = '1970-10-10';
--t1--
--t2--
rollback;

--task 5

update Сотрудники set [Дата рождения] = '1970-10-10' where [ID сотрудника] = 2;
go
-- A ---
          set transaction isolation level READ COMMITTED 
	begin transaction 
	select count(*) from Сотрудники where [Дата рождения] = '1994-01-01';
	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------
	select  'update STUDENT' 'результат', count(*) from Сотрудники where [Дата рождения] = '1994-01-01';
	commit;

	--- B ---	
	begin transaction 	  
	-------------------------- t1 --------------------
          update Сотрудники set [Дата рождения] = '1994-01-01' where [ID сотрудника] = 2; 
          commit; 
	-------------------------- t2 --------------------	

--task 6
delete Назначения where [ID сотрудника] = 2 and Должность = '1-1';
-- A ---
set transaction isolation level  REPEATABLE READ 
begin transaction 
select [ID сотрудника] from Назначения where [ID назначения] = 2;
-------------------------- t1 ------------------ 
-------------------------- t2 -----------------
select 
	case
		when [ID сотрудника] = 2 then 'insert  Заказы'  else 'not' 
	end 'результат', [ID сотрудника] from Назначения  where [ID назначения] = 2;
commit; 

--- B ---	
begin transaction 	  
-------------------------- t1 --------------------
	insert Назначения values('2023-01-01', '1-1', '2027-01-01', 2, 2)
commit; 
-------------------------- t2 --------------------

--task 7

-- A ---
set transaction isolation level SERIALIZABLE
begin transaction
	delete Назначения where [ID сотрудника] = 1001;  
	insert Назначения values('2023-01-01', '1-1', '2027-01-01', 2, 2)
    update Назначения set [ID сотрудника] = 3 where [Дата назначения] = '2013-10-02';
    select [ID сотрудника] from Назначения where Должность = '1-1';
	-------------------------- t1 -----------------
	select [ID сотрудника] from Назначения where Должность = '1-1';
	-------------------------- t2 ------------------ 
commit; 	

--- B ---	
begin transaction
	delete Назначения where [ID сотрудника] = 1001;  
	insert Назначения values('2023-01-01', '1-1', '2027-01-01', 2, 2)
    update Назначения set [ID сотрудника] = 3 where [Дата назначения] = '2013-10-02';
    select [ID сотрудника] from Назначения where Должность = '1-1';
	-------------------------- t1 -----------------
commit; 
    select [ID сотрудника] from Назначения where Должность = '1-1';
    -------------------------- t2 --------------------

--task 8

delete Назначения where [ID сотрудника] = 1025;

begin tran -- внешняя транзакция
insert Назначения values('2023-01-01', '1-1', '2027-01-01', 2, 2)
begin tran -- внутренняя транзакция
update Назначения set [Дата назначения] = '2013-10-03' where [ID сотрудника] = 2;
commit;
-- внутренняя транзакция
if @@trancount > 0 rollback; -- внешняя транзакция
select
	(select count(*) from Назначения where [ID сотрудника] = 2) 'Назначения',
	(select count(*) from Сотрудники where [ID сотрудника] = 2) 'STUDENT';