--UC1
create database PayRoll;

--use database
use PayRoll;

--UC2 create a table for PaymentRoll
create table Employee_payroll(
id int primary key,
name varchar(100),
salary int,
start_date Date
);

--UC3 inserting data
insert into Employee_payroll
values (101,'Samiksha',3000,'11/8/2020')

insert into Employee_payroll
values(102,'Ashwini',4000,'12/13/2020')

insert into Employee_payroll
values(103,'Diksha',5000,'10/5/2020')

--UC4 
select * from Employee_payroll;

--UC5 Inserting More data
insert into Employee_payroll values (104,'Dishita',6000,'2019/10/10'),
(105,'Mayur',7000,'2017/02/08');

--Printing data of a perticular empolyee(where condition)
select * from Employee_payroll where name = 'Samiksha'; 

--searching name and salary for people how join from 2018-01-01
select name,salary from Employee_payroll where start_date between CAST('2020-01-01' AS date) and GETDATE();

--UC6 add gender
Alter table Employee_payroll add gender char;

update Employee_payroll set gender='F' where name='Samiksha' or name='Ashwini';
update Employee_payroll set gender='F' where name='Ashwini' or name='Diksha';
update Employee_payroll set gender='M' where name='Mayur';
Select * from Employee_payroll;

--UC7
--Average
select AVG(salary) from Employee_payroll;
--Sum 
select SUM(salary) from Employee_payroll;
--Minimum
select MIN(salary) from Employee_payroll;
--Maximum
select MAX(salary) from Employee_payroll;
--Count
select COUNT(salary) from Employee_payroll;
-- Group by 
--Total female salary
select SUM(salary) from Employee_payroll
where gender = 'F' group by gender;
--Total male salary
select SUM(salary) from Employee_payroll
where gender = 'M' group by gender;

--UC8
--Adding address,phone_no,dept
Alter table Employee_payroll add address varchar(255) default 'Mumbai'; 
Alter table Employee_payroll add phone_no varchar(255);
Alter table Employee_payroll add dept varchar(255) not null default 'Adv. Dept';
select * from Employee_payroll;

--UC9
Alter table Employee_payroll add basicPay float, Deduction float, TaxablePay float, IncomeTax float, NetPay float;

--UC10 Add Two Employee Having same name but different Dept.
insert into Employee_payroll values
(90,'Terisa',3000000, '2018-01-03' , 'F','New York',9922003699,'Marketting',  3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00)
, (91,'Terisa',3000000, '2018-01-03' , 'F','New York',9034001654,'Sales',  3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00);
select * from Employee_payroll where name='Terisa';

--UC 11 Create Tables
create table Company(
CmpID int identity(1,1) PRIMARY KEY,
CmpName varchar(100) not null);

create table Department(
DepartmentID int identity(1,1) PRIMARY KEY,
DepartmentName varchar(100) not null);

create table employee(
ID int identity(1,1) PRIMARY KEY,
EmployeeName varchar(100) NOT NULL,
EmployeePhoneNumber int not null,
EmployeeAddress varchar(255),
EmployeeGender char(1),
CompanyID int,
Foreign key(CompanyID) REFERENCES employee(id)
);

create table Payment(
PaymentID int identity(1,1) PRIMARY KEY,
EmployeeID int,
basicPay float, 
Deduction float, 
TaxablePay float, 
IncomeTax float, 
NetPay float
Foreign key(EmployeeID) REFERENCES employee(id)
);

create table EmployeeDepartment(
EmployeeID int,
DepartmentID int,
Foreign key(EmployeeId) REFERENCES employee(id),
Foreign key(DepartmentID) REFERENCES Department(DepartmentID)
);