--새로운 사용자 만들기 (오라클 관리자로 접속)
CREATE USER john IDENTIFIED BY 1234;
--접속권한을 주는 방법 
GRANT CREATE SESSION TO john;
--권한들의 묶음 role, CONNECT, RESOURCE, DBA 그 중에
--CONNECT, RESOURCE를 신규 유저에게 주기
GRANT CONNECT, RESOURCE TO john;
--테이블 생성 권한
GRANT CREATE TABLE TO john;

--뷰 생성 권한 주기
GRANT CREATE VIEW TO john;
--권한을 회수 삭제 방법
--revoke 권한명 from 계정

REVOKE CREATE VIEW FROM john;
REVOKE CREATE TABLE FROM john;
--개체 생성 삭제 권한 제거하기
REVOKE RESOURCE FROM john;
--계정삭제 (관련된 모든 내용 삭제)
DROP USER john CASCADE;

--PL / SQL
--익명 블록
SET SERVEROUTPUT ON;
-- 출력을 위한 옵션

BEGIN
    DBMS_OUTPUT.PUT_LINE('헬로우월드!');
END;
/
--DECLARE 옵션 = 변수 선언
DECLARE
message VARCHAR2(100) := '변수에 입력';
BEGIN
    DBMS_OUTPUT.PUT_LINE(message);
END;
/

--변수 선언
DECLARE
v_name emp.ename%TYPE;
BEGIN
v_name := '홍길동';
DBMS_OUTPUT.PUT_LINE (v_name);
END;
/
--프로시저
CREATE OR REPLACE PROCEDURE update_sal 
 (in_empno IN NUMBER)      
 IS 
 BEGIN 
   UPDATE emp 
   SET sal = sal  * 1.1 
   WHERE empno = in_empno; 
--commit;
 END update_sal;
 /
 execute update_sal(7369);
 
EXECUTE update_sal(7369);
EXEC UPDATE_sal(7499);
/
-- adjust_salary(직원번호, 임금인상률%)
CREATE OR REPLACE PROCEDURE adjust_salary(
    in_empno IN emp.empno%TYPE,
    in_percent IN NUMBER
) IS
BEGIN
-- 직원번호의 임금을 in_percent% 만큼 올림
   UPDATE emp
   SET sal = sal + sal * in_percent / 100
   WHERE empno = in_empno;
--commit;
END;
/

-- king 직원의 월급을 10% 인상하라
EXECUTE adjust_salary(7839, 50);
update emp
set sal=5000
where empno = 7839;

update emp
set sal = 800
where empno = 7369;
commit;

--테스트 테이블에 100개의 데이터 입력
DECLARE
    v_cnt NUMBER := 1;
BEGIN
    LOOP
        INSERT INTO TEST(ID, name)
        VALUES(v_cnt, '테스트'||to_char(v_cnt));
        v_cnt := v_cnt+1;
        EXIT WHEN v_cnt > 100;
        --변수의 개수가 100개가 넘으면 종료됨
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('데이터 입력 완료');
    DBMS_OUTPUT.PUT_LINE(v_cnt-1 || '개의 데이터가 입력되었습니다');

END; 
/
