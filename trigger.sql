SET SERVEROUTPUT ON
Create or REPLACE TRIGGER change_name_stoe_trg

BEFORE
    update of store_name
        on stores
FOR EACH ROW
declare
    s_n VARCHAR2(100);
    c_v number;
--   count_visits_store number;
-- old_ VARCHAR2(100);

begin
SELECT Stores.store_name,count(visits.TIME_OF_VISIT) into s_n,c_v
From stores
JOIN visits On Stores.STORE_NUMBER=visits.STORE_NUMBER
group by Stores.store_name
having store_name=:old.STORE_NAME;


--SELECT count(*) into count_visits_store
--From visits
--JOIN stores  On Stores.STORE_NUMBER=visits.STORE_NUMBER
--where stores.store_name= :old.STORE_NAME;

DBMS_OUTPUT.enable;
DBMS_OUTPUT.put_line('c_v');
DBMS_OUTPUT.put_line(c_v);
DBMS_OUTPUT.put_line('c_v');
IF ( c_v > 0) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Can`t change');
    
END IF;
end;
