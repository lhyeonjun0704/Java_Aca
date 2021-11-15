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





