/*
���� 1.
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� 
���� ������� �����͸� ��� �ϼ��� ( AVG(�÷�) ���)
*/

SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary)FROM employees);
                
/*
���� 1.
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� 
���� ������� ���� ����ϼ���
*/
SELECT Count(*) as �ο���
FROM employees
WHERE salary > (SELECT AVG(salary)FROM employees);
                
/*
���� 1.
-EMPLOYEES ���̺��� job_id�� IT_PFOG�� 
������� ��ձ޿����� ���� ������� �����͸� ����ϼ���
*/

SELECT * 
FROM employees WHERE salary > (
                SELECT AVG(salary)
                FROM employees
                WHERE job_id='IT_PROG'
                );

/*���� 2.
-DEPARTMENTS���̺��� manager_id�� 
100�� ����� department_id��
EMPLOYEES���̺��� department_id�� 
��ġ�ϴ� ��� ����� ������ �˻��ϼ���.
*/
SELECT *
FROM employees
WHERE department_id =
(SELECT department_id 
FROM departments
WHERE manager_id=100);

/*
���� 3.
-EMPLOYEES���̺��� ��Pat���� manager_id���� 
���� manager_id�� ���� ��� ����� �����͸� ����ϼ���
*/
SELECT *
FROM employees
WHERE manager_id > (
                        SELECT manager_id
                        FROM employees
                        WHERE first_name ='Pat');  
                        
/*
���� 3.
-EMPLOYEES���̺��� ��James��(2��)���� manager_id�� 
���� ��� ����� �����͸� ����ϼ���.
*/

SELECT *
FROM employees
WHERE manager_id IN(
SELECT manager_id
FROM employees
WHERE first_name = 'James'
);

/*
���� 4.
-EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 
41~50��° �������� �� ��ȣ, �̸��� ����ϼ���
*/
SELECT *FROM(
SELECT ROWNUM rn, tbl.first_name 
FROM
(
SELECT first_name
FROM employees ORDER by first_name  DESC
)tbl
)WHERE rn>=41 and rn<=50;

/*
���� 5.
-EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 
31~40��° �������� �� ��ȣ, ���id, �̸�, ��ȣ, 
�Ի����� ����ϼ���.
*/
SELECT * FROM
(
SELECT ROWNUM AS rn,tbl.* FROM
(
SELECT employee_id, first_name,phone_number,hire_date
FROM employees
ORDER BY hire_date ASC
)tbl
)
WHERE rn>30 and rn<=40;

/*���� 6.
employees���̺� departments���̺��� left �����ϼ���
����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
����) �������̵� ���� �������� ����*/

SELECT e.employee_id, e.first_name||' '||e.last_name, 
d.department_id, d.department_name
FROM employees e LEFT JOIN departments d  
ON e.department_id = d.department_id
ORDER BY employee_id ASC;

/*
���� 7.
���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/

SELECT 
e.employee_id,
first_name,
e.department_id,(
SELECT
department_name
FROM;


/*���� 8.
departments���̺� locations���̺��� left �����ϼ���
����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, 
��Ʈ��_��巹��, ����Ʈ �ڵ�, ��Ƽ �� ����մϴ�
����) �μ����̵� ���� �������� ����*/

SELECT d.department_id, d.department_name,
d.manager_id, loc.location_id,loc.street_address,
loc.postal_code, loc.city
FROM departments d LEFT JOIN locations loc
ON d.location_id = loc.location_id
ORDER BY department_id ASC;

/*���� 9.
���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���*/

SELECT 
d.department_id, d.department_name,
d.manager_id, d.location_id,
(
SELECT
FROM location loc
WHERE loc.location_id = d.location_id
)
FROM departments d
ORDER BY department_id ASC;

SELECT
FROM location loc LEFT JOIN countries c
ON loc.country_id=c.country_id
ORDER BY c.country_name ASC;

/*
���� 12. 
employees���̺�, departments���̺��� left���� hire_date�� 
�������� �������� 1-10��° �����͸� ����մϴ�
����) rownum�� �����Ͽ� ��ȣ, �������̵�, �̸�, ��ȭ��ȣ, �Ի���, 
�μ����̵�, �μ��̸� �� ����մϴ�.
����) hire_date�� �������� �������� ���� �Ǿ�� �մϴ�. 
rownum�� Ʋ������ �ȵ˴ϴ�.
*/
SELECT *FROM
    (
    SELECT  ROWNUM AS rn, tbl.* FROM
        (
        SELECT
            e.employee_id, e.first_name, e.phone_number,
            e.hire_date, d.department_id, d.department_name
        FROM employees e LEFT JOIN departments d
        ON e. department_id = d.department_id
        ORDER BY hire_date ASC
        ) tbl
    )
WHERE rn>0 AND rn<=10;

/*
���� 13. 
--EMPLOYEES �� DEPARTMENTS ���̺��� JOB_ID�� SA_MAN ����� 
������ LAST_NAME, JOB_ID, 
DEPARTMENT_ID,DEPARTMENT_NAME�� ����ϼ���.
*/
SELECT tbl.* , d.department_name 
    FROM
    (
    SELECT
        last_name, job_id, department_id
    FROM employees
    WHERE job_id ='SA_MAN'
    ) tbl
JOIN departments d
ON tbl.department_id = d.department_id;

/*
���� 14
--DEPARTMENT���̺��� �� �μ��� ID, NAME, MANAGER_ID�� 
�μ��� ���� �ο����� ����ϼ���.
--�ο��� ���� �������� �����ϼ���.
--����� ���� �μ��� ������� ���� �ʽ��ϴ�.
*/
SELECT
    d.department_id, d.department_name,
    d.manager_id, a.total
FROM departments d
JOIN
    (
    SELECT department_id, COUNT(*) AS total
    FROM employees
    GROUP BY department_id
    )a
ON d.department_id = a.department_id
ORDER BY a.total;

/*
���� 15
--�μ��� ���� ���� ���ο�, �ּ�, �����ȣ, 
�μ��� ��� ������ ���ؼ� ����ϼ���.
--�μ��� ����� ������ 0���� ����ϼ���.
*/

SELECT
    d.*,
    loc.street_address, loc.postal_code,
    NVL(tbl.result, 0) AS �μ�����ձ޿�
FROM departments d
JOIN locations loc
ON d.location_id = loc.location_id
LEFT JOIN
    (
    SELECT
        department_id, TRUNC(AVG(salary)) AS result
    FROM employees
    GROUP BY department_id
    ) tbl
ON d.department_id = tbl.department_id;

/*
���� 16
-���� 15 ����� ���� DEPARTMENT_ID�������� �������� �����ؼ� 
�ٿ� 1-10������ ����������ϼ���.
*/

SELECT * FROM
    (
    SELECT ROWNUM AS rn, tbl2.*
    FROM
        (
        SELECT
            d.*,
            loc.street_address, loc.postal_code,
            NVL(tbl.result, 0) AS �μ�����ձ޿�
        FROM departments d
        JOIN locations loc
        ON d.location_id = loc.location_id
        LEFT JOIN
            (
            SELECT
                department_id, TRUNC(AVG(salary)) AS result
            FROM employees
            GROUP BY department_id
            ) tbl
        ON d.department_id = tbl.department_id
        ORDER BY d.department_id DESC
        ) tbl2
    )
WHERE rn > 10 AND rn <= 20;


