--집합연산자
--UNION(합집합 중복x, UNION ALL(합집합 중복 O),
--INTERSECT(교집합), MINUS(차집합)(차집합은 순서 중요)
--위 아래 conlumn 개수와 데이터 타입이 정확히 일치해야 합니다.

SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION ALL
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;


SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
INTERSECT
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;


SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20
MINUS
SELECT
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%';
