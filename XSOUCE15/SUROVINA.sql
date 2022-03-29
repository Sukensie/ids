create table SUROVINA
(
    ID      NUMBER generated as identity
        constraint PECIVO_PK
            primary key,
    NAZEV   VARCHAR2(256),
    SKLADEM NUMBER,
    CENA    NUMBER
);

