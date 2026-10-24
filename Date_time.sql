
CREATE TABLE Events (
    Event_ID INT PRIMARY KEY,
    Event_Name VARCHAR(100),
    Event_Date DATETIME
);

SELECT * FROM Events;

drop table Events;

INSERT INTO Events (Event_ID, Event_Name, Event_Date)
VALUES 
(1, 'Independence Day', '2025-08-15 09:00:00'),
(2, 'New Year Party', '2026-01-01 00:00:00'),
(3, 'College Fest', '2025-11-20 18:30:00'),
(4, 'Project Submission', '2025-06-10 23:59:59');

SELECT * FROM Events;


drop table Events;


select event_name,event_date,date_format(event_date,'%d-%m-%y %h:%i:%s')as formatted_date from events;

select now();

select CURDATE();


select CURTIME();

select Event_id,Event_Name,date(Event_Date) as Date from Events;

select Event_id,Event_Name,time(Event_Date) as Time from Events;

select Event_id,Event_Name,monthname(Event_Date) as month_name from Events;

select Event_id,Event_Name,day(Event_Date) as Day from Events;

select Event_id,Event_Name,year(Event_Date) as year from Events;


SELECT
    Event_ID,
    Event_Name,
    DATEDIFF(CURDATE(),Event_Date) AS Difference
FROM Events;


select event_name,event_date,date_add(event_date,interval 7 day) as one_week_later,
date_sub(event_date,interval 3 day) as three_days_before from events;

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Joining_Date DATE,
    Login_Time DATETIME,
    Logout_Time DATETIME,
    Project_Deadline DATE
);

INSERT INTO Employee VALUES
(1, 'Arun', '2023-01-15', '2026-10-01 09:00:00', '2026-10-01 18:00:00', '2026-10-20'),
(2, 'Bala', '2024-03-20', '2026-10-02 09:30:00', '2026-10-02 17:30:00', '2026-10-25'),
(3, 'Charan', '2022-06-10', '2026-10-03 08:45:00', '2026-10-03 18:15:00', '2026-10-30'),
(4, 'Divya', '2025-01-05', '2026-10-04 10:00:00', '2026-10-04 19:00:00', '2026-11-05'),
(5, 'Eswar', '2021-09-25', '2026-10-05 08:30:00', '2026-10-05 17:00:00', '2026-11-10'),
(6, 'Farah', '2024-12-12', '2026-10-06 09:15:00', '2026-10-06 18:30:00', '2026-11-15'),
(7, 'Gokul', '2020-05-18', '2026-10-07 09:45:00', '2026-10-07 18:45:00', '2026-11-20'),
(8, 'Hari', '2023-08-08', '2026-10-08 08:50:00', '2026-10-08 17:20:00', '2026-11-25'),
(9, 'Indhu', '2025-04-22', '2026-10-09 10:10:00', '2026-10-09 19:10:00', '2026-11-28'),
(10, 'Jeeva', '2022-11-30', '2026-10-10 09:20:00', '2026-10-10 18:20:00', '2026-12-01');

drop table Employee;

select *from Employee;


select CURDATE();

select CURTIME();

select Emp_ID,Emp_Name,Year(Joining_Date) as Joining_Date from employee
where Year(Joining_Date)=2024;


select Emp_ID,Emp_Name,monthname(Joining_Date) as Joining_Date from employee;

select Emp_ID,Emp_Name,DATEDIFF(CURDATE(),Joining_Date) as No_of_Days from employee;

select Emp_ID,Emp_Name,Date(Login_Time) as Login_Date from employee;

SELECT
    Emp_ID,
    Emp_Name,
    DATE_SUB(Project_Deadline, INTERVAL 7 DAY) AS Reminder_Date
FROM Employee;


SELECT Emp_ID, Emp_Name, Project_Deadline
FROM Employee
WHERE Project_Deadline > CURDATE();

SELECT
    Emp_ID,
    Emp_Name,
    DATE_ADD(Joining_Date, INTERVAL 30 DAY) AS Extended_Date
FROM Employee;

select Emp_ID,Emp_Name,joining_Date from employee
where joining_Date between '2023-01-01' and '2024-10-31';



CREATE TABLE Employee_Practice (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Joining_Date DATE,
    Login_Time DATETIME,
    Logout_Time DATETIME,
    Project_Deadline DATE
);

INSERT INTO Employee_Practice
(Emp_ID, Emp_Name, Joining_Date, Login_Time, Logout_Time, Project_Deadline)
VALUES
(1, 'Arun', '2022-01-15', '2026-10-01 09:00:00', '2026-10-01 18:00:00', '2026-10-20'),
(2, 'Bala', '2023-03-20', '2026-10-02 09:30:00', '2026-10-02 17:30:00', '2026-10-25'),
(3, 'Charan', '2024-06-10', '2026-10-03 08:45:00', '2026-10-03 18:15:00', '2026-10-30'),
(4, 'Divya', '2025-01-05', '2026-10-04 10:00:00', '2026-10-04 19:00:00', '2026-11-05'),
(5, 'Eswar', '2021-09-25', '2026-10-05 08:30:00', '2026-10-05 17:00:00', '2026-11-10'),
(6, 'Farah', '2024-12-12', '2026-10-06 09:15:00', '2026-10-06 18:30:00', '2026-11-15'),
(7, 'Gokul', '2020-05-18', '2026-10-07 09:45:00', '2026-10-07 18:45:00', '2026-11-20'),
(8, 'Hari', '2023-08-08', '2026-10-08 08:50:00', '2026-10-08 17:20:00', '2026-11-25');


select * from Employee_Practice;


drop table Employee_Practice;


select Emp_Name,Joining_Date,Datediff(curdate(),joining_date) as No_of_days from employee_practice;


SELECT Emp_Name, Project_Deadline,
       DATEDIFF(Project_Deadline, CURDATE()) AS Days_Remaining
FROM Employee_Practice
WHERE Project_Deadline BETWEEN CURDATE()
                           AND DATE_ADD(CURDATE(), INTERVAL 7 DAY);

SELECT
    Emp_Name,
    Joining_Date,
    MONTHNAME(Joining_Date) AS Joining_Month,
    YEAR(Joining_Date) AS Joining_Year
FROM Employee_Practice
WHERE Joining_Date >= '2023-01-01';

SELECT
    Emp_Name,
    Joining_Date,
    DATE(Login_Time) AS Login_Date,
    DATEDIFF(DATE(Login_Time), Joining_Date) AS Days_Between
FROM Employee_Practice
WHERE DATE(Login_Time) > Joining_Date;




CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50),
    Department VARCHAR(50),
    Joining_Date DATETIME,
    Birth_Date DATE
);
drop table Employee;       

INSERT INTO Employee
(Emp_ID, Emp_Name, Department, Joining_Date, Birth_Date)
VALUES
(101, 'Arun', 'IT', '2022-01-15 09:30:00', '1998-05-12'),
(102, 'Priya', 'HR', '2021-06-20 10:45:00', '1997-08-25'),
(103, 'Karthik', 'Finance', '2023-03-10 08:15:00', '2000-12-05'),
(104, 'Divya', 'IT', '2020-11-25 11:20:00', '1999-02-18'),
(105, 'Rahul', 'Sales', '2024-07-05 14:30:00', '2001-10-10'),
(106, 'Sneha', 'HR', '2019-09-12 16:00:00', '1996-04-22'),
(107, 'Vijay', 'Finance', '2022-12-01 09:45:00', '1998-07-30'),
(108, 'Meena', 'Sales', '2023-08-18 13:10:00', '2002-01-15');

select * from  Employee;

select now();

select CURDATE();

select CURTIME();

select Emp_id,Emp_Name,Department,date(Joining_Date) as Emp_joining_date,
                                  time(joining_date) as Time from Employee;

select Emp_id,Emp_Name,Department,day(joining_date) as day,
                                  monthname(joining_date) as monthname,
                                  year(joining_date) as year from Employee;

select Emp_id,Emp_Name,Department,DATEDIFF(CURDATE(),joining_date) as no_of_days from Employee;

select Emp_id,Emp_Name,Department,date_add(joining_date, interval 90
day) as Days_add from Employee;

select Emp_id,Emp_Name,Department,date_sub(joining_date, interval 30
day) as Days_sub from Employee;

SELECT
    Emp_ID,
    Emp_Name,
    DATE_FORMAT(Joining_Date, '%d %M %Y') AS Formatted_Date
FROM Employee;


CREATE INDEX idx_emp_name
ON Employee (Emp_Name);

SHOW INDEX FROM Employee;
                              

