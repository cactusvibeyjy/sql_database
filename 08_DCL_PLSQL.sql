--���ο� ����� ����� (����Ŭ �����ڷ� ����)
CREATE USER john IDENTIFIED BY 1234;
--���ӱ����� �ִ� ��� 
GRANT CREATE SESSION TO john;
--���ѵ��� ���� role, CONNECT, RESOURCE, DBA �� �߿�
--CONNECT, RESOURCE�� �ű� �������� �ֱ�
GRANT CONNECT, RESOURCE TO john;
--���̺� ���� ����
GRANT CREATE TABLE TO john;

--�� ���� ���� �ֱ�
GRANT CREATE VIEW TO john;
--������ ȸ�� ���� ���
--revoke ���Ѹ� from ����

REVOKE CREATE VIEW FROM john;
REVOKE CREATE TABLE FROM john;
--��ü ���� ���� ���� �����ϱ�
REVOKE RESOURCE FROM john;
--�������� (���õ� ��� ���� ����)
DROP USER john CASCADE;

--PL / SQL
--�͸� ���
SET SERVEROUTPUT ON;
-- ����� ���� �ɼ�

BEGIN
    DBMS_OUTPUT.PUT_LINE('��ο����!');
END;
/
--DECLARE �ɼ� = ���� ����
DECLARE
message VARCHAR2(100) := '������ �Է�';
BEGIN
    DBMS_OUTPUT.PUT_LINE(message);
END;
/

--���� ����
DECLARE
v_name emp.ename%TYPE;
BEGIN
v_name := 'ȫ�浿';
DBMS_OUTPUT.PUT_LINE (v_name);
END;
/
--���ν���
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
-- adjust_salary(������ȣ, �ӱ��λ��%)
CREATE OR REPLACE PROCEDURE adjust_salary(
    in_empno IN emp.empno%TYPE,
    in_percent IN NUMBER
) IS
BEGIN
-- ������ȣ�� �ӱ��� in_percent% ��ŭ �ø�
   UPDATE emp
   SET sal = sal + sal * in_percent / 100
   WHERE empno = in_empno;
--commit;
END;
/

-- king ������ ������ 10% �λ��϶�
EXECUTE adjust_salary(7839, 50);
update emp
set sal=5000
where empno = 7839;

update emp
set sal = 800
where empno = 7369;
commit;

--�׽�Ʈ ���̺� 100���� ������ �Է�
DECLARE
    v_cnt NUMBER := 1;
BEGIN
    LOOP
        INSERT INTO TEST(ID, name)
        VALUES(v_cnt, '�׽�Ʈ'||to_char(v_cnt));
        v_cnt := v_cnt+1;
        EXIT WHEN v_cnt > 100;
        --������ ������ 100���� ������ �����
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('������ �Է� �Ϸ�');
    DBMS_OUTPUT.PUT_LINE(v_cnt-1 || '���� �����Ͱ� �ԷµǾ����ϴ�');

END; 
/
