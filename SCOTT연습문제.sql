SELECT empno, ename, sal
FROM EMP 
WHERE DEPTNO = 10;

SELECT ename, hiredate, deptno
FROM EMP
WHERE empno=7369;

SELECT*
FROM EMP
WHERE ename = 'ALLEN';

SELECT ename, deptno, sal
FROM EMP
WHERE hiredate = '81/02/20';

SELECT *
FROM EMP
WHERE job != 'MANAGER';

SELECT *
FROM EMP
WHERE hiredate >= '81/04/02';

SELECT ename, sal, deptno
FROM EMP
WHERE SAL >= 800;

SELECT *
FROM EMP
WHERE DEPTNO >=20;

SELECT*
FROM EMP
WHERE ename > 'L';

SELECT*
FROM EMP
WHERE hiredate< '81/12/09';

SELECT empno, ename
FROM EMP
WHERE empno<=7698;

SELECT ename, sal, deptno, hiredate
FROM EMP
WHERE hiredate >= '81/04/02' AND hiredate  <= '82/12/09';

SELECT ename, job, sal
FROM EMP
WHERE sal > 1600 AND sal < 3000;

SELECT *
FROM EMP
WHERE empno NOT BETWEEN 7654 AND 7782;

SELECT*
FROM EMP
WHERE ename BETWEEN 'B' AND 'J';

SELECT*
FROM EMP
WHERE TO_CHAR(hiredate, 'YYYY') != 1981; 

SELECT*
FROM EMP
WHERE job IN ('MANAGER', 'SALESMAN');

SELECT ename, empno, deptno
FROM EMP
WHERE deptno NOT IN (20, 30);

SELECT empno, ename, hiredate, deptno
FROM EMP
WHERE ename LIKE 'S%';

SELECT *
FROM EMP
WHERE TO_CHAR(hiredate, 'YYYY')= 1981;

SELECT *
FROM EMP
WHERE ename LIKE '%S%';

SELECT *
FROM EMP
WHERE ename LIKE 'M____N';

SELECT *
FROM EMP
WHERE ename LIKE '_A%';

SELECT *
FROM EMP
WHERE comm IS NULL;

SELECT ename, deptno, sal
FROM EMP
WHERE deptno = 30 AND sal >= 1500;

SELECT empno, ename, deptno
FROM EMP
WHERE ename LIKE 'K%' OR deptno=30;

SELECT *
FROM EMP
WHERE deptno = 30 AND sal >= 1500 AND job='MANAGER';

SELECT *
FROM EMP
WHERE deptno = 30 
ORDER BY deptno;

SELECT *
FROM EMP
ORDER BY sal DESC;

SELECT *
FROM EMP
ORDER BY deptno ASC, sal DESC ;

SELECT deptno, ename, sal
FROM EMP
ORDER BY deptno DESC, ename, sal DESC;

SELECT ename, sal, ROUND(sal*0.13) bonus, deptno
FROM EMP
WHERE deptno=10;

SELECT ename, sal, NVL(comm,0), 
(sal+NVL(comm,0))Total, deptno
FROM EMP
ORDER BY Total DESC;

SELECT ename �̸�, sal �޿�, 
TO_CHAR (sal*0.15, '$999.9') ȸ��
FROM EMP
WHERE sal BETWEEN 1500 AND 3000;
--36��
SELECT dname, 
count(*) �����
FROM emp e, dept d
where e.deptno = d.deptno
GROUP BY dname
HAVING count(e.empno)>5;
--36��
SELECT dname, 
COUNT(*) �����
FROM EMP e
JOIN DEPT d
ON e.deptno = d.deptno
GROUP BY dname
HAVING COUNT(e.empno) >5;

SELECT job, 
SUM(sal) �޿��հ�
FROM EMP
WHERE job != 'SALESMAN'
GROUP BY job
HAVING SUM(sal)>5000;

SELECT empno �����ȣ, ename �����, sal �޿�, grade �޿����
,losal, hisal
FROM EMP
JOIN salgrade
ON sal BETWEEN losal and hisal;

SELECT deptno �μ��ѹ�,
COUNT(*) �����, COUNT(comm) Ŀ�̼ǹ��������
FROM emp
GROUP BY deptno;

--SCOTT 40��

SELECT
    ename, deptno,
    decode(deptno, 10, '�ѹ���',
                   20, '���ߺ�',
                       '������'
                        )�μ���              
FROM emp;   

SELECT ename, deptno,
CASE deptno
WHEN 10 THEN '�ѹ���'
WHEN 20 THEN '���ߺ�'
ELSE '������'
END "�μ���"
FROM EMP;


--HR���� ��������
SELECT
TO_CHAR(hire_date, 'YYYY') �Ի�⵵, 
AVG(salary) ��ձ޿�
FROM employees e
JOIN jobs j
ON e.job_id= j.job_id
WHERE j.job_title = 'Sales Manager'
GROUP BY  TO_CHAR(hire_date, 'YYYY')
ORDER BY TO_CHAR(hire_date, 'YYYY');


SELECT city, ROUND(AVG(salary)),COUNT(*)
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON l.location_id = d.location_id
GROUP BY city
HAVING not COUNT(*)>=10
ORDER BY ROUND(AVG(salary));

SELECT e.employee_id, e.last_name, e.salary, 
m.last_name, m.salary
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;


SELECT d.department_name, 
COUNT(*) �����
FROM departments d
JOIN employees e
ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY ����� DESC;

SELECT d.department_name, ROUND(AVG(e.salary), -1) ��ձ޿�
FROM departments d
JOIN employees e
ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY ��ձ޿� DESC ;

SELECT job_title,(AVG(e.salary)) ��ձ޿� 
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
GROUP BY job_title
ORDER BY ��ձ޿� DESC;

SELECT
sub.job_title, avg_sal
from (select e.job_id, max(j.job_title) job_title,
avg(e.salary) avg_sal 
from Employees e inner join Jobs j 
on e.job_id = j.job_id
group by e.job_id
order by avg_sal desc) sub
where rownum <= 7;

SELECT e.employee_id, e.last_name, e.salary
FROM employees e
JOIN employees m
ON m.employee_id = e.manager_id
WHERE e.salary> m.salary;

SELECT CONCAT(CONCAT(first_name,' '), last_name), salary
FROM employees;

SELECT e.first_name||' '||e.last_name, e.salary
FROM employees e
JOIN jobs j
ON j.job_id = e.job_id
WHERE j.job_title = 'Sales Representative' 
AND e.salary BETWEEN 9000 AND 10000
ORDER BY e.salary DESC;

SELECT  J.JOB_TITLE, E.SALARY*12 ����
FROM EMPLOYEES E
JOIN JOBS J
ON J.JOB_ID = E.JOB_ID
WHERE SALARY*12 >=30000
ORDER BY SALARY*12 DESC;

SELECT A.*
from (select l.city ����, round(AVG(e.salary)) ��ձ޿�
FROM employees e
inner JOIN departments d
ON d.department_id = e.department_id
inner JOIN locations l
ON l.location_id = d.LOCATION_ID
group by l.city
order by ��ձ޿� DESC)A
WHERE rownum <=3;

--7��

select 
TO_CHAR(e.hire_date, 'YYYY') hire_year, 
round(AVG(e.salary))
from employees e
JOIN jobs j
on e.job_id = j.job_id
where j.job_title = 'Sales Manager'
group by to_char(e.hire_date, 'YYYY')
order by to_char(e.hire_date, 'YYYY');

--9��
SELECT l.city, ROUND(AVG(e.salary)), COUNT (*) �����
FROM employees e
JOIN departments d
on e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
HAVING COUNT (*) <10
GROUP BY l.city
ORDER BY ROUND(AVG(e.salary));

--10
SELECT e.employee_id, e.first_name||' '||e.last_name �̸�
FROM employees e
JOIN job_history h
ON e.employee_id = h.employee_id
JOIN jobs j
ON j.job_id = h.job_id
WHERE j.job_title = 'Public Accountant';

--11
SELECT e.employee_id ���, e.first_name �̸�, e.last_name ��, 
NVL(d.department_name,'<Not Assigned>') �μ���
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
WHERE TO_CHAR(hire_date, 'YYYY') = 2007
order by ���;

--12
SELECT dd.department_name, ee.employee_id, 
ee.last_name,  min_sal
    FROM 
        (select e.department_id, MIN(e.salary) min_sal
        from employees e
        where e.department_id is not null
        group by e.department_id) A
    JOIN employees ee
    ON A.department_id = ee.department_id
    and ee.salary = A.min_sal
    JOIN departments dd
    ON ee.department_id = dd.department_id
ORDER by ee.department_id, ee.last_name;


select dd.department_name, ee.employee_id, ee.last_name, min_sal
  from (select e.department_id, min(e.salary) min_sal
          from Employees e
         where e.department_id is not null
         group by e.department_id) A 
join Employees ee 
on A.department_id = ee.department_id
and ee.salary = sub.min_sal
join Departments dd
on ee.department_id = dd.department_id
order by ee.department_id, ee.last_name;


--13��
select B.last_name, first_name, salary
from (
    SELECT ROWNUM as RN, A.last_name, first_name, salary 
    FROM (
    SELECT* FROM employees ORDER BY salary DESC
    ) A
    )B
WHERE RN BETWEEN 6 and 10 ;

--14
select e.first_name, e.salary, d.department_name
from employees e
JOIN departments d
ON e.department_id=d.department_id
WHERE department_name = 'Sales' and 
e.salary < (select avg(salary) from Employees 
            where department_id = 100);

--15
SELECT d.department_name,
to_char(e.hire_date,'MM'), COUNT(*)
from employees e
JOIN departments d
ON e.department_id = d.department_id
group by d.department_name, to_char(e.hire_date, 'MM')
having COUNT(*) >=5
order by department_name;

--16
select A.*
from (select d.department_name, e.first_name, e.salary ����,
commission_pct Ŀ�̼�
from employees e
join departments d
on e.department_id = d.department_id
WHERE commission_pct is not null
order by Ŀ�̼� desc, salary desc
) A
WHERE rownum <=4;










