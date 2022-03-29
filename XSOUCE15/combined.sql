drop table OBJEDNAVKA;
drop table PASERAK;
drop table PREDMET;
drop table SMENA;
drop table SUROVINA;
drop table VEZEN;
drop table VEZENI;
drop table ZAMESTNANEC;


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

create table PASERAK
(
    ID             NUMBER generated as identity
        constraint PASERAK_PK
            primary key,
    JMENO          VARCHAR2(256),
    DATUM_NAROZENI DATE,
    POHLAVI        VARCHAR2(256)
);

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

create table SUROVINA
(
    ID      NUMBER generated as identity
        constraint PECIVO_PK
            primary key,
    NAZEV   VARCHAR2(256),
    SKLADEM NUMBER,
    CENA    NUMBER
);

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
