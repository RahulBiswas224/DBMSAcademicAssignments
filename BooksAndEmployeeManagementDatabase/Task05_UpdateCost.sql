SET SERVEROUTPUT ON;
DECLARE
    v_bno BOOKS_COPY.BOOK_NO%TYPE := &bno;
    v_new_cost BOOKS_COPY.COST%TYPE := &new_cost;
    v_old_cost BOOKS_COPY.COST%TYPE;
BEGIN
    SELECT COST INTO v_old_cost FROM BOOKS_COPY WHERE BOOK_NO = v_bno;
    IF v_old_cost < 450 AND v_new_cost < 900 THEN
        UPDATE BOOKS_COPY SET COST = v_new_cost WHERE BOOK_NO = v_bno;
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Invalid Cost Update');
    END IF;
END;
/
