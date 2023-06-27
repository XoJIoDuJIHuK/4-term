use UNIVER;

--1) �� ������ ������ FACULTY, GROUPS, STUDENT � PROGRESS ����������� SE-LECT-������, � ������� ��������� �����-��������, ���������� � ������� ������ ��� ����� ��������� �� ���������� ���. 
--������������ ����������� �� ����� FACULTY, PROFESSION, SUBJECT.
--�������� � ������ ����������� ROLLUP � ���������������� ���������

select PROGRESS.SUBJECT, PROFESSION.PROFESSION_NAME, round(avg(cast(PROGRESS.NOTE as float(4))), 2) NOTES
	from PROGRESS join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	join GROUPS on GROUPS.IDGROUP = STUDENT.IDGROUP
	join PROFESSION on GROUPS.PROFESSION = PROFESSION.PROFESSION
	 where GROUPS.FACULTY = '����'
	 group by PROGRESS.SUBJECT, PROFESSION.PROFESSION_NAME with rollup
	 --��������� ������ - ��.�����. ���� ������

--2) ��������� SELECT-������ �� �. 1 � ��-������������ CUBE-�����������. 
--���������������� ���������.

select PROGRESS.SUBJECT, PROFESSION.PROFESSION_NAME, round(avg(cast(PROGRESS.NOTE as float(4))), 2) NOTES
	from PROGRESS join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	join GROUPS on GROUPS.IDGROUP = STUDENT.IDGROUP
	join PROFESSION on GROUPS.PROFESSION = PROFESSION.PROFESSION
	 where GROUPS.FACULTY = '����'
	 group by PROGRESS.SUBJECT, PROFESSION.PROFESSION_NAME with cube

--3) �� ������ ������ GROUPS, STUDENT � PROGRESS ����������� SELECT-������, � ������� ������������ ���������� ����� ���������.
--� ������� ������ ���������� ��������-�����, ����������, ������� ������ ������-��� �� ���������� ���.
--�������� ����������� ������, � ������� ������������ ���������� ����� ��������� �� ���������� ����.
--���������� ���������� ���� �������� � �������������� ���������� UNION � UN-ION ALL. ��������� ����������. 
select FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(3))), 2) as AVG_NOTE
		from GROUPS
		join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
		join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
		join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
			where FACULTY.FACULTY = '����'
			group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT
union select FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(3))), 2) as AVG_NOTE
	from GROUPS
	join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
	join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
	join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		where FACULTY.FACULTY = '����'
		group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT

select FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(3))), 2) as AVG_NOTE
		from GROUPS
		join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
		join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
		join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
			where FACULTY.FACULTY = '����'
			group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT
union all select FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(3))), 2) as AVG_NOTE--all �� ������� ������������� ������
	from GROUPS
	join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
	join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
	join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		where FACULTY.FACULTY = '����'
		group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT

--4) �������� ����������� ���� �������� �����, ��������� � ���������� ���������� �������� ������ 3. ��������� ���������.
--������������ �������� INTERSECT.

select FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(3))), 2) as AVG_NOTE
		from GROUPS
		join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
		join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
		join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
			where FACULTY.FACULTY = '����'
			group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT
intersect select FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(3))), 2) as AVG_NOTE
	from GROUPS
	join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
	join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
	join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		where FACULTY.FACULTY = '����'
		group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT

--5) �������� ������� ����� ���������� �����, ��������� � ���������� �������� ������ 3. ��������� ���������. 
--������������ �������� EXCEPT.

select FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(3))), 2) as AVG_NOTE
		from GROUPS
		join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
		join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
		join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
			where FACULTY.FACULTY = '����'
			group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT
except select FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(3))), 2) as AVG_NOTE
	from GROUPS
	join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
	join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
	join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		where FACULTY.FACULTY = '����'
		group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT

--6)
use To_MyBase;
--1 
select ���������.�����, ����������.[������� ����������], round(avg(cast(����������.[ID ����������] as float(4))), 2) [NOTE]
	from ���������� join ���������� on ����������.[ID ����������] = ����������.[ID ����������]
	join ��������� on ���������.[ID ���������] = ����������.���������
		where ����������.[ID ����������] % 2 = 0
		group by ���������.�����, ����������.[������� ����������] with rollup
		order by NOTE desc

--2
select ���������.�����, ����������.[������� ����������], round(avg(cast(����������.[ID ����������] as float(4))), 2) [NOTE]
	from ���������� join ���������� on ����������.[ID ����������] = ����������.[ID ����������]
	join ��������� on ���������.[ID ���������] = ����������.���������
		where ����������.[ID ����������] % 2 = 0
		group by ���������.�����, ����������.[������� ����������] with cube
		order by NOTE desc

--3
select ���������.�����, ����������.[������� ����������], round(avg(cast(����������.[ID ����������] as float(4))), 2) [NOTE]
	from ���������� join ���������� on ����������.[ID ����������] = ����������.[ID ����������]
	join ��������� on ���������.[ID ���������] = ����������.���������
		where ����������.[ID ����������] % 2 = 0
		group by ���������.�����, ����������.[������� ����������]
union select ���������.�����, ����������.[������� ����������], round(avg(cast(����������.[ID ����������] as float(4))), 2) [NOTE]
	from ���������� join ���������� on ����������.[ID ����������] = ����������.[ID ����������]
	join ��������� on ���������.[ID ���������] = ����������.���������
		where ����������.[ID ����������] % 2 = 1
		group by ���������.�����, ����������.[������� ����������]
		order by NOTE desc

select ���������.�����, ����������.[������� ����������], round(avg(cast(����������.[ID ����������] as float(4))), 2) [NOTE]
	from ���������� join ���������� on ����������.[ID ����������] = ����������.[ID ����������]
	join ��������� on ���������.[ID ���������] = ����������.���������
		where ����������.[ID ����������] % 2 = 0
		group by ���������.�����, ����������.[������� ����������]
union all select ���������.�����, ����������.[������� ����������], round(avg(cast(����������.[ID ����������] as float(4))), 2) [NOTE]
	from ���������� join ���������� on ����������.[ID ����������] = ����������.[ID ����������]
	join ��������� on ���������.[ID ���������] = ����������.���������
		where ����������.[ID ����������] % 2 = 1
		group by ���������.�����, ����������.[������� ����������]
		order by NOTE desc

--4
select ���������.�����, ����������.[������� ����������], round(avg(cast(����������.[ID ����������] as float(4))), 2) [NOTE]
	from ���������� join ���������� on ����������.[ID ����������] = ����������.[ID ����������]
	join ��������� on ���������.[ID ���������] = ����������.���������
		where ����������.[ID ����������] % 2 = 0
		group by ���������.�����, ����������.[������� ����������]
intersect select ���������.�����, ����������.[������� ����������], round(avg(cast(����������.[ID ����������] as float(4))), 2) [NOTE]
	from ���������� join ���������� on ����������.[ID ����������] = ����������.[ID ����������]
	join ��������� on ���������.[ID ���������] = ����������.���������
		where ����������.[ID ����������] % 2 = 1
		group by ���������.�����, ����������.[������� ����������]
		order by NOTE desc

--5
select ���������.�����, ����������.[������� ����������], round(avg(cast(����������.[ID ����������] as float(4))), 2) [NOTE]
	from ���������� join ���������� on ����������.[ID ����������] = ����������.[ID ����������]
	join ��������� on ���������.[ID ���������] = ����������.���������
		where ����������.[ID ����������] % 2 = 0
		group by ���������.�����, ����������.[������� ����������]
except select ���������.�����, ����������.[������� ����������], round(avg(cast(����������.[ID ����������] as float(4))), 2) [NOTE]
	from ���������� join ���������� on ����������.[ID ����������] = ����������.[ID ����������]
	join ��������� on ���������.[ID ���������] = ����������.���������
		where ����������.[ID ����������] % 2 = 1
		group by ���������.�����, ����������.[������� ����������]
		order by NOTE desc