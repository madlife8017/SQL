--while��
DECLARE
    v_num NUMBER :=3;
    v_count NUMBER :=1;
BEGIN
    WHILE v_count<=10
    LOOP
        dbms_output.put_line(v_num);
        v_count := v_count +1;
    END LOOP;    
END;

--Ż�⹮
DECLARE
    v_num NUMBER :=3;
    v_count NUMBER :=1;
BEGIN
    WHILE v_count<=10
    LOOP
        dbms_output.put_line(v_num);
        EXIT WHEN v_count = 5;
        v_count := v_count +1;
    END LOOP;    
END;

--FOR��
DECLARE
    v_num NUMBER :=3;
BEGIN
    FOR i IN 1..9 --. �� �ΰ� �ۼ��ؼ� ������ ǥ��.
    LOOP
        dbms_output.put_line(v_num||'x'||i||'='||v_num*i);
    END LOOP;
END;

--countinue
DECLARE
    v_num NUMBER :=3;
BEGIN
    FOR i IN 1..9 --. �� �ΰ� �ۼ��ؼ� ������ ǥ��.
    LOOP
        dbms_output.put_line(v_num||'x'||i||'='||v_num*i);
    END LOOP;
END;

--1. ��� �������� ����ϴ� �͸� ����� ���弼��.

DECLARE
BEGIN
    FOR i IN 2..9 --. �� �ΰ� �ۼ��ؼ� ������ ǥ��.
        LOOP
            FOR j IN 1..9 --. �� �ΰ� �ۼ��ؼ� ������ ǥ��.
            LOOP
            dbms_output.put_line(i||'x'||j||'='||i*j);
            END LOOP;
             dbms_output.put_line('');
    END LOOP;
END;

--2. INSERT�� 300�� �����ϴ� �͸� ����� ó���ϼ���.
-- board��� �̸��� ���̺��� ���弼�� (bno,writer,title �÷�������)
-- bno�� sequence�� �÷� �ֽð�, writer�� title��ȣ�� �ٿ��� insert����
-- ex) 1, test1, title1 -> 2 test2 title2 -> 3 test3 title3


CREATE TABLE board(
    bno NUMBER(4),
    writer VARCHAR2(10),
    title VARCHAR2(10)    
);

CREATE SEQUENCE seq
    START WITH 1 -- ���۰� (�⺻���� ������ �� �ּҰ�, ������ �� �ִ밪)
    INCREMENT BY 1 -- ������ (����� ����, ������ ����, �⺻�� 1)
    MAXVALUE 300 -- �ִ밪(�⺻���� ���� 1027, ������ �� -1)
    MINVALUE 1 -- �ּҰ�(�⺻�� ������ �� 1, ������ �� -1028)
    NOCACHE -- ĳ�ø޸� ��� ���� (CACHE) 
    NOCYCLE; -- ��ȯ ���� (NOCYCLE�� �⺻, ��ȯ��Ű���� CYCLE)

DECLARE
    v_num NUMBER :=1;
BEGIN
    FOR i IN 1..300 --. �� �ΰ� �ۼ��ؼ� ������ ǥ��.
    LOOP
        INSERT INTO board (bno, writer, title)
        VALUES (seq.NEXTVAL,'writer'||TO_CHAR(i),'title'||TO_CHAR(i));
    END LOOP;
END;

SELECT * FROM board;
