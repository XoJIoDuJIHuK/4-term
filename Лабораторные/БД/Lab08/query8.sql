use UNIVER;

--task 1
--����������� ������������� � ������ �������-������. ������������� ������ ���� ��������� �� ������ SELECT-������� � ������� TEACH-ER � ��������� ��������� 
--�������: ���, ��� �������������, ���, ��� �������. 

create view TEACHER1
	as select TEACHER, TEACHER_NAME, GENDER, PULPIT
		from TEACHER

select * from TEACHER1

--task 2 
--����������� � ������� ������������� � ������ ���������� ������. ������������� ������ ���� ��������� �� ������ SELECT-������� � �������� FACULTY � PULPIT.
--������������� ������ ��������� ������-��� �������: ���������, ���������� ������ (����������� �� ������ ����� ������� PULPIT). 

create view PULPITS_NUMBER 
as select PULPIT.FACULTY, count(PULPIT_NAME) NUMBER
	from PULPIT join FACULTY on FACULTY.FACULTY = PULPIT.FACULTY
	group by PULPIT.FACULTY
select * from PULPITS_NUMBER

--task 3
--����������� � ������� ������������� � ������ ���������. ������������� ������ ���� ��-������� �� ������ ������� AUDITORIUM � ��������� �������: ���, ������������ 
--����-�����. ������������� ������ ���������� ������ ���������� ��������� (� ������� AUDITO-RIUM_ TYPE ������, ������������ � �����-�� ��) � ��������� ���������� 
--��������� IN-SERT, UPDATE � DELETE.

create view CLASSROOMS (CODE, NAME) as
select AUDITORIUM, AUDITORIUM_NAME
	from AUDITORIUM
	where AUDITORIUM_TYPE like '��%'

drop view CLASSROOMS

insert CLASSROOMS values('148-4', '148-4')
update CLASSROOMS set CODE = '236-2' where NAME = '236-1'
delete from CLASSROOMS where CODE = '148-4'

select * from CLASSROOMS

--task 4
--����������� � ������� ������������� � ������ ����������_���������. 
--������������� ������ ���� ��������� �� ������ SELECT-������� � ������� AUDITO-RIUM � ��������� ��������� �������: ���, ������������ ���������. 
--������������� ������ ���������� ������ ���������� ��������� (� ������� AUDITO-RIUM_TYPE ������, ������������ � �����-��� ��). 

create view CLASSROOMS_2 (CODE, NAME) as
select AUDITORIUM, AUDITORIUM_NAME
	from AUDITORIUM
	where AUDITORIUM_TYPE like '��%' with check option

insert CLASSROOMS_2 values('148-4', '148-4')

select * from CLASSROOMS_2

--task 5
--����������� ������������� � ������ �����-�����. ������������� ������ ���� ��������� �� ������ SELECT-������� � ������� SUB-JECT, ���������� ��� ���������� � 
--�������-��� ������� � ��������� ��������� �������: ���, ������������ ���������� � ��� ��-�����. ������������ TOP � ORDER BY.

create view DISCIPLINES as
select top 100 percent SUBJECT, SUBJECT_NAME, PULPIT
	from SUBJECT
	order by SUBJECT_NAME

drop view DISCIPLINES

select * from DISCIPLINES

--task 6
--�������� ������������� ����������_������, ��������� � ������� 2 ���, ����� ��� ���� ��������� � ������� ��������.
--������������������ �������� ����������-��� ������������� � ������� ��������. ������������ ����� SCHEMABINDING. 


alter view dbo.PULPITS_NUMBER with schemabinding
as select PULPIT.FACULTY, count(PULPIT.PULPIT_NAME) NUMBER
	from dbo.PULPIT join dbo.FACULTY on FACULTY.FACULTY = PULPIT.FACULTY
	group by PULPIT.FACULTY
select * from PULPITS_NUMBER

--alter table PULPIT drop column FACULTY ��� ��� ������� ������: ������ "PULPITS_NUMBER" ������� �� ������� "FACULTY".

--task 7

use To_MyBase;

--1)

create view EMPLOYEES
	as select [������� ����������], [��� ����������], [�������� ����������], ���, [���� ��������], [ID ����������]
		from ����������

select * from EMPLOYEES

--2)

create view ASSIGNMENTS 
as select ���������.�����, count(���������.[�������� ���������]) �����
	from ��������� join ���������� on ���������.[ID ���������] = ����������.���������
	group by ���������.�����
select * from ASSIGNMENTS

drop view ASSIGNMENTS

--3)

create view MEN (NAME, LAST_NAME, SURNAME, GENDER, DATE, ID) as
select [��� ����������], [������� ����������], [�������� ����������], ���, [���� ��������], [ID ����������]
	from ����������
	where ��� = '���'

drop view MEN

update MEN set DATE = '1970-10-10' where NAME = '����'

select * from MEN

--4)

create view MEN_2 (NAME, LAST_NAME, SURNAME, GENDER, DATE, ID) as
select [��� ����������], [������� ����������], [�������� ����������], ���, [���� ��������], [ID ����������]
	from ����������
	where ��� = '���' with check option

drop view MEN_2

update MEN_2 set GENDER = '���' where NAME = '����'--������

select * from MEN_2

--5)

create view ASSIGNMENTS 
as select top 100 percent ���������.�����, count(���������.[�������� ���������]) �����
	from ��������� join ���������� on ���������.[ID ���������] = ����������.���������
	group by ���������.�����
	order by ���������.�����
select * from ASSIGNMENTS

drop view ASSIGNMENTS

--6) 

alter view dbo.ASSIGNMENTS with schemabinding
as select ���������.�����, count(���������.[�������� ���������]) �����
	from dbo.��������� join dbo.���������� on ���������.[ID ���������] = ����������.���������
	group by ���������.�����
select * from ASSIGNMENTS

drop view ASSIGNMENTS

alter table ��������� drop column �����