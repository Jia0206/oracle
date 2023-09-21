
-- ����Ŭ�� �� �� �ּ��Դϴ�.

/*
   
    ���� �� �ּ��Դϴ�.
    ���P
    
*/


-- SELECT [�÷���(���� �� ����)] FROM [���̺� �̸�] / * =>��� �÷��� ���ϴ� ��
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

--�÷��� ��ȸ�ϴ� ��ġ���� * / + - ������ �����մϴ�.

SELECT
    employee_id,
    first_name,
    last_name,
    salary,
    salary + salary * 0.1 AS ������
FROM
    employees;

-- NULL ���� Ȯ�� (���� 0�̳� �����̶��� �ٸ� �����Դϴ�.�ᱹ �̷� �� ���ڿ��� �ִ� ���̱�) ���� ����ִ� ����(������ �ȵ�)
SELECT
    department_id,
    commission_pct
FROM
    employees;

-- alias(�÷� ��, ���̺� ���� �̸��� �����ؼ� ��ȸ�մϴ�.) => AS
SELECT
    first_name AS �̸�,
    last_name  AS ��,
    salary     AS �޿�
FROM
    employees;
    
/*
����Ŭ�� Ȭ����ǥ�� ���ڸ� ǥ���ϰ�, ���ڿ� �ȿ� Ȭ����ǥ��
ǥ���ϰ� �ʹٸ� ''�� �� �� �������� ���ø� �˴ϴ�. 
������ �����ϰ� �ʹٸ� ||�� ����մϴ�. 
*/   

SELECT 
    first_name || ' ' || last_name || '''s salary is $'|| salary
    AS �޿�����
FROM employees;

SELECT department_id From employees;
-- DISTINCT(�ߺ� ���� ����)
SELECT DISTINCT department_id From employees;

--ROWNUM,ROWID 
-- (**�ο��: ������ ���� ��ȯ�Ǵ� �� ��ȣ�� ���(�ܼ� ��ȣ))
-- (�ο���̵�: ������ ���̽� ���� ���� �ּҸ� ��ȯ (�ּҰ�)) 

SELECT ROWNUM, ROWID, employee_id
FROM employees;

