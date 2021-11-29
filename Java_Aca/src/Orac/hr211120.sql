-- 2021/11/19

-- 'Alexander' �� ���� �μ����� �ٹ��ϴ� ������ �̸��� ��, �μ� id ��ȸ
select e.first_name �̸�,  e.last_name ��, 
;
-- 90�� �μ��� ��ձ޿����� ���� �޿��� �޴� ������ �̸�, �μ� id, �޿��� ��ȸ���
select first_name �̸�, department_id �μ����̵�, salary �޿�
from employees
where salary > (select avg(salary) from employees where department_id = 90);

-- seattle�� �ٹ��ϴ� ������ ��ձ޿����� �޿��� ���� �����鼭 30���μ��� �ִ� �޿����� ���� �޿��� �޴� ������
-- �̸�, �޿�, �μ�id, �μ���, ��ȸ ���
select e.first_name �̸�,e.salary �޿�,e.department_id �μ���ȣ,
        d.department_name �μ���
from employees e left outer join departments d
on e.department_id = d.department_id
where e.salary <( select max(salary)
                  from employees
                  where department_id=30) 
                  and(select avg(e2.salary)
                  from employees e2 join departments d
                  on e2.department_id = d.department_id
                  join locations l
                  on d.location_id = l.location_id
                  where lower(city)='seattle') < e.salary
order by salary;

-- 'IT' �μ����� �ٹ��ϴ� �������� �̸�, �޿�, �Ի���, �μ����̵�, �μ��� ��ȸ ���

select e.first_name �̸�, e.salary �޿�, e.hire_date �Ի���, e.department_id, d.department_name �μ���
from employees e join departments d
on d.department_id = e.department_id 
where d.department_name ='IT';

-- Q) �� �μ����� �����޿��� �޴� ������ �̸��� �μ����̵�, �޿� ��ȸ ��� (��, ����� �μ����̵� ��������)
select first_name, department_id, salary
from employees 
where (department_id, salary) in (select department_id, min(salary) from employees group by department_id)
order by department_id;

select first_name, department_id, salary
from employees 
where (department_id, salary) in (select department_id, max(salary) from employees group by department_id)
order by department_id;


select department_id, min(salary) from employees group by department_id order by 1;


--q) ����� �̸�, �μ�id, �޿��� ��ȸ ��� ( ��, ����� ���� �ش� �μ��� �ּұ޿��� �޿������� �־� ���)
select first_name �̸�, department_id �μ����̵�, salary �޿�,
(select min(salary) from employees where department_id = e.department_id) �ּұ޿� 
from employees e;

--Q) ����� �޿��� ������ ���� �μ��� ��ձ޿����� ���� ����� ���� �����, �޿�, ��ձ޿� ��ȸ ���( ��, from ���� subquery���)
select e.first_name �����, e.salary �޿� , a.avgsal
from employees e, (select department_id, round(avg(salary)) avgsal
                   from employees
                   group by department_id) a
where e.department_id = a.department_id and e.salary > a.avgsal;


--Q) �޿��� ���� �޴� ������ ���� �̸� �޿��� ��ȸ ����Ͻÿ�.
select first_name, salary
from employees
order by 2 desc;

-- Q) ������δ�
select first_name �̸�, salary �޿�
from a

select first_name, salary
from employees
order by 2 desc;

select first_name, salary
from (select first_name, salary
from employees
order by 2 desc) a;

--Q) �޿��� ���� �޴� ������ ���� �̸� �޿��� ��ȸ ����Ͻÿ�.(��ȸ�� ������� �Ϸù�ȣ�� ����Ͻÿ�). ��, from�� subquery���)

--Q) �޿��� ���� ���� �޴� ���� 7���� ���� �̸� �޿��� ��ȸ ���
select first_name �̸�, salary �޿� 
from(select first_name, salary from employees order by salary desc)
where rownum <=8;




