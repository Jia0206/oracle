
CREATE TABLE depts AS(SELECT*FROM departments);
SELECT * FROM depts;
----------------------------------------------------
--���� 1

INSERT INTO emps_it
(department_id, department_name, manager_id, location_id) 
VALUES
(280,����, null,1800);
INSERT INTO emps_it
(department_id, department_name, manager_id, location_id)
VALUES
(290,ȸ���, null,1800);
INSERT INTO emps_it
(department_id, department_name, manager_id, location_id)
VALUES
(300,����, 301,1800);
INSERT INTO emps_it
(department_id, department_name, manager_id, location_id)
VALUES
(310, �λ�, 302,1800);
INSERT INTO emps_it
(department_id, department_name, manager_id, location_id)
VALUES
(320, ����, 303,1700);
