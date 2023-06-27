use UNIVER
----1
--В столбец STMT триггер должен поместить событие, на которое он среагировал, а в стол-бец TRNAME  собственное имя. 
--Разработать AFTER-триггер с именем TR_TEACHER_INS для таблицы TEACHER, реагирующий на событие INSERT. Триггер должен записывать строки вводимых данных в 
--таблицу TR_AUDIT. В столбец СС помеща-ются значения столбцов вводимой строки. 

go
drop table TR_AUDIT
go
create table TR_AUDIT(
	ID int identity,
	STMT varchar(20)
		check( STMT IN ( 'INS', 'DEL', 'UPD' )),
	TRNAME varchar(50),
	CC varchar(300) 
);
go

create trigger TEST
    on TEACHER instead of INSERT as
    --print (select count(*) from inserted)
    print 'insert'
    return
go
select * from TEACHER
go
drop trigger TR_TEACHER_INS
go
create trigger TR_TEACHER_INS
	on TEACHER after insert
	as declare @A1 nvarchar(10), @A2 nvarchar(100), @A3 char(1), @A4 char(20),
		 @IN varchar(300);
	print 'insert';
	set @A1 = ( select TEACHER from inserted );
	set @A2 = ( select TEACHER_NAME from inserted );
	set @A3 = ( select GENDER from inserted );
	set @A4 = ( select PULPIT from inserted );
	set @IN = @A1 + ' ' + @A2 + ' ' + @A3 + ' ' + @A4;

	insert into TR_AUDIT( STMT, TRNAME, CC )
		values ( 'INS', 'TR_TEACHER_INS', @IN );

	return;
go	
insert into TEACHER values( 'F7D', 'FFF', N'м', N'ИСиТ');
go
select * from TR_AUDIT

--  TASK 2
--Создать AFTER-триггер с именем TR_TEACHER_DEL для таблицы TEA-CHER, реагирующий на событие DELETE. Триггер должен записывать строку данных в таблицу 
--TR_AUDIT для каждой удаляемой строки. В столбец СС помещаются значения столбца TEACHER удаляемой строки. 

drop trigger TR_TEACHER_DEL;
go
create trigger TR_TEACHER_DEL
	on TEACHER after delete
	as declare @A1 nvarchar(10), @A2 nvarchar(100), @A3 char(1), @A4 char(20),
		 @IN varchar(300);
	print 'delete';
	set @A1 = ( select TEACHER from deleted );
	set @A2 = ( select TEACHER_NAME from deleted );
	set @A3 = ( select GENDER from deleted );
	set @A4 = ( select PULPIT from deleted );
	set @IN = @A1 + ' ' + @A2 + ' ' + @A3 + ' ' + @A4;

	insert into TR_AUDIT( STMT, TRNAME, CC )
		values ( 'DEL', 'TR_TEACHER_DEL', @IN );

	return;
go
delete TEACHER where TEACHER.TEACHER = 'F7D';
go
select * from TR_AUDIT

-- TASK 3
--Создать AFTER-триггер с именем TR_TEACHER_UPD для таблицы TEA-CHER, реагирующий на событие UPDATE. Триггер должен записывать строку данных в таблицу 
--TR_AUDIT для каждой изменяемой строки. В столбец СС помещаются значения столбцов изменяемой строки до и после изме-нения.

drop trigger TR_TEACHER_UPD
go
create trigger TR_TEACHER_UPD
	on TEACHER after update
	as declare @A1 nvarchar(10), @A2 nvarchar(100), @A3 char(1), @A4 char(20),
		 @IN varchar(300);
	print 'update';
	set @A1 = ( select TEACHER from deleted );
	set @A2 = ( select TEACHER_NAME from deleted );
	set @A3 = ( select GENDER from deleted );
	set @A4 = ( select PULPIT from deleted );
	set @IN = @A1 + ' ' + @A2 + ' ' + @A3 + ' ' + @A4;

	insert into TR_AUDIT( STMT, TRNAME, CC )
		values ( 'UPD', 'TR_TEACHER_UPD', @IN );

	return;
go
select * from TEACHER
go
update TEACHER set TEACHER_NAME = 'QQQQ' where TEACHER.TEACHER = 'FD';
go
select * from TR_AUDIT

--  TASK 4
--Создать AFTER-триггер с именем TR_TEACHER для таблицы TEACHER, реа-гирующий на события INSERT, DELETE, UPDATE. 

drop trigger TR_TEACHER
go
create trigger TR_TEACHER
	on TEACHER after insert, delete, update
	as declare @A1 nvarchar(10), @A2 nvarchar(100), @A3 char(1), @A4 char(20),
		 @IN varchar(300);
	declare @C_INS int = ( select COUNT(*) from inserted );
	declare @C_DEL int = ( select COUNT(*) from deleted );
	if @C_INS > 0 AND @C_DEL = 0
		begin
			print 'insert';
			set @A1 = ( select TEACHER from inserted );
			set @A2 = ( select TEACHER_NAME from inserted );
			set @A3 = ( select GENDER from inserted );
			set @A4 = ( select PULPIT from inserted );
			set @IN = @A1 + ' ' + @A2 + ' ' + @A3 + ' ' + @A4;
			insert into TR_AUDIT( STMT, TRNAME, CC )
				values ( 'INS', 'TR_TEACHER', @IN );
		end
	else if @C_INS = 0 AND @C_DEL > 0
		begin
			print 'delete';
			set @A1 = ( select TEACHER from deleted );
			set @A2 = ( select TEACHER_NAME from deleted );
			set @A3 = ( select GENDER from deleted );
			set @A4 = ( select PULPIT from deleted );
			set @IN = @A1 + ' ' + @A2 + ' ' + @A3 + ' ' + @A4;
			insert into TR_AUDIT( STMT, TRNAME, CC )
				values ( 'DEL', 'TR_TEACHER', @IN );
		end
	else if @C_INS > 0 AND @C_DEL > 0
		begin
			print 'update';
			set @A1 = ( select TEACHER from deleted );
			set @A2 = ( select TEACHER_NAME from deleted );
			set @A3 = ( select GENDER from deleted );
			set @A4 = ( select PULPIT from deleted );
			set @IN = @A1 + ' ' + @A2 + ' ' + @A3 + ' ' + @A4;
			insert into TR_AUDIT( STMT, TRNAME, CC )
				values ( 'UPD', 'TR_TEACHER', @IN );
		end
return;
go
update TEACHER set TEACHER_NAME = 'QQQQ' where TEACHER.TEACHER = 'FD';
delete TEACHER where TEACHER.TEACHER = 'FD';
insert into TEACHER values( 'FD', 'FFF', 'м', 'ИСиТ' );
go
select * from TR_AUDIT

select * from TEACHER

delete TR_AUDIT

--  TASK 5
--Разработать сценарий, который демонстрирует на примере базы данных UNIVER, что провер-ка ограничения целостности выполняется до срабатывания AFTER-триггера.

alter table TEACHER alter column TEACHER_NAME varchar(100) not null
go
delete TR_AUDIT
go
begin tran
	update TEACHER set TEACHER.TEACHER_NAME = NULL where TEACHER.TEACHER = 'FD';
rollback
go
select * from TR_AUDIT
select * from TEACHER

go

--  TASK 6
--Создать для таблицы TEACHER три AFTER-триггера с именами: TR_TEACHER_ DEL1, TR_TEACHER_DEL2 и TR_TEA-CHER_ DEL3. Триггеры должны реагировать на собы-тие 
--DELETE и формировать соответствующие строки в таблицу TR_AUDIT.  
--Получить список триггеров таблицы TEACHER. 
--Использовать системные представления SYS.TRIGGERS и SYS.TRIGGERS_ EVENTS, а также системную процедуру SP_SETTRIGGERORDERS. 

drop trigger TR_TEACHER_DEL_1;

drop trigger TR_TEACHER_DEL_2

drop trigger TR_TEACHER_DEL_3

go
create trigger TR_TEACHER_DEL_1
	on TEACHER after delete
	as print 'TR_TEACHER_DEL_1';
	return;
go
create trigger TR_TEACHER_DEL_2
	on TEACHER after delete
	as print 'TR_TEACHER_DEL_2';
	return;
go
create trigger TR_TEACHER_DEL_3
	on TEACHER after delete
	as print 'TR_TEACHER_DEL_3';
	return;
go

select T.NAME, E.TYPE_DESC
	from sys.triggers T
		JOIN sys.trigger_events E
			on T.object_id = E.object_id
	where OBJECT_NAME(T.parent_id) = 'TEACHER' AND
		E.type_desc = 'delete';

exec sp_settriggerorder @TRIGGERNAME = 'TR_TEACHER_DEL_3',
	@ORDER = 'FIRST', @STMTTYPE = 'delete';
	 
exec sp_settriggerorder @TRIGGERNAME = 'TR_TEACHER_DEL_2',
	@ORDER = 'LAST', @STMTTYPE = 'delete';

insert TEACHER(TEACHER, TEACHER_NAME, GENDER, PULPIT)
	values ('TST', 'TST', 'ж', 'ИСиТ');
delete TEACHER where TEACHER = 'TST';
	
--  TASK 7
--Разработать сценарий, демонстрирующий на примере базы данных UNIVER утверждение: AFTER-триггер является частью транзакции, в рамках которого выполняется 
--оператор, акти-визировавший триггер.

drop trigger TASK_7
go
create trigger TASK_7
	on AUDITORIUM after insert, delete, update
	as declare @SUMM int = 
		(select sum(AUDITORIUM_CAPACITY) from AUDITORIUM where AUDITORIUM_NAME = '236-1');
	if (@SUMM > 100 )
		begin
			RAISERROR('ERROR',10,1);
			ROLLBACK;
		end
return;
select * from AUDITORIUM
go
update AUDITORIUM set AUDITORIUM_CAPACITY = 110
	where AUDITORIUM_NAME = '236-1';

--  TASK 8
--Для таблицы FACULTY создать INSTEAD OF-триггер, запрещающий удаление строк в таблице. 

drop trigger TASK_8;
go
create trigger TASK_8
	on FACULTY INSTEAD OF delete
		as RAISERROR('ERROR delete',10,1);
	return
go
delete FACULTY where FACULTY.FACULTY = 'TEST';

select * from FACULTY;

--	TASK 9 
--Создать DDL-триггер, реагирующий на все DDL-события в БД UNIVER. 
--Триггер должен запрещать создавать новые таблицы и удалять существующие. Свое вы-полнение триггер должен сопровождать сооб-щением, которое содержит: 
--тип события, имя и тип объекта, а также пояснительный текст, в случае запрещения выполнения оператора. 

drop trigger TASK_9;
go
create trigger TASK_9
	on database 
		FOR DDL_DATABASE_LEVEL_EVENTS as
	declare @TYPE varchar(50) = 
		EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
	declare @O_NAME varchar(50) = 
		EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
	declare @O_TYPE varchar(50) = 
		EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)');
	print 'TYPE EVENT   ' + @TYPE;
	print 'NAME OBJECT  ' + @O_NAME;
	print 'TYPE_OBJECT  ' + @O_TYPE;
	RAISERROR('OPERATION WITH DB CANCEL',16,1);
	ROLLBACK;
go
drop table TR_AUDIT
create table TEST(I int)

drop table TEST

--task extra
use UNIVER

drop trigger EXTRA
go
create trigger EXTRA
	on FACULTY instead of insert as
	insert TR_AUDIT values('INS', 'INSTEAD OF TRIGGER', '')
return
go
insert FACULTY values('EXTRA', 'EXTRA FACULTY')
go
select * from TR_AUDIT
		


---------------------------------------------------------------------------------------------------------------------------------------------------------
use To_MyBase
----1
go
drop table TO_AUDIT
go
create table TO_AUDIT(
	ID int identity,
	STMT varchar(20)
		check( STMT IN ( 'INS', 'DEL', 'UPD' )),
	TRNAME varchar(50),
	CC varchar(300) 
);
go
select * from Сотрудники
go
drop trigger TR_TEACHER_INS
go
create trigger TR_TEACHER_INS
	on Сотрудники after insert
	as declare @A1 nvarchar(10), @A2 nvarchar(100), @A3 char(1), @A4 char(20),
		 @IN varchar(300);
	print 'insert';
	set @A1 = ( select [Имя сотрудника] from inserted );
	set @A2 = ( select [Фамилия сотрудника] from inserted );
	set @A3 = ( select [Отчество сотрудника] from inserted );
	set @A4 = ( select [Дата рождения] from inserted );
	set @IN = @A1 + ' ' + @A2 + ' ' + @A3 + ' ' + @A4;

	insert into TO_AUDIT( STMT, TRNAME, CC )
		values ( 'INS', 'TR_TEACHER_INS', @IN );
	rollback
	return;
go	
insert into Сотрудники values( 'F7D', 'FFF', 'м', '2022-01-01', 'муж');
go
select * from TO_AUDIT


--  TASK 2
drop trigger TR_TEACHER_DEL;
go
create trigger TR_TEACHER_DEL
	on [Сотрудники] after delete
	as declare @A1 nvarchar(10), @A2 nvarchar(100), @A3 char(1), @A4 char(20),
		 @IN varchar(300);
	print 'delete';
	set @A1 = ( select [Имя сотрудника] from deleted );
	set @A2 = ( select [Имя сотрудника] from deleted );
	set @A3 = ( select Пол from deleted );
	set @A4 = ( select PULPIT from deleted );
	set @IN = @A1 + ' ' + @A2 + ' ' + @A3 + ' ' + @A4;

	insert into TO_AUDIT( STMT, TRNAME, CC )
		values ( 'DEL', 'TR_TEACHER_DEL', @IN );

	return;
go
delete [Сотрудники] where [Сотрудники].[Имя сотрудника] = 'F7D';
go
select * from TO_AUDIT


-- TASK 3
drop trigger TR_TEACHER_UPD
go
create trigger TR_TEACHER_UPD
	on [Сотрудники] after update
	as declare @A1 nvarchar(10), @A2 nvarchar(100), @A3 char(1), @A4 char(20),
		 @IN varchar(300);
	print 'update';
	set @A1 = ( select [Имя сотрудника] from deleted );
	set @A2 = ( select [Имя сотрудника] from deleted );
	set @A3 = ( select Пол from deleted );
	set @A4 = ( select PULPIT from deleted );
	set @IN = @A1 + ' ' + @A2 + ' ' + @A3 + ' ' + @A4;

	insert into TO_AUDIT( STMT, TRNAME, CC )
		values ( 'UPD', 'TR_TEACHER_UPD', @IN );

	return;
go
select * from [Сотрудники]
go
update [Сотрудники] set [Имя сотрудника] = 'QQQQ' where [Сотрудники].[Имя сотрудника] = 'FD';
go
select * from TO_AUDIT


--  TASK 4
drop trigger TR_TEACHER
go
create trigger TR_TEACHER
	on [Сотрудники] after insert, delete, update
	as declare @A1 nvarchar(10), @A2 nvarchar(100), @A3 char(1), @A4 char(20),
		 @IN varchar(300);
	declare @C_INS int = ( select COUNT(*) from inserted );
	declare @C_DEL int = ( select COUNT(*) from deleted );
	if @C_INS > 0 AND @C_DEL = 0
		begin
			print 'insert';
			set @A1 = ( select [Имя сотрудника] from inserted );
			set @A2 = ( select [Имя сотрудника] from inserted );
			set @A3 = ( select Пол from inserted );
			set @A4 = ( select [Имя сотрудника] from inserted );
			set @IN = @A1 + ' ' + @A2 + ' ' + @A3 + ' ' + @A4;
			insert into TO_AUDIT( STMT, TRNAME, CC )
				values ( 'INS', 'TR_TEACHER', @IN );
		end
	else if @C_INS = 0 AND @C_DEL > 0
		begin
			print 'delete';
			set @A1 = ( select [Имя сотрудника] from deleted );
			set @A2 = ( select [Имя сотрудника] from deleted );
			set @A3 = ( select Пол from deleted );
			set @A4 = ( select [Имя сотрудника] from deleted );
			set @IN = @A1 + ' ' + @A2 + ' ' + @A3 + ' ' + @A4;
			insert into TO_AUDIT( STMT, TRNAME, CC )
				values ( 'DEL', 'TR_TEACHER', @IN );
		end
	else if @C_INS > 0 AND @C_DEL > 0
		begin
			print 'update';
			set @A1 = ( select [Имя сотрудника] from deleted );
			set @A2 = ( select [Имя сотрудника] from deleted );
			set @A3 = ( select Пол from deleted );
			set @A4 = ( select [Имя сотрудника] from deleted );
			set @IN = @A1 + ' ' + @A2 + ' ' + @A3 + ' ' + @A4;
			insert into TO_AUDIT( STMT, TRNAME, CC )
				values ( 'UPD', 'TR_TEACHER', @IN );
		end
return;
go
update [Сотрудники] set [Имя сотрудника] = 'QQQQ' where [Сотрудники].[Имя сотрудника] = 'FD';
delete [Сотрудники] where [Сотрудники].[Имя сотрудника] = 'FD';
insert into [Сотрудники] values( 'FD', 'FFF', 'м', 'ИСиТ' );
go
select * from TO_AUDIT

select * from [Сотрудники]

delete TO_AUDIT


--  TASK 5
alter table [Сотрудники] alter column [Имя сотрудника] varchar(100) not null
go
delete TO_AUDIT
go
begin tran
	update [Сотрудники] set [Сотрудники].[Имя сотрудника] = NULL where [Сотрудники].[Имя сотрудника] = 'FFF';
rollback
go
select * from TO_AUDIT
select * from [Сотрудники]

go
--  TASK 6
drop trigger TR_TEACHER_DEL_1;

drop trigger TR_TEACHER_DEL_2

drop trigger TR_TEACHER_DEL_3

--disable trigger TR_TEACHER_DEL_1 on [Сотрудники]
--enable trigger TR_TEACHER_DEL_1 on [Сотрудники]
go
create trigger TR_TEACHER_DEL_1
	on [Сотрудники] after delete
	as print 'TR_TEACHER_DEL_1';
	return;
go
create trigger TR_TEACHER_DEL_2
	on [Сотрудники] after delete
	as print 'TR_TEACHER_DEL_2';
	return;
go
create trigger TR_TEACHER_DEL_3
	on [Сотрудники] after delete
	as print 'TR_TEACHER_DEL_3';
	return;
go

select T.NAME, E.TYPE_DESC
	from sys.triggers T
		JOIN sys.trigger_events E
			on T.object_id = E.object_id
	where OBJECT_NAME(T.parent_id) = '[Сотрудники]' AND
		E.type_desc = 'delete';

exec sp_settriggerorder @TRIGGERNAME = 'TR_TEACHER_DEL_3',
	@ORDER = 'FIRST', @STMTTYPE = 'delete';
	 
exec sp_settriggerorder @TRIGGERNAME = 'TR_TEACHER_DEL_2',
	@ORDER = 'LAST', @STMTTYPE = 'delete';

insert [Сотрудники]([Имя сотрудника], [Имя сотрудника], Пол, [Имя сотрудника])
	values ('TST', 'TST', 'ж', 'ИСиТ');
delete [Сотрудники] where [Имя сотрудника] = 'TST';
	
--  TASK 7
drop trigger TASK_7
go
create trigger TASK_7
	on Сотрудники after insert, delete, update
	as declare @SUMM int = 
		(select sum([Имя сотрудника]) from Сотрудники where [Имя сотрудника] = '236-1');
	if (@SUMM > 100 )
		begin
			RAISERROR('ERROR',10,1);
			ROLLBACK;
		end
return;
select * from AUDITORIUM

update AUDITORIUM set AUDITORIUM_CAPACITY = 110
	where AUDITORIUM_NAME = '236-1';

--  TASK 8
drop trigger TASK_8;
go
create trigger TASK_8
	on FACULTY INSTEAD OF delete
		as RAISERROR('ERROR delete',10,1);
	return

delete FACULTY where FACULTY.FACULTY = 'TEST';

select * from FACULTY;


--	TASK 9 

drop trigger TASK_9;
go
create trigger TASK_9
	on database 
		FOR DDL_DATABASE_LEVEL_EVENTS as
	declare @TYPE varchar(50) = 
		EVENTDATA().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(50)');
	declare @O_NAME varchar(50) = 
		EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(50)');
	declare @O_TYPE varchar(50) = 
		EVENTDATA().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(50)');
	print 'TYPE EVENT   ' + @TYPE;
	print 'NAME OBJECT  ' + @O_NAME;
	print 'TYPE_OBJECT  ' + @O_TYPE;
	RAISERROR('OPERATION WITH DB CANCEL',16,1);
	ROLLBACK;
go
drop table TO_AUDIT
create table TEST(I int)

drop table TEST

--create table