create database EXAM
go
use EXAM
go
create table Employees (
    id int primary key identity,
    FIO nvarchar(100) not null default N'Точило Олег Вячеславович',
    EmploymentDate date not null default '2023-07-06',
    Rank nvarchar(50) not null default N'Engineer',
    Department nvarchar(50) not null default N'Rocket science',
    Salary money not null default 5000
)go
alter table Employees add constraint SalaryCheck check (Salary > 0)
go
create table Vacations (
    vacationId int primary key identity,
    employeeId int not null foreign key references Employees(id),
    startDate date not null,
    endDate date not null,
    type nvarchar(50) not null,
    payment money not null,
    constraint DateCheck check (startDate < endDate)
)
go
--drop procedure SelectEmployeesByRankAndYear
create procedure SelectEmployeesByRankAndYear(@year int, @rank nvarchar(50)) as
    begin try
        if (@year < 0 or @year > 2030)
            begin
                RAISERROR ('Invalid year', 11, 1)
            end
        select FIO from Employees where not exists (select * from Vacations where DATEPART(year, Vacations.startDate) >= @year and
                                                                                  DATEPART(year, Vacations.endDate) <= @year) and Rank = @rank
    end try
    begin catch
        print 'Error in line ' + cast(ERROR_LINE() as nvarchar) + ': ' + cast(ERROR_MESSAGE() as nvarchar)
    end catch
    return
go
insert into Employees values (N'Рубашек Александр Александрович', '2022-01-01', 'Java Developer', 'Rocket science', 1200),
                          (N'Козляковский Данила Александрович', '2022-02-13', 'C++ Developer', 'IT', 1321),
                          (N'Пшенко Артём Владимирович', '2022-12-27', 'JavaScript Developer', 'Rocket science', 500),
                          (N'Ильин Никита Викторович', '2023-02-03', 'SQL Developer', 'First department', 1488)
go
insert into Vacations values (2, '2023-01-01', '2022-01-01', 'full', 1234)--error
go
insert into Vacations values (1, '2023-01-01', '2024-01-01', 'full', 1234),
                          (3, '2023-01-01', '2023-06-02', 'partial', 5432)
go
create table AUDIT (
    vacationId int primary key,
    employeeId int,
    startDate date,
    endDate date,
    type nvarchar(50),
    payment money
)
go
select * from Employees
select * from Vacations
declare @rank nvarchar(50) = N'Java Developer'
declare @year int = 12345
exec SelectEmployeesByRankAndYear @year, @rank
go
drop trigger AuditTrigger
go
create trigger AuditTrigger
    on Vacations
    for delete
    as
    declare AuditCursor cursor global for select * from deleted
    open AuditCursor
    declare @vacationId int, @employeeId int, @startDate date, @endDate date, @type nvarchar(50), @payment money
    fetch AuditCursor into @vacationId, @employeeId, @startDate, @endDate, @type, @payment
    while @@FETCH_STATUS = 0
    begin
        insert AUDIT values (@vacationId, @employeeId, @startDate, @endDate, @type, @payment)
        fetch AuditCursor into @vacationId, @employeeId, @startDate, @endDate, @type, @payment
    end
    close AuditCursor
    deallocate AuditCursor
    return
go
select * from AUDIT
select * from Vacations
delete Vacations
delete AUDIT

print @@TRANCOUNT