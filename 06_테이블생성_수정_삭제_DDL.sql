CREATE TABLE 테스트 
(
  문자열 VARCHAR2(100),
  숫자 NUMBER,
  날짜 DATE DEFAULT SYSDATE);

INSERT INTO 테스트 
VALUES ('하나', 1, sysdate);
INSERT INTO 테스트 
VALUES ('둘', 2, sysdate);
INSERT INTO 테스트 
VALUES ('셋', 3, sysdate);
INSERT INTO 테스트 
VALUES ('넷', 4, sysdate);

SELECT *
FROM 테스트;

--테이블 삭제하기 DROP

DROP TABLE TEST;
DROP TABLE 테스트;

--예제
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

--제약조건 추가
CREATE TABLE 수업 
(
  CNO VARCHAR2(2),
 CNAME VARCHAR2(20) 
);
INSERT INTO 수업 VALUES ('01', '데이터베이스');
INSERT INTO 수업 VALUES ('02', '프로그래밍');
INSERT INTO 수업 VALUES ('03', '자바');
SELECT * FROM 수업;

CREATE TABLE 학생(
sno varchar2 (4),
sname varchar2(50),
cno varchar2(2));

INSERT INTO 학생 VALUES ('0414', '홍길동', '01');
INSERT INTO 학생 VALUES ('0415', '임꺽정', '02');
INSERT INTO 학생 VALUES ('0416', '이순신', '03');
select * from 학생;
--위에서 만든 수업 학생 테이블에 제약조건을 추가
--수업 테이블에 기본키 추가

alter table 수업
add constraint class_cno_pk primary key(cno);
--학생테이블에 기본키 추가
alter table 학생
add constraint student_cno_pk primary key(sno);


--unique추가
alter table 수업
add constraint class_cname_uk unique(cname);
--학생 테이블에 notnull 추가
alter table 학생
modify sname constraint student_sname_nn NOTNULL;
--외래키를 학생테이블에 추가
alter table 학생
add constraint student_cno_fk foreign key(cno)
references 수업(cno);

--제약조건 삭제 primary key (pk) / unique key(uk)
--키만 적고 삭제 가능 (테이블당 하나밖에 없기 때문)

--수업테이블 제약 조건 삭제 
--cascade 는 삭제시 관계되는 제약조건을 함께 삭제 할 수 있다.
alter table 수업
drop primary key cascade;
--unique 삭제

alter table 수업
drop unique (cname);

--not null 삭제
alter table 학생
drop constraint STUDENT_SNAME_NN;
alter table 학생
drop primary key;

--create table (테이블 이름)as select 문
--select문의 결과를 새로 만들 테이블에 저장
create table EMP_TEMP
AS
SELECT * from employees 
where 1<>1; 
--항상거짓이므로 직원 테이블의 열구조만 복사되어 저장됨

--원하는 열과 행만 복사하기
create table EMP80
AS
SELECT employee_id 직원번호, last_name 이름,
salary*12 연봉,
hire_date 고용일자
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


