--형 변환함수 TO_CHAR, TO_NUMBER,TO_DATE

--날짜를 문자로 TO_CHAR(값, 형식)

SELECT TO_CHAR(sysdate) FROM dual;
SELECT TO_CHAR(sysdate,'YY-MM-DD HH24:MI:ss') FROM dual;

--사용하고싶은 문자가 있다면 ""로 묶어 전달합니다.
--'YYYY"년"'

--숫자를 문자로 TO_CHAR(값, 형식)

SELECT TO_CHAR(20000,'99999') FROM dual;

--주어진 자릿수에 숫자를 모두 표기할 수 없어서 모두 #으로 표기됩니다.

SELECT TO_CHAR(20000,'9999') FROM dual;
SELECT TO_CHAR(20000.29,'99999.9') FROM dual;
SELECT TO_CHAR(20000,'$99,999') FROM dual;

--현재 컴기준 나라 화폐기호
SELECT TO_CHAR(salary,'L99,999') AS salary
FROM employees;

--문자를 숫자로 TO_NUMBER(값, 형식)
SELECT '2000'+2000 FROM dual;

SELECT TO_NUMBER('2000')+2000 FROM dual;
SELECT To_NUMBER('$3,300','$9,999')+2000 FROM dual;

--문자를 날짜로 변환하는 함수 TO_DATE(값, 형식)
SELECT TO_DATE('2023-04-13') FROM dual;
SELECT sysdate - TO_DATE('2021-03-26') FROM dual;
SELECT TO_DATE('2021-03-26','YY-MM-DD') FROM dual;

--주어진 문자열을 모두 변환해야 합니다.
SELECT TO_DATE('2021-03-26 12:23:50','YY-MM-DD HH:MI:SS') FROM dual;

--XXXX년 XX월 XX일 문자열 형식으로 변환해보세요
-- 조회 컬럼명은 dateInfo 라고 하겠습니다.

SELECT TO_CHAR(TO_DATE(20050102),'YYYY"년 "MM"월 "DD"일"') AS dateInfo FROM dual;

--NULL 제거 함수 NVL(컬럼, 변환할 타겟값)
SELECT null FROM dual;
SELECT NVL(Null,0) FROM dual;

SELECT
    first_name,
    NVL(commission_pct,0) AS comm_pct
FROM employees;

--NULL 제거 함수 NVL2(컬럼, null이 아닐경우의 값, null일 경우의 값)

SELECT NVL2(Null,'널아님','널임') FROM dual;

SELECT
    first_name,
    commission_pct, 
    NVL2(commission_pct,salary + (salary*commission_pct),salary) AS real_salary
FROM employees;

--DECODE(컬럼 혹은 표현식, 항목1, 결과1, 항목2, 결과2 .....default)
SELECT
    DECODE('C','A','A입니다.','B','B입니다','C','C입니다','모르겠는데요' )
FROM dual;

SELECT
job_id,
salary,
    DECODE(
        job_id,
        'IT_PROG',salary*1.1,
        'FI_MGR',salary*1.2,
        'AD_VP',salary*1.3) AS result
FROM employees;

-- CASE WHEN THEN END
SELECT
    first_name,
    job_id,
    salary,
    (CASE job_id
        WHEN 'IT_PROG' THEN salary*1.1
        WHEN 'FI_MGR' THEN salary*1.2
        WHEN 'AD_VP' THEN salary*1.3
        ELSE salary END)
FROM employees;

--문제 1
SELECT 
employee_id AS 사원번호,
CONCAT(first_name, last_name) AS 사원명,
hire_date AS 입사일자,
TRUNC((sysdate-hire_date)/365) as 근속년수
FROM employees
WHERE (sysdate-hire_date)/365 >=17
ORDER BY 근속년수 DESC;

--문제 2
SELECT
first_name ||' '|| last_name AS 이름,
manager_id,
(CASE department_id
        WHEN 100 THEN '사원'
        WHEN 120 THEN '주임'
        WHEN 121 THEN '대리'
        WHEN 122 THEN '과장'
        ELSE '임원' END)
FROM employees;

------------------------------------------------------
SELECT
    salary,
    employee_id,
    first_name,
    DECODE( --디코드는 범위및 식안됨
        TRUNC(salary/1000),
        0,'E',
        1,'D',
        2,'C',
        3,'B',
        'A'        
    ) AS grade
FROM employees
ORDER BY salary DESC;

SELECT
    salary,
    employee_id,
    first_name,
    (CASE
        WHEN salary BETWEEN 0 AND 999 THEN 'E'
        WHEN salary BETWEEN 1000 AND 1999 THEN 'D'
        WHEN salary BETWEEN 2000 AND 2999 THEN 'C'
        WHEN salary BETWEEN 3000 AND 3999 THEN 'B'
        ELSE 'A' END
    
    )AS grade
FROM employees
ORDER BY salary DESC;
