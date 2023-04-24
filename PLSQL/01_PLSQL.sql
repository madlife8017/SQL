/*
PL/SQL
-오라클에서 제공하는 SQL 프로그래밍 기능이다.
-일반적인 프로그래밍과는 차이가 있지만, 오라클 내부에서 적절한 처리를 위해
적용해 줄 수 있는 절차지향적 코드 작성 방식입니다.
- 쿼리분의 집합으로 어떠한 동작을 일괄 처리하기 위한 용도로 사용합니다.
*/


SET SERVEROUTPUT ON; 
DECLARE
    emp_num NUMBER;
BEGIN
    emp_num :=10;
    DBMS_OUTPUT.put_line(emp_num);
    DBMS_OUTPUT.put_line('Hello pl.sql');
END; 

--**제곱

DECLARE
    A NUMBER :=2**2*3**2;
BEGIN
 DBMS_OUTPUT.put_line('A : '|| TO_CHAR(A));
END;

/*
-DML 문
DDL문은 사용이 불가능하고, 일반적으로 SQL
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
