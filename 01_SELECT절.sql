
-- 오라클의 한 줄 주석입니다.

/*
   
    여러 줄 주석입니다.
    오홓
    
*/


-- SELECT [컬럼명(여러 개 가능)] FROM [테이블 이름] / * =>모든 컬럼을 말하는 것
SELECT
    *
FROM
    employees;

SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees;

SELECT
    email,
    phone_number,
    hire_date
FROM
    employees;

--컬럼을 조회하는 위치에서 * / + - 연산이 가능합니다.

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    salary + salary * 0.1 AS 성과금
FROM
    employees;

-- NULL 값의 확인 (숫자 0이나 공백이랑은 다른 존재입니다.결국 이런 건 문자열이 있는 것이기) 값이 비어있는 상태(연산이 안됨)
SELECT
    department_id,
    commission_pct
FROM
    employees;

-- alias(컬럼 명, 테이블 명의 이름을 변경해서 조회합니다.) => AS
SELECT
    first_name AS 이름,
    last_name  AS 성,
    salary     AS 급여
FROM
    employees;
    
/*
오라클은 홑따옴표로 문자를 표현하고, 문자열 안에 홑따옴표를
표현하고 싶다면 ''를 두 번 연속으로 쓰시면 됩니다. 
문장을 연결하고 싶다면 ||를 사용합니다. 
*/   

SELECT 
    first_name || ' ' || last_name || '''s salary is $'|| salary
    AS 급여내역
FROM employees;

SELECT department_id From employees;
-- DISTINCT(중복 행의 제거)
SELECT DISTINCT department_id From employees;

--ROWNUM,ROWID 
-- (**로우넘: 쿼리에 의해 반환되는 행 번호를 출력(단순 번호))
-- (로우아이디: 데이터 베이스 내의 행의 주소를 반환 (주소값)) 

SELECT ROWNUM, ROWID, employee_id
FROM employees;

