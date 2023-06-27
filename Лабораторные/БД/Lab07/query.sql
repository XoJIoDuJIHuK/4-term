use UNIVER;

--1) На основе таблиц FACULTY, GROUPS, STUDENT и PROGRESS разработать SE-LECT-запрос, в котором выводятся специ-альность, дисциплины и средние оценки при сдаче экзаменов на факультете ТОВ. 
--Использовать группировку по полям FACULTY, PROFESSION, SUBJECT.
--Добавить в запрос конструкцию ROLLUP и проанализировать результат

select PROGRESS.SUBJECT, PROFESSION.PROFESSION_NAME, round(avg(cast(PROGRESS.NOTE as float(4))), 2) NOTES
	from PROGRESS join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	join GROUPS on GROUPS.IDGROUP = STUDENT.IDGROUP
	join PROFESSION on GROUPS.PROFESSION = PROFESSION.PROFESSION
	 where GROUPS.FACULTY = 'ИДиП'
	 group by PROGRESS.SUBJECT, PROFESSION.PROFESSION_NAME with rollup
	 --последняя строка - ср.арифм. всех оценок

--2) Выполнить SELECT-запрос из п. 1 с ис-пользованием CUBE-группировки. 
--Проанализировать результат.

select PROGRESS.SUBJECT, PROFESSION.PROFESSION_NAME, round(avg(cast(PROGRESS.NOTE as float(4))), 2) NOTES
	from PROGRESS join STUDENT on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
	join GROUPS on GROUPS.IDGROUP = STUDENT.IDGROUP
	join PROFESSION on GROUPS.PROFESSION = PROFESSION.PROFESSION
	 where GROUPS.FACULTY = 'ИДиП'
	 group by PROGRESS.SUBJECT, PROFESSION.PROFESSION_NAME with cube

--3) На основе таблиц GROUPS, STUDENT и PROGRESS разработать SELECT-запрос, в котором определяются результаты сдачи экзаменов.
--В запросе должны отражаться специаль-ности, дисциплины, средние оценки студен-тов на факультете ТОВ.
--Отдельно разработать запрос, в котором определяются результаты сдачи экзаменов на факультете ХТиТ.
--Объединить результаты двух запросов с использованием операторов UNION и UN-ION ALL. Объяснить результаты. 
select FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(3))), 2) as AVG_NOTE
		from GROUPS
		join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
		join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
		join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
			where FACULTY.FACULTY = 'ИДиП'
			group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT
union select FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(3))), 2) as AVG_NOTE
	from GROUPS
	join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
	join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
	join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		where FACULTY.FACULTY = 'ХТиТ'
		group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT

select FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(3))), 2) as AVG_NOTE
		from GROUPS
		join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
		join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
		join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
			where FACULTY.FACULTY = 'ИДиП'
			group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT
union all select FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(3))), 2) as AVG_NOTE--all не убирает повторяющиеся строки
	from GROUPS
	join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
	join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
	join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		where FACULTY.FACULTY = 'ХТиТ'
		group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT

--4) Получить пересечение двух множеств строк, созданных в результате выполнения запросов пункта 3. Объяснить результат.
--Использовать оператор INTERSECT.

select FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(3))), 2) as AVG_NOTE
		from GROUPS
		join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
		join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
		join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
			where FACULTY.FACULTY = 'ИДиП'
			group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT
intersect select FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(3))), 2) as AVG_NOTE
	from GROUPS
	join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
	join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
	join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		where FACULTY.FACULTY = 'ХТиТ'
		group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT

--5) Получить разницу между множеством строк, созданных в результате запросов пункта 3. Объяснить результат. 
--Использовать оператор EXCEPT.

select FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(3))), 2) as AVG_NOTE
		from GROUPS
		join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
		join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
		join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
			where FACULTY.FACULTY = 'ИДиП'
			group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT
except select FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT, round(avg(cast(PROGRESS.NOTE as float(3))), 2) as AVG_NOTE
	from GROUPS
	join FACULTY on GROUPS.FACULTY = FACULTY.FACULTY
	join STUDENT on STUDENT.IDGROUP = GROUPS.IDGROUP
	join PROGRESS on PROGRESS.IDSTUDENT = STUDENT.IDSTUDENT
		where FACULTY.FACULTY = 'ХТиТ'
		group by FACULTY.FACULTY, GROUPS.PROFESSION, PROGRESS.SUBJECT

--6)
use To_MyBase;
--1 
select Должности.Отдел, Сотрудники.[Фамилия сотрудника], round(avg(cast(Сотрудники.[ID сотрудника] as float(4))), 2) [NOTE]
	from Сотрудники join Назначения on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника]
	join Должности on Должности.[ID должности] = Назначения.Должность
		where Сотрудники.[ID сотрудника] % 2 = 0
		group by Должности.Отдел, Сотрудники.[Фамилия сотрудника] with rollup
		order by NOTE desc

--2
select Должности.Отдел, Сотрудники.[Фамилия сотрудника], round(avg(cast(Сотрудники.[ID сотрудника] as float(4))), 2) [NOTE]
	from Сотрудники join Назначения on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника]
	join Должности on Должности.[ID должности] = Назначения.Должность
		where Сотрудники.[ID сотрудника] % 2 = 0
		group by Должности.Отдел, Сотрудники.[Фамилия сотрудника] with cube
		order by NOTE desc

--3
select Должности.Отдел, Сотрудники.[Фамилия сотрудника], round(avg(cast(Сотрудники.[ID сотрудника] as float(4))), 2) [NOTE]
	from Сотрудники join Назначения on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника]
	join Должности on Должности.[ID должности] = Назначения.Должность
		where Сотрудники.[ID сотрудника] % 2 = 0
		group by Должности.Отдел, Сотрудники.[Фамилия сотрудника]
union select Должности.Отдел, Сотрудники.[Фамилия сотрудника], round(avg(cast(Сотрудники.[ID сотрудника] as float(4))), 2) [NOTE]
	from Сотрудники join Назначения on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника]
	join Должности on Должности.[ID должности] = Назначения.Должность
		where Сотрудники.[ID сотрудника] % 2 = 1
		group by Должности.Отдел, Сотрудники.[Фамилия сотрудника]
		order by NOTE desc

select Должности.Отдел, Сотрудники.[Фамилия сотрудника], round(avg(cast(Сотрудники.[ID сотрудника] as float(4))), 2) [NOTE]
	from Сотрудники join Назначения on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника]
	join Должности on Должности.[ID должности] = Назначения.Должность
		where Сотрудники.[ID сотрудника] % 2 = 0
		group by Должности.Отдел, Сотрудники.[Фамилия сотрудника]
union all select Должности.Отдел, Сотрудники.[Фамилия сотрудника], round(avg(cast(Сотрудники.[ID сотрудника] as float(4))), 2) [NOTE]
	from Сотрудники join Назначения on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника]
	join Должности on Должности.[ID должности] = Назначения.Должность
		where Сотрудники.[ID сотрудника] % 2 = 1
		group by Должности.Отдел, Сотрудники.[Фамилия сотрудника]
		order by NOTE desc

--4
select Должности.Отдел, Сотрудники.[Фамилия сотрудника], round(avg(cast(Сотрудники.[ID сотрудника] as float(4))), 2) [NOTE]
	from Сотрудники join Назначения on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника]
	join Должности on Должности.[ID должности] = Назначения.Должность
		where Сотрудники.[ID сотрудника] % 2 = 0
		group by Должности.Отдел, Сотрудники.[Фамилия сотрудника]
intersect select Должности.Отдел, Сотрудники.[Фамилия сотрудника], round(avg(cast(Сотрудники.[ID сотрудника] as float(4))), 2) [NOTE]
	from Сотрудники join Назначения on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника]
	join Должности on Должности.[ID должности] = Назначения.Должность
		where Сотрудники.[ID сотрудника] % 2 = 1
		group by Должности.Отдел, Сотрудники.[Фамилия сотрудника]
		order by NOTE desc

--5
select Должности.Отдел, Сотрудники.[Фамилия сотрудника], round(avg(cast(Сотрудники.[ID сотрудника] as float(4))), 2) [NOTE]
	from Сотрудники join Назначения on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника]
	join Должности on Должности.[ID должности] = Назначения.Должность
		where Сотрудники.[ID сотрудника] % 2 = 0
		group by Должности.Отдел, Сотрудники.[Фамилия сотрудника]
except select Должности.Отдел, Сотрудники.[Фамилия сотрудника], round(avg(cast(Сотрудники.[ID сотрудника] as float(4))), 2) [NOTE]
	from Сотрудники join Назначения on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника]
	join Должности on Должности.[ID должности] = Назначения.Должность
		where Сотрудники.[ID сотрудника] % 2 = 1
		group by Должности.Отдел, Сотрудники.[Фамилия сотрудника]
		order by NOTE desc