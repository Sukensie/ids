create table VEZENI
(
    ID       NUMBER generated as identity
        constraint VEZENI_PK
            primary key,
    NAZEV    VARCHAR2(256),
    ADRESA   VARCHAR2(256),
    ALERGENY VARCHAR2(256),
    DRUH     VARCHAR2(256)
);

