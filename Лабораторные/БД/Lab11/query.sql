use UNIVER;

-----1
--����������� ��������, ����������� ������ ��������� �� ������� ����. � ����� ������ ���� �������� ������� �������� ��������� �� ������� SUBJECT � ���� 
--������ ����� �������. ������������ ���������� ������� RTRIM.


DECLARE TASK1 CURSOR
			FOR SELECT SUBJECT.SUBJECT 
				FROM SUBJECT WHERE SUBJECT.PULPIT='����'

DECLARE @TMP CHAR(20), @RES CHAR(200)=''
OPEN TASK1
PRINT 'PULPIT LIST'
FETCH TASK1 INTO @TMP
WHILE @@FETCH_STATUS = 0
	BEGIN
	SET @RES = RTRIM(@TMP) + ', ' + @RES
	FETCH TASK1 INTO @TMP
	END
PRINT @RES
CLOSE TASK1

deallocate task1
-----2
--����������� ��������, ������������-��� ������� ����������� ������� �� ���������� �� ������� ���� ������ UNIVER. (local ������������ ����������)

DECLARE TASK2 CURSOR LOCAL
			FOR SELECT SUBJECT.SUBJECT 
				FROM SUBJECT WHERE SUBJECT.PULPIT = '����'
DECLARE @TMP CHAR(20), @RES CHAR(200) = ''
OPEN TASK2
PRINT 'PULPIT LIST'
FETCH TASK2 INTO @TMP

go
DECLARE @TMP CHAR(20), @RES CHAR(200) = ''
FETCH TASK2 INTO @TMP
WHILE @@FETCH_STATUS = 0
	BEGIN
	SET @RES=RTRIM(@TMP) + ', ' + @RES
	FETCH TASK2 INTO @TMP
	END
PRINT @RES
go

DECLARE TASK22 CURSOR GLOBAL
			FOR SELECT SUBJECT.SUBJECT 
				FROM SUBJECT WHERE SUBJECT.PULPIT = '����'
DECLARE @TMP CHAR(20), @RES CHAR(200) = ''
OPEN TASK22
PRINT 'PULPIT LIST'
FETCH TASK22 INTO @TMP

go
DECLARE @TMP CHAR(20), @RES CHAR(200) = ''
FETCH TASK22 INTO @TMP
WHILE @@FETCH_STATUS = 0
	BEGIN
	SET @RES=RTRIM(@TMP) + ', ' + @RES
	FETCH TASK22 INTO @TMP
	END
PRINT @RES
go
DEALLOCATE TASK22

-----3
--����������� ��������, ������������-��� ������� ����������� �������� �� ������������ �� ������� ���� ������ UNIVER.
--static
DECLARE @a2 CHAR(30), @aa2 CHAR(10), @aaa2 CHAR(10);
DECLARE T3 CURSOR LOCAL STATIC
	FOR SELECT AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY
		FROM dbo.AUDITORIUM WHERE AUDITORIUM_TYPE = '��';
OPEN T3;
PRINT 'LK AUD AMOUNT = ' + CAST(@@CURSOR_ROWS AS VARCHAR(5));
UPDATE AUDITORIUM SET AUDITORIUM_CAPACITY = 93 WHERE AUDITORIUM = '236-2';
INSERT  AUDITORIUM (AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME)
VALUES ('223-6', '��', 15, '223-6');
FETCH T3 INTO @a2, @aa2, @aaa2;
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @a2 + ' ' + @aa2 + ' ' + @aaa2;
	FETCH T3 INTO @a2, @aa2, @aaa2;
END;
CLOSE T3;
DELETE FROM AUDITORIUM WHERE AUDITORIUM='223-6' AND AUDITORIUM_TYPE='��'
UPDATE AUDITORIUM SET AUDITORIUM_CAPACITY = 60 WHERE AUDITORIUM = '236-2'

--dynamic
DECLARE @a3 CHAR(30), @aa3 CHAR(10), @aaa3 CHAR(10);
DECLARE T33 CURSOR LOCAL DYNAMIC
	FOR SELECT AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY
		FROM dbo.AUDITORIUM WHERE AUDITORIUM_TYPE = '��';
OPEN T33;
PRINT 'LK AUD AMOUNT = ' + CAST(@@CURSOR_ROWS AS VARCHAR(5));
UPDATE AUDITORIUM SET AUDITORIUM_CAPACITY = 92 WHERE AUDITORIUM = '236-2';
INSERT  AUDITORIUM (AUDITORIUM, AUDITORIUM_TYPE, AUDITORIUM_CAPACITY, AUDITORIUM_NAME)
VALUES ('223-6', '��', 15, '223-6');
FETCH T33 INTO @a3, @aa3, @aaa3;
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @a3 + ' ' + @aa3 + ' ' + @aaa3;
	FETCH T33 INTO @a3, @aa3, @aaa3;
END;
CLOSE T33;

DELETE FROM AUDITORIUM WHERE AUDITORIUM='223-6' AND AUDITORIUM_TYPE='��'
UPDATE AUDITORIUM SET AUDITORIUM_CAPACITY = 60 WHERE AUDITORIUM = '236-2'
-----4
--����������� ��������, ������������-��� �������� ��������� � ����������-���� ������ ������� � ��������� SCROLL �� ������� ���� ������ UNIVER.
--������������ ��� ��������� �����-��� ����� � ��������� FETCH.

SELECT ROW_NUMBER() OVER
		(ORDER BY SUBJECT.SUBJECT_NAME),
		SUBJECT.SUBJECT_NAME FROM SUBJECT;

DECLARE @ROW_NUMB INT, @SUBJECT_NAME CHAR(50);
DECLARE T4 CURSOR LOCAL DYNAMIC SCROLL
	FOR SELECT ROW_NUMBER() OVER
		(ORDER BY SUBJECT.SUBJECT_NAME),
		SUBJECT.SUBJECT_NAME FROM SUBJECT;
OPEN T4;
	FETCH NEXT FROM T4 INTO @ROW_NUMB, @SUBJECT_NAME;
	PRINT 'NEXT FETCH  ' + CAST( @ROW_NUMB AS VARCHAR(3)) + ' ' + RTRIM(@SUBJECT_NAME);
	
	FETCH FIRST FROM T4 INTO @ROW_NUMB, @SUBJECT_NAME;
	PRINT 'FIRST FETCH  ' + CAST( @ROW_NUMB AS VARCHAR(3)) + ' ' + RTRIM(@SUBJECT_NAME);
	
	FETCH RELATIVE 3 FROM T4 INTO @ROW_NUMB, @SUBJECT_NAME;
	PRINT 'RELATIVE 3 FETCH  ' + CAST( @ROW_NUMB AS VARCHAR(3)) + ' ' + RTRIM(@SUBJECT_NAME);
	
		
	FETCH ABSOLUTE 3 FROM T4 INTO @ROW_NUMB, @SUBJECT_NAME;
	PRINT 'ABSOLUTE 3 FETCH  ' + CAST( @ROW_NUMB AS VARCHAR(3)) + ' ' + RTRIM(@SUBJECT_NAME);

	FETCH PRIOR FROM T4 INTO @ROW_NUMB, @SUBJECT_NAME;
	PRINT 'PRIOR FETCH  ' + CAST( @ROW_NUMB AS VARCHAR(3)) + ' ' + RTRIM(@SUBJECT_NAME);


	FETCH LAST FROM T4 INTO @ROW_NUMB, @SUBJECT_NAME;
	PRINT 'LAST FETCH  ' + CAST( @ROW_NUMB AS VARCHAR(3)) + ' ' + RTRIM(@SUBJECT_NAME);


	FETCH ABSOLUTE -3 FROM T4 INTO @ROW_NUMB, @SUBJECT_NAME;
	PRINT 'ABSOLUTE -3 FETCH  ' + CAST( @ROW_NUMB AS VARCHAR(3)) + ' ' + RTRIM(@SUBJECT_NAME);
	
	
	FETCH RELATIVE -3 FROM T4 INTO @ROW_NUMB, @SUBJECT_NAME;
	PRINT 'RELATIVE -3 FETCH  ' + CAST( @ROW_NUMB AS VARCHAR(3)) + ' ' + RTRIM(@SUBJECT_NAME);

CLOSE T4;
GO

-----5
--������� ������, ��������������� ���������� ����������� CURRENT OF � ������ WHERE � �������������� ���������� UPDATE � DELETE.

DECLARE @SUBJECT CHAR(15), @SUBJECT_NAME CHAR(50), @PULPIT CHAR(25);
DECLARE T5 CURSOR LOCAL DYNAMIC
	FOR SELECT SUBJECT.SUBJECT, SUBJECT.SUBJECT_NAME, SUBJECT.SUBJECT_NAME
			FROM SUBJECT FOR UPDATE;

OPEN T5;
	FETCH T5 INTO @SUBJECT, @SUBJECT_NAME, @PULPIT;
	DELETE SUBJECT WHERE CURRENT OF T5;
	FETCH T5 INTO @SUBJECT, @SUBJECT_NAME, @PULPIT;
	UPDATE SUBJECT SET SUBJECT_NAME = ' placeholder ' WHERE CURRENT OF T5;
CLOSE T5;

select *from SUBJECT where SUBJECT_NAME = ' placeholder '

-----6
--����������� SELECT-������, � ����-��� �������� �� ������� PROGRESS ��������� ������, ���������� ��-�������� � ���������, ���������� ������ ���� 4 
--(������������ ������-����� ������ PROGRESS, STUDENT, GROUPS). 
--����������� SELECT-������, � ��-����� �������� � ������� PROGRESS ��� �������� � ���������� ������� IDSTUDENT �������������� ������ (������������� 
--�� �������).

--6.1
SELECT * FROM PROGRESS;
SELECT * FROM STUDENT;
SELECT * FROM GROUPS;

DROP TABLE #T_PROGRESS;

CREATE TABLE #T_PROGRESS(
	SUBJECT CHAR(10),
	IDSTUDENT INT,
	PDATE DATE,
	NOTE INT
);

INSERT INTO #T_PROGRESS
	SELECT * FROM PROGRESS


SELECT * FROM #T_PROGRESS


DECLARE @NAME CHAR(70), @IDGROUP INT, @NOTE INT;
DECLARE T6 CURSOR LOCAL DYNAMIC
	FOR SELECT STUDENT.NAME, GROUPS.IDGROUP, #T_PROGRESS.NOTE
				FROM GROUPS
					JOIN STUDENT
						ON STUDENT.IDGROUP = GROUPS.IDGROUP
					JOIN #T_PROGRESS
						ON #T_PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
				WHERE #T_PROGRESS.NOTE <= 4
	FOR UPDATE;

OPEN T6;
	FETCH T6 INTO @NAME, @IDGROUP, @NOTE;
	WHILE @@FETCH_STATUS = 0
		BEGIN 
			DELETE #T_PROGRESS WHERE CURRENT OF T6;
			FETCH T6 INTO @NAME, @IDGROUP, @NOTE;	
		END
CLOSE T6;
GO
select *from #T_PROGRESS

--6.2

DECLARE @ID_STUD INT = 1001;

SELECT * FROM PROGRESS WHERE PROGRESS.IDSTUDENT = @ID_STUD;

DECLARE @ID INT, @NOTE INT;
DECLARE T6 CURSOR LOCAL DYNAMIC
	FOR SELECT PROGRESS.IDSTUDENT, PROGRESS.NOTE FROM PROGRESS
		WHERE PROGRESS.IDSTUDENT = @ID_STUD
	FOR UPDATE;

OPEN T6;
	FETCH T6 INTO @ID, @NOTE;
	UPDATE PROGRESS SET NOTE = NOTE + 1 WHERE CURRENT OF T6
CLOSE T6;


SELECT * FROM PROGRESS WHERE PROGRESS.IDSTUDENT = @ID_STUD;

-----7
use To_MyBase;
--1
DEALLOCATE TASK1;
DECLARE TASK1 CURSOR
			FOR SELECT ����������.[��� ����������]
				FROM ���������� WHERE ����������.���='���'

DECLARE @TMP CHAR(20), @RES CHAR(200)=''
OPEN TASK1
FETCH TASK1 INTO @TMP
WHILE @@FETCH_STATUS=0
	BEGIN
	SET @RES=RTRIM(@TMP)+', '+@RES
	FETCH TASK1 INTO @TMP
	END
PRINT @RES
CLOSE TASK1

--2
DEALLOCATE TASK2;
DEALLOCATE TASK22;


DECLARE TASK2 CURSOR LOCAL
			FOR SELECT ����������.[��� ����������]
				FROM ���������� WHERE ����������.���='���'
DECLARE @TMP CHAR(20), @RES CHAR(200)=''
OPEN TASK2
FETCH TASK2 INTO @TMP

go
DECLARE @TMP CHAR(20), @RES CHAR(200)=''
FETCH TASK2 INTO @TMP
WHILE @@FETCH_STATUS=0
	BEGIN
	SET @RES=RTRIM(@TMP)+', '+@RES
	FETCH TASK2 INTO @TMP
	END
PRINT @RES
go

DECLARE TASK22 CURSOR GLOBAL
			FOR SELECT ����������.[��� ����������]
				FROM ���������� WHERE ����������.���='���'
OPEN TASK22

go
DECLARE @TMP CHAR(20), @RES CHAR(200)=''
FETCH TASK22 INTO @TMP
WHILE @@FETCH_STATUS=0
	BEGIN
	SET @RES=RTRIM(@TMP)+', '+@RES
	FETCH TASK22 INTO @TMP
	END
PRINT @RES
go
DEALLOCATE TASK22

--3
DECLARE @a2 CHAR(30), @aa2 CHAR(10), @aaa2 CHAR(10);
DECLARE T3 CURSOR LOCAL STATIC
	FOR SELECT [��� ����������], [������� ����������], [�������� ����������]
		FROM ���������� WHERE ��� = '���';
OPEN T3;
PRINT '���������� ������ = ' + CAST(@@CURSOR_ROWS AS VARCHAR(5));
UPDATE ���������� SET [���� ��������] = '1900-01-01' WHERE [��� ����������] = '�����';
INSERT  ����������([��� ����������], [������� ����������], [�������� ����������], [���� ��������], ���) VALUES ('�����', '�������', '������������', '1910-10-10', '���');
FETCH T3 INTO @a2, @aa2, @aaa2;
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @a2 + ' ' + @aa2 + ' ' + @aaa2;
	FETCH T3 INTO @a2, @aa2, @aaa2;
END;
CLOSE T3;
DELETE FROM ���������� WHERE [��� ����������] ='�����' AND [������� ����������] ='�������'
UPDATE ���������� SET [���� ��������] = '1974-05-05' WHERE [��� ����������] = '�����'

--dynamic
DECLARE @a3 CHAR(30), @aa3 CHAR(10), @aaa3 CHAR(10);
DECLARE T33 CURSOR LOCAL DYNAMIC
	FOR SELECT [��� ����������], [������� ����������], [�������� ����������]
		FROM ���������� WHERE ��� = '���';
OPEN T33;
PRINT '���������� ������ = ' + CAST(@@CURSOR_ROWS AS VARCHAR(5));
UPDATE ���������� SET [���� ��������] = '1900-01-01' WHERE [��� ����������] = '�����';
INSERT  ����������([��� ����������], [������� ����������], [�������� ����������], [���� ��������], ���) VALUES ('�����', '�������', '������������', '1910-10-10', '���');
FETCH T33 INTO @a3, @aa3, @aaa3;
WHILE @@FETCH_STATUS = 0
BEGIN
	PRINT @a3 + ' ' + @aa3 + ' ' + @aaa3;
	FETCH T33 INTO @a3, @aa3, @aaa3;
END;
CLOSE T33;
DELETE FROM ���������� WHERE [��� ����������] ='�����' AND [������� ����������] = '�������'
UPDATE ���������� SET [���� ��������] = '1974-05-05' WHERE [��� ����������] = '�����'

--4
SELECT ROW_NUMBER() OVER
		(ORDER BY ����������.[��� ����������]),
		[��� ����������] FROM ����������;

DECLARE @ROW_NUMB INT, @SUBJECT_NAME CHAR(50);
DECLARE T4 CURSOR LOCAL DYNAMIC SCROLL
	FOR SELECT ROW_NUMBER() OVER
		(ORDER BY ����������.[��� ����������]),
		[��� ����������] FROM ����������;
OPEN T4;
	FETCH NEXT FROM T4 INTO @ROW_NUMB, @SUBJECT_NAME;
	PRINT 'NEXT FETCH  ' + CAST( @ROW_NUMB AS VARCHAR(3)) + ' ' + RTRIM(@SUBJECT_NAME);
	
	FETCH FIRST FROM T4 INTO @ROW_NUMB, @SUBJECT_NAME;
	PRINT 'FIRST FETCH  ' + CAST( @ROW_NUMB AS VARCHAR(3)) + ' ' + RTRIM(@SUBJECT_NAME);
	
	FETCH RELATIVE 3 FROM T4 INTO @ROW_NUMB, @SUBJECT_NAME;
	PRINT 'RELATIVE 3 FETCH  ' + CAST( @ROW_NUMB AS VARCHAR(3)) + ' ' + RTRIM(@SUBJECT_NAME);
	
		
	FETCH ABSOLUTE 3 FROM T4 INTO @ROW_NUMB, @SUBJECT_NAME;
	PRINT 'ABSOLUTE 3 FETCH  ' + CAST( @ROW_NUMB AS VARCHAR(3)) + ' ' + RTRIM(@SUBJECT_NAME);

	FETCH PRIOR FROM T4 INTO @ROW_NUMB, @SUBJECT_NAME;
	PRINT 'PRIOR FETCH  ' + CAST( @ROW_NUMB AS VARCHAR(3)) + ' ' + RTRIM(@SUBJECT_NAME);


	FETCH LAST FROM T4 INTO @ROW_NUMB, @SUBJECT_NAME;
	PRINT 'LAST FETCH  ' + CAST( @ROW_NUMB AS VARCHAR(3)) + ' ' + RTRIM(@SUBJECT_NAME);


	FETCH ABSOLUTE -3 FROM T4 INTO @ROW_NUMB, @SUBJECT_NAME;
	PRINT 'ABSOLUTE -3 FETCH  ' + CAST( @ROW_NUMB AS VARCHAR(3)) + ' ' + RTRIM(@SUBJECT_NAME);
	
	
	FETCH RELATIVE -3 FROM T4 INTO @ROW_NUMB, @SUBJECT_NAME;
	PRINT 'RELATIVE -3 FETCH  ' + CAST( @ROW_NUMB AS VARCHAR(3)) + ' ' + RTRIM(@SUBJECT_NAME);

CLOSE T4;

--5
select *from ����������

DECLARE @SUBJECT NVARCHAR(50), @SUBJECT_NAME NVARCHAR(50), @PULPIT NVARCHAR(50);
DECLARE T5 CURSOR LOCAL DYNAMIC
	FOR SELECT [��� ����������], [������� ����������], [�������� ����������]
			FROM ���������� FOR UPDATE;

OPEN T5;
	FETCH T5 INTO @SUBJECT, @SUBJECT_NAME, @PULPIT;
	UPDATE ���������� SET [��� ����������] = ' placeholder ' WHERE CURRENT OF T5;
CLOSE T5;

select *from ���������� where [��� ����������] = ' placeholder '
UPDATE ���������� SET [��� ����������] = '�������' WHERE [��� ����������] = ' placeholder ';

--6

DROP TABLE #T_PROGRESS;

CREATE TABLE #T_PROGRESS(
	[������� ����������] NVARCHAR(50),
	[��� ����������] NVARCHAR(50),
	[�������� ����������] NVARCHAR(50)
);

INSERT INTO #T_PROGRESS
	SELECT [������� ����������], [��� ����������], [�������� ����������] FROM ����������


SELECT * FROM #T_PROGRESS


DECLARE @NAME NVARCHAR(50), @IDGROUP NVARCHAR(50), @NOTE NVARCHAR(50);
DECLARE T6 CURSOR LOCAL DYNAMIC
	FOR SELECT [������� ����������], [��� ����������], [�������� ����������]
				FROM #T_PROGRESS
				WHERE LEN(#T_PROGRESS.[��� ����������]) <= 4
	FOR UPDATE;

OPEN T6;
	FETCH T6 INTO @NAME, @IDGROUP, @NOTE;
	WHILE @@FETCH_STATUS = 0
		BEGIN 
			DELETE #T_PROGRESS WHERE CURRENT OF T6;
			FETCH T6 INTO @NAME, @IDGROUP, @NOTE;	
		END
CLOSE T6;
GO
select *from #T_PROGRESS

--6.2

DECLARE @ID_STUD INT = 2;

SELECT * FROM ���������� WHERE [ID ����������]= @ID_STUD;

DECLARE @ID NVARCHAR(50), @NOTE NVARCHAR(50);
DECLARE T6 CURSOR LOCAL DYNAMIC
	FOR SELECT [��� ����������], [������� ����������] FROM ����������
		WHERE [ID ����������] = @ID_STUD
	FOR UPDATE;

OPEN T6;
	FETCH T6 INTO @ID, @NOTE;
	UPDATE ���������� SET [��� ����������] = [��� ����������] + [��� ����������] WHERE CURRENT OF T6
CLOSE T6;


SELECT * FROM ���������� WHERE [ID ����������] = @ID_STUD;

-----------------8---------------------
use UNIVER;
DECLARE @faculty varchar(150), @pulpit varchar(200), @discipline varchar(10), @discipline_list varchar(200) = '', @qteacher varchar(3), 
	@temp_faculty varchar(50), @temp_pulpit varchar(50);
SELECT FACULTY.FACULTY_NAME,PULPIT.PULPIT_NAME,SUBJECT.SUBJECT, count(TEACHER.TEACHER_NAME)
		from FACULTY inner join PULPIT
		on PULPIT.FACULTY = FACULTY.FACULTY left outer join SUBJECT
		on SUBJECT.PULPIT = PULPIT.PULPIT left outer join TEACHER
		on TEACHER.PULPIT = PULPIT.PULPIT
		group by FACULTY.FACULTY_NAME,PULPIT.PULPIT_NAME,SUBJECT.SUBJECT order by FACULTY_NAME, PULPIT_NAME asc;
DECLARE GET_REPORT_CURSOR CURSOR LOCAL STATIC for
	SELECT FACULTY.FACULTY_NAME,PULPIT.PULPIT_NAME,SUBJECT.SUBJECT, count(TEACHER.TEACHER_NAME)
		from FACULTY inner join PULPIT
		on PULPIT.FACULTY = FACULTY.FACULTY left outer join SUBJECT
		on SUBJECT.PULPIT = PULPIT.PULPIT left outer join TEACHER
		on TEACHER.PULPIT = PULPIT.PULPIT
		group by FACULTY.FACULTY_NAME,PULPIT.PULPIT_NAME,SUBJECT.SUBJECT order by FACULTY_NAME, PULPIT_NAME asc;

OPEN GET_REPORT_CURSOR
FETCH GET_REPORT_CURSOR into @faculty,@pulpit,@discipline,@qteacher;
while(@@FETCH_STATUS = 0)
	begin
		print ' - ���������: ' + rtrim(@faculty);
		set @temp_faculty = @faculty;
		while (@faculty = @temp_faculty)
			begin
				print '		�������: ' + rtrim(@pulpit);
				print '			���������� ��������������: '+ rtrim(@qteacher) ;
				set @discipline_list = '			����������: ';
				set @temp_pulpit = @pulpit;
						if(@discipline != '')
							begin	
								if(@discipline_list = '			����������: ')
									begin
										set @discipline_list += @discipline;
									end
								else
									begin
										set @discipline_list = rtrim(@discipline_list) + ', ' + @discipline;
									end;
							end;
				FETCH GET_REPORT_CURSOR into @faculty,@pulpit,@discipline,@qteacher;
				while (@pulpit = @temp_pulpit)
					begin
						if(@discipline != '')
							begin	
								if(@discipline_list = '			����������: ')
									begin
										set @discipline_list += @discipline;
									end
								else
									begin
										set @discipline_list = rtrim(@discipline_list) + ', ' + @discipline;
									end;
							end;
						FETCH GET_REPORT_CURSOR into @faculty,@pulpit,@discipline,@qteacher;
					end;
				if(@discipline_list != '			����������: ')--if list of disciplines is not null
					begin
						print rtrim(@discipline_list) ;
						set @discipline_list = '			����������: ';
					end
				else--if list of disciplines is null
					begin
						print rtrim(@discipline_list) + ' ���' ;
					end;
					if(@@FETCH_STATUS != 0)
						begin
							break;
						end;
			end;
	end;
CLOSE GET_REPORT_CURSOR;