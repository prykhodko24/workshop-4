CREATE TABLE brand (
    brand_name VARCHAR2(30) NOT NULL
);

ALTER TABLE brand ADD CONSTRAINT brand_pk PRIMARY KEY ( brand_name );

CREATE TABLE city (
    city_name     VARCHAR2(50) NOT NULL,
    country_name  VARCHAR2(10) NOT NULL
);

ALTER TABLE city ADD CONSTRAINT city_pk PRIMARY KEY ( city_name );

CREATE TABLE country (
    country_name VARCHAR2(10) NOT NULL
);

ALTER TABLE country ADD CONSTRAINT country_pk PRIMARY KEY ( country_name );

CREATE TABLE ownership (
    owner_ship VARCHAR2(30) NOT NULL
);

ALTER TABLE ownership ADD CONSTRAINT ownership_pk PRIMARY KEY ( owner_ship );

CREATE TABLE people (
    people_name VARCHAR2(30) NOT NULL
);

ALTER TABLE people ADD CONSTRAINT people_pk PRIMARY KEY ( people_name );

CREATE TABLE stores (
    store_number    VARCHAR2(30) NOT NULL,
    brand_name      VARCHAR2(30) NOT NULL,
    ownership_ship  VARCHAR2(30) NOT NULL,
    store_name      VARCHAR2(100) NOT NULL,
    city_name       VARCHAR2(50) NOT NULL
);

ALTER TABLE stores ADD CONSTRAINT store_pk PRIMARY KEY ( store_number );

CREATE TABLE visits (
    people_name    VARCHAR2(30) NOT NULL,
    store_number   VARCHAR2(30) NOT NULL,
    time_of_visit  DATE NOT NULL
);

ALTER TABLE visits
    ADD CONSTRAINT visits_pk PRIMARY KEY ( people_name,
                                           store_number,
                                           time_of_visit );

ALTER TABLE city
    ADD CONSTRAINT city_country_fk FOREIGN KEY ( country_name )
        REFERENCES country ( country_name );

ALTER TABLE stores
    ADD CONSTRAINT store_brand_fk FOREIGN KEY ( brand_name )
        REFERENCES brand ( brand_name );

ALTER TABLE stores
    ADD CONSTRAINT store_city_fk FOREIGN KEY ( city_name )
        REFERENCES city ( city_name );

ALTER TABLE stores
    ADD CONSTRAINT store_ownership_fk FOREIGN KEY ( ownership_ship )
        REFERENCES ownership ( owner_ship );

ALTER TABLE visits
    ADD CONSTRAINT visits_people_fk FOREIGN KEY ( people_name )
        REFERENCES people ( people_name );

ALTER TABLE visits
    ADD CONSTRAINT visits_store_fk FOREIGN KEY ( store_number )
        REFERENCES stores ( store_number );
