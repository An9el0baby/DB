-- 生成者Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   时间:        2023-03-02 11:54:49 EST
--   站点:      Oracle Database 21c
--   类型:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE aw_customer (
    customer_id      NUMBER(8) NOT NULL,
    customer_type_id NUMBER(1) NOT NULL,
    address          CHAR(128) NOT NULL,
    company_name     CHAR(32),
    first_name       CHAR(32),
    last_name        CHAR(32),
    transcation_id   NUMBER NOT NULL
);

COMMENT ON COLUMN aw_customer.customer_id IS
    'Unique Customer ID';

COMMENT ON COLUMN aw_customer.address IS
    'Address of customer.';

COMMENT ON COLUMN aw_customer.company_name IS
    'Company Name of customer, if customer is Corporate.';

COMMENT ON COLUMN aw_customer.first_name IS
    'First name of the cusomer, if customer is Individual';

COMMENT ON COLUMN aw_customer.last_name IS
    'Last name of the cusomer, if customer is Individual';

ALTER TABLE aw_customer ADD CONSTRAINT aw_customer_pk PRIMARY KEY ( customer_id );

CREATE TABLE aw_customer_type (
    customer_type_id NUMBER(1) NOT NULL,
    customer_type    CHAR(32) NOT NULL
);

COMMENT ON COLUMN aw_customer_type.customer_type_id IS
    'Customer Type ID: 
0 represents Corporate, 
1 represents Individual';

COMMENT ON COLUMN aw_customer_type.customer_type IS
    'Customer Type:  Corporate or Individual';

ALTER TABLE aw_customer_type ADD CONSTRAINT aw_customer_type_pk PRIMARY KEY ( customer_type_id );

CREATE TABLE aw_property (
    property_id       NUMBER(8) NOT NULL,
    address           CHAR(128) NOT NULL,
    built_year        NUMBER(4) NOT NULL,
    price             NUMBER(32, 2) NOT NULL,
    property_type_id  NUMBER(1) NOT NULL,
    residents_type_id NUMBER(1)
);

COMMENT ON COLUMN aw_property.property_id IS
    'Unique Property ID.';

COMMENT ON COLUMN aw_property.address IS
    'Address of the property.';

COMMENT ON COLUMN aw_property.built_year IS
    'The built year of the property.';

COMMENT ON COLUMN aw_property.price IS
    'The price of the property in USD.';

ALTER TABLE aw_property ADD CONSTRAINT aw_property_pk PRIMARY KEY ( property_id );

CREATE TABLE aw_property_type (
    property_type_id NUMBER(1) NOT NULL,
    property_type    CHAR(32) NOT NULL
);

COMMENT ON COLUMN aw_property_type.property_type_id IS
    'Property type id: 
0 means Resident
1 means  Commercial';

COMMENT ON COLUMN aw_property_type.property_type IS
    'The property type, Residitional or Commercial';

ALTER TABLE aw_property_type ADD CONSTRAINT aw_property_type_pk PRIMARY KEY ( property_type_id );

CREATE TABLE aw_resident_property_type (
    residents_type_id NUMBER(1) NOT NULL,
    residents_type    CHAR(32) NOT NULL
);

COMMENT ON COLUMN aw_resident_property_type.residents_type_id IS
    'The type id of the residnets, if the property type is resident.
0 means Apartment
1 means House
2 means Condo
3 means Single family
4 means Multi family
5 means Townhouse
6 means Mobile home
7 means Farm house';

COMMENT ON COLUMN aw_resident_property_type.residents_type IS
    'The types of the residnets:  
Apartment,
House,
Condo,
Single family
Multi family
Townhouse
Mobile home
Farm house';

ALTER TABLE aw_resident_property_type ADD CONSTRAINT aw_resident_property_type_pk PRIMARY KEY ( residents_type_id );

CREATE TABLE aw_transcation (
    transcation_id      NUMBER(8) NOT NULL,
    customer_id         NUMBER(8) NOT NULL,
    property_id         NUMBER(8) NOT NULL,
    transaction_type_id NUMBER(1) NOT NULL,
    transaction_date    DATE NOT NULL,
    transaction_amount  NUMBER(32, 2) NOT NULL
);

COMMENT ON COLUMN aw_transcation.transcation_id IS
    'The unique trascation id.';

COMMENT ON COLUMN aw_transcation.transaction_date IS
    'The date of trascation.';

COMMENT ON COLUMN aw_transcation.transaction_amount IS
    'The amount of transcation in USD.';

ALTER TABLE aw_transcation ADD CONSTRAINT aw_transcation_pk PRIMARY KEY ( transcation_id );

CREATE TABLE aw_transcation_type (
    transaction_type_id NUMBER(1) NOT NULL,
    transcation_type    CHAR(32) NOT NULL
);

COMMENT ON COLUMN aw_transcation_type.transaction_type_id IS
    'Transaction type id:
0 means Sale
1 means Purchase';

COMMENT ON COLUMN aw_transcation_type.transcation_type IS
    'Transaction type: Sale or Purchase';

ALTER TABLE aw_transcation_type ADD CONSTRAINT aw_transcation_type_pk PRIMARY KEY ( transaction_type_id );

ALTER TABLE aw_transcation
    ADD CONSTRAINT customer_fk FOREIGN KEY ( customer_id )
        REFERENCES aw_customer ( customer_id );

ALTER TABLE aw_customer
    ADD CONSTRAINT customer_type_fk FOREIGN KEY ( customer_type_id )
        REFERENCES aw_customer_type ( customer_type_id );

ALTER TABLE aw_transcation
    ADD CONSTRAINT property_fk FOREIGN KEY ( property_id )
        REFERENCES aw_property ( property_id );

ALTER TABLE aw_property
    ADD CONSTRAINT property_type_fk FOREIGN KEY ( property_type_id )
        REFERENCES aw_property_type ( property_type_id );

ALTER TABLE aw_property
    ADD CONSTRAINT resident_property_type_fk FOREIGN KEY ( residents_type_id )
        REFERENCES aw_resident_property_type ( residents_type_id );

ALTER TABLE aw_transcation
    ADD CONSTRAINT transcation_type_fk FOREIGN KEY ( transaction_type_id )
        REFERENCES aw_transcation_type ( transaction_type_id );



-- Oracle SQL Developer Data Modeler 概要报告: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             13
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
