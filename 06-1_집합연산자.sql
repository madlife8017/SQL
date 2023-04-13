--���տ�����
--UNION(������ �ߺ�x, UNION ALL(������ �ߺ� O),
--INTERSECT(������), MINUS(������)(�������� ���� �߿�)
--�� �Ʒ� conlumn ������ ������ Ÿ���� ��Ȯ�� ��ġ�ؾ� �մϴ�.

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
