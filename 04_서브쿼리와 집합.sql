--popp �������� ������� �ֱ� (����)�� ����� ���
SELECT last_name �̸�, hire_date �������
FROM employees
WHERE hire_date> 
(SELECT hire_date FROM employees 
WHERE last_name = 'Popp');

SELECT last_name, job_id, salary
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);
--����
SELECT last_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees 
WHERE last_name = 'Abel');

SELECT employee_id ������ȣ, last_name �̸�, 
department_id �μ���ȣ, salary �޿�
FROM employees
WHERE salary > (SELECT salary FROM employees 
WHERE last_name = 'Bull')
AND department_id = (SELECT department_id
FROM employees
WHERE last_name = 'Bull');


SELECT last_name, salary, manager_id
FROM employees
WHERE manager_id = (SELECT employee_id FROM employees
WHERE last_name = 'Russell');

SELECT *
FROM employees
WHERE job_id = (SELECT job_id FROM jobs
WHERE job_title = 'Stock Manager');

--HAVING �� ����� ��������
SELECT department_id �μ���ȣ, MIN(salary) �����޿�
FROM employees
GROUP BY department_id
HAVING  MIN(salary) >    
                        ( SELECT min(salary)
                          FROM employees
                          WHERE department_id = 50);
                          
--������ ��������
--�������� ����� �������� ������ ���

--IN������
SELECT employee_id, last_name
FROM employees
WHERE salary  IN
                ( SELECT MIN(salary)
                  FROM employees
                  GROUP BY department_id);

--ANY������
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ANY
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG'
ORDER BY salary DESC;

--ALL ������
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ALL
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

SELECT employee_id, first_name, job_id ����, salary
FROM employees
WHERE manager_id IN (SELECT manager_id
 FROM employees WHERE department_id = 20)
 AND department_id<>20;
 
 SELECT employee_id, last_name, job_id, salary
 FROM employees
 WHERE salary < ANY (SELECT salary FROM employees
 WHERE job_id = 'ST_MAN')
 ORDER BY salary, last_name DESC;
 
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ALL
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'IT_PROG')
                      AND job_id <> 'IT_PROG';
                      
--�������� ���߿�
--WHERE�� ���� ���� ���������� �ִ� ������ ���� ���ƾ� ��.
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id) IN  (SELECT manager_id, job_id
                                FROM employees
                                WHERE first_name = 'Bruce')
AND first_name <> 'Bruce';

--�� �μ����� �ּ� �޿��� �޴� ����� ���� �˻��Ѵ�
select department_id �μ���ȣ, employee_id �����ȣ,
first_name, salary
from employees
where (department_id, salary) in 
(select department_id, min(salary)  
from employees
group by department_id)
order by department_id;

--����
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE (job_id, salary) IN (SELECT job_id, MIN(salary)
FROM employees
GROUP BY job_id)
ORDER BY salary DESC;

--������ �̿� (union, unionall, intersect, minus)
--UNION
SELECT employee_id, job_id
from employees
UNION
select employee_id, job_id
from job_history;

--INTERSECT
SELECT employee_id, job_id
from employees
INTERSECT
select employee_id, job_id
from job_history;

--MINUS ������
SELECT employee_id, job_id
from employees
MINUS
select employee_id, job_id
from job_history;

--����
SELECT department_id
from employees
UNION
select department_id
from departments;

SELECT department_id
from employees
UNION ALL
select department_id
from departments;

SELECT department_id
from employees
INTERSECT
select department_id
from departments;

SELECT department_id
from departments
MINUS
select department_id
from employees;






                  