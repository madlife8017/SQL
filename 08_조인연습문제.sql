SELECT 
*
FROM employees e 
INNER JOIN departments d
ON e.department_id = d.department_id;

SELECT 
*
FROM employees e 
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;

SELECT 
*
FROM employees e 
RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id;

SELECT 
*
FROM employees e 
FULL OUTER JOIN departments d
ON e.department_id = d.department_id;


SELECT 
*
FROM employees e 
FULL OUTER JOIN departments d
ON e.department_id = d.department_id;



--2��
SELECT 
e.first_name ||' '||e.last_name AS name, d.department_id
FROM employees e 
JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id = 200;

--����3
SELECT 
e.first_name, e.job_id, j.job_title
FROM employees e JOIN jobs j ON e.job_id = j.job_id
ORDER BY e.first_name ASC;

--����4.
SELECT*
FROM JOBS j
LEFT JOIN job_history jh
ON j.job_id =jh.job_id;

--����5.

SELECT 
e.first_name || ' ' || e.last_name AS full_name,
d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE e.first_name='Steven'
AND e.last_name = 'King';

--6��
SELECT *
FROM employees e  CROSS JOIN departments d;

--7�� EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� 
--SA_MAN ������� �����ȣ, �̸�, �޿�, �μ���, �ٹ����� ����ϼ���. 
--(Alias�� ���)

SELECT 
e.employee_id, e.first_name || ' ' || e.last_name AS name,
e.salary, d.department_name, loc.city, e.job_id
FROM employees e 
JOIN departments d ON e.department_id = d.department_id
JOIN locations loc ON d.location_id = loc.location_id
WHERE e.job_id ='SA_MAN';

--���� 8.
-- employees, jobs ���̺��� ���� �����ϰ� job_title�� 
--'Stock Manager', 'Stock Clerk'�� ���� ������ ����ϼ���.

SELECT *
FROM employees e JOIN jobs j
ON e.job_id = j.job_id
WHERE j.job_title = 'Stock Manager' 
or j.job_title = 'Stock Clerk';

--���� 9.
-- departments ���̺��� 
--������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���

SELECT
d.department_name, e.first_name
FROM departments d LEFT OUTER JOIN employees e
ON d.department_id = e.department_id
WHERE e.first_name IS NULL;










