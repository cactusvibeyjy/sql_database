
SELECT department_name as "�μ��̸�"
FROM departments;
--�켱 ���̺���� from�� ���� ctrl + space �ڵ����� �� �̸��� �ҷ��´�.
SELECT 
department_id �μ���ȣ, 
department_name �μ��̸�
FROM departments;

--�������̺� ����
SELECT
 salary
 FROM employees;
-- ��ü ���� ���� +100 �߰� �ؼ� �� �� ����� 
 SELECT last_name �̸�, salary ����, salary + 100 ���ʽ�����
 
 FROM employees;
-- ���� 10���� �谨 �� ���� �� �����
SELECT last_name �̸�, salary ����, salary - (salary*0.1) �谨�ȿ���
 
 FROM employees;
--�ߺ� �� (DISTINCT)���� 
--������ ������ ��ȸ
SELECT job_id ����
FROM employees;
SELECT DISTINCT job_id ����
FROM employees;

SELECT employee_id, first_name, last_name
FROM employees;
SELECT  first_name, salary, salary*1.1 AS ��������
FROM employees;
SELECT employee_id �����ȣ, first_name �̸�, last_name ��
FROM employees;

-- ���Ῥ���ڸ� ����Ͽ� ���� ���� �����
SELECT last_name || ' is a ' || job_id as ��������
FROM employees;

SELECT employee_id, first_name||' '|| last_name Ǯ����, email||'@company.com' as �̸���

FROM employees;
DESCRIBE employees;
--���� �� where
SELECT *
 FROM employees
 WHERE salary>14000;
 SELECT*
 FROM employees
 WHERE last_name = 'King'; 
-- ���ڿ��� '' �ѵ���ǥ �� ���̰� ��ҹ��ڸ� ����
SELECT
*
 FROM employees
 WHERE employee_id = 100;

SELECT
*
 FROM employees
 WHERE first_name = 'David';
 SELECT
*
 FROM employees
 WHERE employee_id <=105;
 
 SELECT
*
 FROM job_history
 WHERE start_date > '06/03/03';
-- ��¥ ���� / ���ڿ��� �ν� '' ���δ�.
SELECT *
FROM departments
WHERE location_id <> 1700;
--��������
SELECT last_name, department_id, salary
FROM employees
WHERE department_id = 60 or department_id=80;

 SELECT
*
 FROM employees
 WHERE salary > 4000
 AND job_id = 'IT_PROG';
 
 SELECT*
 FROM employees
 WHERE (job_id = 'IT_PROG'
 OR job_id='FI_ACCOUNT')
 AND salary > 4000;

--80�� �μ��̸鼭 ������ 10000���� ���� ���� �Ǵ� 60�� �μ� ����->�켱 �˻� ��ȣ�� �׷�ȭ�ϱ�
 SELECT*
 FROM employees
 WHERE department_id =60 OR (department_id=80 AND salary > 10000);

-- or �����ڰ� �������϶��� in ���ڻ� Ȥ�� not in�����ڸ� �� �� �ִ�
 SELECT*
 FROM employees
 WHERE department_id not in (30, 50,80, 100, 110);
-- BETWEEN ������ �ʰ��� �̸��� ǥ������ ����.
SELECT*
FROM employees
WHERE salary BETWEEN 10000 AND 20000;
SELECT*
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '04/12/30';
SELECT*
FROM employees
WHERE salary NOT BETWEEN 7000 AND 17000;
--LIKE ������ ���ڿ� ��ȸ�� ��Ȯ���� ���� ��� ���'%'
--���� B �� �����ϴ� ��� ����
SELECT*
FROM employees
WHERE last_name LIKE 'B%';
--'%_%' �� �յڿ� ���� ��쿡�� ���̰��� ������ ���� ��ȸ
SELECT*
FROM employees
WHERE last_name LIKE '%b%';
--%�� �տ� ���� ��쿡�� �� �ޱ��ڰ� ������ ������ ���
SELECT*
FROM employees
WHERE last_name LIKE '%y';

SELECT*
FROM employees
WHERE job_id LIKE '%AD%';

SELECT*
FROM employees
WHERE job_id LIKE '%AD___';

SELECT*
FROM employees
WHERE phone_number LIKE '%1234';

SELECT*
FROM employees
WHERE phone_number NOT LIKE '%3%' AND phone_number LIKE '%9';

SELECT*
FROM employees
WHERE job_id LIKE '%MGR%' OR job_id LIKE '%ASST%';

--IS NULL ������ 
SELECT*
FROM employees
WHERE commission_pct IS NULL;
SELECT*
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT*
FROM employees
WHERE manager_id IS NULL;

--ORDER BY ��ɹ��� ����Ͽ� �࿡ ���� ���� ������ ���� [ASC or DESC]
SELECT*
FROM employees
ORDER BY last_name DESC;

SELECT department_id, employee_id, first_name, last_name
FROM employees
ORDER BY department_id, employee_id;

SELECT department_id, last_name, salary*12 ����
FROM employees
ORDER BY ����;

SELECT department_id, last_name, salary*12 ����
FROM employees
ORDER BY 3 DESC;

SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;

SELECT *
FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY salary DESC;

SELECT *
FROM employees
WHERE employee_id BETWEEN 120 AND 150
ORDER BY department_id DESC, salary DESC;



