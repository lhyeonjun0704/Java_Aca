-- translate / replace
select first_name, email from employees where translate(email, '0123456789', 'PPPPPPPPPP')<> email;

-- 반올림 round
select round(36.754, -1) from dual;

-- 절삭
select trunc(26.754, 1) from dual;

-- 만난지 100일
select sysdate, sysdate+100-1 "만나지 100일" from dual;

-- date 반올림(반올림은 16일부터)
select round(sysdate, 'mon') from dual;
select round(to_date('211116'), 'mon') from dual;
select round(to_date('2021 11 16', 'yyyy mm dd'), 'mon') from dual;
select round(sysdate, 'year') from dual;
select sysdate, add_months(sysdate, 6) from dual;

-- months_between() 인자 순서는(최신날짜, 오래된 날짜)

select first_name, months_between(sysdate, hire_date) from employees;
select first_name, trunc(months_between(sysdate, hire_date)) from employees;
select first_name, hire_date, salary, round(months_between(sysdate, hire_date)/12) from employees where round(months_between(sysdate, hire_date)/12) >= 15;

-- to_char() to_date()

select to_date(sysdate) from dual;

select to_char(sysdate, 'yyyy/mm/dd') from dual;

select first_name, hire_date from employees where to_char(hire_date, 'RR') = '05';

-- 단일행함수(single row function)
select first_name from employees where length(first_name) = 5;

select avg(commission_pct) from employees;

select sum(commission_pct) from employees;

-- 급여의 합, 최소, 최대 급여 출력, 급여평균, 직원수, 매니저있는 직원수, 직원부서 수 구하기
select sum(salary), min(salary), max(salary), round(avg(salary),1), count(*), count(manager_id), count(department_id) from employees;
select sum(salary), min(salary), max(salary), round(avg(salary),1), count(*), count(manager_id), count(distinct department_id) from employees;

-- 부서별 급여의 평균
select department_id, avg(salary) from employees group by department_id order by 1;

-- 부서별 급여의 평균 구하시오
-- 공식 => group by 일 때 select 문에서 그룹함수를 제외한 나머지 칼럼 모드가 group by에 있으면 GOOD 그렇지 않으면 error

select department_id, first_name, avg(salary) from employees group by department_id, first_name order by 1;

<<<<<<< HEAD
select department_id 부서아이디, manager_id 매니저아이디, avg(salary) 평균급여 
from employees 
group by department_id, manager_id;

-- 연봉이 5천만 이하인 직원에 대하여 부서별 최소급여
select department_id, min(salary) from employees where salary*12 < 50000000 group by department_id order by 1;

select department_id 부서, min(salary) 최소급여
from employees
where 'IT' <> substr(job_id, 1, 2)
group by department_id
order by 1;

-- 부서 아이디가 30이상인 직원 부서별 최소급여
select department_id 부서, min(salary) 최소급여
from employees
where department_id >= 30
group by department_id
order by 1;

-- 부서아이디 30이상, 부서별 최소 급여(부서아이디, 최소급여, 평균급여), 부서별 평균급여 10000이하만
select department_id, min(salary), round(avg(salary),0)
from employees
where department_id >= 30 
group by department_id
having avg(salary) <= 10000
order by 1;

desc employees;
-- 각 부서별 직원 수 및 평균급여 주회 직원수가 20명 이상인 부서만 출력
select department_id, count(department_id), avg(salary)
from employees
group by department_id
having count(department_id) >= 20
order by 1;

-- 부서별 인원 수 조회, 인원 수 3명 이상인 부서만
select department_id, count(department_id)
from employees
group by department_id
having count(department_id) >= 3
order by 1;

-- 부서가 30, 90번인 직원들 중 급여 5000이상, 12000 이하 직원들 한해 부서별 평균급여 단, 평균급여 3500이상만 출력, 평균급여 낮은 순
select department_id, avg(salary)
from employees
where salary >= 5000 and salary <= 12000
group by department_id
having avg(salary) >= 3500
order by avg(salary) asc;

-- 각 부서별 최대 급여 최소급여, 평균급여, 급여합계, 인원 수 출력
select department_id, min(salary), max(salary), avg(salary), sum(salary), count(department_id)
from employees
group by department_id
order by 1;

-- 부서별 평균연봉, 최대연봉, 단 부서별 급여 합계 20000이상
select department_id, avg(salary*12), max(salary*12)
from employees
group by department_id
having sum(salary) >= 20000
order by 1;

-- 입사년도별 직원수 출력 직원 수 많은 년도가 먼저 출력(직원 수 내림차순) 단 사원 수 8명 이상인 년도만 출력
select substr(hire_date, 1, 2), count(hire_date)
from employees
group by substr(hire_date, 1, 2)
having count(hire_date) >= 8
order by 2 desc;

select substr(hire_date, 1, 2) from employees;

select first_name 사원명, salary 급여, department_name 부서명
from employees, departments;
=======



>>>>>>> 7b02ad07e221d94ae65417bb6b9ced4e976bf1f6

