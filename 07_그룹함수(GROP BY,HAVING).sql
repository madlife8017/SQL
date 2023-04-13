--�׷� �Լ� AVG, MAX, MIN, SUM, COUNT

SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)    
FROM employees;

SELECT COUNT(*)FROM employees; --������ ���� �����̤��� ��
--count��null ���� ����
SELECT COUNT(first_name)FROM employees;
SELECT COUNT(commission_pct)FROM employees;
SELECT COUNT(manager_id)FROM employees;

--�μ����� �׷�ȭ, �׷��Լ��� ���
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id;

--������ ��
--�׷��Լ��� �Ϲ� �÷��� ���ÿ� �׳� ����Ҽ��� �����ϴ�.
SELECT
    department_id,
    AVG(salary)
FROM employees;--����

-- GROUP BY���� �������� ������ �ٸ� �÷� ��ȸ �Ұ���
SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id; --����


--GROUP by�� 2���̻� ���

SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id, job_id;


--group by�϶� ���ǰɰ� ������ having
SELECT  
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) >100000;

SELECT
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*)>=20;

--�μ� ���̵� 50�̻��� �͵��� �׷�ȭ ��Ű��, �׷������ 5000�̻� ��ȸ
SELECT 
department_id,
avg(salary)
FROM employees
WHERE department_id>=50
GROUP BY department_id
HAVING avg(salary)>=5000
ORDER BY department_id DESC;



