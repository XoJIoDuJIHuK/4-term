use UNIVER;

--task 1)
--Определить все индексы, которые имеются в БД UNIVER. 
--Создать временную локальную таблицу. Заполнить ее данными (не менее 1000 строк). 
--Разработать SELECT-запрос. По-лучить план запроса и определить его стоимость. 
--Создать кластеризованный индекс, уменьшающий стоимость SELECT-запроса.

exec SP_HELPINDEX 'AUDITORIUM'
exec SP_HELPINDEX 'AUDITORIUM_TYPE'
exec SP_HELPINDEX 'FACULTY'
exec SP_HELPINDEX 'GROUPS'
exec SP_HELPINDEX 'PROFESSION'
exec SP_HELPINDEX 'PROGRESS'
exec SP_HELPINDEX 'PULPIT'
exec SP_HELPINDEX 'SUBJECT'
exec SP_HELPINDEX 'STUDENT'
exec SP_HELPINDEX 'TEACHER'

DROP TABLE Task1;

CREATE TABLE Task1(
	TIND INT
	)

GO
DECLARE @i INT;
SET @I = 0;
WHILE @I < 1000
	BEGIN
		INSERT Task1 values(floor(3000*RAND()))
		SET @I = @I + 1;
	END

CHECKPOINT;
DBCC DROPCLEANBUFFERS;

CREATE clustered index Task1_INDEX on Task1(TIND asc)
DROP INDEX Task1_INDEX on Task1

SELECT * FROM Task1 WHERE TIND between 1500 and 2500 order by TIND

--task 2
--Создать временную локальную таб-лицу. Заполнить ее данными (10000 строк или больше). 
--Разработать SELECT-запрос. По-лучить план запроса и определить его стоимость. 
--Создать некластеризованный не-уникальный составной индекс. 
--Оценить процедуры поиска ин-формации.

CHECKPOINT;
DBCC DROPCLEANBUFFERS;

DROP TABLE EX;

CREATE table EX
(    TKEY int, 
      CC int identity(1, 1),
      TF varchar(100)
);

go

set nocount on;           
declare @i int = 0;
while   @i < 10000       -- добавление в таблицу 20000 строк
begin
	INSERT EX(TKEY, TF) values(floor(30000*RAND()), replicate('строка ', 10));
    set @i = @i + 1; 
end;
go

SELECT count(*) from EX

CREATE index EX_NONCLU on EX(TKEY, CC)

SELECT * from  EX where  TKEY > 1500 and  CC < 4500;  
SELECT * from  EX order by  TKEY, CC
SELECT * from  EX where  TKEY = 556 and  CC > 3

--task 3
--Создать временную локальную таб-лицу. Заполнить ее данными (не ме-нее 10000 строк). 
--Разработать SELECT-запрос. По-лучить план запроса и определить его стоимость. 
--Создать некластеризованный ин-декс покрытия, уменьшающий сто-имость SELECT-запроса. 

CHECKPOINT;
DBCC DROPCLEANBUFFERS;

CREATE index EX_TKEY_X on EX(TKEY) INCLUDE (CC)
drop index EX_TKEY_X on EX

SELECT CC from EX where TKEY>15000

--task 4
--Создать и заполнить временную ло-кальную таблицу. 
--Разработать SELECT-запрос, по-лучить план запроса и определить его стоимость. 
--Создать некластеризованный фильтруемый индекс, уменьшаю-щий стоимость SELECT-запроса.

CHECKPOINT;
DBCC DROPCLEANBUFFERS;

SELECT TKEY from  EX where TKEY between 5000 and 19999; 
SELECT TKEY from  EX where TKEY>15000 and  TKEY < 20000  
SELECT TKEY from  EX where TKEY=17000

CREATE  index EX_WHERE on EX(TKEY) where (TKEY>=15000 and TKEY < 20000);  

--task 5
--Заполнить временную локальную таблицу. 
--Создать некластеризованный ин-декс. Оценить уровень фрагмента-ции индекса. 
--Разработать сценарий на T-SQL, выполнение которого приводит к уровню фрагментации индекса выше 90%. 
--Оценить уровень фрагментации индекса. 
--Выполнить процедуру реоргани-зации индекса, оценить уровень фрагментации. 
--Выполнить процедуру пере-стройки индекса и оценить уровень фрагментации индекса.

CREATE index EX_TKEY ON EX(TKEY); 
DROP INDEX EX_TKEY ON EX

SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'UNIVER'), 
OBJECT_ID(N'EX'), NULL, NULL, NULL) ss  JOIN sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id WHERE name is not null;

INSERT top(10000) EX(TKEY, TF) select TKEY, TF from EX;

ALTER index EX_TKEY on EX reorganize;

ALTER index EX_TKEY on EX rebuild with (online = off);

--task 6
--Разработать пример, демонстриру-ющий применение параметра FILL-FACTOR при создании некластери-зованного индекса.

DROP index EX_TKEY on EX;
CREATE index EX_TKEY on EX(TKEY) with (fillfactor = 65);

INSERT top(50)percent INTO EX(TKEY, TF) SELECT TKEY, TF  FROM EX;

SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'UNIVER'),    
OBJECT_ID(N'EX'), NULL, NULL, NULL) ss JOIN sys.indexes ii 
ON ss.object_id = ii.object_id and ss.index_id = ii.index_id  WHERE name is not null;


--task 7

use To_MyBase;

--task 1)
--Определить все индексы, которые имеются в БД UNIVER. 
--Создать временную локальную таблицу. Заполнить ее данными (не менее 1000 строк). 
--Разработать SELECT-запрос. По-лучить план запроса и определить его стоимость. 
--Создать кластеризованный индекс, уменьшающий стоимость SELECT-запроса.

exec SP_HELPINDEX 'Сотрудники'
exec SP_HELPINDEX 'Должности'
exec SP_HELPINDEX 'Назначения'

DROP TABLE Task1;

CREATE TABLE Task1(
	TIND INT
	)

GO
DECLARE @i INT;
SET @I = 0;
WHILE @I < 1000
	BEGIN
		INSERT Task1 values(floor(3000*RAND()))
		SET @I = @I + 1;
	END

CHECKPOINT;
DBCC DROPCLEANBUFFERS;

CREATE clustered index Task1_INDEX on Task1(TIND asc)
DROP INDEX Task1_INDEX on Task1

SELECT * FROM Task1 WHERE TIND between 1500 and 2500 order by TIND

--task 2
--Создать временную локальную таб-лицу. Заполнить ее данными (10000 строк или больше). 
--Разработать SELECT-запрос. По-лучить план запроса и определить его стоимость. 
--Создать некластеризованный не-уникальный составной индекс. 
--Оценить процедуры поиска ин-формации.

DROP TABLE EX;

CREATE table EX
(    TKEY int, 
      CC int identity(1, 1),
      TF varchar(100)
);

go

set nocount on;           
declare @i int = 0;
while   @i < 10000       -- добавление в таблицу 20000 строк
begin
	INSERT EX(TKEY, TF) values(floor(30000*RAND()), replicate('строка ', 10));
    set @i = @i + 1; 
end;
go

SELECT count(*) from EX

CREATE index EX_NONCLU on EX(TKEY, CC)

SELECT * from  EX where  TKEY > 1500 and  CC < 4500;  
SELECT * from  EX order by  TKEY, CC
SELECT * from  EX where  TKEY = 556 and  CC > 3

--task 3
--Создать временную локальную таб-лицу. Заполнить ее данными (не ме-нее 10000 строк). 
--Разработать SELECT-запрос. По-лучить план запроса и определить его стоимость. 
--Создать некластеризованный ин-декс покрытия, уменьшающий сто-имость SELECT-запроса. 

CREATE  index EX_TKEY_X on EX(TKEY) INCLUDE (CC)
SELECT CC from EX where TKEY>15000

--task 4
--Создать и заполнить временную ло-кальную таблицу. 
--Разработать SELECT-запрос, по-лучить план запроса и определить его стоимость. 
--Создать некластеризованный фильтруемый индекс, уменьшаю-щий стоимость SELECT-запроса.

SELECT TKEY from  EX where TKEY between 5000 and 19999; 
SELECT TKEY from  EX where TKEY>15000 and  TKEY < 20000  
SELECT TKEY from  EX where TKEY=17000

CREATE  index EX_WHERE on EX(TKEY) where (TKEY>=15000 and TKEY < 20000);  

--task 5
--Заполнить временную локальную таблицу. 
--Создать некластеризованный ин-декс. Оценить уровень фрагмента-ции индекса. 
--Разработать сценарий на T-SQL, выполнение которого приводит к уровню фрагментации индекса выше 90%. 
--Оценить уровень фрагментации индекса. 
--Выполнить процедуру реоргани-зации индекса, оценить уровень фрагментации. 
--Выполнить процедуру пере-стройки индекса и оценить уровень фрагментации индекса.

CREATE index EX_TKEY ON EX(TKEY); 
DROP INDEX EX_TKEY ON EX

SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'UNIVER'), 
OBJECT_ID(N'EX'), NULL, NULL, NULL) ss  JOIN sys.indexes ii on ss.object_id = ii.object_id and ss.index_id = ii.index_id WHERE name is not null;

INSERT top(10000) EX(TKEY, TF) select TKEY, TF from EX;

ALTER index EX_TKEY on EX reorganize;

ALTER index EX_TKEY on EX rebuild with (online = off);

--task 6
--Разработать пример, демонстриру-ющий применение параметра FILL-FACTOR при создании некластери-зованного индекса.

DROP index EX_TKEY on EX;
CREATE index EX_TKEY on EX(TKEY) with (fillfactor = 65);

INSERT top(50)percent INTO EX(TKEY, TF) SELECT TKEY, TF  FROM EX;

SELECT name [Индекс], avg_fragmentation_in_percent [Фрагментация (%)]
FROM sys.dm_db_index_physical_stats(DB_ID(N'UNIVER'),    
OBJECT_ID(N'EX'), NULL, NULL, NULL) ss JOIN sys.indexes ii 
ON ss.object_id = ii.object_id and ss.index_id = ii.index_id  WHERE name is not null;