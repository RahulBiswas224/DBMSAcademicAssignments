SET SERVEROUTPUT ON;
DECLARE
    v_eno EMPLOYEE.Eno%TYPE := &eno;
    rec EMPLOYEE%ROWTYPE;
BEGIN
    SELECT * INTO rec FROM EMPLOYEE WHERE Eno = v_eno;
    DBMS_OUTPUT.PUT_LINE('Name: ' || rec.Name || ' Dept: ' || rec.Department);
END;
/
