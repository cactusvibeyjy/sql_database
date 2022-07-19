--집계함수 (aggregate function)
SELECT AVG(salary), MAX(salary),
       MIN(salary), SUM(salary)
FROM employees
WHERE job_id LIKE '%REP%';

SELECT COUNT(commission_pct)
FROM employees
WHERE department_id = 80;

--DISTINCT 종류구별
SELECT COUNT(DISTINCT department_id)
FROM employees;

SELECT COUNT(DISTINCT department_id)
FROM employees;
--퍙균값은 AVG
SELECT AVG(commission_pct)
FROM employees;
-- NVL 눌값을 변환하여 평균 구하기
SELECT AVG(NVL(commission_pct, 0))
FROM employees;

--각 부서의 평균급여 GROUP BY
SELECT department_id 부서명, ROUND(AVG(salary)) 평균급여
       --TO_CHAR(ROUND(AVG(salary)), '$99,999') 달러표시
FROM employees
GROUP BY department_id
ORDER BY 부서명;

--예제
SELECT  department_id 부서명,
COUNT(*) 사원수,
MAX(salary) 최대급여, MIN(salary) 최소급여, 
SUM(salary) 급여합계, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
ORDER BY 급여합계 DESC;

SELECT department_id 부서번호, job_id 직업별,
SUM(salary),
COUNT(*) 직원수
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id ASC;

SELECT 
ROUND(AVG(MAX(salary))) 부서별최고월급평균, 
AVG(MIN(salary)) 부서별최저월급평균
FROM employees
GROUP BY department_id;

--HAVING 그룹조건
SELECT department_id 부서명, COUNT(*) 사원수
FROM employees
GROUP BY department_id
HAVING COUNT(*)>5;
--예제
SELECT job_id 직종, 
SUM(salary) 월급여합계
FROM employees
WHERE job_id<>'AC_MGR'
GROUP BY job_id
HAVING(AVG(salary)) > 10000
ORDER BY 월급여합계 DESC;

SELECT department_id 부서번호, 
ROUND(AVG(salary)) 평균급여
FROM employees
WHERE department_id<>40
GROUP BY department_id
--HAVING ROUND(AVG(salary))<=7000;
HAVING 7000>=ROUND(AVG(salary));
--=기호는 항상 부등호 오른쪽에 위치

SELECT job_id 직종, 
SUM(salary) 급여총액
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary)>=13000
ORDER BY 급여총액 DESC;

--JOIN함수
SELECT employee_id, first_name, job_id, job_title
FROM employees
NATURAL JOIN jobs;

SELECT e.employee_id 직원번호, e.last_name 직원이름, 
e.department_id 부서번호, d.department_name 부서명
FROM employees e JOIN departments d
ON e.department_id = d.department_id;


--예제
SELECT department_name 부서명, city 시티명,
country_name 국가명
FROM departments D
JOIN locations l
ON d.location_id = l.location_id
JOIN countries c
ON l.country_id = c.country_id
WHERE l.city IN ('Seattle', 'London') 
AND c.country_name LIKE 'United%';

--비등가 JOIN 다른 두개의 테이블을 겹치는 부분을 합하여 
--하나의 테이블로 조인

--JOIN -Self Join 조인-셀프조인
SELECT e.last_name 직원, m.last_name 매니저
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id;

--JOIN -Outer Join (외부조인)
--LEFT
SELECT e.last_name 직원, e.department_id 부서번호, 
d.department_name 부서명
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;

--RIGHT
SELECT e.last_name 직원, d.department_id 부서번호, 
d.department_name 부서명
FROM employees e
RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id;

--FULL
SELECT e.last_name 직원, e.department_id 부서번호, 
d.department_name 부서명
FROM employees e
FULL OUTER JOIN departments d
ON e.department_id = d.department_id;

SELECT c.country_name 국가, c.country_id 국가번호, 
l.location_id 지역번호, l.city 도시
FROM countries c
LEFT OUTER JOIN locations l
ON l.country_id = c.country_id
ORDER BY l.location_id DESC;

--교차조인 (Cross Join)
SELECT country_name  국가, region_name  지역이름
FROM countries 
CROSS JOIN regions ;



