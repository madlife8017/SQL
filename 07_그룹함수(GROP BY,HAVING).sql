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

/*
문제 1.
사원 테이블에서 JOB_ID별 사원 수를 구하세요.
사원 테이블에서 JOB_ID별 월급의 평균을 구하세요. 월급의 평균 순으로 내림차순 정렬하세요
*/
SELECT 
job_id,
AVG(salary) AS avgs,
COUNT(job_id) 
FROM employees
GROUP BY job_id
ORDER BY avgs ASC;

--문제 2.
--사원 테이블에서 입사 년도 별 사원 수를 구하세요.
SELECT 
TO_CHAR(hire_date,'YYYY'),
COUNT(TO_CHAR(hire_date,'YYYY'))
FROM employees
GROUP BY TO_CHAR(hire_date,'YYYY');

--문제 3.
--급여가 1000 이상인 사원들의 부서별 평균 급여를 출력하세요. 
--단 부서 평균 급여가 2000이상인 부서만 출력
SELECT 
department_id,
AVG(salary)
FROM employees
WHERE salary>=5000
GROUP BY department_id
HAVING AVG(salary)>=7000;

/*
문제 4.
사원 테이블에서 commission_pct(커미션) 컬럼이 null이 아닌 사람들의
department_id(부서별) salary(월급)의 평균, 합계, count를 구합니다.
조건 1) 월급의 평균은 커미션을 적용시킨 월급입니다.
조건 2) 평균은 소수 2째 자리에서 절삭 하세요
*/

SELECT
    department_id,
    TRUNC(AVG(salary+(salary*commission_pct)),2),
    SUM(salary+ salary*commission_pct),
    COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;








