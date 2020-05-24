CREATE VIEW store_visit
AS SELECT Stores.store_name,visits.TIME_OF_VISIT
From stores
JOIN visits On Stores.STORE_NUMBER=visits.STORE_NUMBER
;

Create or REPLACE TRIGGER change_name_stoe_trg

BEFORE
    update of store_name
        on stores
FOR EACH ROW
declare
     count_visits_store number;
     old_ VARCHAR2(100);
begin
--old_:= :old.store_name;

Select count(*) into count_visits_store
From store_visit
where store_name  = :old.store_name
group by store_name;

IF ( count_visits_store > 0) THEN

        RAISE_APPLICATION_ERROR(-20001, 'Can`t change');

END IF;
end;

UPDATE stores
SET store_name = 'Nation'
WHERE store_name='Nation Towers';
