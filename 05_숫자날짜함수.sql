--�����Լ�
--ROUND(�ݿø�)
--���ϴ� �ݿø� ��ġ�� �Ű������� ����. ������ �ִ� �͵� ����

SELECT
    ROUND(3.1415, 3), ROUND(45.923, 0), ROUND(45.923, -1)
FROM dual;

--TRUNC(����)
--������ �Ҽ��� �ڸ������� �߶���ϴ�.
SELECT
    ROUND(3.1415, 3), ROUND(45.923, 0), ROUND(45.923, -1)
FROM dual;

--ABS(���밪)
SELECT ABS(-34) FROM dual;

--CELL(�ø�), FLOOR(����)
SELECT CEIL(3.14), FLOOR(3.14)
FROM dual;

--MID
SELECT 10/4, MOD(10,4)
FROM dual;

--��¥ �Լ�
SELECT sysdate FROM dual;
SELECT systimestamp FROM dual;

--��¥�� ������ �����մϴ�.
SELECT sysdate + 1 FROM dual;

SELECT first_name, sysdate - hire_date
FROM employees;

SELECT first_name, sysdate - hire_date
FROM employees;

--��¥ �ݿø�, ����
SELECT ROUND(sysdate) FROM dual;
SELECT ROUND(sysdate, 'year') FROM dual;
SELECT ROUND(sysdate, 'month') FROM dual;
SELECT ROUND(sysdate, 'day') FROM dual;--�� �������� �ݿø�(�ش� ���� �Ͽ��� ����)

SELECT TRUNC(sysdate) FROM dual;
SELECT TRUNC(sysdate, 'year') FROM dual;
SELECT TRUNC(sysdate, 'month') FROM dual;
SELECT TRUNC(sysdate, 'day') FROM dual; --�ϱ������� ���� (�ش� ���� �Ͽ��� ����)


