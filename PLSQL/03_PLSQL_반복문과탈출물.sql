--while문
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

--탈출문
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

--FOR문
DECLARE
    v_num NUMBER :=3;
BEGIN
    FOR i IN 1..9 --. 을 두개 작성해서 범위를 표현.
    LOOP
        dbms_output.put_line(v_num||'x'||i||'='||v_num*i);
    END LOOP;
END;

--countinue
DECLARE
    v_num NUMBER :=3;
BEGIN
    FOR i IN 1..9 --. 을 두개 작성해서 범위를 표현.
    LOOP
        dbms_output.put_line(v_num||'x'||i||'='||v_num*i);
    END LOOP;
END;

--1. 모든 구구단을 출력하는 익명 블록을 만드세요.

DECLARE
BEGIN
    FOR i IN 2..9 --. 을 두개 작성해서 범위를 표현.
        LOOP
            FOR j IN 1..9 --. 을 두개 작성해서 범위를 표현.
            LOOP
            dbms_output.put_line(i||'x'||j||'='||i*j);
            END LOOP;
             dbms_output.put_line('');
    END LOOP;
END;

--2. INSERT를 300번 실행하는 익명 블록을 처리하세요.
-- board라는 이름의 테이블을 만드세요 (bno,writer,title 컬럼이존재)
-- bno는 sequence로 올려 주시고, writer와 title번호를 붙여서 insert진행
-- ex) 1, test1, title1 -> 2 test2 title2 -> 3 test3 title3


CREATE TABLE board(
    bno NUMBER(4),
    writer VARCHAR2(10),
    title VARCHAR2(10)    
);

CREATE SEQUENCE seq
    START WITH 1 -- 시작값 (기본값은 증가할 때 최소값, 감소할 때 최대값)
    INCREMENT BY 1 -- 증가값 (양수면 증가, 음수면 감소, 기본값 1)
    MAXVALUE 300 -- 최대값(기본값은 증가 1027, 감소일 때 -1)
    MINVALUE 1 -- 최소값(기본값 증가일 때 1, 감소일 때 -1028)
    NOCACHE -- 캐시메모리 사용 여부 (CACHE) 
    NOCYCLE; -- 순환 여부 (NOCYCLE이 기본, 순환시키려면 CYCLE)

DECLARE
    v_num NUMBER :=1;
BEGIN
    FOR i IN 1..300 --. 을 두개 작성해서 범위를 표현.
    LOOP
        INSERT INTO board (bno, writer, title)
        VALUES (seq.NEXTVAL,'writer'||TO_CHAR(i),'title'||TO_CHAR(i));
    END LOOP;
END;

SELECT * FROM board;
