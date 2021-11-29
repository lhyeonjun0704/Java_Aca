-- 21/ 11/ 25

-- 사원수와 부서테이블의 행수를 조회 출력하시오 (단, 2개의 procedure로 작성하며 out 인자를 사용하시오.)

create or replace procedure soo_count
( v_emp_cnt out number, v_dept_cnt out number )
is
begin
    select count(*) into v_emp_cnt
    from employees;
    
    select count(*) into v_dept_cnt
    from departments;
    
end;
/

set serveroutput on
create or replace procedure soo_count_result
is
    v_emp_cnt number;
    v_dept_cnt number;
begin
    soo_count(v_emp_cnt, v_dept_cnt); 
    dbms_output.put_line(v_emp_cnt || ', ' || v_dept_cnt);
end;
/

select * from sawon_table;
-- sawon_table의 1번 사원을 삭제하는 프로그램을 작성하시오.
create or replace procedure d_sawon
( v_id in sawon_table.emp_id%type)
is
    
begin
    delete from sawon_table
    where emp_id = v_id;
    commit;
end;
/

execute d_sawon(1)

-- employees 사원 중 사원아이디가 120이상인 사원의 급여를 10%인상하시오 (110, 20%), (130, 15%) 식으로

create or replace procedure em_sal_10
(v_employee_id in employees.employee_id%type, v_percent in number)
is
begin
    update employees
    set salary = salary * (1+v_percent/100)
    where employee_id >= v_employee_id;
    commit;
end;
/

execute emp_sal_10(120, 10);


-- 지역 아이디를 입력받아 해당 지역아이디의 모든 컬럼내용을 조회 출력하시오.
-- 컬럼이 많을 경우 -> 해결은 컬럼단위로 하짐라고 테이블 단위로 하면된다. aa%Type bb%Type 대신에 테이블명%rowtype로 해결 가능.

set serveroutput on
create or replace procedure sawon_region_info
(v_in_region_id regions.region_id%type)
is
    all_re regions%rowtype;
begin
    select * into all_re
    from regions
    where region_id = v_in_region_id;
    dbms_output.put_line('지역아이디 = ' || all_re.region_id || chr(10) || '지역명 = ' || all_re.region_name);
end;
/
select * from regions;

execute sawon_region_info(1)


-- 부서 아이디와 사원명을 입력받아 부서아이디, 사원명, 급여를 조회 출력하는 프로시져 작성하시오 (%rowtype사용)
set serveroutput on
create or replace procedure find_sal
(v_d_id in employees.department_id%type, v_e_name in employees.first_name%type)
is
    t1 employees%rowtype;
begin
    select department_id, first_name, salary into t1.department_id, t1.first_name, t1.salary
    from employees
    where department_id = v_d_id and first_name = v_e_name;
    dbms_output.put_line('부서아이디 =' || t1.department_id || '사원명 = ' || t1.first_name || '급여 = ' || t1.salary);
end;
/

select * from employees;
execute find_sal(90, 'Lex')

-- 사원 아이디를 입력받아 급여가 5000이상이면 A, 그렇지 않으면 B를 출력하는 프로시져를 작성하시오(출력은 사원아이디, 급여, 등급)
set serveroutput on
create or replace procedure over_5
(v_id in employees.department_id%type)
is
    e_id_t employees%rowtype;
    temp char(1);
begin
    select employee_id, salary into e_id_t.employee_id, e_id_t.salary 
    from employees
    where employee_id = v_id;
    if e_id_t.salary >= 5000 
    then temp := 'A'; else temp := 'B'; end if;
    dbms_output.put_line('사원아이디 = ' || e_id_t.employeE_id || '급여 = ' || e_id_t.salary || '등급 = ' || temp);
end;
/

execute over_5(121)


for i in 1..100 loop
v_hap := v_hap+i;
end loop;


select * from teltable;
-- cursor
-- cursor는 sql 커서를 말하며 multi row 저장 관련 메모리 포인터(select 결과로 나오는 여러개의 행을 저장하는 종이박스의 개념)
-- 종류는 implicit cursor, explicit cursor

-- 사원테이블에서 이름을 입력받아 해당 이름 데이터를 삭제하는 프로시져 작성. 삭제한 후 결과에 대한 comment도 출력.
set serveroutput on
create or replace procedure delete_sawon_table
(v_name in sawon_table.emp_name%type)
is
    v_result varchar2(30);
begin
    delete from sawon_table
    where emp_name = v_name;
    -- commit;
    
    if sql%notfound then
        v_result := '없음';
    else
        v_result := to_char(sql%rowcount) || '명'; -- 결과적으로 반환되는 행 수
    end if;
    dbms_output.put_line('삭제된 인원은 ' || v_result || '입니다.');
    
end;
/
select * from sawon_table;
execute delete_sawon_table('park')

-- 급여를 입력하여 해당 급여보다 많은 급여를 받는 사원의 이름, 급여, 입사일을 출력하고 몇명인지 인원수도 출력하는 프로시져 작성하시오.(cursor사용)

is
    cursor 커서명 is select문장;
begin
    open 커서명;
    fetch 커서명 into 변수들;
    close 커서명;
end;
/

set serveroutput on
create or replace procedure sawon_sal_gt
(v_in_salary employees.salary%type)
is
    v_first_name employees.first_name%type;
    v_salary = employees.salary%type;
    v_shiredate = employees.hire_date%type;
    
    cursor salary_gt is
        select first_name, salary, hire_date
        from employees
        where salary > v_in_salary;
begin
    open salary_gt;
    loop
    fetch salary_gt into v_first_name, v_salary, v_hiredate;
    
    exit when salary_gt%notfound;
    
    dbms_output.put_line('사원이름 = ' || v_first_name || chr(10) || '급여 = ' || v_salary || chr(10) || '입사일 = ' || v_hiredate);
    
    end loop;

-- trigger
--(1단계) 
 
  create table panmae_table (
     id   number(3),
     dan  number(5),
         soo  number(5) 
   
   );
 
 insert into panmae_table
 values (1,1000,200);
 
 insert into panmae_table
 values (2,500,50);
 
 commit;
 
 
  create table  keum_table (
  id  number(3),
  keum number(10)
  
  );
  
  insert into keum_table
 values (1,200000);
 
 insert into keum_table
 values (2,25000);
 
commit;

delete from keum_table where id = 1 or id = 2;

create or replace trigger kyesan_trigger
after update of soo on panmae_table
for each row
begin
    update keum_table
    set keum = :old.dan * :new.soo
    where id = :old.id;
end;
/

update panmae_table
set soo = 57
where id = 1;

select * from keum_table;
select * from panmae_table;

-- Q) 토요일과 일요일에는 작업하지 못하도록 trigger 프로그램을 작성하시오. 토-일은 panmae_table에 변화가 발생하면 오류 출력
set serveroutput on
create or replace trigger no_working
before update or insert or delete on panmae_table
begin
    if(to_char(sysdate, 'day') in ('목요일', '금요일')) then
    raise_application_error(-20000, 'stop running');
    else
        dbms_output.put_line('Hello');
    end if;
end;
/












