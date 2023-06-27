use UNIVER;

--task1, 2
--На основе таблиц AUDITORIUM и AUDI-TORIUM_TYPE разработать запрос, вычисляющий для каждого типа аудиторий максимальную, минимальную, среднюю вместимость аудиторий, 
--суммарную вместимость всех аудиторий и общее количество аудиторий данного типа. 
--Результирующий набор должен содержать столбец с наименованием типа аудиторий и столбцы с вычисленными величинами. 
--Использовать внутреннее соединение таблиц, секцию GROUP BY и агрегатные функции

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
--на основе таблицы PROGRESS, который будет содержать значения экзаменационных оценок и их количество в заданном интервале
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
--на основе таблиц FACULTY, GROUPS, STUDENT и PROGRESS, который содержит среднюю экзаменационную оценку для каждого курса каждой специальности и факультета
select FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.YEAR_FIRST, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [NOTE]
	from FACULTY inner join PROFESSION on PROFESSION.FACULTY = FACULTY.FACULTY
	inner join GROUPS on GROUPS.PROFESSION = PROFESSION.PROFESSION
	inner join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
	inner join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		group by FACULTY_NAME, GROUPS.PROFESSION, YEAR_FIRST
		order by NOTE desc

--task5
--Переписать SELECT-запрос, разработанный в задании 4, так чтобы в расчете среднего значения оценок использовались оценки только по дисциплинам с кодами БД и ОАиП. Использовать WHERE
select FACULTY.FACULTY_NAME, GROUPS.PROFESSION, GROUPS.YEAR_FIRST, SUBJECT, round(avg(cast(PROGRESS.NOTE as float(4))), 2) [NOTE]
	from FACULTY inner join PROFESSION on PROFESSION.FACULTY = FACULTY.FACULTY
	inner join GROUPS on GROUPS.PROFESSION = PROFESSION.PROFESSION
	inner join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
	inner join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	where PROGRESS.SUBJECT = 'БД' or PROGRESS.SUBJECT = 'ОАиП'
		group by FACULTY_NAME, GROUPS.PROFESSION, YEAR_FIRST, SUBJECT
		order by NOTE desc

--task6
--На основе таблиц FACULTY, GROUPS, STUDENT и PROGRESS разработать запрос, в котором выводятся специальность, дисциплины и средние оценки при сдаче экзаменов на факультете ТОВ
select PROGRESS.SUBJECT, PROFESSION.PROFESSION_NAME, round(avg(cast(PROGRESS.NOTE as float(4))), 2) NOTES
	from PROGRESS join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	join GROUPS on GROUPS.IDGROUP = STUDENT.IDGROUP
	join PROFESSION on GROUPS.PROFESSION = PROFESSION.PROFESSION
	 where GROUPS.FACULTY = 'ИДиП'
	 group by  PROGRESS.SUBJECT, PROFESSION.PROFESSION_NAME

--task7
--На основе таблицы PROGRESS определить для каждой дисциплины количество студентов, получивших оценки 8 и 9. 
--Использовать группировку, секцию HAVING, сортировку. 

--без where оно не работает так, как должно, потому что надо либо убирать агрегатные функции max() и группировать в том числе по оценке, что приведёт к двум группам для каждого
--предмета: для студентов с оценкой 8 и студентов с оценкой 9, либо убирать where и получать на выходе количество студентов с любой оценкой по данному предмету
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
--1, 2 выбрать мин/макс/ср/сум значения ID сотрудников
select	Сотрудники.Пол,
		max(Сотрудники.[ID сотрудника]) Maximum,
		min(Сотрудники.[ID сотрудника]) Minimum,
		avg(Сотрудники.[ID сотрудника]) Average,
		count (*) Amount,
		sum(Сотрудники.[ID сотрудника]) Sum
		from Назначения join Сотрудники
		on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника]
			group by Сотрудники.Пол

--3 выбрать количество юных, молодых и старых сотрудников
select *
	from (select case when Сотрудники.[Дата рождения] between '1970-01-02' and '1972-01-01' then 'молодой'
		when [Дата рождения] between '1900-01-01' and '1970-01-02' then 'старый'
		else 'юный'
		end [Notes], count (*) Amount
	from Сотрудники group by case
		when Сотрудники.[Дата рождения] between '1970-01-02' and '1972-01-01' then 'молодой'
		when [Дата рождения] between '1900-01-01' and '1970-01-02' then 'старый'
		else 'юный'
		end) as T
			order by case [Notes]
				when 'юный' then 1
				when 'молодой' then 2
				when 'старый' then 3
				else 0
				end

--4 выбрать средний ID для каждой должности и каждого пола
select Должности.[Название должности], Сотрудники.Пол, round(avg(cast(Сотрудники.[ID сотрудника] as float(4))), 2) [NOTE]
	from Сотрудники join Назначения on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника]
	join Должности on Должности.[ID должности] = Назначения.Должность
		group by Должности.[Название должности], Сотрудники.Пол
		order by NOTE desc

--5 выбрать средний ID для каждой должности и каждого пола
select Должности.[Название должности], Сотрудники.Пол, round(avg(cast(Сотрудники.[ID сотрудника] as float(4))), 2) [NOTE]
	from Сотрудники join Назначения on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника]
	join Должности on Должности.[ID должности] = Назначения.Должность
		where Сотрудники.[ID сотрудника] = 1 or Сотрудники.[ID сотрудника] = 2
		group by Должности.[Название должности], Сотрудники.Пол
		order by NOTE desc

--6 выбрать для каждого отдела и каждой фамилии средний ID. (можно убрать группировку по фамилии, тогда будет средний по отделу с заданным условием)
select Должности.Отдел, Сотрудники.[Фамилия сотрудника], round(avg(cast(Сотрудники.[ID сотрудника] as float(4))), 2) [NOTE]
	from Сотрудники join Назначения on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника]
	join Должности on Должности.[ID должности] = Назначения.Должность
		where Сотрудники.[ID сотрудника] % 2 = 0
		group by Должности.Отдел, Сотрудники.[Фамилия сотрудника]
		order by NOTE desc

--7 выбрать для каждой даты рождения кличество сотрудников, принадлежащих к мужскому или женскому полу
select [Дата рождения], count(distinct [ID сотрудника]) as AMOUNT
	from Сотрудники
	where Пол in ('муж', 'жен')
	group by [Дата рождения]
	having max(Пол) >= 'жен' AND max(Пол) <= 'муж';