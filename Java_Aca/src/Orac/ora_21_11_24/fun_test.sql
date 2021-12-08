-- ��� 1)
-- ��ȯ �ڷ����� ����
create or replace function t_function
( v_l in number, v_h in number)
return number 
is v_result number;
begin
    v_result := (v_l * v_h) / 2;
    return (v_result);
end;
/

select '�ﰢ���� ���̴� ' || t_function(100, 20) text_temp from dual;

-- ��� 2)
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

-- �μ����̵� �Է��Ͽ� �ش� �μ� �޿��� ��ձ޿��� ��ȸ ����ϴ� function �ۼ�
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


-- �ʱ�ġ�� id�� 10, irum�� hong ������ M �Ի��Ͽ� ���ó�¥�� �־� ����ϴ� �͸� ����� �ۼ��Ͻÿ�.
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

-- ���������� ������ �Է¹޾� �޿����� �����Ը����ϴ� ���α׷��� �ۼ��Ͻÿ�(��, �޿��� �����Դ� ������ 1/6, procedure��)
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

-- + 0�̳� ���� ������ "����� �Է����ּ���" ����)

set serveroutput on
create or replace procedure weight_moon
(v_weight_earth in number)

is 
    v_w_m number(7, 2);
begin
    if(v_weight_earth <=0) then
        dbms_output.put_line('����� �Է��ϼ���.');
    return;
    end if;
    v_w_m := round(v_weight_earth / 6, 2);
    dbms_output.put_line(v_w_m);
end;
/

execute weight_moon(-100)



