use UNIVER;
-----------1
--Разработать скалярную функцию с именем COUNT_STUDENTS, которая вычисляет количество сту-дентов на факультете, код которого задается параметром типа 
--varchar(20) с именем @faculty
--Внести изменения в текст функции с помощью оператора ALTER с тем, чтобы функция принимала второй параметр @prof типа varchar(20), обозначающий 
--специальность сту-дентов.

drop function COUNT_STUDENTS;
go
create function COUNT_STUDENTS (@faculty varchar(20) = null) returns int
as begin  
	return (select count(*) from FACULTY join GROUPs on FACULTY.FACULTY = GROUPS.FACULTY
				join STUDENT on GROUPS.IDGROUP = STUDENT.IDGROUP where FACULTY.FACULTY = @faculty);
end;
go
select FACULTY.FACULTY,dbo.COUNT_STUDENTS(FACULTY)[Count] from FACULTY;
go
alter function COUNT_STUDENTS(@faculty varchar(20) = null, @prof varchar(20) = null) returns int
as begin
	return (select count(*) from FACULTY join GROUPS on FACULTY.FACULTY = GROUPS.FACULTY 
				join STUDENT on GROUPS.IDGROUP = STUDENT.IDGROUP where (FACULTY.FACULTY = @faculty and GROUPS.PROFESSION = isnull(@prof, GROUPS.PROFESSION)))
end;
go
select FACULTY.FACULTY, GROUPS.PROFESSION, dbo.COUNT_STUDENTS(FACULTY.FACULTY, GROUPS.PROFESSION)[Count] from FACULTY, GROUPS;

-------2
--Разработать скалярную функцию с именем FSUBJECTS, принимающую параметр @p типа varchar(20), значение ко-торого задает код кафедры (столбец SUBJECT.PULPIT). 
--Функция должна возвращать строку типа varchar(300) с перечнем дисциплин в отчете. 

go
create function FSUBJECTS (@p varchar(20)) returns varchar(300)
as 
begin
	declare @part char(20);
	declare @Full varchar(300) = 'Дисциплины: ';
	declare TakeSubjects  cursor local 
	for select SUBJECT.SUBJECT from SUBJECT where SUBJECT.PULPIT = @p;
	open TakeSubjects;
	fetch TakeSubjects into @part;
	while @@FETCH_STATUS = 0
	begin
		set @Full = @Full + ', ' + rtrim(@part);
		fetch TakeSubjects into @part;
	end;
	close TakeSubjects
	return @Full;
end;
go
select PULPIT, dbo.FSUBJECTS(PULPIT)[Предметы по дисциплинам] from PULPIT;
go
drop function FSUBJECTS;

------3
--Разработать табличную функцию FFACPUL
--Функция принимает два параметра, задающих код фа-культета (столбец FACULTY.FACULTY) и код кафедры (столбец PULPIT.PULPIT). Использует SELECT-запрос c 
--левым внешним соединением между таблицами FACULTY и PULPIT. 


go 
create function FFACPUL(@codeFaculty varchar(20), @codePulpit nchar(20)) returns table
as return select FACULTY.FACULTY , PULPIT.PULPIT 
from FACULTY left join PULPIT
on FACULTY.FACULTY = PULPIT.FACULTY 
where FACULTY.FACULTY = isnull(@codeFaculty, FACULTY.FACULTY)
	and PULPIT.PULPIT = ISNULL(@codePulpit, PULPIT.PULPIT);
go
select * from dbo.FFACPUL(null, null); 
select * from dbo.FFACPUL('ИДиП', null);
select * from dbo.FFACPUL(null, 'ИСиТ'); 
select * from dbo.FFACPUL('ТОВ', 'ХПД'); 
drop function FFACPUL;

-------4
--На рисунке ниже показан сценарий, демонстрирующий ра-боту скалярной функции FCTEACHER. Функция принима-ет один параметр, задающий код кафедры. Функция 
--возвра-щает количество преподавателей на заданной параметром кафедре. Если параметр равен NULL, то возвращается об-щее количество преподавателей. 

go
create function FCTEACHER(@codePulp nchar(20)) returns int
as 
begin
	declare @result int = (select count(*) from TEACHER 
	where TEACHER.PULPIT = isnull(@codePulp, TEACHER.PULPIT));
	return @result;
end;
go
select PULPIT.PULPIT, dbo.FCTEACHER(PULPIT.PULPIT)[Количество учителей]
from PULPIT;
select dbo.FCTEACHER(null)[общее количество ];
drop function FCTEACHER;
------5---------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
use To_MyBase
-----------1
drop function COUNT_EMPLOYEES;
go
create function COUNT_EMPLOYEES (@faculty varchar(20) = null) returns int--параметр - название отдела
as begin  
	return (select count(*) from Сотрудники join Назначения on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника]
				join Должности on Должности.[ID должности] = Назначения.Должность where Должности.Отдел = @faculty);
end;
go
select [Название должности], dbo.COUNT_EMPLOYEES(Отдел)[Count] from Должности;
go
alter function COUNT_EMPLOYEES(@faculty varchar(20) = null, @prof varchar(20) = null) returns int--название отдела и пола
as begin
	return (select count(*) from Сотрудники join Назначения on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника]
				join Должности on Должности.[ID должности] = Назначения.Должность where Должности.Отдел = @faculty and Сотрудники.Пол = @prof);
end;
go
select [Название должности], Пол, dbo.COUNT_EMPLOYEES(Должности.Отдел, Сотрудники.Пол)[Count] from Должности, Сотрудники;
-------2
go
create function femployees (@p varchar(20)) returns varchar(300)--параметр - отдел
as 
begin
	declare @part char(20);
	declare @Full varchar(300) = 'Должности: ';
	declare TakeSubjects  cursor local 
	for select [ID должности] from Должности where Отдел = @p;
	open TakeSubjects;
	fetch TakeSubjects into @part;
	while @@FETCH_STATUS = 0
	begin
		set @Full = @Full + ', ' + rtrim(@part);
		fetch TakeSubjects into @part;
	end;
	close TakeSubjects
	return @Full;
end;
go
select Отдел, dbo.femployees(Отдел)[Предметы по дисциплинам] from Должности;
go
drop function femployees;
------3
go 
create function FEMPASS(@codeFaculty varchar(20), @codePulpit nchar(20)) returns table
as return select Сотрудники.[ID сотрудника], Назначения.[Дата назначения]
from Сотрудники left join Назначения
on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника] 
where Сотрудники.[ID сотрудника] = isnull(@codeFaculty, Сотрудники.[ID сотрудника])
	and Назначения.[ID назначения] = ISNULL(@codePulpit, Назначения.[ID назначения]);
go
select * from dbo.FEMPASS(null, null); 
select * from dbo.FEMPASS('1', null);
select * from dbo.FEMPASS(null, '3'); 
select * from dbo.FEMPASS('2', '3'); 
drop function FEMPASS;
-------4
go
create function FCEPLOYEES(@codePulp nchar(20)) returns int
as 
begin
	declare @result int = (select count(*) from Сотрудники
	where Сотрудники.[ID сотрудника] = isnull(@codePulp, Сотрудники.[ID сотрудника]));
	return @result;
end;
go
select [ID сотрудника], dbo.FCEPLOYEES([ID сотрудника])[Количество учителей]
from Сотрудники;
select dbo.FCEPLOYEES(null)[общее количество ];
drop function FCEPLOYEES;

---------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------

------6
--Изменить эту функцию так, чтобы количество кафедр, количество групп, количество студентов и количество специально-стей вычислялось отдельными скалярными 
--функциями.

use UNIVER;
go
drop function PULPIT_COUNT;
drop function GROUP_COUNT;
drop function PROFESSION_COUNT;
drop function FACULTY_REPORT;
go
create function PULPIT_COUNT(@faculty nchar(10)) returns int  
as begin 
	return (select count(PULPIT) from PULPIT where FACULTY = @faculty);
end;
go
create function GROUP_COUNT(@faculty nchar(10)) returns int
as begin
	return (select count(GROUPS.IDGROUP) from GROUPS where GROUPS.FACULTY = @faculty);
end;
go
create function PROFESSION_COUNT(@faculty nchar(10)) returns int
as begin
	return (select count(PROFESSION.PROFESSION) from PROFESSION where PROFESSION.FACULTY = @faculty);
end;
go
create function FACULTY_REPORT(@c int) returns @fr table
([Факультет]varchar(50), [Количество кафедр]int, [Количество групп]int,
	[Количество студентов]int, [Количество специальностей]int)
	as begin
		declare cc cursor static for
			select FACULTY.FACULTY from FACULTY where dbo.COUNT_STUDENTS(FACULTY.FACULTY, null)>@c;
		declare @f varchar(30);
		open cc;
			fetch cc into @f
			while @@FETCH_STATUS = 0
			begin
				insert @fr values(@f, dbo.PULPIT_COUNT(@f), dbo.GROUP_COUNT(@f), dbo.COUNT_STUDENTS(@f,null), dbo.PROFESSION_COUNT(@f))
				fetch cc into @f; 
			end;
		close cc;
		return;
	end;
go
select * from dbo.FACULTY_REPORT(-1);