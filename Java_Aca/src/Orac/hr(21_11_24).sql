-- 2021/11/24

-- index(조회속도 상향)
-- 인덱스 만들어 사용하기(책의 목차)(단, 인덱스가 무조건 속도를 빠르게 하는 것은 아니다.)
-- 행수가 많을경우, join등에 빈번하게 사용되는 컬럼에는 좋으나 수정이나 변경 사항이 많은 경우에는
-- 인덱스도 변경해야하므로 사용하지 않는 것이 좋다.

-- 급여가 2000 이상인 경우에 해당되는 급여와 부서명 출력

select e.salary 급여, d.department_name 부서명
from employees e join departments d
on e.department_id = d.department_id
where salary > 2000
order by 1 desc;


drop index idx_employees_salary; -- 삭제
create index idx_employees_salary on employees(salary); -- 생성
alter index idx_employees_salary rebuild; -- 변경

-- PL/SQL : Procedure Language/ sql (sql + 절차적프로그래밍)

-- pl/sql block 는 declare, begin, exception, end 로 구성
-- declare, exception 은 생략 가능
-- 이름이 없는 경우는 익명 블록이다.
-- 변수 선언은 declare절에서 하되, procedure 안에서 사용할 변수는 IS에 기술한다.
-- Begin ~ End; 의 블록단위로 실행하며 이 블록안에 처리 문장 등이 들어간다.
-- 각각의 문장의 종료는 세미콜론(;)
-- 주석은 한 문장인 경우 -- 기호 이며 여러줄 주석은 자바와 같다.
-- END의 끝에 세미콜론(;) 을 사용, 이것은 블록-end를 의미
-- 블록의 실행을 위해 문장 긑에 /를 입력한다.
-- 검색관련 select 에서는 결과는 한 행이 반환되어야 하며 into 변수가 요구된다.
-- 검색관련 select 여러 줄 처리가 가능하게 하려면 cursor를 사용하면 된다.

-- ex) 삼각형 넓이 구하는 함수
-- ex)create or replace function name(v, v);

create or replace function t_function
( v_l in number, v_h in number)
return number; -- 반환 자료형이 숫자
is v_result number;
begin
    v_result = (v_l * v_h) / 2;
    return v_result;
end;/


