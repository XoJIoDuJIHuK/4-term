use UNIVER;

--task1, 2
--�� ������ ������ AUDITORIUM � AUDI-TORIUM_TYPE ����������� ������, ����������� ��� ������� ���� ��������� ������������, �����������, ������� ����������� ���������, 
--��������� ����������� ���� ��������� � ����� ���������� ��������� ������� ����. 
--�������������� ����� ������ ��������� ������� � ������������� ���� ��������� � ������� � ������������ ����������. 
--������������ ���������� ���������� ������, ������ GROUP BY � ���������� �������

select	AUDITORIUM.AUDITORIUM_TYPE,
		max(AUDITORIUM.AUDITORIUM_CAPACITY) Maximum,
		min(AUDITORIUM.AUDITORIUM_CAPACITY) Minimum,
		avg(AUDITORIUM.AUDITORIUM_CAPACITY) Average,
		count (*) Amount,
		sum(AUDITORIUM.AUDITORIUM_CAPACITY) Sum
		from AUDITORIUM join AUDITORIUM_TYPE
		on AUDITORIUM.AUDITORIUM_TYPE = AUDITORIUM_TYPE.AUDITORIUM_TYPE
			group by AUDITORIUM.AUDITORIUM_TYPE

--task3
--�� ������ ������� PROGRESS, ������� ����� ��������� �������� ��������������� ������ � �� ���������� � �������� ���������
select *
	from (select case when PROGRESS.NOTE between 1 and 4 then 'bad'
		when PROGRESS.NOTE between 4 and 7 then 'norm'
		else 'not bad'
		end [Notes], count (*) Amount
	from PROGRESS group by case
		when PROGRESS.NOTE between 1 and 4 then 'bad'
		when PROGRESS.NOTE between 4 and 7 then 'norm'
		else 'not bad'
		end) as T
			order by case [Notes]
				when 'bad' then 1
				when 'norm' then 2
				when 'not bad' then 3
				else 0
				end

--task4
--�� ������ ������ FACULTY, GROUPS, STUDENT � PROGRESS, ������� �������� ������� ��������������� ������ ��� ������� ����� ������ ������������� � ����������
select FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.YEAR_FIRST, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [NOTE]
	from FACULTY inner join PROFESSION on PROFESSION.FACULTY = FACULTY.FACULTY
	inner join GROUPS on GROUPS.PROFESSION = PROFESSION.PROFESSION
	inner join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
	inner join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		group by FACULTY_NAME, GROUPS.PROFESSION, YEAR_FIRST
		order by NOTE desc

--task5
--���������� SELECT-������, ������������� � ������� 4, ��� ����� � ������� �������� �������� ������ �������������� ������ ������ �� ����������� � ������ �� � ����. ������������ WHERE
select FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.YEAR_FIRST, SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [NOTE]
	from FACULTY inner join PROFESSION on PROFESSION.FACULTY = FACULTY.FACULTY
	inner join GROUPS on GROUPS.PROFESSION = PROFESSION.PROFESSION
	inner join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
	inner join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where PROGRESS.SUBJECT = '��' or PROGRESS.SUBJECT = '����'
		group by FACULTY_NAME, GROUPS.PROFESSION, YEAR_FIRST, SUBJECT
		order by NOTE desc

--task6
--�� ������ ������ FACULTY, GROUPS, STUDENT � PROGRESS ����������� ������, � ������� ��������� �������������, ���������� � ������� ������ ��� ����� ��������� �� ���������� ���
select PROGRESS.SUBJECT, PROFESSION.PROFESSION_NAME, round(avg(cast(PROGRESS.NOTE as float(4))), 2) NOTES
	from PROGRESS join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	join GROUPS on GROUPS.IDGROUP = STUDENT.IDGROUP
	join PROFESSION on GROUPS.PROFESSION = PROFESSION.PROFESSION
	 where GROUPS.FACULTY = '����'
	 group by  PROGRESS.SUBJECT, PROFESSION.PROFESSION_NAME

--task7
--�� ������ ������� PROGRESS ���������� ��� ������ ���������� ���������� ���������, ���������� ������ 8 � 9. 
--������������ �����������, ������ HAVING, ����������. 

--��� where ��� �� �������� ���, ��� ������, ������ ��� ���� ���� ������� ���������� ������� max() � ������������ � ��� ����� �� ������, ��� ������� � ���� ������� ��� �������
--��������: ��� ��������� � ������� 8 � ��������� � ������� 9, ���� ������� where � �������� �� ������ ���������� ��������� � ����� ������� �� ������� ��������
select SUBJECT, count(IDSTUDENT) as AMOUNT
	from PROGRESS
	where NOTE in (8, 9)
	group by SUBJECT
	having max(NOTE) >= 8 AND max(NOTE) <= 9
	order by AMOUNT

--select SUBJECT, count(IDSTUDENT) as AMOUNT
--	from PROGRESS
--	group by SUBJECT, NOTE
--	having NOTE = 8 or NOTE = 9;

--task8
use To_MyBase;
--1, 2 ������� ���/����/��/��� �������� ID �����������
select	����������.���,
		max(����������.[ID ����������]) Maximum,
		min(����������.[ID ����������]) Minimum,
		avg(����������.[ID ����������]) Average,
		count (*) Amount,
		sum(����������.[ID ����������]) Sum
		from ���������� join ����������
		on ����������.[ID ����������] = ����������.[ID ����������]
			group by ����������.���

--3 ������� ���������� ����, ������� � ������ �����������
select *
	from (select case when ����������.[���� ��������] between '1970-01-02' and '1972-01-01' then '�������'
		when [���� ��������] between '1900-01-01' and '1970-01-02' then '������'
		else '����'
		end [Notes], count (*) Amount
	from ���������� group by case
		when ����������.[���� ��������] between '1970-01-02' and '1972-01-01' then '�������'
		when [���� ��������] between '1900-01-01' and '1970-01-02' then '������'
		else '����'
		end) as T
			order by case [Notes]
				when '����' then 1
				when '�������' then 2
				when '������' then 3
				else 0
				end

--4 ������� ������� ID ��� ������ ��������� � ������� ����
select ���������.[�������� ���������], ����������.���, round(avg(cast(����������.[ID ����������] as float(4))), 2) [NOTE]
	from ���������� join ���������� on ����������.[ID ����������] = ����������.[ID ����������]
	join ��������� on ���������.[ID ���������] = ����������.���������
		group by ���������.[�������� ���������], ����������.���
		order by NOTE desc

--5 ������� ������� ID ��� ������ ��������� � ������� ����
select ���������.[�������� ���������], ����������.���, round(avg(cast(����������.[ID ����������] as float(4))), 2) [NOTE]
	from ���������� join ���������� on ����������.[ID ����������] = ����������.[ID ����������]
	join ��������� on ���������.[ID ���������] = ����������.���������
		where ����������.[ID ����������] = 1 or ����������.[ID ����������] = 2
		group by ���������.[�������� ���������], ����������.���
		order by NOTE desc

--6 ������� ��� ������� ������ � ������ ������� ������� ID. (����� ������ ����������� �� �������, ����� ����� ������� �� ������ � �������� ��������)
select ���������.�����, ����������.[������� ����������], round(avg(cast(����������.[ID ����������] as float(4))), 2) [NOTE]
	from ���������� join ���������� on ����������.[ID ����������] = ����������.[ID ����������]
	join ��������� on ���������.[ID ���������] = ����������.���������
		where ����������.[ID ����������] % 2 = 0
		group by ���������.�����, ����������.[������� ����������]
		order by NOTE desc

--7 ������� ��� ������ ���� �������� ��������� �����������, ������������� � �������� ��� �������� ����
select [���� ��������], count(distinct [ID ����������]) as AMOUNT
	from ����������
	where ��� in ('���', '���')
	group by [���� ��������]
	having max(���) >= '���' AND max(���) <= '���';