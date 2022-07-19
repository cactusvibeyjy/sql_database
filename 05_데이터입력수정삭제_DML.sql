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
values  (207, '펭수', '김','peng', '515.129.1234', 
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

--데이터의 수정
--UPDATE / SET / WHERE 조건절을 넣어 특정한 정보만 변경가능 
--WHERE 조건절이 없으면 모든 행의 정보가 수정되버림

--예제

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
--rollback그 전 commit 상태로 돌아간다
--commit 영구저장
ROLLBACK;
commit;


--DELETE FROM 데이터 삭제 WHERE 조건절로 특정한 데이터만 지우기
--WHERE 절에 서브쿼리 사용가능

--오류보고 중 FK 경우, 
--외래키 에러 => 다른 레코드가 사용하고 있기때문
DELETE FROM departments
WHERE department_name ='Music';

DELETE FROM departments
WHERE department_id IN
(SELECT department_id 
FROM departments
WHERE department_name
LIKE '%Dept%');

--ROLLBACK 수정한 모든 DML 작업을 원상태로 복구

--문자형 데이터타입 VARCHAR2
DESC test;
INSERT INTO TEST
VALUES (1, 'abcdefghij1234567890');

--VALUES (2, 'abcdefghij12345678901');
--oracle 에서 한글은 한자에 3바이트/ 영어, 숫자는 1바이트
INSERT INTO TEST
VALUES (2, '가나다라마바');


INSERT INTO TEST
VALUES (4, '현재날짜입력', SYSDATE);
INSERT INTO TEST
VALUES (5, '문자열로입력', '22/03/07');
INSERT INTO TEST (id, name)
VALUES (6, '현재날짜입력');

SELECT *
FROM test;

DELETE FROM test;

--DDL 테이블 만들기 / 수정
--create / alter / drop
--테이블 생성시 문자로만 시작 가능, 영어로만 생성가능
--테이블 이름 중복 불가능 / 명령어를 테이블 이름으로 생성 불가능


