create table student
(
id int primary  key identity,
name varchar(20),
branchid int,
gender varchar(20),
branch varchar(20)
)
insert into student values('priya',2,'female','eee'),
('shreya',1,'female','cse'),
('akila',3,'female','eee'),
('sravani',2,'female','ece'),
('arjun',3,'male','cse')
select *from student
drop table student
---- branchid
create function branchidfun(@bid int)
returns table
as 
return
(
select * from student where branchid=@bid
)
select * from dbo.branchidfun(2)
--- gender
create function genderfun(@gender varchar(10))
returns table
as 
return
(
select * from student where gender=@gender)
select * from dbo.genderfun('male')
drop function genderfun
--------trigger
create table tablemplyee
(
id int,name varchar(40),
gender varchar(40),
salary int,deptid int 
)
insert into tablemplyee values(1,'mahesh','male',9000,1),
(2,'ankith','male',94000,3),
(3,'siva','male',29000,2),
(4,'archana','female',86000,1),
(5,'kavya','female',8700,3)
select * from tablemplyee
drop table tablemplyee
create table tablemplyeeaudit
(
id int identity(1,1) primary key,
auditdata nvarchar(1000) 
)
create trigger tr_tblemployee_fordelete
on tablemplyee
for delete

as
begin 
declare @id int
select @id=id from deleted
delete from tablemplyee  where id=4
insert into tablemplyeeaudit values ('new employee'+cast(@id as varchar (10))+'is insrted'
+cast(getdate() as varchar(30)))
end
select *from tablemplyee
select *from tablemplyeeaudit
insert into tablemplyee values (4,'geetha','female',894798,4)
delete from tablemplyee  where id=3
drop trigger tr_tblemployee_fordelete
-------subquery
create table tblproducts
(
id int primary key identity,
name varchar(20),
decsrption varchar(100)
) 
create table prodcutssales
(
id int primary key identity,
productid int foreign key references tblproducts(id),
unitprice int,
quantitysoled int
)
insert into tblproducts values('tv','it is one of the good one'),
('laptop','this one is updated version'),
('desktop','hp is the best one')
insert into prodcutssales values(3,450,5),
(2,250,7),
(3,450,4),
(3,450,9)
select * from tblproducts where id in
(
select Distinct productid from prodcutssales where quantitysoled =0
)