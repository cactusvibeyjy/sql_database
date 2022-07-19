DESCRIBE emp;

SELECT deptno, job
FROM EMP
WHERE deptno = 30 and job = 'SALESMAN';

SELECT *
FROM emp
WHERE sal between 2000 and 3000;

create table EMP_TEMP
AS
SELECT * from emp 
where 1<>1; 

INSERT INTO emp_temp (EMPNO, ENAME, JOB, MGR, HIREDATE,
SAL, COMM, DEPTNO)
VALUES ('9999', '홍길동', 'PRESIDENT', 
'', '2001/01/01', '5000', '1000', '10'); 

DROP TABLE DEPT_TEMP2;
create table DEPT_TEMP2
AS
SELECT * from DEPT;

describe dept_temp2;

UPDATE DEPT_TEMP2
SET dname = 'DATABASE', loc='SEOUL'
WHERE deptno = 40;

select ename 
from emp
where ename = UPPER('smith');


SELECT *
FROM emp
WHERE LENGTH(ename) <=4;
--11
SELECT SUBSTR (job,1, 3)
FROM emp;


--12
SELECT *
FROM emp
WHERE hiredate > '1981/06/01';

--13
SELECT empno 사원번호, ename 사원이름, sal 월급,
NVL(comm, 0) 추가수당, sal*12+NVL(comm,0) ANNSAL
FROM emp;
--14
select COUNT( DISTINCT job) 
FROM emp;

--15
SELECT e.ename 사원이름, d.dname 부서이름
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE e.sal >=3000;

--16
SELECT *
FROM emp
WHERE sal >(select sal from emp WHERE ename = 'MARTIN')
            ;
            
--17
SELECT *
from emp
WHERE
sal > (select MAX(sal) from emp
            where deptno = 30);
            
--18
SELECT*
FROM emp
JOIN salgrade
ON sal BETWEEN losal AND hisal
WHERE deptno = 30 and grade =3;
--19
CREATE TABLE EMP_DDL(
EMPNO NUMBER(4),
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR NUMBER(4),
HIREDATE DATE,
SAL NUMBER(7,2),
COMM NUMBER(7,2),
DEPTNO NUMBER(2)
);
DESCRIBE EMP_DDL;

--20
CREATE OR REPLACE VIEW EMP_V3
(직원번호,이름,직업, 고용일자, 월급, 부서번호)
AS
SELECT empno, ename, job, hiredate, sal, deptno
FROM emp;



CREATE VIEW EMP_V3 
AS
SELECT empno, ename, job, 
hiredate, sal, deptno
FROM emp;

/
FROM emp;
AS
SELECT empno, ename, job, 
hiredate, sal, deptno
FROM emp;