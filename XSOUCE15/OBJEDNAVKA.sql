create table OBJEDNAVKA
(
    ID              NUMBER default "XSOUCE15"."ISEQ$$_187477".nextval generated as identity
        constraint OBJEDNAVKA_PK
        primary key,
    DATUM_OBJEDNANI DATE   default current_date,
    STAV            VARCHAR2(256),
    CENA            NUMBER,
    DOPRAVA         VARCHAR2(256),
    TERMIN_DODANI   DATE
);

