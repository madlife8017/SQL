SELECT * 
FROM employees;

SELECT 
employee_id,
first_name,last_name,
hire_date, salary
FROM employees;

SELECT 
employee_id,
first_name ||' '|| last_name AS 이름,
hire_date, salary
FROM employees;

SELECT *
FROM employees
WHERE department_id = '50';

SELECT 
first_name ||' '|| last_name AS name,
department_id,manager_id
FROM employees
WHERE department_id = '50';

SELECT 
first_name ||' '|| last_name AS name,
salary,salary+300 as bonus
FROM employees;

SELECT 
first_name ||' '|| last_name AS name,
salary
FROM employees
WHERE salary>10000;

SELECT 
first_name ||' '|| last_name AS name,
job_id,commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

SELECT 
first_name ||' '|| last_name AS name,
hire_date,salary
FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

SELECT 
first_name ||' '|| last_name AS name,
hire_date,salary
FROM employees
WHERE hire_date LIKE '03%';

SELECT 
department_id,
first_name ||' '|| last_name AS name,
salary
FROM employees
WHERE department_id = 60
ORDER BY salary DESC;

SELECT
first_name ||' '|| last_name AS name,
job_id
FROM employees
WHERE job_id = 'IT_PROG' or job_id =  'SA_MAN';

SELECT
first_name ||' '|| last_name AS name,
job_id
FROM employees
WHERE job_id IN ('IT_PROG','SA_MAN');

SELECT
first_name ||' '|| last_name||' 사원의 급여는'||salary||'달러 입니다'
FROM employees
WHERE last_name = 'King' and first_name='Steven';

SELECT
first_name ||' '|| last_name AS name,
job_id
FROM employees
WHERE job_id LIKE '%MAN';

SELECT
first_name ||' '|| last_name AS name,
job_id
FROM employees
WHERE job_id LIKE '%MAN'
ORDER BY job_id DESC;

SELECT
first_name ||' '|| last_name AS name,
job_id
FROM employees
WHERE job_id LIKE '%MAN'
ORDER BY job_id ASC;









