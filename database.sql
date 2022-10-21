-- select employee_id, last_name, (salary*12)+(salary*12*nvl(commission_pct, 0)) from employees;
-- select employee_id, last_name, (salary*12)+(salary*12*nvl(commission_pct, 0)) annual_salary from employees;
-- select last_name||' is a '||job_id "Employees" from employees;
-- select last_name||'''s'||' annual salary with commission is '||((salary*12)+(salary*12*nvl(commission_pct, 0))) annual_salary from employees;
-- select * from employees where job_id like '%S';

-- create or replace procedure raise_salary
-- (p_id in employees.employee_id%TYPE,
-- p_percent in number)
-- is
-- begin
-- update employees
-- set salary = salary * (1+p_percent/100)
-- where employee_id=p_id;
-- end raise_salary;
-- /

-- create or replace procedure query_emp
--     (p_id in employees.employee_id%TYPE,
--     p_name out employees.last_name%TYPE,
--     p_salary out employees.salary%TYPE)
-- is 
-- begin
--     select last_name, salary into p_name, p_salary 
--     from employees 
--     where employee_id = p_id;
-- end query_emp;
-- /

-- declare
--     v_emp_name employees.last_name%TYPE;
--     v_emp_sal employees.salary%TYPE;
-- begin
--     query_emp(101, v_emp_name, v_emp_sal);
--     dbms_output.put_line(v_emp_name||' earns '||to_char(v_emp_sal, '$999,999.00'));
-- end;
-- /

-- create or replace procedure area_of_circle
--     (r in number,
--     area out number
--     )
-- is
-- begin
--     select 3.1416*r*r into area FROM dual;
-- end area_of_circle;
-- /


-- declare
--     v_temp_area number;
-- begin
--     area_of_circle(10, v_temp_area);
--     dbms_output.put_line('area of the circle is: '||v_temp_area);
-- end;
-- /

-- create or replace procedure commission_calculator
--     (p_id in employees.employee_id%TYPE,
--     p_last_name out employees.last_name%TYPE,
--     yearly_salary out employees.salary%TYPE
--     )
-- is
-- begin
--     select last_name, ((salary*12)+(salary*12*nvl(commission_pct, 0))) into p_last_name, yearly_salary FROM employees where employee_id=p_id;
-- end commission_calculator;
-- /

-- declare
--     v_emp_name employees.last_name%TYPE;
--     v_yearly_salary employees.salary%TYPE;
-- begin
--     commission_calculator(107, v_emp_name, v_yearly_salary);
--     dbms_output.put_line(v_emp_name||'''s yearly salary is '||v_yearly_salary);
-- end;
-- /

-- create or replace procedure format_phone
--     (p_phone_no in out varchar2) is
-- begin
--     p_phone_no := '(' || substr(p_phone_no, 1, 3) ||
--                     ') ' || substr(p_phone_no, 4, 3) ||
--                     '-' || substr(p_phone_no, 7);
-- end format_phone;
-- /

-- declare
--     v_temp_no varchar2(15);
-- begin
--     v_temp_no := '8006330575';
--     format_phone(v_temp_no);
--     dbms_output.put_line(v_temp_no);
-- end;
-- /

-- create table unformatted_number (
--     id number,
--     phone_number varchar2(50),
--     primary key(id)
-- );
-- create table formatted_number (
--     id number,
--     phone_number varchar2(50),
--     primary key(id)
-- );

-- insert into unformatted_number values (1, '8006330575');
-- insert into unformatted_number values (2, '7006330575');
-- insert into unformatted_number values (3, '6006330575');


-- create or replace procedure format_phone
--     (p_id in unformatted_number.id%TYPE,
--     p_phone_no out varchar2) is
-- begin
--     select phone_number into p_phone_no from unformatted_number where id = p_id;
--     p_phone_no := '(' || substr(p_phone_no, 1, 3) ||
--                     ') ' || substr(p_phone_no, 4, 3) ||
--                     '-' || substr(p_phone_no, 7);
--     insert into formatted_number values (p_id, p_phone_no);
    
-- end format_phone;
-- /

-- declare
--     v_id number;
--     v_phone varchar2(50);
-- begin
--     v_id := 2;
--     format_phone(v_id, v_phone);
--     -- dbms_output.put_line(v_temp_no);
-- end;
-- /

-- create or replace procedure insert_into_temp(tid in number, tmp in number)
-- is
-- begin
--     insert into temp values(tid, tmp);
-- end insert_into_temp;
-- /

-- create or replace function get_sal(p_id employees.employee_id%TYPE) return number is
--     v_sal employees.salary%TYPE := 0;
-- begin
--     select salary into v_sal from employees where employee_id=p_id;
--     return v_sal;
-- end get_sal;
-- /

-- execute dbms_output.put_line(get_sal(100));

-- declare
--     sal employees.salary%TYPE;
-- begin
--     sal := get_sal(100);
--     dbms_output.put_line('The salary is: '||sal);
-- end;
-- /

-- create or replace function tax_calculator(p_id employees.employee_id%TYPE) return number is
--     tax_amount employees.salary%TYPE := 0;
-- begin
--     select ((salary*12)+(salary*12*nvl(commission_pct, 0)))*0.1 into tax_amount from employees where employee_id=p_id;
--     return tax_amount;
-- end tax_calculator;
-- /

-- declare
--     num_1 number := &num;
--     num_2 number := &num;
--     num_3 number := &num;
--     max_num number;
-- begin
--     if(num_1>num_2 and num_1>num_3)
--     then
--     max_num:=num_1;
--     elsif(num_2>num_1 and num_1>num_3)
--     then
--     max_num:=num_2;
--     else
--     max_num:=num_3;
--     end if;
--     dbms_output.put_line(max_num);
-- end;
-- /

-- declare
--     v_counter number :=1;
-- begin
--     loop
--         dbms_output.put_line(v_counter);
--         v_counter := v_counter+1;
--         exit when v_counter > 10; 
--     end loop;
-- end;
-- /

declare
    n number := 2;
    i number := 2;
    flag number;
begin
    loop
    flag := 1;
    i := 2;
        loop
        if (mod(n, i)=0) and n <> i
        then
        flag := 0;
        end if;
        exit when (mod(n, i)=0) or i=n;
        i := i+1;
        end loop;.
    if(flag=1)
    then
    dbms_output.put_line(n||' is a prime number.');
    end if;
    n:=n+1;
    exit when n>100;
    end loop;
end;
/

-- declare
--     n number := 2;
--     i number := 2;
--     flag number;
-- begin
--     while n<101
--     loop
--     flag := 1;
--     i := 2;
--         while i<n
--         loop
--         if (mod(n, i)=0)
--         then
--         flag := 0;
--         end if;
--         i := i+1;
--         end loop;
--     if(flag=1)
--     then
--     dbms_output.put_line(n||' is a prime number.');
--     end if;
--     n:=n+1;
--     end loop;
-- end;
-- /

-- declare
--     n number;
--     i number;
--     flag number;
-- begin
--     for n in 2..100
--     loop
--     flag := 1;
--         for i in 2..(n-1)
--         loop
--         if (mod(n, i)=0)
--         then
--         flag := 0;
--         end if;
--         end loop;
--     if(flag=1)
--     then
--     dbms_output.put_line(n||' is a prime number.');
--     end if;
--     end loop;
-- end;
-- /
