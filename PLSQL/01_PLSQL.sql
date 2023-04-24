/*
PL/SQL
-����Ŭ���� �����ϴ� SQL ���α׷��� ����̴�.
-�Ϲ����� ���α׷��ְ��� ���̰� ������, ����Ŭ ���ο��� ������ ó���� ����
������ �� �� �ִ� ���������� �ڵ� �ۼ� ����Դϴ�.
- �������� �������� ��� ������ �ϰ� ó���ϱ� ���� �뵵�� ����մϴ�.
*/


SET SERVEROUTPUT ON; 
DECLARE
    emp_num NUMBER;
BEGIN
    emp_num :=10;
    DBMS_OUTPUT.put_line(emp_num);
    DBMS_OUTPUT.put_line('Hello pl.sql');
END; 

--**����

DECLARE
    A NUMBER :=2**2*3**2;
BEGIN
 DBMS_OUTPUT.put_line('A : '|| TO_CHAR(A));
END;

/*
-DML ��
DDL���� ����� �Ұ����ϰ�, �Ϲ������� SQL
*/

DECLARE
    v_emp_name employees.first_name%TYPE;
    v_dep_name departments.department_name%TYPE;
BEGIN
    SELECT
        e.first_name,
        d.department_name
    INTO v_emp_name,v_dep_name
    FROM employees e    
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    WHERE employee_id=100;    
    dbms_output.put_line(v_emp_name || '-' ||v_dep_name);
END;
