
SELECT department_name as "부서이름"
FROM departments;
--우선 테이블명을 from에 적고 ctrl + space 자동으로 열 이름을 불러온다.
SELECT 
department_id 부서번호, 
department_name 부서이름
FROM departments;

--직원테이블 월급
SELECT
 salary
 FROM employees;
-- 전체 직원 월급 +100 추가 해서 새 열 만들기 
 SELECT last_name 이름, salary 월급, salary + 100 보너스월급
 
 FROM employees;
-- 월급 10프로 삭감 새 월급 열 만들기
SELECT last_name 이름, salary 월급, salary - (salary*0.1) 삭감된월급
 
 FROM employees;
--중복 값 (DISTINCT)제거 
--직업의 종류만 조회
SELECT job_id 직업
FROM employees;
SELECT DISTINCT job_id 직업
FROM employees;

SELECT employee_id, first_name, last_name
FROM employees;
SELECT  first_name, salary, salary*1.1 AS 뉴셀러리
FROM employees;
SELECT employee_id 사원번호, first_name 이름, last_name 성
FROM employees;

-- 연결연산자를 사용하여 정보 열을 만들기
SELECT last_name || ' is a ' || job_id as 직업정보
FROM employees;

SELECT employee_id, first_name||' '|| last_name 풀네임, email||'@company.com' as 이메일

FROM employees;
DESCRIBE employees;
--조건 절 where
SELECT *
 FROM employees
 WHERE salary>14000;
 SELECT*
 FROM employees
 WHERE last_name = 'King'; 
-- 문자열은 '' 한따옴표 꼭 붙이고 대소문자를 가림
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
-- 날짜 사이 / 문자열로 인식 '' 붙인다.
SELECT *
FROM departments
WHERE location_id <> 1700;
--논리연산자
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

--80번 부서이면서 월급이 10000보다 많은 직원 또는 60번 부서 직원->우선 검색 괄호로 그룹화하기
 SELECT*
 FROM employees
 WHERE department_id =60 OR (department_id=80 AND salary > 10000);

-- or 연사자가 여러개일때는 in 연자사 혹은 not in연산자를 쓸 수 있다
 SELECT*
 FROM employees
 WHERE department_id not in (30, 50,80, 100, 110);
-- BETWEEN 연산자 초과와 미만은 표현하지 못함.
SELECT*
FROM employees
WHERE salary BETWEEN 10000 AND 20000;
SELECT*
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '04/12/30';
SELECT*
FROM employees
WHERE salary NOT BETWEEN 7000 AND 17000;
--LIKE 연산자 문자열 조회시 명확하지 않을 경우 사용'%'
--성이 B 로 시작하는 모든 직원
SELECT*
FROM employees
WHERE last_name LIKE 'B%';
--'%_%' 가 앞뒤에 있을 경우에는 사이값에 있으면 전부 조회
SELECT*
FROM employees
WHERE last_name LIKE '%b%';
--%가 앞에 있을 경우에는 맨 뒷글자가 값으로 끝나는 경우
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

--IS NULL 연산자 
SELECT*
FROM employees
WHERE commission_pct IS NULL;
SELECT*
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT*
FROM employees
WHERE manager_id IS NULL;

--ORDER BY 명령문을 사용하여 행에 대해 정렬 순서를 지정 [ASC or DESC]
SELECT*
FROM employees
ORDER BY last_name DESC;

SELECT department_id, employee_id, first_name, last_name
FROM employees
ORDER BY department_id, employee_id;

SELECT department_id, last_name, salary*12 연봉
FROM employees
ORDER BY 연봉;

SELECT department_id, last_name, salary*12 연봉
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



