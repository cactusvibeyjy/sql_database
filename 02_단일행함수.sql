--������ �Լ�
--�����Լ�
--��ҹ��� ��ȯ�Լ�
SELECT UPPER('SQL Course'), LOWER ('SQL Course'), INITCAP('SQL Course')
FROM dual; --��� �׽�Ʈ�� ���̺� (1�ุ ����)�� �̿��Ͽ� ����

--�������� �Լ�
SELECT CONCAT('��ο�', '����')
FROM dual;
SELECT CONCAT('��ο�', '����'),
SUBSTR('ABCDEFG',3,4),
LENGTH('ABCDEFG'),
INSTR('ABCDEFG','D')
FROM dual;
--������ֱ� TRIM (���ڿ�) �յ��� ������ ����
SELECT
TRIM('  ��ο�  '), '  ��ο�  '
FROM DUAL;
--��ҹ��� ���� ������ LOWER OR UPPER ����Ͽ� ��ȯ�Ͽ� ��ȸ����
--������ �Լ� ����

--���ڿ��ٲٱ�
SELECT job_id, REPLACE (job_id, 'ACCOUNT', 'ACCNT') ������
FROM employees;

--����
SELECT last_name, email,
LOWER(last_name), UPPER(last_name), INITCAP(email)
FROM employees;

SELECT job_id,
SUBSTR(job_id,1,2)
FROM employees;

--������ �Լ�
--���ڸ� �ݿø� ROUND
SELECT ROUND(15.193, 1), ROUND(15.193,-1)
FROM DUAL;

--���ڸ� ���� TRUNC
SELECT TRUNC(15.79,1), TRUNC(15.79, 0), TRUNC(15.79, -1)
FROM DUAL;
--MOD �Լ� ����Ͽ� ¦���� �������� ����
SELECT employee_id ¦��, last_name
FROM employees
WHERE MOD (employee_id, 2)=0
ORDER BY employee_id;

--����
SELECT salary, last_name,
ROUND(salary/30, 0) ����, ROUND(salary/30, 1) �Ҽ���ù°, 
ROUND(salary/30, -1) "10�� �ڸ�"
FROM employees
ORDER BY salary DESC;

--��¥�Լ�
--SELECT ROUND(sysdate, 'DD') ��, ROUND(sysdate, 'MM') ��, ROUND(sysdate, 'YYYY'') �⵵,
--MONTHS_BETWEEN('2017/10/10', )
SELECT department_id, sysdate, hire_date,
MONTHS_BETWEEN(SYSDATE, hire_date)
FROM employees
WHERE department_id = 100;

SELECT hire_date,
ADD_MONTHS(hire_date, 3) ���ϱ�_3����,
ADD_MONTHS(hire_date, -3) ����_3����
FROM employees
WHERE employee_id BETWEEN 100 AND 106;

--��ȯ��
SELECT employee_id,
TO_CHAR(hire_date, 'MM/YYYY')
FROM employees
WHERE department_id=100;

SELECT last_name �̸�, TO_CHAR (salary, '$99,999.99') ����
FROM employees
WHERE salary>10000 
ORDER BY salary DESC;

--TO_NUMBER 
SELECT TO_NUMBER('01210616')
FROM dual;

--NVL => NULL �� ��ȯ �Լ�
SELECT last_name, NVL (manager_id, 30) �Ŵ���
from employees
where last_name = 'King';

--NVL2 (expr, expr1, expr2) => expr ���� NULL�� �ƴҰ�� 
--expr1�� ��ȯ -> �ƴ� ��� ���� expr 2 �� ��ȯ
SELECT last_name, NVL2(manager_id, 1, 0) �Ŵ���
FROM employees
WHERE last_name = 'King';

--����
SELECT 
last_name �̸�, salary ����, 
NVL(commission_pct, 0) Ŀ�̼�, 
(salary*12) + (salary*12*NVL((commission_pct),0))����
FROM employees
ORDER BY salary DESC;

SELECT last_name �̸�, salary ����, 
NVL(commission_pct, 0) Ŀ�̼�, 
(salary*12) + (salary*12*NVL((commission_pct),0))����,
NVL2(commission_pct, 'SAL+COMM', 'SAL') ���������
FROM employees
ORDER BY salary DESC;

--DECODE & CASE �Լ�
SELECT last_name �̸�, job_id, salary,
    DECODE(job_id, 'IT_PROG',  salary * 1.10,
                   'ST_CLERK', salary * 1.15,
                   'SA_REP',   salary * 1.20,
                               salary)  "��������"
FROM employees;

SELECT last_name �̸�, job_id ����, salary ����,
    DECODE(TRUNC(salary/2000), 0, 0,
                               1, 0.09,
                               2, 0.2,
                               3, 0.3,
                               4, 0.4,
                               5, 0.42,
                               6, 0.44,
                               0.45) ���� 
FROM employees
ORDER BY ���� DESC;


--CASE �Լ�
SELECT last_name �̸�, job_id, salary,
   CASE job_id  WHEN 'IT_PROG'   THEN salary * 1.10
                WHEN 'ST_CLERK'  THEN salary * 1.15
                WHEN 'SA_REP'    THEN salary * 1.20
                ELSE                  salary  
   END "���� ����"
FROM employees;

SELECT last_name �̸�, job_id, salary,
    CASE  WHEN salary<5000   THEN 'Low'
          WHEN salary<10000  THEN 'Medium'
          WHEN salary<20000  THEN 'Good'
          ELSE                    'Excellent'  
    END "�޿� ����"
FROM employees;

SELECT first_name, last_name, job_id, salary,
    CASE  WHEN salary>=9000  THEN '�����޿�'
          WHEN salary>=6000   THEN '�����޿�'
         
          ELSE '�����޿�'
          END �޿����
FROM employees
WHERE job_id='IT_PROG'; 

