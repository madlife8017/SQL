-- insert
-- ���̺� ���� Ȯ��
DESC departments;

--INSERT�� ù��° ��� (��� Ŀ�� �����͸� �ѹ��� ����)
INSERT INTO departments
VALUES(290,'������');

SELECT * FROM departments;
ROLLBACK; --���� ������ �ٽ� �ڷ� �ǵ����� Ű����

--INSERT �ι�° ��� (���� �÷��� �����ϰ� ����, not null Ȯ���ϼ���!)

INSERT INTO departments
(department_id, department_name,�Ӥ���)
VALUES (290,'������');

-- �纻 ���̺� ����
-- �纻 ���̺� ������ �� �׳� �����ϸ� -> ��ȸ�� �����ͱ��� ��� ����
-- WHERE���� false�� (1=2) �����ϸ� -> ���̺��� ������ �����ϰ�
--�����ʹ� ���� x
CREATE TABLE managers AS 
(SELECT employee_id, first_name, job_id, hire_date
FROM employees WHERE 1=2);

--false ���̸� ���ĸ� ������ ����Ŭ�� boolean�� ����

SELECT *
FROM managers;

DROP TABLE managers;

--INSERT (��������)
INSERT INTO managers
(SELECT employee_id,first_name, job_id, hire_date FROM employees);

-------------------------------

--UPDATE
CREATE TABLE emps AS(SELECT *FROM) employees;
SELECT * FROM emps;

/*
CTAS�� ����ϸ� ���� ������ NOT NULL ����� ������� �ʽ��ϴ�.
���������� ���� ��Ģ�� ��Ű�� �����͸� �����ϰ�, �׷��� ���� �͵���
DB�� ����Ǵ� ���� �����ϴ� �������� ����մϴ�.
*/

