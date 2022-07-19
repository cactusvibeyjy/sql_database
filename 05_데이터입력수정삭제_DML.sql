INSERT INTO  departments(department_id, department_name,
manager_id, location_id)
VALUES (300, 'GAME', 100, 1700);

SELECT*
FROM departments
WHERE department_id=300;

DESCRIBE departments;

INSERT INTO departments(department_id, department_name)
VALUES (280, 'Music');

SELECT *
FROM departments
WHERE department_id = 280;

DELETE FROM employees
WHERE first_name = 'JB';

INSERT INTO employees
values  (207, '���', '��','peng', '515.129.1234', 
SYSDATE, 'IT_PROG', 9999, NULL, 205, 300);

INSERT INTO departments (department_id, department_name,
manager_id, location_id)
VALUES (271, 'Simple Dept 1', 200, 1700);

INSERT INTO departments (department_id, department_name,
manager_id, location_id)
VALUES (272, 'Simple Dept 2', 200, 1700);

INSERT INTO departments (department_id, department_name,
manager_id, location_id)
VALUES (273, 'Simple Dept 3', 200, 1700);

SELECT department_id, department_name,
manager_id, location_id
FROM departments
WHERE manager_id = 200;

--�������� ����
--UPDATE / SET / WHERE �������� �־� Ư���� ������ ���氡�� 
--WHERE �������� ������ ��� ���� ������ �����ǹ���

--����

UPDATE departments
SET manager_id = 100
WHERE department_id BETWEEN 150 AND 200;

UPDATE departments
SET manager_id = 200, location_id = 1700
WHERE department_name = 'Music';

SELECT department_id, department_name, manager_id
FROM departments
WHERE department_id BETWEEN 150 AND 200;

UPDATE employees
SET salary = 100;

SELECT salary
FROM employees;
--rollback�� �� commit ���·� ���ư���
--commit ��������
ROLLBACK;
commit;


--DELETE FROM ������ ���� WHERE �������� Ư���� �����͸� �����
--WHERE ���� �������� ��밡��

--�������� �� FK ���, 
--�ܷ�Ű ���� => �ٸ� ���ڵ尡 ����ϰ� �ֱ⶧��
DELETE FROM departments
WHERE department_name ='Music';

DELETE FROM departments
WHERE department_id IN
(SELECT department_id 
FROM departments
WHERE department_name
LIKE '%Dept%');

--ROLLBACK ������ ��� DML �۾��� �����·� ����

--������ ������Ÿ�� VARCHAR2
DESC test;
INSERT INTO TEST
VALUES (1, 'abcdefghij1234567890');

--VALUES (2, 'abcdefghij12345678901');
--oracle ���� �ѱ��� ���ڿ� 3����Ʈ/ ����, ���ڴ� 1����Ʈ
INSERT INTO TEST
VALUES (2, '�����ٶ󸶹�');


INSERT INTO TEST
VALUES (4, '���糯¥�Է�', SYSDATE);
INSERT INTO TEST
VALUES (5, '���ڿ����Է�', '22/03/07');
INSERT INTO TEST (id, name)
VALUES (6, '���糯¥�Է�');

SELECT *
FROM test;

DELETE FROM test;

--DDL ���̺� ����� / ����
--create / alter / drop
--���̺� ������ ���ڷθ� ���� ����, ����θ� ��������
--���̺� �̸� �ߺ� �Ұ��� / ��ɾ ���̺� �̸����� ���� �Ұ���


