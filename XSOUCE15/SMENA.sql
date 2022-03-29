create table SMENA
(
    ID      NUMBER generated as identity
        constraint SMENA_PK
            primary key,
    ZACATEK TIMESTAMP(6),
    KONEC   TIMESTAMP(6),
    DATUM   DATE,
    MISTO   VARCHAR2(256)
);

