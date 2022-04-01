--FOR
DECLARE
CURSOR c_emp IS SELECT ename,hiredate from emp order by 2;
Begin
For v_reg_emp IN c_emp LOOP
DBMS_OUTPUT.PUT_LINE(v_reg_emp.ename||v_reg_emp.hiredate);
END LOOP;
END;
/

--WHILE
DECLARE
CURSOR c_emp IS SELECT ename,hiredate from emp order by 2;
V_reg_emp c_emp%rowtype;
Begin
OPEN c_emp;
FETCH c_emp INTO v_reg_emp;
WHILE c_emp%FOUND LOOP
DBMS_OUTPUT.PUT_LINE(v_reg_emp.ename||v_reg_emp.hiredate);
FETCH c_emp INTO v_reg_emp;
END LOOP;
Close c_emp;
END;
/

--DO WHILE 
DECLARE 
CURSOR c_emp IS SELECT ename,hiredate from emp order by 2;
V_reg_emp c_emp%rowtype;
BEGIN
OPEN c_emp;
LOOP 
    FETCH c_emp INTO v_reg_emp;
    EXIT WHEN c_emp%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(v_reg_emp.ename||v_reg_emp.hiredate);
END LOOP;
CLOSE c_emp;
END;
/