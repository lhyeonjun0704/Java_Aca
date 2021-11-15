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





