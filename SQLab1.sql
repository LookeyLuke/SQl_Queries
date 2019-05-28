--#Sukûrë Lukas Lysychas

--#1

describe SALGRADE; 

select
	* 
from
	SALGRADE; 

--#2

describe EMP;

select
	* 
from
	EMP 
where
	JOB = 'MANAGER'; 

--#3

select
	ENAME, DEPTNO, SAL 
from
	EMP 
where
	(SAL >= 1600) and (SAL <= 3000); 

--#4

select
	* 
from
	DEPT 
order by
	DNAME; 

--#5

select
	distinct JOB 
from
	EMP 
order by
	JOB desc; 

--#6

select
	* 
from
	EMP 
where
	DEPTNO in (10, 30) 
order by
	ENAME; 

--#7

select
	ENAME, SAL*12, COMM 
from
	EMP 
where
	SAL > COMM 
order by
	SAL desc; 

--#8


select
	ENAME, JOB 
from
	EMP 
where
	JOB = 'CLERK' and DEPTNO = 20; 

--#9

select
	ENAME, JOB, MGR, SAL 
from
	EMP 
where
	MGR is null; 

--#10


select
	ENAME as "Vardas", nvl(COMM, 0)+SAL as "Pajamos" 
from
	EMP; 

--#11

select
	ENAME, DEPTNO, HIREDATE 
from
	EMP 
where
	HIREDATE between '1983.01.01' and '1983.12.31'; 

--#12


select
	ENAME, round(SAL*1.15,0) 
from
	EMP; 

--#13

select
	ENAME, HIREDATE, ADD_MONTHS(hiredate,12) as "REVIEW" 
from
	EMP 
order by
	REVIEW; 

--#14

select
	ENAME, DEPTNO, replace(JOB,'SALESMAN','SALESPERSON') as JOB 
from
	EMP 
where
	DEPTNO = 30; 

--#15

select
	min(SAL) as "Maþiausias atlyginimas" 
from
	EMP; 

--#16

select
	min(SAL) as "Maþiausias atlyginimas", max(SAL) as "Didþiausias atlyginimas ", round(avg(SAL),2) as "Vidutinis atlyginimas"  
from
	EMP; 

--#17

select
	JOB, min(SAL) as "Maþiausias atlyginimas", max(SAL) as "Didþiausias atlyginimas " 
from
	EMP 
group by
	JOB; 

--#18

select
	 count(JOB) 
from
	EMP 
where
	JOB = 'MANAGER'; 

--#19

select
	JOB, round(sum(SAL)/count(JOB),2) as "Vidurkis", round(sum(nvl(COMM,0)+SAL)/count(JOB),2) as "Pajamos" 
from
	EMP 
group by
	JOB; 

--#20

select
	(max(SAL)-min(SAL)) as"Skirtumas" 
from
	EMP; 

--#21

select
	DEPTNO, count(JOB) 
from
	EMP 
group by
	DEPTNO 
having
	count(JOB) > 3; 

--#22

SELECT
    EMPNO, count (EMPNO)
FROM
    EMP
GROUP BY
    EMPNO;

--#23

select 
    MGR, min(SAL)
from 
    EMP 
where 
    MGR is not null and SAL >= 1000
group by 
    MGR
order by
    min(SAL) desc;

--#24

SELECT
    emp.ename, dept.dname
FROM 
    emp,dept
WHERE
    emp.deptno = dept.deptno
ORDER BY
    dept.dname;

--#25

SELECT
    emp.ename, dept.dname, emp.deptno
FROM 
    emp,dept
WHERE
    emp.deptno = dept.deptno;
    
--#26

SELECT
    emp.ename, dept.dname, dept.loc
FROM 
    emp,dept
WHERE
    emp.deptno = dept.deptno and emp.sal > 1500;
    
--#27

SELECT
	emp.ename, emp.job, emp.sal, salgrade.grade
FROM
	emp, salgrade
WHERE
    (emp.sal BETWEEN salgrade.losal AND salgrade.hisal);
    
--#28

SELECT
	emp.ename, emp.job, emp.sal, salgrade.grade
FROM
	emp, salgrade
WHERE
    (emp.sal BETWEEN salgrade.losal AND salgrade.hisal) AND salgrade.grade = 3;
    
--#29

SELECT
    emp.ename, emp.sal, dept.loc
FROM 
    emp,dept
WHERE
    dept.deptno = emp.deptno AND emp.deptno = 20;

--#30

select 
    dept.DNAME, count(job) as count
from 
    emp 
right join 
    dept on emp.DEPTNO = dept.DEPTNO 
group by 
    dept.DNAME
having
    count(job) = 0;

--#31

select 
    dept.DNAME, min(emp.SAL) as "Maþiausias atlyginimas", max(emp.SAL) as "Didþiausias atlyginimas "
from 
    emp 
right join 
    dept on emp.DEPTNO = dept.DEPTNO 
group by 
    dept.DNAME;