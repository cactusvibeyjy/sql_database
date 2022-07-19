--�����Լ� (aggregate function)
SELECT AVG(salary), MAX(salary),
       MIN(salary), SUM(salary)
FROM employees
WHERE job_id LIKE '%REP%';

SELECT COUNT(commission_pct)
FROM employees
WHERE department_id = 80;

--DISTINCT ��������
SELECT COUNT(DISTINCT department_id)
FROM employees;

SELECT COUNT(DISTINCT department_id)
FROM employees;
--���հ��� AVG
SELECT AVG(commission_pct)
FROM employees;
-- NVL ������ ��ȯ�Ͽ� ��� ���ϱ�
SELECT AVG(NVL(commission_pct, 0))
FROM employees;

--�� �μ��� ��ձ޿� GROUP BY
SELECT department_id �μ���, ROUND(AVG(salary)) ��ձ޿�
       --TO_CHAR(ROUND(AVG(salary)), '$99,999') �޷�ǥ��
FROM employees
GROUP BY department_id
ORDER BY �μ���;

--����
SELECT  department_id �μ���,
COUNT(*) �����,
MAX(salary) �ִ�޿�, MIN(salary) �ּұ޿�, 
SUM(salary) �޿��հ�, ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id
ORDER BY �޿��հ� DESC;

SELECT department_id �μ���ȣ, job_id ������,
SUM(salary),
COUNT(*) ������
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id ASC;

SELECT 
ROUND(AVG(MAX(salary))) �μ����ְ�������, 
AVG(MIN(salary)) �μ��������������
FROM employees
GROUP BY department_id;

--HAVING �׷�����
SELECT department_id �μ���, COUNT(*) �����
FROM employees
GROUP BY department_id
HAVING COUNT(*)>5;
--����
SELECT job_id ����, 
SUM(salary) ���޿��հ�
FROM employees
WHERE job_id<>'AC_MGR'
GROUP BY job_id
HAVING(AVG(salary)) > 10000
ORDER BY ���޿��հ� DESC;

SELECT department_id �μ���ȣ, 
ROUND(AVG(salary)) ��ձ޿�
FROM employees
WHERE department_id<>40
GROUP BY department_id
--HAVING ROUND(AVG(salary))<=7000;
HAVING 7000>=ROUND(AVG(salary));
--=��ȣ�� �׻� �ε�ȣ �����ʿ� ��ġ

SELECT job_id ����, 
SUM(salary) �޿��Ѿ�
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary)>=13000
ORDER BY �޿��Ѿ� DESC;

--JOIN�Լ�
SELECT employee_id, first_name, job_id, job_title
FROM employees
NATURAL JOIN jobs;

SELECT e.employee_id ������ȣ, e.last_name �����̸�, 
e.department_id �μ���ȣ, d.department_name �μ���
FROM employees e JOIN departments d
ON e.department_id = d.department_id;


--����
SELECT department_name �μ���, city ��Ƽ��,
country_name ������
FROM departments D
JOIN locations l
ON d.location_id = l.location_id
JOIN countries c
ON l.country_id = c.country_id
WHERE l.city IN ('Seattle', 'London') 
AND c.country_name LIKE 'United%';

--�� JOIN �ٸ� �ΰ��� ���̺��� ��ġ�� �κ��� ���Ͽ� 
--�ϳ��� ���̺�� ����

--JOIN -Self Join ����-��������
SELECT e.last_name ����, m.last_name �Ŵ���
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id;

--JOIN -Outer Join (�ܺ�����)
--LEFT
SELECT e.last_name ����, e.department_id �μ���ȣ, 
d.department_name �μ���
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;

--RIGHT
SELECT e.last_name ����, d.department_id �μ���ȣ, 
d.department_name �μ���
FROM employees e
RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id;

--FULL
SELECT e.last_name ����, e.department_id �μ���ȣ, 
d.department_name �μ���
FROM employees e
FULL OUTER JOIN departments d
ON e.department_id = d.department_id;

SELECT c.country_name ����, c.country_id ������ȣ, 
l.location_id ������ȣ, l.city ����
FROM countries c
LEFT OUTER JOIN locations l
ON l.country_id = c.country_id
ORDER BY l.location_id DESC;

--�������� (Cross Join)
SELECT country_name  ����, region_name  �����̸�
FROM countries 
CROSS JOIN regions ;



