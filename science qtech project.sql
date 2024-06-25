create database employee;
use employee;
show tables;

SELECT EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT from emp_record_table;

SELECT EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING
from emp_record_table
WHERE EMP_RATING<2  ;

SELECT EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING
from emp_record_table
WHERE EMP_RATING>4 ;

SELECT EMP_ID,FIRST_NAME,LAST_NAME,GENDER,DEPT,EMP_RATING
from emp_record_table
WHERE EMP_RATING BETWEEN 2 AND 4 ;


SELECT CONCAT(FIRST_NAME," ",LAST_NAME) AS NAME FROM emp_record_table 
where DEPT='FINANCE' ;

SELECT a.EMP_ID, a.FIRST_NAME,a.LAST_NAME,a.ROLE,a.EXP,count(a.EMP_ID) as EMP_COUNT
FROM emp_record_table a 
inner join emp_record_table b
ON a.EMP_ID = b.MANAGER_ID
GROUP BY a.EMP_ID
ORDER BY a.EMP_ID;


select EMP_ID,FIRST_NAME,LAST_NAME,DEPT FROM emp_record_table
where DEPT='HEALTHCARE'
UNION 
select EMP_ID,FIRST_NAME,LAST_NAME,DEPT FROM emp_record_table
where DEPT='FINANCE';


SELECT  m.EMP_ID,m.FIRST_NAME,m.LAST_NAME,m.ROLE,m.DEPT,m.EMP_RATING,max(m.EMP_RATING)
OVER(PARTITION BY m.DEPT)
AS "MAX_DEPT_RATING"
FROM emp_record_table m
ORDER BY DEPT;

SELECT  EMP_ID,FIRST_NAME,LAST_NAME,ROLE,min(SALARY),max(SALARY)
FROM emp_record_table 
GROUP BY ROLE;

SELECT EMP_ID,FIRST_NAME,LAST_NAME,EXP,
RANK() OVER (ORDER BY EXP) AS EXP_RANK
FROM emp_record_table;

create  view country_wise_employee as
select EMP_ID,FIRST_NAME,LAST_NAME,COUNTRY,SALARY 
FROM emp_record_table
where SALARY>6000;

select*from country_wise_employee;

select  EMP_ID,FIRST_NAME,LAST_NAME,EXP
from emp_record_table
where  EMP_ID IN(select MANAGER_ID from emp_record_table);

CALL emp_with_more_than_3_years_experience();

select EXP ,Employee_ROLE(EXP)
FROM data_science_team;


CREATE INDEX idx_first_name
ON emp_record_table(FIRST_NAME(20));
SELECT * FROM emp_record_table
WHERE FIRST_NAME='Eric';


update emp_record_table
set SALARY = (select SALARY  +( select SALARY * 0.5 EMP_RATING));

SELECT*FROM emp_record_table;


select EMP_ID,FIRST_NAME,LAST_NAME,SALARY,COUNTRY,CONTINENT ,
AVG(SALARY)OVER (PARTITION BY COUNTRY) AS AVG_SALARY_COUNTRY,
AVG(SALARY)OVER (PARTITION BY CONTINENT) AS AVG_SALARY_CONTINENT
FROM emp_record_table ;