--1. ������ �� 3���� ����ϴ� �͸� ����� ������. (��¹� 9���� �����ؼ�)
SET SERVEROUTPUT ON;

DECLARE
    tnum NUMBER;
BEGIN
    tnum :=3;
    DBMS_OUTPUT.put_line('3*1 :'|| TO_CHAR(tnum*1));
    DBMS_OUTPUT.put_line('3*2 :'|| TO_CHAR(tnum*2));
    DBMS_OUTPUT.put_line('3*3 :'|| TO_CHAR(tnum*3));
    DBMS_OUTPUT.put_line('3*4 :'|| TO_CHAR(tnum*4));
    DBMS_OUTPUT.put_line('3*5 :'|| TO_CHAR(tnum*5));
    DBMS_OUTPUT.put_line('3*6 :'|| TO_CHAR(tnum*6));
    DBMS_OUTPUT.put_line('3*7 :'|| TO_CHAR(tnum*7));
    DBMS_OUTPUT.put_line('3*8 :'|| TO_CHAR(tnum*8));
    DBMS_OUTPUT.put_line('3*9 :'|| TO_CHAR(tnum*9));    
END;

DECLARE
    v_emp_name employees.first_name%TYPE;
    v_emp_email employees.email%TYPE;
BEGIN
    SELECT
    first_name, email
    INTO v_emp_name,v_emp_email
    FROM employees   
    WHERE employee_id = 201;    
    DBMS_OUTPUT.put_line(v_emp_name);
    DBMS_OUTPUT.put_line(v_emp_email); 
END;

--3��
DECLARE
    maxNum number;
BEGIN 
    SELECT MAX(employee_id)
    INTO maxNum
    FROM employees;        
    INSERT INTO emps
    (employee_id, last_name, email, hire_date, job_id)
    VALUES(maxNum+1,'steaven','steavenjobs',sysdate,'CEO');
    COMMIT;
END;

SELECT * FROM emps;


