--IF문
DECLARE
    v_num1 NUMBER:=10;
    v_num2 NUMBER:=5;
BEGIN
    IF
        v_num1>=v_num2
    THEN
        dbms_output.put_line(v_num1 ||'이(가) 큰수');
    ELSE
        dbms_output.put_line(v_num1 ||'이(가) 큰수');
    END IF;
END;

--ELSE IF문
DECLARE
    v_salary NUMBER:=0;
    v_department_id NUMBER:=0;
BEGIN
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10,120),-1);
    SELECT salary
    INTO v_salary
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM = 1;
    
    IF v_salary <= 5000 THEN
        dbms_output.put_line('낮음');
    ELSIF v_salary <=9000 THEN
    dbms_output.put_line('중간');
    ELSE
    dbms_output.put_line('높음');
    END IF;    
END;

--중첩 if문
DECLARE
    v_salary NUMBER:=0;
    v_department_id NUMBER:=0;
    v_commission NUMBER:=0;
BEGIN
    v_department_id := ROUND(DBMS_RANDOM.VALUE(10,120),-1);
    SELECT salary
    INTO v_salary
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM = 1;
    
    IF v_salary <= 5000 THEN
        dbms_output.put_line('낮음');
    ELSIF v_salary <=9000 THEN
    dbms_output.put_line('중간');
    ELSE
    dbms_output.put_line('높음');
    END IF;    
END;

