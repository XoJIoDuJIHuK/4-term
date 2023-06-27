use UNIVER;
-----------1
--����������� ��������� ������� � ������ COUNT_STUDENTS, ������� ��������� ���������� ���-������ �� ����������, ��� �������� �������� ���������� ���� 
--varchar(20) � ������ @faculty
--������ ��������� � ����� ������� � ������� ��������� ALTER � ���, ����� ������� ��������� ������ �������� @prof ���� varchar(20), ������������ 
--������������� ���-������.

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
--����������� ��������� ������� � ������ FSUBJECTS, ����������� �������� @p ���� varchar(20), �������� ��-������ ������ ��� ������� (������� SUBJECT.PULPIT). 
--������� ������ ���������� ������ ���� varchar(300) � �������� ��������� � ������. 

go
create function FSUBJECTS (@p varchar(20)) returns varchar(300)
as 
begin
	declare @part char(20);
	declare @Full varchar(300) = '����������: ';
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
select PULPIT, dbo.FSUBJECTS(PULPIT)[�������� �� �����������] from PULPIT;
go
drop function FSUBJECTS;

------3
--����������� ��������� ������� FFACPUL
--������� ��������� ��� ���������, �������� ��� ��-�������� (������� FACULTY.FACULTY) � ��� ������� (������� PULPIT.PULPIT). ���������� SELECT-������ c 
--����� ������� ����������� ����� ��������� FACULTY � PULPIT. 


go 
create function FFACPUL(@codeFaculty varchar(20), @codePulpit nchar(20)) returns table
as return select FACULTY.FACULTY , PULPIT.PULPIT 
from FACULTY left join PULPIT
on FACULTY.FACULTY = PULPIT.FACULTY 
where FACULTY.FACULTY = isnull(@codeFaculty, FACULTY.FACULTY)
	and PULPIT.PULPIT = ISNULL(@codePulpit, PULPIT.PULPIT);
go
select * from dbo.FFACPUL(null, null); 
select * from dbo.FFACPUL('����', null);
select * from dbo.FFACPUL(null, '����'); 
select * from dbo.FFACPUL('���', '���'); 
drop function FFACPUL;

-------4
--�� ������� ���� ������� ��������, ��������������� ��-���� ��������� ������� FCTEACHER. ������� �������-�� ���� ��������, �������� ��� �������. ������� 
--������-���� ���������� �������������� �� �������� ���������� �������. ���� �������� ����� NULL, �� ������������ ��-��� ���������� ��������������. 

go
create function FCTEACHER(@codePulp nchar(20)) returns int
as 
begin
	declare @result int = (select count(*) from TEACHER 
	where TEACHER.PULPIT = isnull(@codePulp, TEACHER.PULPIT));
	return @result;
end;
go
select PULPIT.PULPIT, dbo.FCTEACHER(PULPIT.PULPIT)[���������� ��������]
from PULPIT;
select dbo.FCTEACHER(null)[����� ���������� ];
drop function FCTEACHER;
------5---------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------
use To_MyBase
-----------1
drop function COUNT_EMPLOYEES;
go
create function COUNT_EMPLOYEES (@faculty varchar(20) = null) returns int--�������� - �������� ������
as begin  
	return (select count(*) from ���������� join ���������� on ����������.[ID ����������] = ����������.[ID ����������]
				join ��������� on ���������.[ID ���������] = ����������.��������� where ���������.����� = @faculty);
end;
go
select [�������� ���������], dbo.COUNT_EMPLOYEES(�����)[Count] from ���������;
go
alter function COUNT_EMPLOYEES(@faculty varchar(20) = null, @prof varchar(20) = null) returns int--�������� ������ � ����
as begin
	return (select count(*) from ���������� join ���������� on ����������.[ID ����������] = ����������.[ID ����������]
				join ��������� on ���������.[ID ���������] = ����������.��������� where ���������.����� = @faculty and ����������.��� = @prof);
end;
go
select [�������� ���������], ���, dbo.COUNT_EMPLOYEES(���������.�����, ����������.���)[Count] from ���������, ����������;
-------2
go
create function femployees (@p varchar(20)) returns varchar(300)--�������� - �����
as 
begin
	declare @part char(20);
	declare @Full varchar(300) = '���������: ';
	declare TakeSubjects  cursor local 
	for select [ID ���������] from ��������� where ����� = @p;
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
select �����, dbo.femployees(�����)[�������� �� �����������] from ���������;
go
drop function femployees;
------3
go 
create function FEMPASS(@codeFaculty varchar(20), @codePulpit nchar(20)) returns table
as return select ����������.[ID ����������], ����������.[���� ����������]
from ���������� left join ����������
on ����������.[ID ����������] = ����������.[ID ����������] 
where ����������.[ID ����������] = isnull(@codeFaculty, ����������.[ID ����������])
	and ����������.[ID ����������] = ISNULL(@codePulpit, ����������.[ID ����������]);
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
	declare @result int = (select count(*) from ����������
	where ����������.[ID ����������] = isnull(@codePulp, ����������.[ID ����������]));
	return @result;
end;
go
select [ID ����������], dbo.FCEPLOYEES([ID ����������])[���������� ��������]
from ����������;
select dbo.FCEPLOYEES(null)[����� ���������� ];
drop function FCEPLOYEES;

---------------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------------

------6
--�������� ��� ������� ���, ����� ���������� ������, ���������� �����, ���������� ��������� � ���������� ����������-���� ����������� ���������� ���������� 
--���������.

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
([���������]varchar(50), [���������� ������]int, [���������� �����]int,
	[���������� ���������]int, [���������� ��������������]int)
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