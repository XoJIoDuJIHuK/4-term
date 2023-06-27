-- task 1

drop proc PSUBJECT
go
create proc PSUBJECT as
	begin
		declare @COUNT int = ( select COUNT( * ) from subject )
		select
			subject.subject as 'КОД',
			subject.SUBJECT_NAME as 'НАЗВАНИЕ',
			subject.PULPIT as 'КАФЕДРА'
		from subject
		return @COUNT
	end

declare @K int;
exec @K = PSUBJECT
select @K


--task 2
drop proc PSUBJECT

go
ALTER proc PSUBJECT 
	@P varchar(20) = NULL,
	@C int OUTPUT as
	begin
		declare @COUNT int = ( select COUNT( * ) from subject )
		select
			subject.subject as 'КОД',
			subject.SUBJECT_NAME as 'НАЗВАНИЕ',
			subject.PULPIT as 'КАФЕДРА'
		from subject
			where subject.subject = @P
		set @C = @@ROWCOUNT
		return @COUNT
	end
go
declare @K int = 0, @R int = 0, @P varchar(20)
exec @K = PSUBJECT 'СУБД',  @R OUTPUT
print @R


-- task 3
drop table #subject

ALTER proc PSUBJECT @P varchar(20) as
	begin
		declare @K int = ( select COUNT(*) from subject )
		select * from subject where subject = @P
	end
go
create table #subject(
	subject nvarchar(10) primary key,
	SUBJECT_NAME nvarchar(50),
	PULPIT nvarchar(50)
)
go
insert #subject exec PSUBJECT @P = 'СУБД'
insert #subject exec PSUBJECT @P = 'ИГ'
go
select * from #subject
select * from subject


-- task 4

drop proc PAUDITORIUM_INSERT
go
create proc PAUDITORIUM_INSERT
	@A char(20),
	@N char(10),
	@C int = 0,
	@T varchar(50) as
	begin
		begin try
			insert into AUDITORIUM(AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME)
				values(@A, @N, @C, @T)
			return 1
		end try
		begin catch
			print ERROR_NUMBER()
			print ERROR_MESSAGE() 
			print 'SEVERITY: ' + cast(ERROR_SEVERITY() as varchar(10))
			print 'STATE: ' + cast(ERROR_STATE() as varchar(10))
			print 'LINE: ' + cast(ERROR_LINE() as varchar(10))
			if ERROR_PROCEDURE() IS NOT NULL
				print ERROR_PROCEDURE()
			return -1;
		end catch
	end
go
declare @RESULT int;
exec @RESULT = PAUDITORIUM_INSERT '2345y6', 'sds', 15, '431-1';
print @RESULT
go
delete AUDITORIUM where AUDITORIUM.AUDITORIUM_NAME='431-1'


-- task 5

drop proc SUBJECT_REPORT
go
create proc SUBJECT_REPORT 
	@P char(10) as 
	begin
		declare @RESULT int = 0
		begin try
			declare SR cursor for
			select subject from subject where PULPIT = @P;
			--if NOT EXISTS ( select subject from subject where PULPIT = @P )
			if (select count(*) from subject where PULPIT = @P) = 0
				--throw 51000, 'MY_ERROR', 1
				RAISERROR('MY_ERROR',51000,1)
			else 
				declare @TV char(20), @T char(300) = ' '
				open SR
				fetch SR into @TV
				print 'subject: '
				fetch SR into @TV
				set @RESULT = @RESULT + 1
				WHILE @@FETCH_STATUS = 0
					begin
						set @T = RTRIM(@TV) + ', ' + @T
						set @RESULT = @RESULT + 1
						fetch SR into @TV
					end
				print @T
				CLOSE SR
				deallocate SR
				return @RESULT
		end try
		begin catch
			print 'ERROR'
			close SR
			deallocate SR
			print ERROR_MESSAGE()
			if ERROR_PROCEDURE() IS NOT NULL print ERROR_PROCEDURE()
			return @RESULT
		end catch
	end
go
select * from PULPIT
go
declare @RC int
exec @RC = SUBJECT_REPORT 'ИСиТ'
print 'count= ' + cast( @RC as varchar(3))
go
select * from subject

--task 6
drop proc PAUDITORIUM_INSERTX
go
create proc PAUDITORIUM_INSERTX
	@A char(20),
	@N char(10),
	@C int = 0,
	@T varchar(50),
	@TN varchar(50)
	as 
	begin try
		set transaction isolation level serializable
		begin tran
			insert AUDITORIUM_TYPE(AUDITORIUM_TYPE, AUDITORIUM_TYPENAME )
				values ( @T, @TN )
		commit tran
		begin tran
			exec @TN = PAUDITORIUM_INSERT @A, @T, @C, @N
		commit tran
		return @TN
	end try
	begin catch
		print 'номер ошибки  : ' + cast(error_number() as varchar(6))
		print 'сообщение     : ' + error_message()
		print 'уровень       : ' + cast(error_severity()  as varchar(6))
		print 'метка         : ' + cast(error_state()   as varchar(8))
		print 'номер строки  : ' + cast(error_line()  as varchar(8))
		if ERROR_PROCEDURE() IS NOT NULL
			print ERROR_PROCEDURE()
		if @@TRANCOUNT > 0 rollback tran
		return -1
	end catch
go

declare @TN int
exec @TN = PAUDITORIUM_INSERTX @A = '1337-1', @N ='1337', @C = 50, @T = 'TEST TYPE', @TN='TEST TYPE'
if @TN!=1
print 'ERROR CODE: ' + cast(@TN as varchar(3))
go
select * from AUDITORIUM where AUDITORIUM_TYPE = 'TEST TYPE'
select * from AUDITORIUM_TYPE where AUDITORIUM_TYPENAME = 'TEST TYPE'
go
delete AUDITORIUM where AUDITORIUM_TYPE = 'TEST TYPE'
go
delete AUDITORIUM_TYPE where AUDITORIUM_TYPENAME = 'TEST TYPE'
go



--------------------------------------------------------------------------task 7------------------------------------------------------------------
use To_MyBase 
-- task 1

drop proc PSUBJECT
go
create proc PSUBJECT as
	begin
		select * from Сотрудники
		return (select count(*) from Сотрудники)
	end
go
declare @K int;
exec @K = PSUBJECT
select @K


--task 2
go
ALTER proc PSUBJECT 
	@P varchar(20) = NULL,
	@C int OUTPUT as
	begin
		declare @COUNT int = ( select COUNT( * ) from Сотрудники )
		select
			[Фамилия сотрудника] as 'Ф',
			[Имя сотрудника] as 'И',
			[Отчество сотрудника] as 'О',
			[Дата рождения] as 'Д',
			Пол as 'П',
			[ID сотрудника] as 'I'
		from Сотрудники
			where Пол = @P
		set @C = @@ROWCOUNT
		return @COUNT
	end
go
declare @K int = 0, @R int = 0, @P char(3)
exec @K = PSUBJECT 'муж',  @R OUTPUT
print cast(@R as nvarchar(50)) + ' ' + cast(@K as nvarchar(50))


-- task 3
drop table #subject
go
alter proc PSUBJECT @P int as
	begin
		declare @K int = (select COUNT(*) from Сотрудники)
		select * from Сотрудники where [ID сотрудника] = @P
	end
go
create table #subject(
	[Фамилия сотрудника] nvarchar(50),
    [Имя сотрудника] nvarchar(50),
    [Отчество сотрудника] nvarchar(50),
    [Дата рождения] date,
    Пол char(3),
    [ID сотрудника] int primary key
)
go
insert #subject exec PSUBJECT 3
go
select * from #subject


-- task 4

drop proc PAUDITORIUM_INSERT
go
create proc PAUDITORIUM_INSERT
	@F nvarchar(50),
	@I nvarchar(50),
	@O nvarchar(50),
	@D date,
	@G char(3)
	as begin
		begin try
			insert into Сотрудники([Фамилия сотрудника], [Имя сотрудника], [Отчество сотрудника], [Дата рождения], Пол)
				values(@F, @I, @O, @D, @G)
			return 1
		end try
		begin catch
			print ERROR_NUMBER()
			print ERROR_MESSAGE() 
			print 'SEVERITY: ' + cast(ERROR_SEVERITY() as varchar(10))
			print 'STATE: ' + cast(ERROR_STATE() as varchar(10))
			print 'LINE: ' + cast(ERROR_LINE() as varchar(10))
			if ERROR_PROCEDURE() IS NOT NULL
				print ERROR_PROCEDURE()
			return -1;
		end catch
	end
go
declare @RESULT int;
exec @RESULT = PAUDITORIUM_INSERT 'Козляковский', 'Даниил', 'Александрович', '2022-01-01', 'муж';
print @RESULT
go
select * from Сотрудники
delete Сотрудники where [Фамилия сотрудника] = 'Козляковский'


-- task 5

drop proc SUBJECT_REPORT
go
create proc SUBJECT_REPORT 
	@P char(3) as 
	begin
		declare @RESULT int = 0
		begin try
			declare SR cursor for
			select [Имя сотрудника] from Сотрудники where Пол = @P;
			if (select count(*) from Сотрудники where Пол = @P) = 0
				RAISERROR('MY_ERROR',51000,1)
			else 
				declare @TV nvarchar(50), @T char(300) = ' '
				open SR
				fetch SR into @TV
				print 'subject: '
				fetch SR into @TV
				set @RESULT = @RESULT + 1
				WHILE @@FETCH_STATUS = 0
					begin
						set @T = RTRIM(@TV) + ', ' + @T
						set @RESULT = @RESULT + 1
						fetch SR into @TV
					end
				print @T
				CLOSE SR
				return @RESULT
		end try
		begin catch
			print 'ERROR'
			if ERROR_PROCEDURE() IS NOT NULL print ERROR_PROCEDURE()
			return @RESULT
		end catch
	end
go
declare @RC int
exec @RC = SUBJECT_REPORT 'жен'
print 'count= ' + cast( @RC as varchar(3))
go
select * from Сотрудники


--task 6
go
create proc PAUDITORIUM_INSERTX
	@F nvarchar(50),
	@I nvarchar(50),
	@O nvarchar(50),
	@D date,
	@G char(3),

	@DATE date
	as 
	begin try
		set transaction isolation level serializable
		declare @TN int, @ID int
		begin tran
			exec @TN = PAUDITORIUM_INSERT @F,@I,@O,@D,@G
		commit tran
		begin tran
			set @ID = (select [ID сотрудника] from Сотрудники where [Фамилия сотрудника] = @F and [Имя сотрудника] = @I and [Отчество сотрудника] = @O and
				[Дата рождения] = @D and Пол = @G)
			insert Назначения
				values (@DATE, '1-1', '2022-10-10', @ID)
		commit tran
		return @TN
	end try
	begin catch
		print 'номер ошибки  : ' + cast(error_number() as varchar(6))
		print 'сообщение     : ' + error_message()
		print 'уровень       : ' + cast(error_severity()  as varchar(6))
		print 'метка         : ' + cast(error_state()   as varchar(8))
		print 'номер строки  : ' + cast(error_line()  as varchar(8))
		if ERROR_PROCEDURE() IS NOT NULL
			print ERROR_PROCEDURE()
		if @@TRANCOUNT > 0 rollback tran
		return -1
	end catch
go

declare @TN int
exec @TN = PAUDITORIUM_INSERTX 'Козляковский', 'Даниил', 'Александрович', '2022-01-01', 'муж', '2021-1-3';
if @TN!=1
print 'ERROR CODE: ' + cast(@TN as varchar(3))
go
select * from Назначения where [Дата назначения] = '2021-1-3'
select * from Сотрудники where [Фамилия сотрудника] = 'Козляковский'
go
delete Назначения where [Дата назначения] = '2021-1-3'
go
delete Сотрудники where [Фамилия сотрудника] = 'Козляковский'
go
drop proc PAUDITORIUM_INSERTX