
/*
# �����̶�?
- ���� �ٸ� ���̺��� ������ ���谡 �����Ͽ�
 1�� �̻��� ���̺��� �����͸� ��ȸ�ϱ� ���ؼ� ����մϴ�.
- SELECT �÷�����Ʈ FROM ���δ���� �Ǵ� ���̺� (1�� �̻�)
  WHERE ���� ���� (����Ŭ ���� ����)
*/

-- employees ���̺��� �μ� id�� ��ġ�ϴ� departments���̺��� 
-- �μ� id�� ã�Ƽ� SELECT ���Ͽ� �մ� �÷����� ����ϴ� ������

    SELECT 
    e.first_name,
    d.department_name   
    FROM employees e, departments d 
-- AS ���� ����
    WHERE e.department_id = d.department_id;

