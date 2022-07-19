--popp 직원보다 고용일이 최근 (이후)에 고용한 사람
SELECT last_name 이름, hire_date 고용일자
FROM employees
WHERE hire_date> 
(SELECT hire_date FROM employees 
WHERE last_name = 'Popp');

SELECT last_name, job_id, salary
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);
--예제
SELECT last_name, salary
FROM employees
WHERE salary > (SELECT salary FROM employees 
WHERE last_name = 'Abel');

SELECT employee_id 직원번호, last_name 이름, 
department_id 부서번호, salary 급여
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

--HAVING 절 사용한 서브쿼리
SELECT department_id 부서번호, MIN(salary) 최저급여
FROM employees
GROUP BY department_id
HAVING  MIN(salary) >    
                        ( SELECT min(salary)
                          FROM employees
                          WHERE department_id = 50);
                          
--다중행 서브쿼리
--서브쿼리 결과가 여러개의 행으로 출력

--IN연산자
SELECT employee_id, last_name
FROM employees
WHERE salary  IN
                ( SELECT MIN(salary)
                  FROM employees
                  GROUP BY department_id);

--ANY연산자
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ANY
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG'
ORDER BY salary DESC;

--ALL 연산자
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ALL
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

SELECT employee_id, first_name, job_id 직종, salary
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
                      
--서브쿼리 다중열
--WHERE절 열들 수와 서브쿼리에 있는 열들의 수가 같아야 함.
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id) IN  (SELECT manager_id, job_id
                                FROM employees
                                WHERE first_name = 'Bruce')
AND first_name <> 'Bruce';

--각 부서별로 최소 급여를 받는 사원의 정보 검색한다
select department_id 부서번호, employee_id 사원번호,
first_name, salary
from employees
where (department_id, salary) in 
(select department_id, min(salary)  
from employees
group by department_id)
order by department_id;

--예제
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE (job_id, salary) IN (SELECT job_id, MIN(salary)
FROM employees
GROUP BY job_id)
ORDER BY salary DESC;

--집합을 이용 (union, unionall, intersect, minus)
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

--MINUS 차집합
SELECT employee_id, job_id
from employees
MINUS
select employee_id, job_id
from job_history;

--예제
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






                  