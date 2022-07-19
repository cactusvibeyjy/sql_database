CREATE TABLE �׽�Ʈ 
(
  ���ڿ� VARCHAR2(100),
  ���� NUMBER,
  ��¥ DATE DEFAULT SYSDATE);

INSERT INTO �׽�Ʈ 
VALUES ('�ϳ�', 1, sysdate);
INSERT INTO �׽�Ʈ 
VALUES ('��', 2, sysdate);
INSERT INTO �׽�Ʈ 
VALUES ('��', 3, sysdate);
INSERT INTO �׽�Ʈ 
VALUES ('��', 4, sysdate);

SELECT *
FROM �׽�Ʈ;

--���̺� �����ϱ� DROP

DROP TABLE TEST;
DROP TABLE �׽�Ʈ;

--����
CREATE TABLE SAMPLE_PRODUCT (
pruduct_id NUMBER, product_name VARCHAR2 (20),
menu_date DATE);

DROP TABLE SAMPLE_PRODUCT;


CREATE TABLE MEMBERS 
(
  MEMBER_ID NUMBER(2), PRIMARY KEY
  FIRST_NAME VARCHAR2(50) NOT NULL, 
  LAST_NAME VARCHAR2(50) NOT NULL,
  GENDER VARCHAR2(5)CHECK (gender IN ('woman', 'man')), 
  BIRTH_DAY DATE DEFAULT SYSDATE, 
  EMAIL VARCHAR2(20) UNIQUE NOT NULL,
);

CREATE TABLE members (
    member_id   NUMBER(2)       PRIMARY KEY,
    first_name  VARCHAR2(50)    NOT NULL,
    last_name   VARCHAR2(50)    NOT NULL,
    gender      VARCHAR2(5)     CHECK (gender IN('Man', 'Woman')),
    birth_day   DATE    DEFAULT SYSDATE,
    email       VARCHAR2(200)   UNIQUE NOT NULL
);

--�������� �߰�
CREATE TABLE ���� 
(
  CNO VARCHAR2(2),
 CNAME VARCHAR2(20) 
);
INSERT INTO ���� VALUES ('01', '�����ͺ��̽�');
INSERT INTO ���� VALUES ('02', '���α׷���');
INSERT INTO ���� VALUES ('03', '�ڹ�');
SELECT * FROM ����;

CREATE TABLE �л�(
sno varchar2 (4),
sname varchar2(50),
cno varchar2(2));

INSERT INTO �л� VALUES ('0414', 'ȫ�浿', '01');
INSERT INTO �л� VALUES ('0415', '�Ӳ���', '02');
INSERT INTO �л� VALUES ('0416', '�̼���', '03');
select * from �л�;
--������ ���� ���� �л� ���̺� ���������� �߰�
--���� ���̺� �⺻Ű �߰�

alter table ����
add constraint class_cno_pk primary key(cno);
--�л����̺� �⺻Ű �߰�
alter table �л�
add constraint student_cno_pk primary key(sno);


--unique�߰�
alter table ����
add constraint class_cname_uk unique(cname);
--�л� ���̺� notnull �߰�
alter table �л�
modify sname constraint student_sname_nn NOTNULL;
--�ܷ�Ű�� �л����̺� �߰�
alter table �л�
add constraint student_cno_fk foreign key(cno)
references ����(cno);

--�������� ���� primary key (pk) / unique key(uk)
--Ű�� ���� ���� ���� (���̺�� �ϳ��ۿ� ���� ����)

--�������̺� ���� ���� ���� 
--cascade �� ������ ����Ǵ� ���������� �Բ� ���� �� �� �ִ�.
alter table ����
drop primary key cascade;
--unique ����

alter table ����
drop unique (cname);

--not null ����
alter table �л�
drop constraint STUDENT_SNAME_NN;
alter table �л�
drop primary key;

--create table (���̺� �̸�)as select ��
--select���� ����� ���� ���� ���̺� ����
create table EMP_TEMP
AS
SELECT * from employees 
where 1<>1; 
--�׻�����̹Ƿ� ���� ���̺��� �������� ����Ǿ� �����

--���ϴ� ���� �ุ �����ϱ�
create table EMP80
AS
SELECT employee_id ������ȣ, last_name �̸�,
salary*12 ����,
hire_date �������
from employees 
where department_id=80; 


create table stmans 
as
select employee_id id, job_id job,
salary sal
from employees
where job_id ='ST_MAN';

select *
from stmans;


