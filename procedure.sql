create or replace PROCEDURE add_visit( visitors_name VARCHAR2,
stores_number VARCHAR2,
times DATE)
as
visitors visits.PEOPLE_NAME%TYPE;
stor_id visits.STORE_NUMBER%TYPE;

BEGIN
        SELECT store_number 
        INTO stor_id
        FROM stores   
        WHERE store_number = stores_number;
        
        SELECT PEOPLE_NAME 
        INTO visitors
        FROM people   
        WHERE PEOPLE_NAME = visitors_name;
        
        
     INSERT INTO VISITS(STORE_NUMBER,PEOPLE_NAME,TIME_OF_VISIT) VALUES (stores_number,visitors_name, times);
      DBMS_OUTPUT.PUT_LINE('added information');
      
EXCEPTION 
    WHEN NO_DATA_FOUND
    THEN DBMS_OUTPUT.PUT_LINE('No visitor or establishment found!');
END;
