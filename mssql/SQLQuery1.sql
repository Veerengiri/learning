create table tech(techId int primary key, Tname nvarchar(150) not null, Refrence nvarchar(200) not null,cost int, mentor nvarchar(40));
create table associate (pid int primary key, pname varchar(50) not null,tid int ,foreign key (tid) references tech(techId));

--basic query
create index ind_cost on tech(cost);
select * from tech order by cost;
select * from associate;
insert into tech values(5,'msSql','microsoft',75,'mehul');
insert into associate values(2,'harsh',3);
print 'hi';
delete from tech where techId=2;

-- joins
select * from tech inner join associate on tech.techid=associate.tid;
select * from tech left join associate on tech.techid=associate.tid;
select * from tech right join associate on tech.techid=associate.tid;
select * from tech full outer join associate on tech.techid= associate.tid;
select * from tech cross join associate;
select * from tech a,tech b;

--sub querys
select * from tech where techId in (select tid from associate); 
--corelated query
select * from tech t where exists (select * from associate a where t.techId=a.tid); 

--set Operations;
(select * from tech where techId=1) union (select * from tech where techId=3);
(select * from tech) intersect (select * from tech where techId in (3,4));
(select * from tech) except (select * from tech where techId in (3,4));

--functions;
select getDate(); select Dateadd(day,2,getDate());
CREATE FUNCTION Let_sum3(@num1 INT, @num2 INT)
RETURNS INT
AS
BEGIN
    DECLARE @ans INT; 
    SET @ans = @num1 + @num2 + 3; 
    RETURN @ans; 
END;
SELECT dbo.let_sum3(5, 10) AS Result;

-- store procedures
CREATE procedure Let_sum4 @num1 INT, @num2 INT
AS
BEGIN
    DECLARE @ans INT; 
    select @num1 + @num2 + 3;  
END;
exec Let_sum4 5,10;

--trigger
create trigger createinfo on tech after insert As
Begin 
	print 'trigger is ran';
End;
Disable trigger createinfo on tech;
Enable trigger createinfo on tech;

create trigger dnd on tech instead of delete As
Begin
	print 'delete is not allowed in this database';
End;

--lock mechanism
SELECT * FROM sys.dm_tran_locks;