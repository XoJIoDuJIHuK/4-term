use UNIVER;

--task 1
--Разработать представление с именем Препода-ватель. Представление должно быть построено на основе SELECT-запроса к таблице TEACH-ER и содержать следующие 
--столбцы: код, имя преподавателя, пол, код кафедры. 

create view TEACHER1
	as select TEACHER, TEACHER_NAME, GENDER, PULPIT
		from TEACHER

select * from TEACHER1

--task 2 
--Разработать и создать представление с именем Количество кафедр. Представление должно быть построено на основе SELECT-запроса к таблицам FACULTY и PULPIT.
--Представление должно содержать следую-щие столбцы: факультет, количество кафедр (вычисляется на основе строк таблицы PULPIT). 

create view PULPITS_NUMBER 
as select PULPIT.FACULTY, count(PULPIT_NAME) NUMBER
	from PULPIT join FACULTY on FACULTY.FACULTY = PULPIT.FACULTY
	group by PULPIT.FACULTY
select * from PULPITS_NUMBER

--task 3
--Разработать и создать представление с именем Аудитории. Представление должно быть по-строено на основе таблицы AUDITORIUM и содержать столбцы: код, наименование 
--ауди-тории. Представление должно отображать только лекционные аудитории (в столбце AUDITO-RIUM_ TYPE строка, начинающаяся с симво-ла ЛК) и допускать выполнение 
--оператора IN-SERT, UPDATE и DELETE.

create view CLASSROOMS (CODE, NAME) as
select AUDITORIUM, AUDITORIUM_NAME
	from AUDITORIUM
	where AUDITORIUM_TYPE like 'ЛК%'

drop view CLASSROOMS

insert CLASSROOMS values('148-4', '148-4')
update CLASSROOMS set CODE = '236-2' where NAME = '236-1'
delete from CLASSROOMS where CODE = '148-4'

select * from CLASSROOMS

--task 4
--Разработать и создать представление с именем Лекционные_аудитории. 
--Представление должно быть построено на основе SELECT-запроса к таблице AUDITO-RIUM и содержать следующие столбцы: код, наименование аудитории. 
--Представление должно отображать только лекционные аудитории (в столбце AUDITO-RIUM_TYPE строка, начинающаяся с симво-лов ЛК). 

create view CLASSROOMS_2 (CODE, NAME) as
select AUDITORIUM, AUDITORIUM_NAME
	from AUDITORIUM
	where AUDITORIUM_TYPE like 'ЛК%' with check option

insert CLASSROOMS_2 values('148-4', '148-4')

select * from CLASSROOMS_2

--task 5
--Разработать представление с именем Дисци-плины. Представление должно быть построено на основе SELECT-запроса к таблице SUB-JECT, отображать все дисциплины в 
--алфавит-ном порядке и содержать следующие столбцы: код, наименование дисциплины и код ка-федры. Использовать TOP и ORDER BY.

create view DISCIPLINES as
select top 100 percent SUBJECT, SUBJECT_NAME, PULPIT
	from SUBJECT
	order by SUBJECT_NAME

drop view DISCIPLINES

select * from DISCIPLINES

--task 6
--Изменить представление Количество_кафедр, созданное в задании 2 так, чтобы оно было привязано к базовым таблицам.
--Продемонстрировать свойство привязанно-сти представления к базовым таблицам. Использовать опцию SCHEMABINDING. 


alter view dbo.PULPITS_NUMBER with schemabinding
as select PULPIT.FACULTY, count(PULPIT.PULPIT_NAME) NUMBER
	from dbo.PULPIT join dbo.FACULTY on FACULTY.FACULTY = PULPIT.FACULTY
	group by PULPIT.FACULTY
select * from PULPITS_NUMBER

--alter table PULPIT drop column FACULTY вот эта строчка выдаст: объект "PULPITS_NUMBER" зависит от столбец "FACULTY".

--task 7

use To_MyBase;

--1)

create view EMPLOYEES
	as select [Фамилия сотрудника], [Имя сотрудника], [Отчество сотрудника], Пол, [Дата рождения], [ID сотрудника]
		from Сотрудники

select * from EMPLOYEES

--2)

create view ASSIGNMENTS 
as select Должности.Отдел, count(Должности.[Название должности]) Число
	from Должности join Назначения on Должности.[ID должности] = Назначения.Должность
	group by Должности.Отдел
select * from ASSIGNMENTS

drop view ASSIGNMENTS

--3)

create view MEN (NAME, LAST_NAME, SURNAME, GENDER, DATE, ID) as
select [Имя сотрудника], [Фамилия сотрудника], [Отчество сотрудника], Пол, [Дата рождения], [ID сотрудника]
	from Сотрудники
	where Пол = 'муж'

drop view MEN

update MEN set DATE = '1970-10-10' where NAME = 'Иван'

select * from MEN

--4)

create view MEN_2 (NAME, LAST_NAME, SURNAME, GENDER, DATE, ID) as
select [Имя сотрудника], [Фамилия сотрудника], [Отчество сотрудника], Пол, [Дата рождения], [ID сотрудника]
	from Сотрудники
	where Пол = 'муж' with check option

drop view MEN_2

update MEN_2 set GENDER = 'жен' where NAME = 'Иван'--ошибка

select * from MEN_2

--5)

create view ASSIGNMENTS 
as select top 100 percent Должности.Отдел, count(Должности.[Название должности]) Число
	from Должности join Назначения on Должности.[ID должности] = Назначения.Должность
	group by Должности.Отдел
	order by Должности.Отдел
select * from ASSIGNMENTS

drop view ASSIGNMENTS

--6) 

alter view dbo.ASSIGNMENTS with schemabinding
as select Должности.Отдел, count(Должности.[Название должности]) Число
	from dbo.Должности join dbo.Назначения on Должности.[ID должности] = Назначения.Должность
	group by Должности.Отдел
select * from ASSIGNMENTS

drop view ASSIGNMENTS

alter table Должности drop column Отдел