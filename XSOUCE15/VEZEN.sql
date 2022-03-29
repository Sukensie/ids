create table VEZEN
(
    ID             NUMBER generated as identity
        constraint VEZEN_PK
            primary key,
    JMENO          VARCHAR2(256),
    DATUM_NAROZENI DATE,
    POHLAVI        VARCHAR2(256),
    CISLO_CELY     NUMBER,
    TREST          VARCHAR2(256)
);

