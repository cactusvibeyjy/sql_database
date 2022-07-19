--단일행 함수
--문자함수
--대소문자 변환함수
SELECT UPPER('SQL Course'), LOWER ('SQL Course'), INITCAP('SQL Course')
FROM dual; --듀얼 테스트용 테이블 (1행만 나옴)을 이용하여 연습

--문자조작 함수
SELECT CONCAT('헬로우', '월드')
FROM dual;
SELECT CONCAT('헬로우', '월드'),
SUBSTR('ABCDEFG',3,4),
LENGTH('ABCDEFG'),
INSTR('ABCDEFG','D')
FROM dual;
--공백없애기 TRIM (문자열) 앞뒤의 공백을 제거
SELECT
TRIM('  헬로우  '), '  헬로우  '
FROM DUAL;
--대소문자 섞여 있을때 LOWER OR UPPER 사용하여 변환하여 조회가능
--문자형 함수 예제

--문자열바꾸기
SELECT job_id, REPLACE (job_id, 'ACCOUNT', 'ACCNT') 적용결과
FROM employees;

--예제
SELECT last_name, email,
LOWER(last_name), UPPER(last_name), INITCAP(email)
FROM employees;

SELECT job_id,
SUBSTR(job_id,1,2)
FROM employees;

--숫자형 함수
--숫자를 반올림 ROUND
SELECT ROUND(15.193, 1), ROUND(15.193,-1)
FROM DUAL;

--숫자를 절삭 TRUNC
SELECT TRUNC(15.79,1), TRUNC(15.79, 0), TRUNC(15.79, -1)
FROM DUAL;
--MOD 함수 사용하여 짝수인 직원들을 정렬
SELECT employee_id 짝수, last_name
FROM employees
WHERE MOD (employee_id, 2)=0
ORDER BY employee_id;

--예제
SELECT salary, last_name,
ROUND(salary/30, 0) 정수, ROUND(salary/30, 1) 소수점첫째, 
ROUND(salary/30, -1) "10의 자리"
FROM employees
ORDER BY salary DESC;

--날짜함수
--SELECT ROUND(sysdate, 'DD') 일, ROUND(sysdate, 'MM') 월, ROUND(sysdate, 'YYYY'') 년도,
--MONTHS_BETWEEN('2017/10/10', )
SELECT department_id, sysdate, hire_date,
MONTHS_BETWEEN(SYSDATE, hire_date)
FROM employees
WHERE department_id = 100;

SELECT hire_date,
ADD_MONTHS(hire_date, 3) 더하기_3개월,
ADD_MONTHS(hire_date, -3) 빼기_3개월
FROM employees
WHERE employee_id BETWEEN 100 AND 106;

--변환형
SELECT employee_id,
TO_CHAR(hire_date, 'MM/YYYY')
FROM employees
WHERE department_id=100;

SELECT last_name 이름, TO_CHAR (salary, '$99,999.99') 월급
FROM employees
WHERE salary>10000 
ORDER BY salary DESC;

--TO_NUMBER 
SELECT TO_NUMBER('01210616')
FROM dual;

--NVL => NULL 값 변환 함수
SELECT last_name, NVL (manager_id, 30) 매니저
from employees
where last_name = 'King';

--NVL2 (expr, expr1, expr2) => expr 값이 NULL이 아닐결우 
--expr1로 반환 -> 아닐 경우 다음 expr 2 로 반환
SELECT last_name, NVL2(manager_id, 1, 0) 매니저
FROM employees
WHERE last_name = 'King';

--예제
SELECT 
last_name 이름, salary 월급, 
NVL(commission_pct, 0) 커미션, 
(salary*12) + (salary*12*NVL((commission_pct),0))연봉
FROM employees
ORDER BY salary DESC;

SELECT last_name 이름, salary 월급, 
NVL(commission_pct, 0) 커미션, 
(salary*12) + (salary*12*NVL((commission_pct),0))연봉,
NVL2(commission_pct, 'SAL+COMM', 'SAL') 연봉계산방법
FROM employees
ORDER BY salary DESC;

--DECODE & CASE 함수
SELECT last_name 이름, job_id, salary,
    DECODE(job_id, 'IT_PROG',  salary * 1.10,
                   'ST_CLERK', salary * 1.15,
                   'SA_REP',   salary * 1.20,
                               salary)  "수정월급"
FROM employees;

SELECT last_name 이름, job_id 직무, salary 월급,
    DECODE(TRUNC(salary/2000), 0, 0,
                               1, 0.09,
                               2, 0.2,
                               3, 0.3,
                               4, 0.4,
                               5, 0.42,
                               6, 0.44,
                               0.45) 세율 
FROM employees
ORDER BY 월급 DESC;


--CASE 함수
SELECT last_name 이름, job_id, salary,
   CASE job_id  WHEN 'IT_PROG'   THEN salary * 1.10
                WHEN 'ST_CLERK'  THEN salary * 1.15
                WHEN 'SA_REP'    THEN salary * 1.20
                ELSE                  salary  
   END "월급 수정"
FROM employees;

SELECT last_name 이름, job_id, salary,
    CASE  WHEN salary<5000   THEN 'Low'
          WHEN salary<10000  THEN 'Medium'
          WHEN salary<20000  THEN 'Good'
          ELSE                    'Excellent'  
    END "급여 수준"
FROM employees;

SELECT first_name, last_name, job_id, salary,
    CASE  WHEN salary>=9000  THEN '상위급여'
          WHEN salary>=6000   THEN '중위급여'
         
          ELSE '하위급여'
          END 급여등급
FROM employees
WHERE job_id='IT_PROG'; 

