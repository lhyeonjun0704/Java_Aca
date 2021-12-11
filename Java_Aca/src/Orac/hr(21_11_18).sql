-- 21/11/18
select * from employees;
select * from tab;
desc departments;
select e.employee_id, e.first_name
from employees e, departments d
where e.manager_id = d.manager_id;

--self join
select e.employee_id ���, e.first_name �����, m.first_name �Ŵ����̸�
from employees e, employees m 
where e.manager_id = m.employee_id(+)
order by 1;

select * from employees;
-- ������ ���, ����̸�, �Ŵ������̵�, �Ŵ����̸��� ����Ͻÿ�(��, �����ڰ� ���� ������ ���)
select e.employee_id ���, e.first_name ����̸�, e.manager_id �Ŵ������̵�, m.first_name �Ŵ����̸�
from employees e, employees m
where e.manager_id = m.employee_id(+)
order by 1;

select e.employee_id ���, e.first_name ����̸�, e.manager_id �Ŵ������̵�, m.first_name �Ŵ����̸�
from employees e, employees m
where e.manager_id = m.employee_id(+)
union
select e.employee_id ���, e.first_name ����̸�, e.manager_id �Ŵ������̵�, m.first_name �Ŵ����̸�
from employees e, employees m
where e.manager_id(+) = m.employee_id
order by 4;

select e.employee_id ���, e.first_name �����, nvl(m.first_name, '�Ŵ�������') �Ŵ����̸�
from employees e, employees m
where e.manager_id = m.employee_id(+)
order by 1;

select e.employee_id ���̵�, e.first_name �̸�, e.last_name ��, m.first_name �Ŵ�����
from employees e, employees m
where e.manager_id = m.employee_id
union
select employee_id ���̵�, first_name �̸�, last_name ��, '�Ŵ�������'
from employees
where manager_id is null;

-- Q) ������ ���, �����, job���̵� ��� ��, job_id�� 'Clerk'�� �� ����� ����(������)
select employee_id ���, first_name �����, job_id job���̵�
from employees
minus
select employee_id ���, first_name �����, job_id job���̵�
from employees
where lower(job_id) like '%clerk%';


DROP TABLE SALGRADE;

CREATE TABLE SALGRADE 
( 
  GRADE number(5) NOT NULL,
  LSAL number(8),
  HSAL number(8),
    CONSTRAINT SALGRADE_GRADE_PK PRIMARY KEY (GRADE)
);            

INSERT INTO SALGRADE(GRADE, LSAL, HSAL) VALUES (1, 500, 2999);
INSERT INTO SALGRADE(GRADE, LSAL, HSAL) VALUES (2, 3000, 3799);
INSERT INTO SALGRADE(GRADE, LSAL, HSAL) VALUES (3, 3800, 5199);
INSERT INTO SALGRADE(GRADE, LSAL, HSAL) VALUES (4, 5200, 9999);
INSERT INTO SALGRADE(GRADE, LSAL, HSAL) VALUES (5, 10000, 50000);
 
commit; 

SELECT * FROM SALGRADE; 

select * from tab;

-- ������ �޿��� ���������� ��ȸ�Ͻÿ�(����� �̸�, �޿�, ���) ��, �޿��� ����������, ������ �̸� ��������
select e.first_name �̸�, e.salary �޿�, s.grade ���
from employees e, salgrade s
where e.salary between s.lsal and s.hsal
order by e.salary desc, e.first_name;


select department_id, avg(salary)
from employees 
where department_id = 100
group by department_id;

select avg(salary) from employees where department_id = 100;

select department_id  from employees where lower(first_name) = 'nancy';
select avg(salary) from employees where department_id = 100;

desc departments;
select department_id �μ����̵�, department_name �μ���
from departments
where department_id in (select department_id 
                        from employees 
                        where salary=8200);

-- 'IT'�μ����� �ٹ��ϴ� �������� �̸�, �޿�, �Ի��� ��ȸ���
select e.first_name, e.salary, e.hire_date
from employees e, departments d
where d.department_name = 'IT';

-- 'Alexander'�� ���� �μ����� �ٹ��ϴ� ������ �̸��� �μ� id ��ȸ ���
select e.first_name �̸�, e.department_id �μ����̵�
from employees e
where department_id in (select department_id from employees where lower(first_name) = 'alexander');

-- 90�� �μ��� ��ձ޿����� ���� �޿��� �޴� ������ �̸�, �μ� id, �޿��� ��ȸ ���
select first_name �̸�, department_id �μ����̵�,salary �޿�
from employees 
where first_name in (select first_name from employees where salary > 
                      (select avg(salary) from employees where department_id = 90));
      
desc employees;                
-- Seattle�� �ٹ��ϴ� ������ ��ձ޿����� �޿� ���� �����鼭 30�� �μ��� �ִ� �޿����� ���� �޿��� �޴� ������ �̸�, �޿�, �μ���id, �μ��� ���
select first_name, salary, department_id, department_name
from employees
where ;

select * from locations;
select first_name from employees where 
                