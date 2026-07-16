SET SERVEROUTPUT ON;
DECLARE
    n NUMBER := &num;
    i NUMBER := 2;
    is_prime BOOLEAN := TRUE;
BEGIN
    IF n < 2 THEN is_prime := FALSE;
    ELSE
        WHILE i <= SQRT(n) LOOP
            IF MOD(n, i) = 0 THEN is_prime := FALSE; EXIT; END IF;
            i := i + 1;
        END LOOP;
    END IF;
    IF is_prime THEN DBMS_OUTPUT.PUT_LINE(n || ' is Prime');
    ELSE DBMS_OUTPUT.PUT_LINE(n || ' is not Prime'); END IF;
END;
/
