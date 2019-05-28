SELECT 
    ename|| ' is a ' ||job as "Name and Duties"
FROM 
    emp;
    
SELECT 
    INITCAP(ename) "Name"
FROM 
    emp;
    
SELECT 
    LOWER(ename) "Name"
FROM 
    emp;
    
select
    ENAME "Name"
from
	EMP 
where
    UPPER(ename) LIKE 'SMITH';
    
select
    ENAME "Name"
from
	EMP
where
    INSTR(ename, 'L',1,2) > 1;
    
select
    ENAME "Name", LENGTH(ENAME)
from
	EMP;

select
    ENAME "Name", LENGTH(ENAME) "Length"
from
	EMP;

select
    LPAD(ENAME, 15, '*') "Name", LENGTH(ENAME) "Length"
from
	EMP;

select
    INITCAP(RPAD(ENAME,15,'.'))|| LOWER(LPAD(JOB,15,'.')) as "CONCAT"
from
	EMP;
    
select
    LTRIM(RTRIM(ENAME,'S'),'S') "Name" 
from
	EMP;
    
select
	ENAME, replace(JOB,'SALESMAN','SALESPERSON') as JOB
from
	EMP;
    
select
	ENAME, SUBSTR(ENAME,2,2)
from
	EMP;
    

DEFINE kodas = '47812050014'
SELECT 'Gime 19'||SUBSTR(&kodas,2,2)||'.'||SUBSTR(&kodas,4,2)||'.'||SUBSTR(&kodas,6,2)
from
    sys.dual;
    
DEFINE kodas = '47812050014'
SELECT 
    'Gime '||
    CASE
        when SUBSTR(&kodas,1,1) = 3 or SUBSTR(&kodas,1,1) = 4 THEN '19'
        when SUBSTR(&kodas,1,1) = 5 or SUBSTR(&kodas,1,1) = 6 THEN '20'
    END||
    SUBSTR(&kodas,2,2)||'.'||SUBSTR(&kodas,4,2)||'.'||SUBSTR(&kodas,6,2) as "Data"
from
    sys.dual;

select
    to_date('27 vasario 2019','DD MONTH YYYY') "MY DATE", to_char(sysdate,'FMDD-DAY-MONTH-YYYY') "SYS DATE"
from
	sys.dual;
    
SELECT USER
from dual;

SELECT MGR,EMPNO, ENAME,
LEAD (EMPNO,1) OVER (PARTITION BY MGR ORDER BY ENAME) "NEXT_EMPNO"
FROM EMP;


SELECT ENAME, SAL
FROM EMP
WHERE SAL=(SELECT MIN(SAL) 
FROM EMP);

SELECT ENAME, SAL
FROM EMP
WHERE SAL=(SELECT MIN(SAL) 
FROM EMP) AND DEPTNO=20;

SELECT MIN(SAL)
FROM EMP
GROUP BY DEPTNO;

SELECT JOB, MIN(SAL)
FROM EMP
GROUP BY JOB;

SELECT JOB, MIN(SAL)
FROM EMP
GROUP BY JOB
HAVING MIN(SAL) < 1500
ORDER BY JOB;

SELECT JOB, MIN(SAL)
FROM EMP
WHERE SAL > 1500
GROUP BY JOB
ORDER BY JOB;

SELECT JOB, MIN(SAL)
FROM EMP
GROUP BY JOB
HAVING MIN(SAL) > 1500
ORDER BY JOB;

SELECT USER 
FROM DUAL;

select
    to_date('2019 VASARIO 29','YYYY MONTH DD') "MY DATE"
from
	sys.dual;
    
SELECT EMPNO, ENAME, JOB
FROM EMP
UNION
SELECT EMPNO, ENAME, JOB
FROM EMP_courses;

SELECT EMPNO, ENAME, JOB
FROM EMP
UNION ALL
SELECT EMPNO, ENAME, JOB
FROM EMP_courses;

SELECT EMPNO, ENAME, JOB
FROM EMP
MINUS
SELECT EMPNO, ENAME, JOB
FROM EMP_courses;

SELECT EMPNO,ENAME, JOB
FROM EMP
WHERE EMPNO NOT IN(
SELECT EMPNO
FROM EMP_courses);

SELECT EMPNO, ENAME, JOB
FROM EMP
INTERSECT
SELECT EMPNO, ENAME, JOB
FROM EMP_courses;

SELECT EMP.EMPNO, EMP.ENAME, EMP.JOB
FROM EMP, EMP_Courses
WHERE EMP.EMPNO = EMP_COURSES.EMPNO;

SELECT EMP.EMPNO, EMP.ENAME, DEPT.DEPTNO
FROM EMP, DEPT
WHERE DEPT.DEPTNO = EMP.DEPTNO;

SELECT EMP.EMPNO, EMP.ENAME, DEPT.DEPTNO
FROM EMP, DEPT
WHERE DEPT.DEPTNO = EMP.DEPTNO;

SELECT EMP.EMPNO, EMP.ENAME, DEPT.DEPTNO
FROM EMP
INNER JOIN DEPT
ON DEPT.DEPTNO = EMP.DEPTNO;

SELECT EMP.EMPNO, EMP.ENAME, DEPT.DEPTNO
FROM EMP
LEFT JOIN DEPT
ON DEPT.DEPTNO = EMP.DEPTNO;

SELECT EMP.EMPNO, EMP.ENAME, DEPT.DEPTNO
FROM EMP
RIGHT JOIN DEPT
ON DEPT.DEPTNO = EMP.DEPTNO;

SELECT EMP.EMPNO, EMP.ENAME, DEPT.DEPTNO
FROM EMP
FULL OUTER JOIN DEPT
ON DEPT.DEPTNO = EMP.DEPTNO;

SELECT ename, job, sal, dname, loc, DEPT.DEPTNO
FROM Emp INNER JOIN Dept
ON Emp.deptno=Dept.deptno
WHERE sal>2000;

SELECT ename, sal, grade
FROM Emp, Salgrade 
WHERE sal BETWEEN losal and hisal;

SELECT e.empno, e.ename, e.job,
m.empno, m.ename
FROM Emp e INNER JOIN Emp m
ON e.mgr=m.empno;

SELECT grade, COUNT(EMP.SAL) "Employees in Salary Grades"
FROM Emp, Salgrade 
WHERE sal BETWEEN losal and hisal
GROUP BY grade;

SELECT ename, sal from EMP
WHERE sal = (select max(sal) from EMP);

SELECT ename,empno, subquery1.totalsal 
from EMP,
(select mgr, sum(sal) as totalsal 
from EMP
group by mgr) subquery1
WHERE  subquery1.mgr = emp.empno;

SELECT emp.ename, emp.empno, 
  (SELECT SUM(sal) AS totalsal
   FROM EMP vadovai
   WHERE vadovai.mgr = emp.empno) subquery2
FROM EMP
where empno in (select distinct mgr from EMP where mgr is not null);

select distinct mgr from EMP;

with subquery1 AS 
(select mgr, sum(sal) as totalsal 
from EMP
group by mgr)
SELECT ename,empno, subquery1.totalsal
from EMP
Inner JOIN subquery1 on  subquery1.mgr = emp.empno;


with subquery1 AS 
(select mgr
from EMP
group by mgr)
SELECT ename,empno, deptno
from EMP
INNER JOIN subquery1 on  subquery1.mgr = emp.empno
where deptno = 20;
