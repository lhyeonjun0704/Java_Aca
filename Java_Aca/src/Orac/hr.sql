-- translate / replace
select first_name, email from employees where translate(email, '0123456789', 'PPPPPPPPPP')<> email;

-- �ݿø� round
select round(36.754, -1) from dual;

-- ����
select trunc(26.754, 1) from dual;

-- ������ 100��
select sysdate, sysdate+100-1 "������ 100��" from dual;

-- date �ݿø�(�ݿø��� 16�Ϻ���)
select round(sysdate, 'mon') from dual;
select round(to_date('211116'), 'mon') from dual;
select round(to_date('2021 11 16', 'yyyy mm dd'), 'mon') from dual;
select round(sysdate, 'year') from dual;
select sysdate, add_months(sysdate, 6) from dual;

-- months_between() ���� ������(�ֽų�¥, ������ ��¥)

select first_name, months_between(sysdate, hire_date) from employees;
select first_name, trunc(months_between(sysdate, hire_date)) from employees;
select first_name, hire_date, salary, round(months_between(sysdate, hire_date)/12) from employees where round(months_between(sysdate, hire_date)/12) >= 15;

-- to_char() to_date()

select to_date(sysdate) from dual;

select to_char(sysdate, 'yyyy/mm/dd') from dual;

select first_name, hire_date from employees where to_char(hire_date, 'RR') = '05';

-- �������Լ�(single row function)
select first_name from employees where length(first_name) = 5;

select avg(commission_pct) from employees;

select sum(commission_pct) from employees;

-- �޿��� ��, �ּ�, �ִ� �޿� ���, �޿����, ������, �Ŵ����ִ� ������, �����μ� �� ���ϱ�
select sum(salary), min(salary), max(salary), round(avg(salary),1), count(*), count(manager_id), count(department_id) from employees;
select sum(salary), min(salary), max(salary), round(avg(salary),1), count(*), count(manager_id), count(distinct department_id) from employees;

-- �μ��� �޿��� ���
select department_id, avg(salary) from employees group by department_id order by 1;

-- �μ��� �޿��� ��� ���Ͻÿ�
-- ���� => group by �� �� select ������ �׷��Լ��� ������ ������ Į�� ��尡 group by�� ������ GOOD �׷��� ������ error

select department_id, first_name, avg(salary) from employees group by department_id, first_name order by 1;

<<<<<<< HEAD
select department_id �μ����̵�, manager_id �Ŵ������̵�, avg(salary) ��ձ޿� 
from employees 
group by department_id, manager_id;

-- ������ 5õ�� ������ ������ ���Ͽ� �μ��� �ּұ޿�
select department_id, min(salary) from employees where salary*12 < 50000000 group by department_id order by 1;

select department_id �μ�, min(salary) �ּұ޿�
from employees
where 'IT' <> substr(job_id, 1, 2)
group by department_id
order by 1;

-- �μ� ���̵� 30�̻��� ���� �μ��� �ּұ޿�
select department_id �μ�, min(salary) �ּұ޿�
from employees
where department_id >= 30
group by department_id
order by 1;

-- �μ����̵� 30�̻�, �μ��� �ּ� �޿�(�μ����̵�, �ּұ޿�, ��ձ޿�), �μ��� ��ձ޿� 10000���ϸ�
select department_id, min(salary), round(avg(salary),0)
from employees
where department_id >= 30 
group by department_id
having avg(salary) <= 10000
order by 1;

desc employees;
-- �� �μ��� ���� �� �� ��ձ޿� ��ȸ �������� 20�� �̻��� �μ��� ���
select department_id, count(department_id), avg(salary)
from employees
group by department_id
having count(department_id) >= 20
order by 1;

-- �μ��� �ο� �� ��ȸ, �ο� �� 3�� �̻��� �μ���
select department_id, count(department_id)
from employees
group by department_id
having count(department_id) >= 3
order by 1;

-- �μ��� 30, 90���� ������ �� �޿� 5000�̻�, 12000 ���� ������ ���� �μ��� ��ձ޿� ��, ��ձ޿� 3500�̻� ���, ��ձ޿� ���� ��
select department_id, avg(salary)
from employees
where salary >= 5000 and salary <= 12000
group by department_id
having avg(salary) >= 3500
order by avg(salary) asc;

-- �� �μ��� �ִ� �޿� �ּұ޿�, ��ձ޿�, �޿��հ�, �ο� �� ���
select department_id, min(salary), max(salary), avg(salary), sum(salary), count(department_id)
from employees
group by department_id
order by 1;

-- �μ��� ��տ���, �ִ뿬��, �� �μ��� �޿� �հ� 20000�̻�
select department_id, avg(salary*12), max(salary*12)
from employees
group by department_id
having sum(salary) >= 20000
order by 1;

-- �Ի�⵵�� ������ ��� ���� �� ���� �⵵�� ���� ���(���� �� ��������) �� ��� �� 8�� �̻��� �⵵�� ���
select substr(hire_date, 1, 2), count(hire_date)
from employees
group by substr(hire_date, 1, 2)
having count(hire_date) >= 8
order by 2 desc;

select substr(hire_date, 1, 2) from employees;

select first_name �����, salary �޿�, department_name �μ���
from employees, departments;
=======



>>>>>>> 7b02ad07e221d94ae65417bb6b9ced4e976bf1f6

