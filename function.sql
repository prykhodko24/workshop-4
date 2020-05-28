create type TypeFunkObject as object
(
 PEOPLE_NAME varchar2(500),
 COUNTRY_NAME varchar2(10)
);

create type TypeFunkList as table of TypeFunkObject;


CREATE OR REPLACE FUNCTION visiter_country(counry1 in varchar2,country2 in varchar2)
          return TypeFunkList pipelined as
begin
  for i in (
      SELECT COUNTRY.COUNTRY_NAME,PEOPLE.PEOPLE_NAME
    FROM PEOPLE
    join VISITS on PEOPLE.PEOPLE_NAME=VISITS.PEOPLE_NAME
    join STORES on VISITS.STORE_NUMBER=STORES.STORE_NUMBER
    join CITY on STORES.CITY_NAME=CITY.CITY_NAME
    join COUNTRY on city.COUNTRY_NAME=COUNTRY.COUNTRY_NAME
    WHERE COUNTRY.COUNTRY_NAME=counry1 or COUNTRY.COUNTRY_NAME=country2
     )
 loop
   pipe row (TypeFunkObject(i.PEOPLE_NAME, i.COUNTRY_NAME));    
  end loop;
 return;
end;
