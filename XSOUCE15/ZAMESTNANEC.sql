create table ZAMESTNANEC
(
    ID             NUMBER generated as identity
        constraint ZAMESTNANEC_PK
            primary key,
    JMENO          VARCHAR2(256),
    DATUM_NAROZENI DATE,
    POHLAVI        VARCHAR2(256),
    BYDLISTE       VARCHAR2(256)
);

