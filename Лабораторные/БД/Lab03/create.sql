use master
create database Lab03 on primary

(name = N'UNIVER_mdf', filename = N'D:\_УЧЁБА_\Лабораторные\БД\Lab03\UNIVER_mdf.mdf',
size = 10240Kb, maxsize = UNLIMITED, filegrowth = 1024Kb),
(name = N'UNIVER_ndf', filename = N'D:\_УЧЁБА_\Лабораторные\БД\Lab03\UNIVER_ndf.ndf',
size = 10240Kb, maxsize = 1Gb, filegrowth = 25%),
filegroup FG1
(name = N'UNIVER_fg1', filename = N'D:\_УЧЁБА_\Лабораторные\БД\Lab03\UNIVER_fgq-1.ndf',
size = 10240Kb, maxsize = 1Gb, filegrowth = 25%),
(name = N'UNIVER_fg2', filename = N'D:\_УЧЁБА_\Лабораторные\БД\Lab03\UNIVER_fgq-2.ndf',
size = 10240Kb, maxsize = 1Gb, filegrowth = 25%)
log on (name = N'UNIVER_log', filename = N'D:\_УЧЁБА_\Лабораторные\БД\Lab03\UNIVER_log.ldf',
size = 10240Kb, maxsize = 1Gb, filegrowth = 25%)