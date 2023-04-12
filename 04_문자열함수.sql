--lower(�ҹ���), initcap(�ձ��ڸ� �빮��), upper(�빮��)

SELECT 'abcDEF', lower('abcDEF'), upper('abcDEF')
FROM dual;

SELECT last_name, LOWER(last_name),
INITCAP(last_name), UPPER(last_name)
FROM employees;

SELECT last_name FROM employees
WHERE LOWER(last_name) = 'austin';

--length(����), instr(���� ã��,������ 0�� ��ȯ, ������ �ε��� ��)
SELECT
    'abcdef', LENGTH('abcdef'), INSTR('abcdef','a')
FROM dual;

SELECT
    first_name, LENGTH(first_name), INSTR(first_name,'a')
FROM employees;

--substr(���ڿ� �ڸ���), concat(���ڿ���) 1���� ����.

SELECT
    'abcdef' as ex,
    SUBSTR('abcdedf', 1,4),
    CONCAT('abc','def')--�ΰ��� ����
FROM dual;

SELECT
first_name,
SUBSTR(first_name,1,3),
CONCAT(first_name, last_name)
FROM employees;

--LPAD, RPAD (��, ���� �������ڿ��� ä���)
SELECT
    LPAD('abc',10,'*'),
    RPAD('abc',10,'*')
FROM dual;

--LTRIM(), RTRIM(), TRIM() ��������
--LTRIM(param1, param2) -> param2�� ���� param1���� ã�Ƽ� ����.(���ʺ���)
--LTRIM(param1, param2) -> param2�� ���� param1���� ã�Ƽ� ����.(�����ʺ���)

SELECT LTRIM('javascript_java','java')FROM dual;
SELECT RTRIM('javascript_java','java')FROM dual;
SELECT TRIM('        java   ')FROM dual;

--replace()
SELECT
    REPLACE('my dream is a president',' ','')--��������
FROM dual;

SELECT
    REPLACE(REPLACE('my dream is a president','president','programmer'),' ','')
FROM dual;

SELECT
    REPLACE(CONCAT('hello', 'world!'),'!','?')
FROM dual;

/*
���� 1.
EMPLOYEES ���̺� ���� �̸�, �Ի����� �÷����� �����ؼ� �̸������� �������� ��� �մϴ�.
���� 1) �̸� �÷��� first_name, last_name�� �ٿ��� ����մϴ�.
���� 2) �Ի����� �÷��� xx/xx/xx�� ����Ǿ� �ֽ��ϴ�. xxxxxx���·� �����ؼ� ����մϴ�.
*/

SELECT *
FROM employees;

SELECT first_name ||' '|| last_name AS �̸�,
REPLACE(hire_date,'/','') AS �Ի�����
FROM employees
ORDER BY �̸� ASC;


SELECT first_name ||' '|| last_name AS �̸�,
REPLACE(phone_number,(SUBSTR(phone_number, 1,4)),'(02)')
FROM employees;

SELECT 
RPAD(SUBSTR(first_name, 1,3),LENGTH(first_name),'*') AS name,
LPAD(salary,10,'*') AS salary
FROM employees
WHERE LOWER (job_id) =LOWER ('IT_PROG');







/*
dual �̶�� ���̺��� sys�� �����ϴ� ����Ŭ�� ǥ�� ���̺�μ�,
���� �� �࿡ ���÷��� ��� �ִ� dummy ���̺� �Դϴ�.
�Ͻ����� ��� �����̳� ��¥ ���� � �ַ� ����մϴ�.
��� ����ڰ� ������ �� �ֽ��ϴ�.
*/