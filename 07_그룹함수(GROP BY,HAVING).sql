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

/*
���� 1.
��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���
*/
SELECT 
job_id,
AVG(salary) AS avgs,
COUNT(job_id) 
FROM employees
GROUP BY job_id
ORDER BY avgs ASC;

--���� 2.
--��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.
SELECT 
TO_CHAR(hire_date,'YYYY'),
COUNT(TO_CHAR(hire_date,'YYYY'))
FROM employees
GROUP BY TO_CHAR(hire_date,'YYYY');

--���� 3.
--�޿��� 1000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. 
--�� �μ� ��� �޿��� 2000�̻��� �μ��� ���
SELECT 
department_id,
AVG(salary)
FROM employees
WHERE salary>=5000
GROUP BY department_id
HAVING AVG(salary)>=7000;

/*
���� 4.
��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���
*/

SELECT
    department_id,
    TRUNC(AVG(salary+(salary*commission_pct)),2),
    SUM(salary+ salary*commission_pct),
    COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;








