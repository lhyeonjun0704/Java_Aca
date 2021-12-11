-- 2021/11/24

-- index(��ȸ�ӵ� ����)
-- �ε��� ����� ����ϱ�(å�� ����)(��, �ε����� ������ �ӵ��� ������ �ϴ� ���� �ƴϴ�.)
-- ����� �������, join� ����ϰ� ���Ǵ� �÷����� ������ �����̳� ���� ������ ���� ��쿡��
-- �ε����� �����ؾ��ϹǷ� ������� �ʴ� ���� ����.

-- �޿��� 2000 �̻��� ��쿡 �ش�Ǵ� �޿��� �μ��� ���

select e.salary �޿�, d.department_name �μ���
from employees e join departments d
on e.department_id = d.department_id
where salary > 2000
order by 1 desc;


drop index idx_employees_salary; -- ����
create index idx_employees_salary on employees(salary); -- ����
alter index idx_employees_salary rebuild; -- ����

-- PL/SQL : Procedure Language/ sql (sql + ���������α׷���)

-- pl/sql block �� declare, begin, exception, end �� ����
-- declare, exception �� ���� ����
-- �̸��� ���� ���� �͸� ����̴�.
-- ���� ������ declare������ �ϵ�, procedure �ȿ��� ����� ������ IS�� ����Ѵ�.
-- Begin ~ End; �� ��ϴ����� �����ϸ� �� ��Ͼȿ� ó�� ���� ���� ����.
-- ������ ������ ����� �����ݷ�(;)
-- �ּ��� �� ������ ��� -- ��ȣ �̸� ������ �ּ��� �ڹٿ� ����.
-- END�� ���� �����ݷ�(;) �� ���, �̰��� ���-end�� �ǹ�
-- ����� ������ ���� ���� �P�� /�� �Է��Ѵ�.
-- �˻����� select ������ ����� �� ���� ��ȯ�Ǿ�� �ϸ� into ������ �䱸�ȴ�.
-- �˻����� select ���� �� ó���� �����ϰ� �Ϸ��� cursor�� ����ϸ� �ȴ�.

-- ex) �ﰢ�� ���� ���ϴ� �Լ�
-- ex)create or replace function name(v, v);

create or replace function t_function
( v_l in number, v_h in number)
return number; -- ��ȯ �ڷ����� ����
is v_result number;
begin
    v_result = (v_l * v_h) / 2;
    return v_result;
end;/


