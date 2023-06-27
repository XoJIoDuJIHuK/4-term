use UNIVER;

select PULPIT.PULPIT_NAME
	from PULPIT, FACULTY
	where PULPIT.FACULTY = FACULTY.FACULTY
	and FACULTY.FACULTY in (select FACULTY from PROFESSION where PROFESSION_NAME like '%технологи[ия]%')

select PULPIT.PULPIT_NAME
	from PULPIT inner join FACULTY
	on PULPIT.FACULTY = FACULTY.FACULTY
	and FACULTY.FACULTY in (select FACULTY from PROFESSION where PROFESSION_NAME like '%технологи[ия]%')

select distinct PULPIT.PULPIT_NAME
	from PULPIT inner join FACULTY
	on PULPIT.FACULTY = FACULTY.FACULTY
		inner join PROFESSION
		on FACULTY.FACULTY = PROFESSION.FACULTY
		where (PROFESSION.PROFESSION_NAME like '%технологи[ия]%')

select AUDITORIUM_NAME, AUDITORIUM_CAPACITY, AUDITORIUM_TYPE
	from AUDITORIUM a
	where AUDITORIUM_CAPACITY = (select top(1) AUDITORIUM_CAPACITY from AUDITORIUM aa
		where aa.AUDITORIUM_TYPE = a.AUDITORIUM_TYPE order by AUDITORIUM_CAPACITY desc)

select FACULTY_NAME from FACULTY
	where not exists (select * from PULPIT
						where PULPIT.FACULTY = FACULTY.FACULTY)

select top 1
	(select avg(NOTE) from PROGRESS where SUBJECT like 'ОАиП') OAiP,
	(select avg(NOTE) from PROGRESS where SUBJECT like 'КГ') СП,
	--бд там нет
	(select avg(NOTE) from PROGRESS where SUBJECT like 'СУБД') SUBD
from PROGRESS

select AUDITORIUM from AUDITORIUM
	where AUDITORIUM_CAPACITY >= all (select AUDITORIUM_CAPACITY from AUDITORIUM where AUDITORIUM_NAME like '%6-%')

select AUDITORIUM from AUDITORIUM
	where AUDITORIUM_CAPACITY >= any (select AUDITORIUM_CAPACITY from AUDITORIUM where AUDITORIUM_NAME like '%4-%')


--------------------------------------------Ninth bloody task-------------------------------------------------------

use To_MyBase;

select [ID сотрудника]
	from Назначения, Должности
	where Должности.[ID должности] = Назначения.Должность
	and [ID сотрудника] in (select [ID сотрудника] from Сотрудники where [Отчество сотрудника] like '%ич%')

select [ID сотрудника]
	from Назначения inner join Должности
	on Должности.[ID должности] = Назначения.Должность
		where [ID сотрудника] in (select [ID сотрудника] from Сотрудники where [Отчество сотрудника] like '%ич%')


select Назначения.[ID сотрудника]
	from Назначения inner join Должности
	on Должности.[ID должности] = Назначения.Должность
		inner join Сотрудники
		on Сотрудники.[ID сотрудника] = Назначения.[ID сотрудника]
			where ([Отчество сотрудника] like '%ич%')

select [Имя сотрудника], [Фамилия сотрудника], [Отчество сотрудника]--выбрать старших мужчину и женщину
	from Сотрудники a
	where [Дата рождения] = (select top(1) [Дата рождения] from Сотрудники aa
		where aa.Пол = a.Пол order by [Дата рождения] asc)

select [ID должности] from Должности
	where not exists (select * from Назначения
						where Должности.[ID должности] = Назначения.[Должность])

select top 1--средний ID у мужчин и женщин
	(select avg([ID сотрудника]) from Сотрудники where [Отчество сотрудника] like '%ич%') муж,
	(select avg([ID сотрудника]) from Сотрудники  where [Отчество сотрудника] like '%на%') жен
from Сотрудники

select [Фамилия сотрудника] from Сотрудники--старше всех мужчин
	where [Дата рождения] <= all (select [Дата рождения] from Сотрудники where [Отчество сотрудника] like '%вич%')

select [Фамилия сотрудника] from Сотрудники--моложе всех женщин
	where [Дата рождения] >= any (select [Дата рождения] from Сотрудники where [Отчество сотрудника] like '%на%')