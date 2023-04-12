--lower(소문자), initcap(앞글자만 대문자), upper(대문자)

SELECT 'abcDEF', lower('abcDEF'), upper('abcDEF')
FROM dual;

SELECT last_name, LOWER(last_name),
INITCAP(last_name), UPPER(last_name)
FROM employees;

SELECT last_name FROM employees
WHERE LOWER(last_name) = 'austin';

--length(길이), instr(문자 찾기,없으면 0을 반환, 있으면 인덱스 값)
SELECT
    'abcdef', LENGTH('abcdef'), INSTR('abcdef','a')
FROM dual;

SELECT
    first_name, LENGTH(first_name), INSTR(first_name,'a')
FROM employees;

--substr(문자열 자르기), concat(문자연결) 1부터 시작.

SELECT
    'abcdef' as ex,
    SUBSTR('abcdedf', 1,4),
    CONCAT('abc','def')--두개만 가능
FROM dual;

SELECT
first_name,
SUBSTR(first_name,1,3),
CONCAT(first_name, last_name)
FROM employees;

--LPAD, RPAD (좌, 우측 지정문자열로 채우기)
SELECT
    LPAD('abc',10,'*'),
    RPAD('abc',10,'*')
FROM dual;

--LTRIM(), RTRIM(), TRIM() 공백제거
--LTRIM(param1, param2) -> param2의 값을 param1에서 찾아서 제거.(왼쪽부터)
--LTRIM(param1, param2) -> param2의 값을 param1에서 찾아서 제거.(오른쪽부터)

SELECT LTRIM('javascript_java','java')FROM dual;
SELECT RTRIM('javascript_java','java')FROM dual;
SELECT TRIM('        java   ')FROM dual;

--replace()
SELECT
    REPLACE('my dream is a president',' ','')--공백제거
FROM dual;

SELECT
    REPLACE(REPLACE('my dream is a president','president','programmer'),' ','')
FROM dual;

SELECT
    REPLACE(CONCAT('hello', 'world!'),'!','?')
FROM dual;

/*
문제 1.
EMPLOYEES 테이블 에서 이름, 입사일자 컬럼으로 변경해서 이름순으로 오름차순 출력 합니다.
조건 1) 이름 컬럼은 first_name, last_name을 붙여서 출력합니다.
조건 2) 입사일자 컬럼은 xx/xx/xx로 저장되어 있습니다. xxxxxx형태로 변경해서 출력합니다.
*/

SELECT *
FROM employees;

SELECT first_name ||' '|| last_name AS 이름,
REPLACE(hire_date,'/','') AS 입사일자
FROM employees
ORDER BY 이름 ASC;


SELECT first_name ||' '|| last_name AS 이름,
REPLACE(phone_number,(SUBSTR(phone_number, 1,4)),'(02)')
FROM employees;

SELECT 
RPAD(SUBSTR(first_name, 1,3),LENGTH(first_name),'*') AS name,
LPAD(salary,10,'*') AS salary
FROM employees
WHERE LOWER (job_id) =LOWER ('IT_PROG');







/*
dual 이라는 테이블은 sys가 소유하는 오라클의 표준 테이블로서,
오직 한 행에 한컬럼만 담고 있는 dummy 테이블 입니다.
일시적인 산술 연산이나 날짜 연산 등에 주로 사용합니다.
모든 사용자가 접근할 수 있습니다.
*/