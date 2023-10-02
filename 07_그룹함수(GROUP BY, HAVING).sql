
-- 그룹 함수 AVG, MAX, MIN, SUM, COUNT
-- 그룹을 묶지 않으면 테이블 전체 그룹으로 묶임

SELECT 
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees;
    
-- COUNT(*) : 총 행 데이터의 개수를 의미함 
SELECT COUNT(*) FROM employees;
SELECT COUNT(first_name) FROM employees;

-- null이 아닌 행의 수
SELECT COUNT(commission_pct)FROM employees; 

-- null이 아닌 행의 수
SELECT COUNT(manager_id)FROM employees; 

-- 부서별로 그룹화, 그룹함수의 사용
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id; -- 맞는 예시 
-- GROUP BY 그룹화 시키는 코드 
-- GROUP BY department_id;가 있는 이유는 department_id,를 구하는 데
-- 그룹화를 시키지 않으면 개별 평균을 낸다는 의미이기 때문에 
-- 에러가 된다는 의미 

--주의할 점 
-- 그룹 함수는 일반 컬럼과 동시에 그냥 출력할 수는 없습니다. 
SELECT
    department_id,
    AVG(salary)
FROM employees; -- 에러 예시

-- GROUP BY절을 사용할 때 GROUP절에 묶이지 않으면 
-- 다른 컬럼을 조회할 수 없습니다. 
--  job_id는 그룹화가 되어있는 범위가 아니기 때문에

SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id; -- 에러 


--GROUP BY절 2개 이상 사용 

SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

--GROUP BY를 통해 그룹화 할 때 조건을 걸 경우 HAVING을 사용.
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;

SELECT 
    job_id,
    COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 5;

-- 부서 아이디가 50 이상인 것들을 그룹화 시키고, (일반조건)-> where
-- 그룹 월급 평균이 5000 이상만 조회 (그룹화 조건)-> having 
SELECT 
    department_id,
    AVG(salary) AS 평균
FROM employees
WHERE department_id >= 50
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY department_id DESC;

--FROM-> WHERE-> GROUP BY-> HAVING-> SELECT-> ORDER BY (순서 정렬)

/*
문제 1.
사원 테이블에서 JOB_ID별 사원 수를 구하세요.
사원 테이블에서 JOB_ID별 월급의 평균을 구하세요. 월급의 평균 순으로 내림차순 정렬하세요.
*/
SELECT 
    job_id,
    count(*)AS 사원수
FROM employees
GROUP BY job_id;


SELECT
    job_id,  
    AVG(salary) AS 평균월급
FROM employees
GROUP BY job_id
ORDER BY 평균월급 DESC;
/*
문제 2.
사원 테이블에서 입사 년도 별 사원 수를 구하세요.
(TO_CHAR() 함수를 사용해서 연도만 변환합니다. 그리고 그것을 그룹화 합니다.)
*/
SELECT 
    TO_CHAR(hire_date, 'yy') AS 입사년도,
    COUNT(*) AS 사원수
FROM employees
GROUP BY TO_CHAR(hire_date, 'yy')
ORDER BY 입사년도 ASC;

/*
문제 3.
급여가 5000 이상인 사원들의 부서별 평균 급여를 출력하세요. 
단 부서 평균 급여가 7000이상인 부서만 출력하세요.
*/

SELECT
    department_id,
    AVG(salary) AS 평균
    
FROM employees
WHERE salary >= 5000
GROUP BY department_id
HAVING AVG(salary)>= 7000;

/*
문제 4.
사원 테이블에서 commission_pct(커미션) 컬럼이 null이 아닌 사람들의
department_id(부서별) salary(월급)의 평균, 합계, count를 구합니다.
조건 1) 월급의 평균은 커미션을 적용시킨 월급입니다.
조건 2) 평균은 소수 2째 자리에서 절삭 하세요.
*/

SELECT
    department_id,
    SUM(salary +(salary*commission_pct))AS 합계,
    COUNT(*),
    TRUNC(AVG(salary +(salary*commission_pct)),2) AS avg_salaryb nj

 FROM employees
 WHERE commission_pct IS NOT NULL 
 GROUP BY department_id;

 

