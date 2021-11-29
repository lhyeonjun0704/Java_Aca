-- 21/ 11/ 25

-- ������� �μ����̺��� ����� ��ȸ ����Ͻÿ� (��, 2���� procedure�� �ۼ��ϸ� out ���ڸ� ����Ͻÿ�.)

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
-- sawon_table�� 1�� ����� �����ϴ� ���α׷��� �ۼ��Ͻÿ�.
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

-- employees ��� �� ������̵� 120�̻��� ����� �޿��� 10%�λ��Ͻÿ� (110, 20%), (130, 15%) ������

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


-- ���� ���̵� �Է¹޾� �ش� �������̵��� ��� �÷������� ��ȸ ����Ͻÿ�.
-- �÷��� ���� ��� -> �ذ��� �÷������� ������� ���̺� ������ �ϸ�ȴ�. aa%Type bb%Type ��ſ� ���̺��%rowtype�� �ذ� ����.

set serveroutput on
create or replace procedure sawon_region_info
(v_in_region_id regions.region_id%type)
is
    all_re regions%rowtype;
begin
    select * into all_re
    from regions
    where region_id = v_in_region_id;
    dbms_output.put_line('�������̵� = ' || all_re.region_id || chr(10) || '������ = ' || all_re.region_name);
end;
/
select * from regions;

execute sawon_region_info(1)


-- �μ� ���̵�� ������� �Է¹޾� �μ����̵�, �����, �޿��� ��ȸ ����ϴ� ���ν��� �ۼ��Ͻÿ� (%rowtype���)
set serveroutput on
create or replace procedure find_sal
(v_d_id in employees.department_id%type, v_e_name in employees.first_name%type)
is
    t1 employees%rowtype;
begin
    select department_id, first_name, salary into t1.department_id, t1.first_name, t1.salary
    from employees
    where department_id = v_d_id and first_name = v_e_name;
    dbms_output.put_line('�μ����̵� =' || t1.department_id || '����� = ' || t1.first_name || '�޿� = ' || t1.salary);
end;
/

select * from employees;
execute find_sal(90, 'Lex')

-- ��� ���̵� �Է¹޾� �޿��� 5000�̻��̸� A, �׷��� ������ B�� ����ϴ� ���ν����� �ۼ��Ͻÿ�(����� ������̵�, �޿�, ���)
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
    dbms_output.put_line('������̵� = ' || e_id_t.employeE_id || '�޿� = ' || e_id_t.salary || '��� = ' || temp);
end;
/

execute over_5(121)


for i in 1..100 loop
v_hap := v_hap+i;
end loop;


select * from teltable;
-- cursor
-- cursor�� sql Ŀ���� ���ϸ� multi row ���� ���� �޸� ������(select ����� ������ �������� ���� �����ϴ� ���̹ڽ��� ����)
-- ������ implicit cursor, explicit cursor

-- ������̺��� �̸��� �Է¹޾� �ش� �̸� �����͸� �����ϴ� ���ν��� �ۼ�. ������ �� ����� ���� comment�� ���.
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
        v_result := '����';
    else
        v_result := to_char(sql%rowcount) || '��'; -- ��������� ��ȯ�Ǵ� �� ��
    end if;
    dbms_output.put_line('������ �ο��� ' || v_result || '�Դϴ�.');
    
end;
/
select * from sawon_table;
execute delete_sawon_table('park')

-- �޿��� �Է��Ͽ� �ش� �޿����� ���� �޿��� �޴� ����� �̸�, �޿�, �Ի����� ����ϰ� ������� �ο����� ����ϴ� ���ν��� �ۼ��Ͻÿ�.(cursor���)

is
    cursor Ŀ���� is select����;
begin
    open Ŀ����;
    fetch Ŀ���� into ������;
    close Ŀ����;
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
    
    dbms_output.put_line('����̸� = ' || v_first_name || chr(10) || '�޿� = ' || v_salary || chr(10) || '�Ի��� = ' || v_hiredate);
    
    end loop;

-- trigger
--(1�ܰ�) 
 
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

-- Q) ����ϰ� �Ͽ��Ͽ��� �۾����� ���ϵ��� trigger ���α׷��� �ۼ��Ͻÿ�. ��-���� panmae_table�� ��ȭ�� �߻��ϸ� ���� ���
set serveroutput on
create or replace trigger no_working
before update or insert or delete on panmae_table
begin
    if(to_char(sysdate, 'day') in ('�����', '�ݿ���')) then
    raise_application_error(-20000, 'stop running');
    else
        dbms_output.put_line('Hello');
    end if;
end;
/












