
-- �׷� �Լ� AVG, MAX, MIN, SUM, COUNT
-- �׷��� ���� ������ ���̺� ��ü �׷����� ����

SELECT 
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees;
    
-- COUNT(*) : �� �� �������� ������ �ǹ��� 
SELECT COUNT(*) FROM employees;
SELECT COUNT(first_name) FROM employees;

-- null�� �ƴ� ���� ��
SELECT COUNT(commission_pct)FROM employees; 

-- null�� �ƴ� ���� ��
SELECT COUNT(manager_id)FROM employees; 

-- �μ����� �׷�ȭ, �׷��Լ��� ���
SELECT
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id; -- �´� ���� 
-- GROUP BY �׷�ȭ ��Ű�� �ڵ� 
-- GROUP BY department_id;�� �ִ� ������ department_id,�� ���ϴ� ��
-- �׷�ȭ�� ��Ű�� ������ ���� ����� ���ٴ� �ǹ��̱� ������ 
-- ������ �ȴٴ� �ǹ� 

--������ �� 
-- �׷� �Լ��� �Ϲ� �÷��� ���ÿ� �׳� ����� ���� �����ϴ�. 
SELECT
    department_id,
    AVG(salary)
FROM employees; -- ���� ����

-- GROUP BY���� ����� �� GROUP���� ������ ������ 
-- �ٸ� �÷��� ��ȸ�� �� �����ϴ�. 
--  job_id�� �׷�ȭ�� �Ǿ��ִ� ������ �ƴϱ� ������

SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id; -- ���� 


--GROUP BY�� 2�� �̻� ��� 

SELECT
    job_id,
    department_id,
    AVG(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

--GROUP BY�� ���� �׷�ȭ �� �� ������ �� ��� HAVING�� ���.
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

-- �μ� ���̵� 50 �̻��� �͵��� �׷�ȭ ��Ű��, (�Ϲ�����)-> where
-- �׷� ���� ����� 5000 �̻� ��ȸ (�׷�ȭ ����)-> having 
SELECT 
    department_id,
    AVG(salary) AS ���
FROM employees
WHERE department_id >= 50
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY department_id DESC;

--FROM-> WHERE-> GROUP BY-> HAVING-> SELECT-> ORDER BY (���� ����)

/*
���� 1.
��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���.
*/
SELECT 
    job_id,
    count(*)AS �����
FROM employees
GROUP BY job_id;


SELECT
    job_id,  
    AVG(salary) AS ��տ���
FROM employees
GROUP BY job_id
ORDER BY ��տ��� DESC;
/*
���� 2.
��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.
(TO_CHAR() �Լ��� ����ؼ� ������ ��ȯ�մϴ�. �׸��� �װ��� �׷�ȭ �մϴ�.)
*/
SELECT 
    TO_CHAR(hire_date, 'yy') AS �Ի�⵵,
    COUNT(*) AS �����
FROM employees
GROUP BY TO_CHAR(hire_date, 'yy')
ORDER BY �Ի�⵵ ASC;

/*
���� 3.
�޿��� 5000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. 
�� �μ� ��� �޿��� 7000�̻��� �μ��� ����ϼ���.
*/

SELECT
    department_id,
    AVG(salary) AS ���
    
FROM employees
WHERE salary >= 5000
GROUP BY department_id
HAVING AVG(salary)>= 7000;

/*
���� 4.
��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���.
*/

SELECT
    department_id,
    SUM(salary +(salary*commission_pct))AS �հ�,
    COUNT(*),
    TRUNC(AVG(salary +(salary*commission_pct)),2) AS avg_salaryb nj

 FROM employees
 WHERE commission_pct IS NOT NULL 
 GROUP BY department_id;

 

