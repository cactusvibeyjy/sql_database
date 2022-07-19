--뷰 view = 가상의 테이블
--단순한 뷰 만들기
create view EMP_V1 (직원번호, 이름, 성, 이메일, 고용일, 직종)
as
select employee_id, first_name, last_name, email, hire_date,
job_id
from employees;

select *
from emp_v1;
--뷰에 데이터 입력시, 실제로는 뷰를 만들때 사용한 테이블에 입력됨
--뷰는 실제 저장된 테이블이 아님.
insert into EMP_V1
values (333, '펭수','김', 'peng', sysdate, 'IT_PROG');

SELECT *
from employees
where employee_id =333;

--복잡한 뷰 만들기
--그룹함수를 사용한 뷰는 DML (입력, 삭제, 수정) 불가
--or replace 있으면 수정을 해라라는 명령문
create or replace view 부서별_직원_보고서
as
select department_id 부서번호, count(*) 직원수,
round(avg(salary))평균급여
from employees
group by department_id
order by department_id;
--읽기만 가능한 뷰
--90번 부서 직원들의 읽기 전용 뷰

create or replace view EMP90_read (직원번호, 이름, 성, 이메일,
고용일, 직종)
as 
select employee_id, first_name, last_name, 
email, hire_date,job_id
from employees
where department_id=90
with read only;

select *
from emp90_read;
--DML 작업 안됨

--인덱스 조회하기 (기본키 열은 자동으로 인덱스가 생성됨)
select*
from all_ind_columns
where table_name = 'DEPARTMENTS';--table 이름은 대문자


--인덱스 실습용 테이블 만들기
drop table members;
create table members(
member_id INT,
first_name varchar2(100) not null,
last_name varchar2(100) not null,
gender char(1) not null,
dob date not null,
email varchar2(255) not null,
primary key (member_id));

--라스트 네임으로 검색
explain plan for
select *
from members
where last_name = 'Harse';

--sql 실행보고서 확인
select
plan_table_output
from table(DBMS_xplan.display());

--인덱스 만들기
create index member_last_name_i
on members(last_name);
--인덱스 조회하기
select*
from all_ind_columns
where table_name = 'MEMBERS';
--인덱스 삭제하기
drop index member_last_name_i;

--멀티 인덱스 (열1, 열2,...) 여러 열을 같이 인덱스
create index members_name_i
on members(last_name, first_name);

select*
from all_ind_columns
where table_name = 'MEMBERS';

--검색하기
explain plan for
select * from members
where last_name LIKE'A%' AND first_name LIKE 'M%';
--sql 실행보고서 확인
select
plan_table_output
from table(DBMS_XPLAN.DISPLAY());

--시퀀스 생성
create sequence 시퀀스1;
drop sequence TLZNJSTM1;

--시퀀스 정보 확인
select * 
from USER_SEQUENCES
WHERE SEQUENCE_NAME = '시퀀스1';

--시퀀스 사용법 (.NEXTVAL = 다음 시퀀스 값 1씩 증가, 
--CURRVAL = 현재값을 나타냄)
select 시퀀스1.NEXTVAL FROM DUAL;
select 시퀀스1.CURRVAL FROM DUAL;

CREATE TABLE 직원(
emp_id NUMBER(6) PRIMARY KEY,
name VARCHAR2(50)
);

--시퀀스를 이용해서 직원의 ID를 입력
--십만부터 시작하고 10씩 증가하는 시퀀스 2 생성
CREATE SEQUENCE 시퀀스2
START WITH 100000
INCREMENT BY 10;
--직원 테이블에 입력하기
INSERT INTO 직원
VALUES (시퀀스2.NEXTVAL, '펭수');
INSERT INTO 직원
VALUES (시퀀스2.NEXTVAL, '길동');
INSERT INTO 직원
VALUES (시퀀스2.NEXTVAL, '길수');
INSERT INTO 직원
VALUES (시퀀스2.NEXTVAL, '펭현');
INSERT INTO 직원
VALUES (시퀀스2.NEXTVAL, '펭펭');
DROP SEQUENCE 시퀀스1;
CREATE SEQUENCE 시퀀스1;
SELECT* FROM 직원;

--EMP_ID 직원번호를 시퀀스1로 업데이트
UPDATE 직원
SET emp_id = 시퀀스1.NEXTVAL;

--로우넘 ROWNUM
--상위 순위 1부터 출력
SELECT ROWNUM, EMP.*
FROM EMP
WHERE ROWNUM <=5;


--중간 순위 6~10 번째 (FROM 절 서브쿼리로 AS RN 을 준 뒤,
-- WHERE 절에서 RN 중간 값 입력
SELECT E.* 
FROM (SELECT ROWNUM AS RN, EMP.* FROM EMP) E
WHERE RN BETWEEN 6 AND 10;
--정렬한뒤 순서매겨서 중간번호 출력하기
SELECT ROWNUM, EMP.*
FROM EMP
WHERE ROWNUM <=5
ORDER BY sal DESC;
--직원들 중 월급이 많은 사람 top5

select * from emp order by sal desc;
--서브쿼리 정렬을 먼저하고 rownum으로 원하는 순서 제한

SELECT ROWNUM, A.*
FROM
(SELECT EMPNO, ENAME, SAL FROM EMP ORDER BY SAL DESC) A
WHERE ROWNUM <=5;




