use univer;

declare @lastName nvarchar(100);
declare studentName cursor
for select name from student;

select count(*) from student;
declare @i int = (select count(*) from student);
print @i

open studentName;
print @@rowcount

fetch studentName into @lastName;
print @lastName;
while @@fetch_status = 0
begin
	fetch studentName into @lastName;
	print @lastName;
end

close studentName
deallocate studentName