create table PREDMET
(
    ID       NUMBER generated as identity
        constraint PREDMET_PK_2
            primary key,
    NAZEV    VARCHAR2(256),
    DRUH     VARCHAR2(256),
    CENA     NUMBER,
    HMOTNOST NUMBER
);

