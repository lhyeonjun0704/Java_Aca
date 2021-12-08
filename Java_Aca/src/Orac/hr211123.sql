-- �������� ����
--constraint �������� �̸�(���̺��_Į����_�������Ǿ��) �����ְ� ����(5�� 1)

select * from dictionary;

create table memidtable(
    memid number(6) constraint memidtable_memid_pk primary key,
    memname varchar(20)
    );
    

create table memtable(
    memname varchar2(20) constraint memtable_memname_pk primary key,
    memetel varchar2(20) constraint memtable_memtel_uk unique,
    memhobby varchar2(30) constraint memtable_memhobby_nn not null,
    membi number(5) constraint memtable_membi_ck check(1000 < membi),
    memid number(6) constraint memtable_memid_fk references memidtable(memid)
    );

desc memtable;

-- �������� L2
create table memtable2(
    memname varchar2(20),
    memtel varchar2(20),
    memhobby varchar2(20),
    membi number(5),
    memid number(6),
    constraint memtable2_memname_pk primary key(memname),
    constraint memtable2_memtel_uk unique(memtel),
    constraint memtable2_membi_ck check(membi > 1000),
    constraint memtable2_memid_fk foreign key(memid) references memidtable(memid)
    );
    
-- constraint memtable2_memname2_pk primary key(memname, memtel)
-- constraint memtable2_memtel2_uk check(memtel like '02-3355-%'), ��Ģ ���� �� ����.
-- constraint memtable2_memtel3_pk primary key(memtel)

desc memtable2;

select * from memidtable;

insert into memidtable values( 1, 'ȫ�浿');
insert into memidtable values( 2, 'ȫ�渻');
commit;

insert into memtable (memid, memetel, memhobby, memname)
VALUES (2, '010-3355-7890', 'no', '������');

select * from memtable;

-- memtable�� ���������̸� selelct 
select * from user_cons_columns where table_name = 'MEMTABLE';

-- view

-- �μ����̵� 100���� ����� �̸��� ��ȭ��ȣ�� ���� table�� ����ÿ�
select first_name, phone_number 
from employees
where department_id=100;

-- �μ����̵� 100���� ����� �̸��� ��ȭ��ȣ�� ���� view�� ����ÿ�
create view dept_100_view
as select first_name, phone_number 
from employees
where department_id=100;
select * from dept_100_view;

-- view�� ���������� ���̴� ������ view�ȿ� sql������ ����Ǹ鼭 ������ ��µȴ�.
select view_name, text from user_views;


-- replace!
create or replace view dept_80_view
as select first_name, phone_number
from employees
where department_id = 80;

select * from dept_80_view;

create or replace view dept_80_view -- �̸��� �״�� �ΰ�
as select first_name, phone_number
from employees
where department_id = 50;

create or replace view emp_mid_121_view
as select * from employees
where manager_id = 121
with check option; -- ���ǹ��� �ִ� �÷��� view�� �����������ϵ��� �ϴ°�?

update emp_mid_121_view
set manager_id = 150   
where employee_id = 131;

-- view �������� ���ϵ��� 
create or replace view emp_mid_122_view
as select * from employees
where manager_id = 122
with read only;

-- read only�̱� ������ ���� �Ұ�
update emp_mid_122_view
set manager_id = 121
where employee_id = 135;

create sequence sawon_table_seq;

insert into sawon_table values(sawon_table_seq.nextval, 'aaa', '20/11/23', 'seoul');

select * from sawon_table;


select c.country_name ������, count(*) �����
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
join countries c
on c.country_id = l.country_id
group by c.country_name;

select * from employees;
desc employees;

select extract(year from hire_date) || '�⵵' �Ի�⵵, count(*) �����
from employees
group by extract(year from hire_date)
order by 2 desc;

select first_name �̸�, nvl(to_char(department_id), '�μ�����') �μ����̵�, salary �޿�
from employees 
where salary > 5000 and salary < 10000 and commission_pct is not null
order by salary desc;



