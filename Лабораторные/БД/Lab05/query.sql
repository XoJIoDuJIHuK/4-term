use UNIVER;

select PULPIT.PULPIT_NAME
	from PULPIT, FACULTY
	where PULPIT.FACULTY = FACULTY.FACULTY
	and FACULTY.FACULTY in (select FACULTY from PROFESSION where PROFESSION_NAME like '%���������[��]%')

select PULPIT.PULPIT_NAME
	from PULPIT inner join FACULTY
	on PULPIT.FACULTY = FACULTY.FACULTY
	and FACULTY.FACULTY in (select FACULTY from PROFESSION where PROFESSION_NAME like '%���������[��]%')

select distinct PULPIT.PULPIT_NAME
	from PULPIT inner join FACULTY
	on PULPIT.FACULTY = FACULTY.FACULTY
		inner join PROFESSION
		on FACULTY.FACULTY = PROFESSION.FACULTY
		where (PROFESSION.PROFESSION_NAME like '%���������[��]%')

select AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE
	from AUDITORIUM a
	where AUDITORIUM_CAPACITY = (select top(1) AUDITORIUM_CAPACITY from AUDITORIUM aa
		where aa.AUDITORIUM_TYPE = a.AUDITORIUM_TYPE order by AUDITORIUM_CAPACITY desc)

select FACULTY_NAME from FACULTY
	where not exists (select * from PULPIT
						where PULPIT.FACULTY = FACULTY.FACULTY)

select top 1
	(select avg(NOTE) from PROGRESS where SUBJECT like '����') OAiP,
	(select avg(NOTE) from PROGRESS where SUBJECT like '��') ��,
	--�� ��� ���
	(select avg(NOTE) from PROGRESS where SUBJECT like '����') SUBD
from PROGRESS

select AUDITORIUM from AUDITORIUM
	where AUDITORIUM_CAPACITY >= all (select AUDITORIUM_CAPACITY from AUDITORIUM where AUDITORIUM_NAME like '%6-%')

select AUDITORIUM from AUDITORIUM
	where AUDITORIUM_CAPACITY >= any (select AUDITORIUM_CAPACITY from AUDITORIUM where AUDITORIUM_NAME like '%4-%')


--------------------------------------------Ninth bloody task-------------------------------------------------------

use To_MyBase;

select [ID ����������]
	from ����������, ���������
	where ���������.[ID ���������] = ����������.���������
	and [ID ����������] in (select [ID ����������] from ���������� where [�������� ����������] like '%��%')

select [ID ����������]
	from ���������� inner join ���������
	on ���������.[ID ���������] = ����������.���������
		where [ID ����������] in (select [ID ����������] from ���������� where [�������� ����������] like '%��%')


select ����������.[ID ����������]
	from ���������� inner join ���������
	on ���������.[ID ���������] = ����������.���������
		inner join ����������
		on ����������.[ID ����������] = ����������.[ID ����������]
			where ([�������� ����������] like '%��%')

select [��� ����������], [������� ����������], [�������� ����������]--������� ������� ������� � �������
	from ���������� a
	where [���� ��������] = (select top(1) [���� ��������] from ���������� aa
		where aa.��� = a.��� order by [���� ��������] asc)

select [ID ���������] from ���������
	where not exists (select * from ����������
						where ���������.[ID ���������] = ����������.[���������])

select top 1--������� ID � ������ � ������
	(select avg([ID ����������]) from ���������� where [�������� ����������] like '%��%') ���,
	(select avg([ID ����������]) from ����������  where [�������� ����������] like '%��%') ���
from ����������

select [������� ����������] from ����������--������ ���� ������
	where [���� ��������] <= all (select [���� ��������] from ���������� where [�������� ����������] like '%���%')

select [������� ����������] from ����������--������ ���� ������
	where [���� ��������] >= any (select [���� ��������] from ���������� where [�������� ����������] like '%��%')