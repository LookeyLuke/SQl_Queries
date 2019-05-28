select * from SALGRADE;
select * from EMP;
select * from DEPT;

describe SALGRADE;
select * from SALGRADE; --#1

describe EMP;
select * from EMP where JOB like '%MANAGER%'; --#2

select ENAME, DEPTNO, SAL from EMP where (SAL >= 1600) and (SAL <= 3000); --#3

select * from DEPT order by DNAME; --#4

select distinct JOB from EMP order by JOB desc; --#5

select * from EMP where DEPTNO in (10, 30) order by ENAME; --#6

select ENAME, SAL*12, COMM from EMP where SAL > nvl(COMM,0) order by SAL desc; --#7 daugiau uz neturimus duomenis.

select ENAME, JOB from EMP where JOB like '%CLERK%' and DEPTNO = 20; --#8

select ENAME, JOB, MGR, SAL from EMP where MGR is not null; --#9

select ENAME as "Vardas", nvl(COMM, 0)+SAL as "Pajamos" from EMP; --#10

select ENAME, DEPTNO, HIREDATE from EMP where HIREDATE between '1983.01.01' and '1983.12.31'; --#11

select ENAME, round(SAL*1.15,0) from EMP; --#12

select ENAME, HIREDATE, REGEXP_SUBSTR(HIREDATE+365, '[[:digit:]-]+.[[:digit:]-]+.[[:digit:]-]+') "REVIEW" from EMP order by REVIEW; --#13

select ENAME, DEPTNO, replace(JOB,'SALESMAN','SALESPERSON') as JOB from EMP where DEPTNO = 30; --#14

select min(SAL) as "Maþiausias atlyginimas" from EMP; --#15

select min(SAL) as "Maþiausias atlyginimas", max(SAL) as "Didþiausias atlyginimas ", round(avg(SAL),2) as "Vidutinis atlyginimas"  from EMP; --#16

select  JOB, min(SAL) as "Maþiausias atlyginimas", max(SAL) as "Didþiausias atlyginimas " from EMP group by JOB; --#17

select count(JOB) from EMP where JOB like '%MANAGER%'; --#18

select JOB, round(sum(SAL)/count(JOB),2) as "Vidurkis", round(sum(nvl(COMM,0)+SAL)/count(JOB),2) as "Pajamos" from EMP group by JOB; --#19

select (max(SAL)-min(SAL)) as"Skirtumas" from EMP; --#20

select DEPTNO, count(JOB) from EMP group by DEPTNO having count(JOB) > 3; --#21

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


    