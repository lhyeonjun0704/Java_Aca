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

-- 여러 줄 insert &가 붙으면 기억창고(변수), ''(작은따옴표) 를 붙이면 문자형식일 때, 없으면 숫자형식
-- &id에서 id를 반드시 컬러명과 일치할 필요 x

insert into sawon_table values(&id, '&name', '&date', '&juso');

select * from employees;

select last_name, first_name from employees;

select last_name || ' ' || first_name as 성명 from employees;

select salary from employees where salary >= 1300;
select 'Steven의 봉급은 2400달러이다.' from employees;
