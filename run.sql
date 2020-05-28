SET SERVEROUTPUT ON
declare
CURSOR VISITS_T1 IS
		SELECT PEOPLE_NAME,TIME_OF_VISIT FROM visits;


CURSOR f_t IS
		select PEOPLE_NAME,COUNTRY_NAME from table(visiter_country('UA','UA')) t;
begin
--add_visit( 'Vovas','22331-212326' ,Date '2013-10-25');


DBMS_OUTPUT.enable;
DBMS_OUTPUT.put_line('Table VISITS before procedure ');
for i in VISITS_T1
loop

		DBMS_OUTPUT.put_line(i.PEOPLE_NAME||' '||i.TIME_OF_VISIT);
end loop;



add_visit( 'Vova','22331-212326' ,Date '2015-10-30');
DBMS_OUTPUT.put_line('_____________________________________________________________ ');
DBMS_OUTPUT.put_line('Table VISITS AFTER procedure (if there are visited and stores) ');
for i in VISITS_T1
loop
		DBMS_OUTPUT.put_line(i.PEOPLE_NAME||' '||i.TIME_OF_VISIT);
end loop;




add_visit( 'Vovan','22331-212326' ,Date '2015-10-25');
DBMS_OUTPUT.put_line('_____________________________________________________________ ');
DBMS_OUTPUT.put_line('Table VISITS AFTER procedure (if there are not visited and stores) ');
for i in VISITS_T1
loop
		DBMS_OUTPUT.put_line(i.PEOPLE_NAME||' '||i.TIME_OF_VISIT);
end loop;

DBMS_OUTPUT.put_line('_____________________________________________________________ ');
DBMS_OUTPUT.put_line('The function should show a table with information in which country the client visited the cafe');

for k in f_t
loop
		DBMS_OUTPUT.put_line(k.PEOPLE_NAME||' '||k.COUNTRY_NAME);
end loop;

end;
