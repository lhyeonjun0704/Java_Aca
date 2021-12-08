-- 2021/11/19

-- 'Alexander' 와 같은 부서에서 근무하는 직원의 이름과 성, 부서 id 조회
select e.first_name 이름,  e.last_name 성, 
;
-- 90번 부서의 평균급여보다 많은 급여를 받는 직원의 이름, 부서 id, 급여를 조회출력
select first_name 이름, department_id 부서아이디, salary 급여
from employees
where salary > (select avg(salary) from employees where department_id = 90);

-- seattle에 근무하는 직원의 평균급여보다 급여를 많이 받으면서 30번부서의 최대 급여보다 적은 급여를 받는 직원의
-- 이름, 급여, 부서id, 부서명, 조회 출력
select e.first_name 이름,e.salary 급여,e.department_id 부서번호,
        d.department_name 부서명
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

-- 'IT' 부서에서 근무하는 직원들의 이름, 급여, 입사일, 부서아이디, 부서명 조회 출력

select e.first_name 이름, e.salary 급여, e.hire_date 입사일, e.department_id, d.department_name 부서명
from employees e join departments d
on d.department_id = e.department_id 
where d.department_name ='IT';

-- Q) 각 부서별로 최저급여를 받는 직원의 이름과 부서아이디, 급여 조회 출력 (단, 출력은 부서아이디 오름차순)
select first_name, department_id, salary
from employees 
where (department_id, salary) in (select department_id, min(salary) from employees group by department_id)
order by department_id;

select first_name, department_id, salary
from employees 
where (department_id, salary) in (select department_id, max(salary) from employees group by department_id)
order by department_id;


select department_id, min(salary) from employees group by department_id order by 1;


--q) 사원의 이름, 부서id, 급여를 조회 출력 ( 단, 사원이 속한 해당 부서의 최소급여를 급여다음에 넣어 출력)
select first_name 이름, department_id 부서아이디, salary 급여,
(select min(salary) from employees where department_id = e.department_id) 최소급여 
from employees e;

--Q) 사원의 급여가 지신이 속한 부서의 평균급여보다 많은 사원에 대해 사원명, 급여, 평균급여 조회 출력( 단, from 절에 subquery사용)
select e.first_name 사원명, e.salary 급여 , a.avgsal
from employees e, (select department_id, round(avg(salary)) avgsal
                   from employees
                   group by department_id) a
where e.department_id = a.department_id and e.salary > a.avgsal;


--Q) 급여를 많이 받는 순으로 직원 이름 급여를 조회 출력하시오.
select first_name, salary
from employees
order by 2 desc;

-- Q) 방법으로는
select first_name 이름, salary 급여
from a

select first_name, salary
from employees
order by 2 desc;

select first_name, salary
from (select first_name, salary
from employees
order by 2 desc) a;

--Q) 급여를 많이 받는 순으로 직원 이름 급여를 조회 출력하시오.(조회된 순서대로 일련번호도 출력하시오). 단, from에 subquery사용)

--Q) 급여를 가장 많이 받는 상위 7명의 직원 이름 급여를 조회 출력
select first_name 이름, salary 급여 
from(select first_name, salary from employees order by salary desc)
where rownum <=8;




