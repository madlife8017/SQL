--그룹 함수 AVG, MAX, MIN, SUM, COUNT

SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)    
FROM employees;

SELECT COUNT(*)FROM employees; --널포함 총해 ㅇ데이ㅌ의 수
--count는null 포함 안함
SELECT COUNT(first_name)FROM employees;
SELECT COUNT(commission_pct)FROM employees;
SELECT COUNT(manager_id)FROM employees;

--부서별로 그룹화, 그룹함수의 사용
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id;

--주의할 점
--그룹함수는 일반 컬럼과 동시에 그냥 출력할수는 없습니다.
SELECT
    department_id,
    AVG(salary)
FROM employees;--에러

-- GROUP BY절에 묶ㅇ이지 않으면 다른 컬럼 조회 불가능
SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id; --에러


--GROUP by절 2개이상 사용

SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id, job_id;


--group by일때 조건걸고 싶으면 having
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

--부서 아이디가 50이상인 것들을 그룹화 시키고, 그룹평균이 5000이상만 조회
SELECT 
department_id,
avg(salary)
FROM employees
WHERE department_id>=50
GROUP BY department_id
HAVING avg(salary)>=5000
ORDER BY department_id DESC;



