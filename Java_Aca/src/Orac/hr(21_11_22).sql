-- Q) 커미션을 가장 많이 받는 상위 3명의 이름과 커미션을 조회 출력
select first_name 이름, salary * commission_pct 커미션 
from (select first_name, salary, commission_pct from employees 
order by 2 desc nulls last)
where rownum <= 3 and commission_pct is not null;

select salary * commission_pct 
from employees 
where commission_pct  is not null and rownum <= 3 
order by 1 desc;

select * from employees;

-- 80번 부서의 평균급여보다 평균급여가 작은 부서의 부서아이디와 해당 부서의 평균급여를 조회출력하시오.
select e.department_id 부서아이디, round(avg(m.salary))
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


-- 부서 아이디가 80번인 사원아이디와 급여가 들어있는 테이블 작성.
create table employees_deptid_80
as
select employee_id, salary 
from employees
where department_id = 80;

select * from employees_deptid_80;

create table employees_s
as select first_name 이름, phone_number 전화번호, department_id 부서아이디
from employees;

select * from employees_s;

-- all < : 이 중 최대값 보다 큰거~  
-- any : in과 같은 효과 !any 는 no in과 같은 효과

-- 부서ID가 80인 부서 직원들의 급여(예: 12000이 최대라면) 보다 많은 급여를 받는 직원들 조회
select employee_id 부서아이디, first_name 이름, salary 급여
from employees
where salary > all(select salary from employees where department_id = 80);

select employee_id 부서아이디, first_name 이름, salary 급여
from employees
where salary <= all(select salary from employees where department_id = 80);

select employee_id 부서아이디, first_name 이름, salary 급여
from employees
where salary >= any(select salary from employees where department_id = 80);

-- savepoint ~; 하면 commit한 부분 세이브포인트 정할 수 있음
-- rollback to ~; 하면 ~전 까지만 롤백할 수 있음.

select * from jobs;
-- 사원 직책에 따라 급여를 인상지급하고자 한다.
-- 직책에 'Manager'가 포함된 사원은 급여를 인상하여 1.1만큼 지급하고 나머지는 1.5만큼 지급한다.
-- 이름, 직책, 인상된급여 조회 출력.
-- 삼항연산자 ≒ decode(대상컬럼, 조건, yes처리1, no처리2)

-- 애초에 이건 decode로 푸는 문제가 아님.
select e.first_name 이름, j.job_title 직책, e.salary 급여, decode(j.job_title in ('Manger'),0 , salary*1.1, salary*1.5) 인상된급여
from employees e join jobs j
on e.job_id = j.job_id;


-- 만일 job_id가 'AD'로 시작하면 10%, 'FI'로 시작하면 15% 인상 'PU'로 시작하면 20% 인상

select e.first_name 이름, j.job_title 직책, e.salary 급여, decode(upper(substr(j.job_id, 1, 2)) , 'AD' , salary*1.1, 'FI', salary*1.5, 'PU', salary*1.2) 인상된급여
from employees e join jobs j
on e.job_id = j.job_id;

-- 직책이 Manager이면 10%, accountant이면 20% 그 외 30%
select e.first_name 이름, j.job_title 직책, e.salary 급여, case when j.job_title like '%Manager%' then salary*1.1
                                                             when j.job_title like '%Accountant%' then salary*1.2
                                                             else salary*1.3 end
from employees e join jobs j
on e.job_id = j.job_id;

select * from employees_s;

flashback table employees_s to before drop;

--drop table employees_s purge; --복구 불가

-- 제약 조건 5가지 무결성을 위해서 
-- primary key -> 중복 x, null x(pk)
-- foreign key -> 중복 가능, null 가능(fk)
-- unique -> 하나만 가능(중복 불가), null은 무관 (uk)
-- not null -> null만 불가 (nn)
-- check : 가격 > 0 (ck)
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

