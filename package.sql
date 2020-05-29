CREATE OR REPLACE PACKAGE package_f_p AS
    type TypeFunkObject is record
    (PEOPLE_NAME varchar2(500),
    COUNTRY_NAME varchar2(10));
 
    type TypeFunkList is table of TypeFunkObject;
    
    PROCEDURE add_visit( visitors_name VARCHAR2,
        stores_number VARCHAR2,
        times DATE);
    
    
    FUNCTION visiter_country(counry1 in varchar2,country2 in varchar2)
    return TypeFunkList pipelined;
    
END package_f_p;
/
CREATE OR REPLACE PACKAGE BODY package_f_p  AS

FUNCTION visiter_country(counry1 in varchar2,country2 in varchar2)
          return TypeFunkList pipelined as
begin
  for i in (
    SELECT COUNTRY.COUNTRY_NAME,PEOPLE.PEOPLE_NAME
    FROM PEOPLE
    join VISITS on PEOPLE.PEOPLE_NAME=VISITS.PEOPLE_NAME
    join STORES on VISITS.STORE_NUMBER=STORES.STORE_NUMBER
    join CITY on STORES.CITY_NAME=CITY.CITY_NAME
    join COUNTRY on city.COUNTRY_NAME=COUNTRY.COUNTRY_NAME
    WHERE COUNTRY.COUNTRY_NAME=counry1 or COUNTRY.COUNTRY_NAME=country2)
                          
                          
 loop
   pipe row (i);    
  end loop;
                          
                          
 return;
end;
    
 PROCEDURE add_visit( visitors_name VARCHAR2,
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

END package_f_p;
/
