create table PASERAK
(
    ID             NUMBER generated as identity
        constraint PASERAK_PK
            primary key,
    JMENO          VARCHAR2(256),
    DATUM_NAROZENI DATE,
    POHLAVI        VARCHAR2(256)
);

