select * from employees;
select * from departments;
select * from locations;
select * from countries;
select * from regions;
select * from job_history;
select * from jobs;

create table sawon_table(
    emp_id number(5),
    emp_name char(20),
    emp_hiredate date default sysdate,
    emp_address varchar2(50)
    );

select * from tab;

desc sawon_table;
select * from sawon_table;

insert into sawon_table values (100, 'hong', '21/09/07', 'seoul');

update sawon_table set emp_address='jeju' where emp_id = 100;
update sawon_table set emp_id = 120 where emp_address='jeju';

insert into sawon_table values ( 140, 'park', '21/09/07', NULL);

insert into sawon_table(emp_id, emp_hiredate) values(150, '98/09/07');

commit;

-- ���� �� insert &�� ������ ���â��(����), ''(��������ǥ) �� ���̸� ���������� ��, ������ ��������
-- &id���� id�� �ݵ�� �÷���� ��ġ�� �ʿ� x

insert into sawon_table values(&id, '&name', '&date', '&juso');

select * from employees;

select last_name, first_name from employees;

select last_name || ' ' || first_name as ���� from employees;

select salary from employees where salary >= 1300;
select 'Steven�� ������ 2400�޷��̴�.' from employees;
