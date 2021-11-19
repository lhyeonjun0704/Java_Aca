-- sqldeveloper���� erd ����
-- �޴� ���� -> data modeler - ������
-- �����Ʒ��� ������ â���� �Ǿ� + ��ȣŬ���� �� ��Ÿ���� "��������[1]" - ����- �������� ��
-- ȭ�� ���� relational... 7HR ���̺� �巡�� �ϵ� ���̺� ���� �׸��� �巡���Ͽ� ���� relational..��â����
-- �����ϰ� �������� relational.. ��â���� - ����� -���� -�Ͽ� �����������⿡�� ���� ����� üũǥ�� ����
-- �̹����� pdf�� ��� �������� relational... ��â���� -���� �� �� "���̾�׷��μ�"���� �����Ͽ� ����.

-- join
select e.first_name �̸�, e.salary �޿�, e.department_id �μ����̵�, d.department_name �μ���
from employees e, departments d
where e.department_id = d.department_id;

-- Q) ������ �̸�, �Ŵ������̵�, �������̵� ����Ͻÿ�
select e.first_name �̸�,  e.manager_id �Ŵ������̵�, d.location_id �������̵�
from employees e, departments d
where e.department_id = d.department_id
order by e.first_name;

-- ������ �̸�, �Ŵ������̵�, �������̵� ����Ͻÿ�
select e.first_name �̸�, e.manager_id �Ŵ������̵�, d.location_id �������̵�
from employees e, departments d
where e.department_id = d.department_id and e.manager_id > 120
order by e.first_name;

-- ������� �̸��� ��å(job_title)�� ��ȸ ���
select e.first_name ������, j.job_title ��å
from employees e, jobs j
where e.job_id = j.job_id;

select * from employees;
select * from locations;
select * from departments;
select * from tab;

-- ������ �̸�, �μ���, �ش� city�� ����Ͻÿ�
select e.first_name ������, d.department_id �μ���, l.city ����
from employees e, locations l, departments d
where e.department_id = d.department_id and d.location_id = l.location_id
order by l.city asc;

select * from employees;
select * from locations;
select * from departments;
-- ���ú� ������ ���( ����� ���ø�, ������)
select l.city ���ø�, count(l.city)
from locations l, departments d, employees e
where l.location_id = d.location_id and d.department_id = e.department_id
group by l.city;

select * from locations;
select * from departments;
-- �μ��̸��� �μ��� ���� ���ø�(city)�� ��ȸ ���.
select d.department_name �μ���, l.city ���ø�
from departments d, locations l
where d.location_id = l.location_id;

select * from countries;
select * from employees;
-- ����� �̸��� �ش� ����� �ٹ��ϴ� ������ ��ȸ ���.
select e.first_name �̸�, c.country_name �ٹ�������
from employees e, departments d, locations l, countries c
where e.department_id = d.department_id and d.location_id = l.location_id and l.country_id = c.country_id;

-- ��å(job_title)�� 'representative'�� ��� �̸� ��å, �μ� ��ȸ ���
select e.first_name �̸�, j.job_title ��å, d.department_name
from employees e, jobs j, departments d
where d.department_id = e.department_id and e.job_id = j.job_id and lower(j.job_title) like '%representative%';

select job_title from jobs;

-- ��å(job_title)�� 'clerk'�� ��� �̸� ��å, �μ��� ��ȸ

-- �� ���ÿ� ���� �μ��� ���� 2007�� ������ �Ի��� �������� �ο��� ���( ��, ���� ������ ��� �������� ���� ������ ��� ���ø�-�μ���-�ο���)
select c.country_name ���ø�, d.department_name �μ���, count(c.country_name)
from employees e, departments d, countries c, locations l
where substr(e.hire_date, 1, 2) = '07'and d.location_id = l.location_id and l.country_id = c.country_id and e.department_id = d.department_id
group by d.department_name, c.country_name
order by c.country_name asc, count(c.country_name) desc;

select l.city ���ø�, d.department_name �μ���, count(*) �ο���
from employees e, departments d, locations l 
where e.department_id = d.department_id and d.location_id = l.location_id and hire_date < '07/01/01'
group by l.city, d.department_name
order by l.city, count(*) desc;

select e.first_name �̸�, e.salary �޿�, d.department_name �μ���
from employees e, departments d
where e.department_id = d.department_id(+);

select e.first_name �̸�, e.salary �޿�, d.department_name �μ���
from employees e, departments d
where e.department_id(+) = d.department_id;

select e.first_name �̸�, e.salary �޿�, d.department_name �μ���
from employees e left outer join departments d
on(e.department_id = d.department_id);

select e.first_name �̸�, e.salary �޿�, d.department_name �μ���
from employees e right outer join departments d
on(e.department_id = d.department_id);

-- outer join ���̺� �̰� ansi 1999���� �ۼ��ؾߵ�.


select e.first_name �̸�, e.salary �޿�, d.department_name �μ���
from employees e, departments d
where e.department_id = d.department_id(+)
union
select e.first_name �̸�, e.salary �޿�, d.department_name �μ���
from employees e, departments d
where e.department_id(+) = d.department_id;

select hire_date from employees;

-- 2007�� �Ի��� �������� ���, �̸�, ��(last_name), �Ի���, �μ����� ���
-- �� ��, �μ��� ��ġ���� ���� ������ ���, '�׷��μ�����'�� �����ְ� ������ ��(last_name)�� ���� ���
select e.employee_id ���, e.first_name �̸�, e.last_name ��, e.hire_date �Ի���, nvl2(d.department_name, d.department_name, '�׷��μ�����') �μ���
from employees e, departments d
where e.hire_date like '07%'and e.department_id = d.department_id(+)
order by e.last_name;
