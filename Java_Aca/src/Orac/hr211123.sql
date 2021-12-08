-- 제약조건 사용법
--constraint 제약조건 이름(테이블명_칼럼명_제약조건약어) 제약주건 종류(5중 1)

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

-- 제약조건 L2
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
-- constraint memtable2_memtel2_uk check(memtel like '02-3355-%'), 규칙 정할 수 있음.
-- constraint memtable2_memtel3_pk primary key(memtel)

desc memtable2;

select * from memidtable;

insert into memidtable values( 1, '홍길동');
insert into memidtable values( 2, '홍길말');
commit;

insert into memtable (memid, memetel, memhobby, memname)
VALUES (2, '010-3355-7890', 'no', '이은우');

select * from memtable;

-- memtable의 제약조건이름 selelct 
select * from user_cons_columns where table_name = 'MEMTABLE';

-- view

-- 부서아이디가 100번인 사원의 이름과 전화번호만 들어가는 table을 만드시오
select first_name, phone_number 
from employees
where department_id=100;

-- 부서아이디가 100번인 사원의 이름과 전화번호만 들어가는 view를 만드시오
create view dept_100_view
as select first_name, phone_number 
from employees
where department_id=100;
select * from dept_100_view;

-- view는 실제내용이 보이는 이유는 view안에 sql문장이 실행되면서 내용이 출력된다.
select view_name, text from user_views;


-- replace!
create or replace view dept_80_view
as select first_name, phone_number
from employees
where department_id = 80;

select * from dept_80_view;

create or replace view dept_80_view -- 이름은 그대로 두고
as select first_name, phone_number
from employees
where department_id = 50;

create or replace view emp_mid_121_view
as select * from employees
where manager_id = 121
with check option; -- 조건문에 있는 컬럼은 view로 변경하지못하도록 하는것?

update emp_mid_121_view
set manager_id = 150   
where employee_id = 131;

-- view 수정하지 못하도록 
create or replace view emp_mid_122_view
as select * from employees
where manager_id = 122
with read only;

-- read only이기 때문에 변경 불가
update emp_mid_122_view
set manager_id = 121
where employee_id = 135;

create sequence sawon_table_seq;

insert into sawon_table values(sawon_table_seq.nextval, 'aaa', '20/11/23', 'seoul');

select * from sawon_table;


select c.country_name 국가명, count(*) 사원수
from employees e join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
join countries c
on c.country_id = l.country_id
group by c.country_name;

select * from employees;
desc employees;

select extract(year from hire_date) || '년도' 입사년도, count(*) 사원수
from employees
group by extract(year from hire_date)
order by 2 desc;

select first_name 이름, nvl(to_char(department_id), '부서없음') 부서아이디, salary 급여
from employees 
where salary > 5000 and salary < 10000 and commission_pct is not null
order by salary desc;



