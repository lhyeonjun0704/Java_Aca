-- 방법 1)
-- 반환 자료형이 숫자
create or replace function t_function
( v_l in number, v_h in number)
return number 
is v_result number;
begin
    v_result := (v_l * v_h) / 2;
    return (v_result);
end;
/

select '삼각형의 넓이는 ' || t_function(100, 20) text_temp from dual;

-- 방법 2)
variable result number
execute :result := t_function(5, 3)
print result

-- declare
set serveroutput on
declare
    aa number;
    irum varchar(20) := 'hong';
    begin
        aa := 95;
        dbms_output.put_line(aa);
        DBMS_OUTPUT.PUT_LINE(irum);
        
    end;
    /

desc departments;

-- 부서아이디를 입력하여 해당 부서 급여의 평균급여를 조회 출력하는 function 작성
create or replace function avgsal_dept_func
( v_department_id in employees.department_id%type)
return employees.salary%type
is v_avg_salary employees.salary%type;
begin
    select avg(salary) into v_avg_salary
    from employees
    where department_id = v_department_id;
    
    return (v_avg_salary);
    
end;
/

variable aaa number
execute :aaa := avgsal_dept_func(80)
print aaa


-- 초기치로 id에 10, irum에 hong 성별에 M 입사일에 오늘날짜를 넣어 출력하는 익명 블록을 작성하시오.
set serveroutput on
declare
    v_id number(2);
    v_irum char(4);
    v_sex char(1);
    v_hd date;
    begin
        v_id := 10;
        v_irum := 'hong';
        v_sex := 'M';
        v_hd := sysdate;
        
        dbms_output.put_line('id = ' || v_id || ', irum = ' || v_irum || ', sex = ' || v_sex || ', hiredate = ' || v_hd);

    end;
/

-- 지구에서의 몸무게 입력받아 달에서의 몸무게를구하는 프로그램을 작성하시오(단, 달에서 몸무게는 지구의 1/6, procedure로)
set serveroutput on
create or replace procedure weight_moon
(v_weight_earth in number)

is 
    v_w_m number(7, 2);
begin
    v_w_m := round(v_weight_earth / 6, 2);
    dbms_output.put_line(v_w_m);
end;
/

execute weight_moon(73)

-- + 0이나 음수 들어오면 "양수를 입력해주세요" 종료)

set serveroutput on
create or replace procedure weight_moon
(v_weight_earth in number)

is 
    v_w_m number(7, 2);
begin
    if(v_weight_earth <=0) then
        dbms_output.put_line('양수를 입력하세요.');
    return;
    end if;
    v_w_m := round(v_weight_earth / 6, 2);
    dbms_output.put_line(v_w_m);
end;
/

execute weight_moon(-100)



