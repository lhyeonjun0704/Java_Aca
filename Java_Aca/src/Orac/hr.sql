-- sqldeveloper에서 erd 추출
-- 메뉴 보기 -> data modeler - 브라우저
-- 좌측아래의 브라우저 창에서 맨앞 + 기호클릭한 후 나타나는 "관계형모델[1]" - 마오- 새관계형 모델
-- 화면 우측 relational... 7HR 테이블 드래그 하되 테이블 앞의 그림을 드래그하여 우측 relational..탭창으로
-- 간단하게 보기위해 relational.. 탭창에서 - 빈공간 -마오 -하여 세부정보보기에서 열만 남기고 체크표시 해제
-- 이미지나 pdf로 결과 저장위해 relational... 탭창에서 -마오 한 후 "다이어그램인쇄"에서 선택하여 저장.

-- join
select e.first_name 이름, e.salary 급여, e.department_id 부서아이디, d.department_name 부서명
from employees e, departments d
where e.department_id = d.department_id;

-- Q) 직원의 이름, 매니저아이디, 지역아이디를 출력하시오
select e.first_name 이름,  e.manager_id 매니저아이디, d.location_id 지역아이디
from employees e, departments d
where e.department_id = d.department_id
order by e.first_name;

-- 직원의 이름, 매니저아이디, 지역아이디를 출력하시오
select e.first_name 이름, e.manager_id 매니저아이디, d.location_id 지역아이디
from employees e, departments d
where e.department_id = d.department_id and e.manager_id > 120
order by e.first_name;

-- 사원들의 이름과 직책(job_title)을 조회 출력
select e.first_name 직원명, j.job_title 직책
from employees e, jobs j
where e.job_id = j.job_id;

select * from employees;
select * from locations;
select * from departments;
select * from tab;

-- 직원의 이름, 부서명, 해당 city를 출력하시오
select e.first_name 직원명, d.department_id 부서명, l.city 도시
from employees e, locations l, departments d
where e.department_id = d.department_id and d.location_id = l.location_id
order by l.city asc;

select * from employees;
select * from locations;
select * from departments;
-- 도시별 직원수 출력( 출력은 도시명, 직원수)
select l.city 도시명, count(l.city)
from locations l, departments d, employees e
where l.location_id = d.location_id and d.department_id = e.department_id
group by l.city;

select * from locations;
select * from departments;
-- 부서이름과 부서가 속한 도시명(city)을 조회 출력.
select d.department_name 부서명, l.city 도시명
from departments d, locations l
where d.location_id = l.location_id;

select * from countries;
select * from employees;
-- 사원의 이름과 해당 사원이 근무하는 국가명 조회 출력.
select e.first_name 이름, c.country_name 근무국가명
from employees e, departments d, locations l, countries c
where e.department_id = d.department_id and d.location_id = l.location_id and l.country_id = c.country_id;

-- 직책(job_title)이 'representative'인 사람 이름 직책, 부서 조회 출력
select e.first_name 이름, j.job_title 직책, d.department_name
from employees e, jobs j, departments d
where d.department_id = e.department_id and e.job_id = j.job_id and lower(j.job_title) like '%representative%';

select job_title from jobs;

-- 직책(job_title)이 'clerk'인 사람 이름 직책, 부서명 조회

-- 각 도시에 속한 부서명 별로 2007년 이전에 입사한 직원들의 인원수 출력( 단, 같은 도시일 경우 직원수가 많은 순으로 출력 도시명-부서명-인원수)
select c.country_name 도시명, d.department_name 부서명, count(c.country_name)
from employees e, departments d, countries c, locations l
where substr(e.hire_date, 1, 2) = '07'and d.location_id = l.location_id and l.country_id = c.country_id and e.department_id = d.department_id
group by d.department_name, c.country_name
order by c.country_name asc, count(c.country_name) desc;

select l.city 도시명, d.department_name 부서명, count(*) 인원수
from employees e, departments d, locations l 
where e.department_id = d.department_id and d.location_id = l.location_id and hire_date < '07/01/01'
group by l.city, d.department_name
order by l.city, count(*) desc;

select e.first_name 이름, e.salary 급여, d.department_name 부서명
from employees e, departments d
where e.department_id = d.department_id(+);

select e.first_name 이름, e.salary 급여, d.department_name 부서명
from employees e, departments d
where e.department_id(+) = d.department_id;

select e.first_name 이름, e.salary 급여, d.department_name 부서명
from employees e left outer join departments d
on(e.department_id = d.department_id);

select e.first_name 이름, e.salary 급여, d.department_name 부서명
from employees e right outer join departments d
on(e.department_id = d.department_id);

-- outer join 테이블 이거 ansi 1999으로 작성해야됨.


select e.first_name 이름, e.salary 급여, d.department_name 부서명
from employees e, departments d
where e.department_id = d.department_id(+)
union
select e.first_name 이름, e.salary 급여, d.department_name 부서명
from employees e, departments d
where e.department_id(+) = d.department_id;

select hire_date from employees;

-- 2007년 입사한 직원들의 사번, 이름, 성(last_name), 입사일, 부서명을 출력
-- 이 때, 부서에 배치되지 않은 직원의 경우, '그런부서없어'로 보여주고 정렬은 성(last_name)을 기준 출력
select e.employee_id 사번, e.first_name 이름, e.last_name 성, e.hire_date 입사일, nvl2(d.department_name, d.department_name, '그런부서없어') 부서명
from employees e, departments d
where e.hire_date like '07%'and e.department_id = d.department_id(+)
order by e.last_name;
