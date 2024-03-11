-- 生成者Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   时间:        2023-03-02 22:53:48 EST
--   站点:      Oracle Database 21c
--   类型:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE aw_air_fli_type (
    airfli_type_id NUMBER(1) NOT NULL,
    airfli_type    VARCHAR2(16) NOT NULL
);

COMMENT ON COLUMN aw_air_fli_type.airfli_type_id IS
    'The unqiue type id of airport and flight relation, 
0: The airport is the flight''s departure airport.
1: The airport is the flight''s arrival airport.';

COMMENT ON COLUMN aw_air_fli_type.airfli_type IS
    'The type of airport and flight relation, 
Departure or Arrival.';

ALTER TABLE aw_air_fli_type ADD CONSTRAINT aw_air_fli_type_pk PRIMARY KEY ( airfli_type_id );

CREATE TABLE aw_airline (
    airline_id   VARCHAR2(8) NOT NULL,
    airline_name VARCHAR2(128) NOT NULL
);

COMMENT ON COLUMN aw_airline.airline_id IS
    'The unique airline  id code.';

COMMENT ON COLUMN aw_airline.airline_name IS
    'Airline name.';

ALTER TABLE aw_airline ADD CONSTRAINT aw_airline_pk PRIMARY KEY ( airline_id );

CREATE TABLE aw_airport (
    airport_code VARCHAR2(3) NOT NULL,
    state        VARCHAR2(16) NOT NULL,
    city         VARCHAR2(16) NOT NULL,
    address      VARCHAR2(128) NOT NULL,
    zipcode      NUMBER(5) NOT NULL
);

COMMENT ON COLUMN aw_airport.airport_code IS
    'Unique airport code in US.';

ALTER TABLE aw_airport ADD CONSTRAINT aw_airport_pk PRIMARY KEY ( airport_code );

CREATE TABLE aw_airport_flight (
    flight_id      VARCHAR2(8) NOT NULL,
    airport_code   VARCHAR2(3) NOT NULL,
    airfli_type_id NUMBER(1) NOT NULL
);

ALTER TABLE aw_airport_flight ADD CONSTRAINT aw_airport_flight_pk PRIMARY KEY ( flight_id,
                                                                                airport_code );

CREATE TABLE aw_flight (
    flight_id      VARCHAR2(8) NOT NULL,
    flight_type_id NUMBER(1) NOT NULL,
    airline_id     VARCHAR2(8) NOT NULL,
    departure_date DATE NOT NULL,
    arrival_date   DATE NOT NULL
);

COMMENT ON COLUMN aw_flight.flight_id IS
    'The unique flight id,';

COMMENT ON COLUMN aw_flight.departure_date IS
    'The departure date of the flight.';

COMMENT ON COLUMN aw_flight.arrival_date IS
    'The arrival date of the flight.';

ALTER TABLE aw_flight ADD CONSTRAINT aw_flight_pk PRIMARY KEY ( flight_id );

CREATE TABLE aw_flight_type (
    flight_type_id NUMBER(1) NOT NULL,
    flight_type    VARCHAR2(16) NOT NULL
);

COMMENT ON COLUMN aw_flight_type.flight_type_id IS
    'The unique flight type.
0: Domestic
1: International
2: Cargo
3: Charter';

COMMENT ON COLUMN aw_flight_type.flight_type IS
    'Flight type.
Domestic
International
Cargo
Charter';

ALTER TABLE aw_flight_type ADD CONSTRAINT aw_flight_type_pk PRIMARY KEY ( flight_type_id );

ALTER TABLE aw_airport_flight
    ADD CONSTRAINT air_fli_type_fk FOREIGN KEY ( airfli_type_id )
        REFERENCES aw_air_fli_type ( airfli_type_id );

ALTER TABLE aw_flight
    ADD CONSTRAINT airline_fk FOREIGN KEY ( airline_id )
        REFERENCES aw_airline ( airline_id );

ALTER TABLE aw_airport_flight
    ADD CONSTRAINT airport_fk FOREIGN KEY ( airport_code )
        REFERENCES aw_airport ( airport_code );

ALTER TABLE aw_airport_flight
    ADD CONSTRAINT flight_fk FOREIGN KEY ( flight_id )
        REFERENCES aw_flight ( flight_id );

ALTER TABLE aw_flight
    ADD CONSTRAINT flight_type_fk FOREIGN KEY ( flight_type_id )
        REFERENCES aw_flight_type ( flight_type_id );



-- Oracle SQL Developer Data Modeler 概要报告: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             11
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
