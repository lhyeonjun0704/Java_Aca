-- 21/11/18
select * from employees;
select * from tab;
desc departments;
select e.employee_id, e.first_name
from employees e, departments d
where e.manager_id = d.manager_id;

--self join
select e.employee_id 사번, e.first_name 사원명, m.first_name 매니저이름
from employees e, employees m 
where e.manager_id = m.employee_id(+)
order by 1;

select * from employees;
-- 직원의 사번, 사원이름, 매니저아이디, 매니저이름을 출력하시오(단, 관리자가 없는 직원도 출력)
select e.employee_id 사번, e.first_name 사원이름, e.manager_id 매니저아이디, m.first_name 매니저이름
from employees e, employees m
where e.manager_id = m.employee_id(+)
order by 1;

select e.employee_id 사번, e.first_name 사원이름, e.manager_id 매니저아이디, m.first_name 매니저이름
from employees e, employees m
where e.manager_id = m.employee_id(+)
union
select e.employee_id 사번, e.first_name 사원이름, e.manager_id 매니저아이디, m.first_name 매니저이름
from employees e, employees m
where e.manager_id(+) = m.employee_id
order by 4;

select e.employee_id 사번, e.first_name 사원명, nvl(m.first_name, '매니저없음') 매니저이름
from employees e, employees m
where e.manager_id = m.employee_id(+)
order by 1;

select e.employee_id 아이디, e.first_name 이름, e.last_name 성, m.first_name 매니저명
from employees e, employees m
where e.manager_id = m.employee_id
union
select employee_id 아이디, first_name 이름, last_name 성, '매니저없음'
from employees
where manager_id is null;

-- Q) 직원의 사번, 사원명, job아이디 출력 단, job_id가 'Clerk'이 들어간 사원은 제외(차집합)
select employee_id 사번, first_name 사원명, job_id job아이디
from employees
minus
select employee_id 사번, first_name 사원명, job_id job아이디
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

-- 직원의 급여가 몇등급인지를 조회하시오(출력은 이름, 급여, 등급) 단, 급여가 많은순부터, 같으면 이름 오름차순
select e.first_name 이름, e.salary 급여, s.grade 등급
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
select department_id 부서아이디, department_name 부서명
from departments
where department_id in (select department_id 
                        from employees 
                        where salary=8200);

-- 'IT'부서에서 근무하는 직원들의 이름, 급여, 입사일 조회출력
select e.first_name, e.salary, e.hire_date
from employees e, departments d
where d.department_name = 'IT';

-- 'Alexander'와 같은 부서에서 근무하는 직원의 이름과 부서 id 조회 출력
select e.first_name 이름, e.department_id 부서아이디
from employees e
where department_id in (select department_id from employees where lower(first_name) = 'alexander');

-- 90번 부서의 평균급여보다 많은 급여를 받는 직원의 이름, 부서 id, 급여를 조회 출력
select first_name 이름, department_id 부서아이디,salary 급여
from employees 
where first_name in (select first_name from employees where salary > 
                      (select avg(salary) from employees where department_id = 90));
      
desc employees;                
-- Seattle에 근무하는 직원의 평균급여보다 급여 많이 받으면서 30번 부서의 최대 급여보다 적은 급여를 받는 직원의 이름, 급여, 부서명id, 부서명 출력
select first_name, salary, department_id, department_name
from employees
where ;

select * from locations;
select first_name from employees where 
                