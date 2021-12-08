-- Q) Ŀ�̼��� ���� ���� �޴� ���� 3���� �̸��� Ŀ�̼��� ��ȸ ���
select first_name �̸�, salary * commission_pct Ŀ�̼� 
from (select first_name, salary, commission_pct from employees 
order by 2 desc nulls last)
where rownum <= 3 and commission_pct is not null;

select salary * commission_pct 
from employees 
where commission_pct  is not null and rownum <= 3 
order by 1 desc;

select * from employees;

-- 80�� �μ��� ��ձ޿����� ��ձ޿��� ���� �μ��� �μ����̵�� �ش� �μ��� ��ձ޿��� ��ȸ����Ͻÿ�.
select e.department_id �μ����̵�, round(avg(m.salary))
from employees e, (select m.department_id, avg(m.salary) 
                   from employees m
                   group by m.department_id
                   having avg(salary) < (select avg(salary) from employees where department_id = 80)
                   ) a
group by e.department_id;

select avg(salary) from employees where department_id = 80;

select department_id, round(avg(salary))
from employees
group by department_id
having avg(salary) < (select avg(salary) from employees where department_id = 80)
;


-- �μ� ���̵� 80���� ������̵�� �޿��� ����ִ� ���̺� �ۼ�.
create table employees_deptid_80
as
select employee_id, salary 
from employees
where department_id = 80;

select * from employees_deptid_80;

create table employees_s
as select first_name �̸�, phone_number ��ȭ��ȣ, department_id �μ����̵�
from employees;

select * from employees_s;

-- all < : �� �� �ִ밪 ���� ū��~  
-- any : in�� ���� ȿ�� !any �� no in�� ���� ȿ��

-- �μ�ID�� 80�� �μ� �������� �޿�(��: 12000�� �ִ���) ���� ���� �޿��� �޴� ������ ��ȸ
select employee_id �μ����̵�, first_name �̸�, salary �޿�
from employees
where salary > all(select salary from employees where department_id = 80);

select employee_id �μ����̵�, first_name �̸�, salary �޿�
from employees
where salary <= all(select salary from employees where department_id = 80);

select employee_id �μ����̵�, first_name �̸�, salary �޿�
from employees
where salary >= any(select salary from employees where department_id = 80);

-- savepoint ~; �ϸ� commit�� �κ� ���̺�����Ʈ ���� �� ����
-- rollback to ~; �ϸ� ~�� ������ �ѹ��� �� ����.

select * from jobs;
-- ��� ��å�� ���� �޿��� �λ������ϰ��� �Ѵ�.
-- ��å�� 'Manager'�� ���Ե� ����� �޿��� �λ��Ͽ� 1.1��ŭ �����ϰ� �������� 1.5��ŭ �����Ѵ�.
-- �̸�, ��å, �λ�ȱ޿� ��ȸ ���.
-- ���׿����� �� decode(����÷�, ����, yesó��1, noó��2)

-- ���ʿ� �̰� decode�� Ǫ�� ������ �ƴ�.
select e.first_name �̸�, j.job_title ��å, e.salary �޿�, decode(j.job_title in ('Manger'),0 , salary*1.1, salary*1.5) �λ�ȱ޿�
from employees e join jobs j
on e.job_id = j.job_id;


-- ���� job_id�� 'AD'�� �����ϸ� 10%, 'FI'�� �����ϸ� 15% �λ� 'PU'�� �����ϸ� 20% �λ�

select e.first_name �̸�, j.job_title ��å, e.salary �޿�, decode(upper(substr(j.job_id, 1, 2)) , 'AD' , salary*1.1, 'FI', salary*1.5, 'PU', salary*1.2) �λ�ȱ޿�
from employees e join jobs j
on e.job_id = j.job_id;

-- ��å�� Manager�̸� 10%, accountant�̸� 20% �� �� 30%
select e.first_name �̸�, j.job_title ��å, e.salary �޿�, case when j.job_title like '%Manager%' then salary*1.1
                                                             when j.job_title like '%Accountant%' then salary*1.2
                                                             else salary*1.3 end
from employees e join jobs j
on e.job_id = j.job_id;

select * from employees_s;

flashback table employees_s to before drop;

--drop table employees_s purge; --���� �Ұ�

-- ���� ���� 5���� ���Ἲ�� ���ؼ� 
-- primary key -> �ߺ� x, null x(pk)
-- foreign key -> �ߺ� ����, null ����(fk)
-- unique -> �ϳ��� ����(�ߺ� �Ұ�), null�� ���� (uk)
-- not null -> null�� �Ұ� (nn)
-- check : ���� > 0 (ck)
create table memtable(
    memname varchar2(20),
    memtel varchar2(20),
    memhobby varchar2(30),
    membi number(5),
    memid number(6)
    );

create table memidtable(
    memid number(6),
    memname varchar2(20)
    );
    
insert into employees values (998);

