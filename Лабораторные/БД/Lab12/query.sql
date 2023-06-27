use UNIVER;

--task 1
--����������� ��������, ��������������� ������ � ������ ������� ����������.


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
--����������� ��������, ��������������� �������� ����������� ����� ���������� �� ������� ���� ������ UNIVER. 
--� ����� CATCH ������������� ������ ��������������� ��������� �� �������. 
--���������� ������ �������� ��� ������������� ��������� ���������� ����������� ������.

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
--����������� ��������, ��������������� ���������� ��������� SAVE TRAN �� ������� ���� ������ UNIVER. 
--� ����� CATCH ������������� ������ ��������������� ��������� �� �������. 
--���������� ������ �������� ��� ������������� ��������� ����������� ����� � ��������� ���������� ����������� ������.

declare @point varchar(32);
begin try
	begin tran
		insert PROGRESS values('����', 1025, '2021-01-01', 8);
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
--����������� ��� �������� A � B �� ������� ���� ������ UNIVER.
--�������� A ������������ ����� ����� ���������� � ������� ��������������� READ UNCOMMITED, �������� B � ����� ���������� � ������� ��������������� READ COMMITED (�� ���������). 
--�������� A ������ ���������������, ��� ������� READ UNCOMMITED ��������� ����������������, ��������������� � ��������� ������. 


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
insert PROGRESS values('����', 1025, '2021-01-01', 8);
update STUDENT set BDAY = '1994-01-01' where IDSTUDENT = 1025;--1993-06-12
--t1--
--t2--
rollback

--task 5
--����������� ��� �������� A � B �� ������� ���� ������ UNI-VER. 
--�������� A � � ����������-�� ����� ����� ���������� � ������� ��������������� READ COMMITED. 
--�������� A ������ �����-����������, ��� ������� READ COMMITED �� ��������� ��-��������������� ������, �� ��� ���� �������� ���������-������ � ��������� ������. 


update STUDENT set BDAY = '1993-06-12' where IDSTUDENT = 1025;
rollback
go
-- A ---
	set transaction isolation level READ COMMITTED 
	begin transaction 
	select * from STUDENT where IDSTUDENT = 1025
	-------------------------- t1 -----------------
	-------------------------- t2 -----------------
	select  'update STUDENT' '���������', * from STUDENT where IDSTUDENT = 1025
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
--����������� ��� �������� A � B �� ������� ���� ������ UNIVER. 
--�������� A ������������ ����� ����� ���������� � ����-��� ��������������� REPEATABLE READ. �������� B � ����� ���������� � ������� ��������������� READ COMMITED. 
--�������� A ������ ���������������, ��� ������� REAPETABLE READ �� ��������� ����������������� ������ � ���������������� ������, �� ��� ���� �������� ��������� ������. 


delete PROGRESS where IDSTUDENT = 1025;
-- A ---
set transaction isolation level  REPEATABLE READ 
begin transaction 
select IDSTUDENT from PROGRESS where NOTE = 7;
-------------------------- t1 ------------------ 
-------------------------- t2 -----------------
select 
	case
		when IDSTUDENT = 1025 then 'insert  ������'  else 'not' 
	end '���������', IDSTUDENT from PROGRESS  where NOTE = 7;
commit; 

--- B ---	
begin transaction 	  
-------------------------- t1 --------------------
	insert PROGRESS values ('����', 1025, '01.12.2014', 7);
-------------------------- t2 --------------------
commit; 

--task 7
--����������� ��� �������� A � B �� ������� ���� ������ UNIVER. 
--�������� A ������������ ����� ����� ���������� � ������� ��������������� SERIALIZABLE. 
--�������� B � ����� ���������� � ������� ��������������� READ COMMITED.
--�������� A ������ ��������������� ���������� ����������, ����������������� � ���������������� ������.


-- A ---
set transaction isolation level SERIALIZABLE
begin transaction
	delete PROGRESS where IDSTUDENT = 1001;  
	insert PROGRESS values ('����', 1001, '2013-10-02', 7);
    update PROGRESS set IDSTUDENT = 1001 where PDATE = '2013-10-02';
    select IDSTUDENT from PROGRESS where SUBJECT = '����';
	-------------------------- t1 -----------------
	select IDSTUDENT from PROGRESS where SUBJECT = '����';
	-------------------------- t2 ------------------ 
commit; 	

--- B ---	
begin transaction
	delete PROGRESS where IDSTUDENT = 1001;  
	insert PROGRESS values ('����', 1001, '2013-10-02', 7);
    update PROGRESS set SUBJECT = '��' where IDSTUDENT = 1001;
    select IDSTUDENT from PROGRESS where SUBJECT = '����';
	-------------------------- t1 -----------------
commit; 
    select IDSTUDENT from PROGRESS where SUBJECT = '����';
    -------------------------- t2 --------------------
	rollback


--task 8
--����������� ��������, ��������������� �������� ��������� ����������, �� ������� ���� ������ UNIVER. 

delete PROGRESS where IDSTUDENT = 1025;

begin tran -- ������� ����������
insert PROGRESS values ('����', 1025, '2013-10-02', 7);
begin tran -- ���������� ����������
update PROGRESS set PDATE = '2013-10-03' where IDSTUDENT = 1025;
commit;
select PDATE from PROGRESS where IDSTUDENT = 1025;
-- ���������� ����������
if @@trancount > 0 rollback; -- ������� ����������
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
		delete ���������� where [ID ����������] = 1;
		insert ���������� values('������', '�������', '��������', '1973-04-04', '���');
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
		insert ���������� values('2023-01-01', '1-1', '2027-01-01', 1, 3);
		set @point = 'p1'; save tran @point;
		delete ���������� where [ID ����������] = 1 and [ID ����������] = 3;
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
delete ���������� where [���� ����������] = '2023-01-01';
update ���������� set [���� ��������] = '1970-10-10' where [ID ����������] = 2;
go

set transaction isolation level READ UNCOMMITTED
begin transaction
--t1--
select @@SPID, 'insert PROGRESS' 'result', * from ���������� where [���� ����������] = '2023-01-01';
select @@SPID, 'update STUDENTS' 'result', [��� ����������], [���� ��������] from ���������� where [���� ��������] = '1970-10-10';
commit;
--t2--
--B--
begin transaction
select @@SPID
insert ���������� values('2023-01-01', '1-1', '2027-01-01', 1, 3)
update ���������� set [���� ��������] = '1994-01-01' where [���� ��������] = '1970-10-10';
--t1--
--t2--
rollback;

--task 5

update ���������� set [���� ��������] = '1970-10-10' where [ID ����������] = 2;
go
-- A ---
          set transaction isolation level READ COMMITTED 
	begin transaction 
	select count(*) from ���������� where [���� ��������] = '1994-01-01';
	-------------------------- t1 ------------------ 
	-------------------------- t2 -----------------
	select  'update STUDENT' '���������', count(*) from ���������� where [���� ��������] = '1994-01-01';
	commit;

	--- B ---	
	begin transaction 	  
	-------------------------- t1 --------------------
          update ���������� set [���� ��������] = '1994-01-01' where [ID ����������] = 2; 
          commit; 
	-------------------------- t2 --------------------	

--task 6
delete ���������� where [ID ����������] = 2 and ��������� = '1-1';
-- A ---
set transaction isolation level  REPEATABLE READ 
begin transaction 
select [ID ����������] from ���������� where [ID ����������] = 2;
-------------------------- t1 ------------------ 
-------------------------- t2 -----------------
select 
	case
		when [ID ����������] = 2 then 'insert  ������'  else 'not' 
	end '���������', [ID ����������] from ����������  where [ID ����������] = 2;
commit; 

--- B ---	
begin transaction 	  
-------------------------- t1 --------------------
	insert ���������� values('2023-01-01', '1-1', '2027-01-01', 2, 2)
commit; 
-------------------------- t2 --------------------

--task 7

-- A ---
set transaction isolation level SERIALIZABLE
begin transaction
	delete ���������� where [ID ����������] = 1001;  
	insert ���������� values('2023-01-01', '1-1', '2027-01-01', 2, 2)
    update ���������� set [ID ����������] = 3 where [���� ����������] = '2013-10-02';
    select [ID ����������] from ���������� where ��������� = '1-1';
	-------------------------- t1 -----------------
	select [ID ����������] from ���������� where ��������� = '1-1';
	-------------------------- t2 ------------------ 
commit; 	

--- B ---	
begin transaction
	delete ���������� where [ID ����������] = 1001;  
	insert ���������� values('2023-01-01', '1-1', '2027-01-01', 2, 2)
    update ���������� set [ID ����������] = 3 where [���� ����������] = '2013-10-02';
    select [ID ����������] from ���������� where ��������� = '1-1';
	-------------------------- t1 -----------------
commit; 
    select [ID ����������] from ���������� where ��������� = '1-1';
    -------------------------- t2 --------------------

--task 8

delete ���������� where [ID ����������] = 1025;

begin tran -- ������� ����������
insert ���������� values('2023-01-01', '1-1', '2027-01-01', 2, 2)
begin tran -- ���������� ����������
update ���������� set [���� ����������] = '2013-10-03' where [ID ����������] = 2;
commit;
-- ���������� ����������
if @@trancount > 0 rollback; -- ������� ����������
select
	(select count(*) from ���������� where [ID ����������] = 2) '����������',
	(select count(*) from ���������� where [ID ����������] = 2) 'STUDENT';