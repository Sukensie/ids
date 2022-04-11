DROP TABLE surovina CASCADE CONSTRAINTS;
DROP TABLE pecivo CASCADE CONSTRAINTS;
DROP TABLE predmet CASCADE CONSTRAINTS;
DROP TABLE objednavka CASCADE CONSTRAINTS;
DROP TABLE vezen CASCADE CONSTRAINTS;
DROP TABLE smena CASCADE CONSTRAINTS;
DROP TABLE zamestnanec CASCADE CONSTRAINTS;
DROP TABLE paserak CASCADE CONSTRAINTS;
DROP TABLE vezeni CASCADE CONSTRAINTS;

DROP TABLE objednavka_paserak;
DROP TABLE objednavka_predmet;
DROP TABLE objednavka_vezen;
DROP TABLE paserak_vezeni;
DROP TABLE pecivo_objednavka;
DROP TABLE smena_zamestnanec;
DROP TABLE surovina_pecivo;
DROP TABLE vezeni_smena;
DROP TABLE mnozstvi;

CREATE TABLE surovina
(
    id_surovina  number GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY,
    nazev varchar2(256),
    skladem    varchar2(256),
    cena    number
);
CREATE TABLE pecivo
(
    id_pecivo  number GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY,
    nazev varchar2(256),
    hmotnost varchar2(256),
    alergeny varchar2(256),
    druh varchar2(256)
);
CREATE TABLE predmet
(
    id_predmet  number GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY,
    nazev varchar2(256),
    druh varchar2(256),
    cena number,
    hmotnost varchar2(256)
);
CREATE TABLE objednavka
(
    id_objednavka  number GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY,
    datum_objednani timestamp DEFAULT current_date,
    stav    varchar2(256),
    cena    varchar2(256),
    doprava varchar2(256),
    termin_dodani   timestamp
);

CREATE TABLE vezen
(
    id_vezen  number GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY,
    jmeno varchar2(256),
    rodne_cislo varchar2(256) CHECK((LENGTH(rodne_cislo)=10 AND MOD(to_number(rodne_cislo), 11)=0) OR (LENGTH(rodne_cislo)=9 AND SUBSTR(rodne_cislo, 7,3) <> '000') AND REGEXP_LIKE(rodne_cislo, '^[[:digit:]]+$')
        AND (SUBSTR(rodne_cislo, 1, 2) >= 0 AND SUBSTR(rodne_cislo, 1, 2) <= 99) AND (SUBSTR(rodne_cislo, 3, 2) >= 1 AND SUBSTR(rodne_cislo, 3, 2) <= 12)
        AND (SUBSTR(rodne_cislo, 5, 2) >= 1 AND SUBSTR(rodne_cislo, 5, 2) <= 31)),
    pohlavi varchar2(256),
    cislo_cely number,
    trest varchar2(256)
);
CREATE TABLE smena
(
    id_smena  number GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY,
    zacatek timestamp,
    konec timestamp,
    misto varchar2(256)
);
CREATE TABLE zamestnanec
(
    id_zamestnanec  number GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY,
    jmeno varchar2(256),
    rodne_cislo varchar2(256) CHECK((LENGTH(rodne_cislo)=10 AND MOD(to_number(rodne_cislo), 11)=0) OR (LENGTH(rodne_cislo)=9 AND SUBSTR(rodne_cislo, 7,3) <> '000') AND REGEXP_LIKE(rodne_cislo, '^[[:digit:]]+$')
        AND (SUBSTR(rodne_cislo, 1, 2) >= 0 AND SUBSTR(rodne_cislo, 1, 2) <= 99) AND (SUBSTR(rodne_cislo, 3, 2) >= 1 AND SUBSTR(rodne_cislo, 3, 2) <= 12)
        AND (SUBSTR(rodne_cislo, 5, 2) >= 1 AND SUBSTR(rodne_cislo, 5, 2) <= 31)),
    pohlavi varchar2(256),
    ulice varchar2(256),
    cislo_popisne number,
    mesto varchar2(256),
    psc number,

    cislo_prukazu number,
    vycvik varchar2(256),
    vybaveni varchar2(256)
);

CREATE TABLE paserak
(
    id_paserak  number GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY,
    jmeno varchar2(256),
    rodne_cislo varchar2(256) CHECK((LENGTH(rodne_cislo)=10 AND MOD(to_number(rodne_cislo), 11)=0) OR (LENGTH(rodne_cislo)=9 AND SUBSTR(rodne_cislo, 7,3) <> '000') AND REGEXP_LIKE(rodne_cislo, '^[[:digit:]]+$')
        AND (SUBSTR(rodne_cislo, 1, 2) >= 0 AND SUBSTR(rodne_cislo, 1, 2) <= 99) AND (SUBSTR(rodne_cislo, 3, 2) >= 1 AND SUBSTR(rodne_cislo, 3, 2) <= 12)
        AND (SUBSTR(rodne_cislo, 5, 2) >= 1 AND SUBSTR(rodne_cislo, 5, 2) <= 31)),
    pohlavi varchar2(256)
);
CREATE TABLE vezeni
(
    id_vezeni  number GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY,
    nazev varchar2(256),

    ulice varchar2(256),
    cislo_popisne number,
    mesto varchar2(256),
    psc number
);

CREATE TABLE mnozstvi
(
    id_objednavka number,
    id_pecivo number,
    pocet number,
    druh varchar2(256),
    CONSTRAINT mnozstvi_pk PRIMARY KEY (id_objednavka, id_pecivo),
    CONSTRAINT objednavka_fk3 FOREIGN KEY (id_objednavka) REFERENCES objednavka (id_objednavka),
    CONSTRAINT pecivo_fk3 FOREIGN KEY (id_pecivo) REFERENCES pecivo (id_pecivo)
);

CREATE TABLE surovina_pecivo
(
    id_surovina number,
    id_pecivo number,
    CONSTRAINT surovina_pecivo_pk PRIMARY KEY (id_surovina, id_pecivo),
    CONSTRAINT surovina_fk1 FOREIGN KEY (id_surovina) REFERENCES surovina (id_surovina),
    CONSTRAINT pecivo_fk1 FOREIGN KEY (id_pecivo) REFERENCES pecivo (id_pecivo)
);

CREATE TABLE pecivo_objednavka
(
    id_objednavka number,
    id_pecivo number,
    CONSTRAINT pecivo_objednavka_pk PRIMARY KEY (id_pecivo, id_objednavka),
    CONSTRAINT objednavka_fk2 FOREIGN KEY (id_objednavka) REFERENCES objednavka (id_objednavka),
    CONSTRAINT pecivo_fk2 FOREIGN KEY (id_pecivo) REFERENCES pecivo (id_pecivo)
);

CREATE TABLE objednavka_vezen
(
    id_objednavka number,
    id_vezen number,
    CONSTRAINT objednavka_vezen_pk PRIMARY KEY (id_vezen, id_objednavka),
    CONSTRAINT objednavka3 FOREIGN KEY (id_objednavka) REFERENCES objednavka (id_objednavka),
    CONSTRAINT vezen_fk3 FOREIGN KEY (id_vezen) REFERENCES vezen (id_vezen)
);

CREATE TABLE objednavka_paserak
(
    id_objednavka number,
    id_paserak number,
    CONSTRAINT objednavka_paserak_pk PRIMARY KEY (id_paserak, id_objednavka),
    CONSTRAINT objednavka_fk4 FOREIGN KEY (id_objednavka) REFERENCES objednavka (id_objednavka),
    CONSTRAINT paserak_fk4 FOREIGN KEY (id_paserak) REFERENCES paserak (id_paserak)
);

CREATE TABLE paserak_vezeni
(
    id_paserak number,
    id_vezeni number,
    CONSTRAINT paserak_vezeni_pk PRIMARY KEY (id_paserak, id_vezeni),
    CONSTRAINT vezeni_fk5 FOREIGN KEY (id_vezeni) REFERENCES vezeni (id_vezeni),
    CONSTRAINT paserak_fk5 FOREIGN KEY (id_paserak) REFERENCES paserak (id_paserak)
);

CREATE TABLE vezeni_smena
(
    id_vezeni number,
    id_smena number,
    CONSTRAINT vezeni_smena_pk PRIMARY KEY (id_vezeni, id_smena),
    CONSTRAINT vezeni_fk6 FOREIGN KEY (id_vezeni) REFERENCES vezeni (id_vezeni),
    CONSTRAINT smena_fk6 FOREIGN KEY (id_smena) REFERENCES smena (id_smena)
);
CREATE TABLE smena_zamestnanec
(
    id_smena number,
    id_zamestnanec number,
    CONSTRAINT smena_zamestnanec PRIMARY KEY (id_smena, id_zamestnanec),
    CONSTRAINT smena_fk7 FOREIGN KEY (id_smena) REFERENCES smena (id_smena),
    CONSTRAINT zamestnanec_fk7 FOREIGN KEY (id_zamestnanec) REFERENCES zamestnanec (id_zamestnanec)
);

CREATE TABLE objednavka_predmet
(
    id_objednavka number,
    id_predmet number,

    CONSTRAINT objednavka_predmet_pk PRIMARY KEY (id_objednavka, id_predmet),
    CONSTRAINT objednavka_fk8 FOREIGN KEY (id_objednavka) REFERENCES objednavka (id_objednavka),
    CONSTRAINT predmet_fk8 FOREIGN KEY (id_predmet) REFERENCES predmet (id_predmet)
);


-- naplněný tabulek daty

INSERT INTO zamestnanec (jmeno, rodne_cislo, pohlavi, ulice, cislo_popisne, mesto, psc, cislo_prukazu, vycvik, vybaveni)
VALUES ('Pepa Frajer', '010101001', 'boy', 'Semilaso', '25', 'Brno', '78032', '123', 'full', 'tazer');

INSERT INTO zamestnanec (jmeno, rodne_cislo, pohlavi, ulice, cislo_popisne, mesto, psc, cislo_prukazu, vycvik, vybaveni)
VALUES ('Josefina Hrdá', '010101001', 'gril', 'Semilaso', '25', 'Kuřim', '78032', '12', 'ultra', 'obušek');

INSERT INTO vezeni (nazev, ulice, cislo_popisne, mesto, psc)
VALUES ('Vezeni cool', 'Semilaso', '25', 'Brno', '78032');

INSERT INTO vezeni (nazev, ulice, cislo_popisne, mesto, psc)
VALUES ('Vezeni not cool', 'Semilaso', '257', 'Praha', '78032');

INSERT INTO vezen (jmeno, rodne_cislo, pohlavi, cislo_cely, trest)
VALUES ('Pepka Frajerka', '010101001', 'micka', '25', 'pohorsovani');

INSERT INTO vezen (jmeno, rodne_cislo, pohlavi, cislo_cely, trest)
VALUES ('Pepega', '010101001', 'jedi', '24', 'vysmech');

INSERT INTO surovina (nazev, skladem, cena)
VALUES ('Mouka', '20', '200');

INSERT INTO surovina (nazev, skladem, cena)
VALUES ('Mouka', '200', '25');

INSERT INTO smena (zacatek, konec, misto)
VALUES (TO_DATE('2012-10-12', 'yyyy/mm/dd'), TO_DATE('2014-11-12', 'yyyy/mm/dd'), 'louka');

INSERT INTO smena (zacatek, konec, misto)
VALUES (TO_DATE('2012-10-14', 'yyyy/mm/dd'), TO_DATE('2013-11-14', 'yyyy/mm/dd'), 'louka');

INSERT INTO predmet (nazev, druh, cena, hmotnost)
VALUES ('nůž', 'bodné', '200', '20');

INSERT INTO predmet (nazev, druh, cena, hmotnost)
VALUES ('kudla', 'bodné', '300', '25');

INSERT INTO predmet (nazev, druh, cena, hmotnost)
VALUES ('pistole', 'střelné', '3000', '250');

INSERT INTO pecivo (nazev, druh, hmotnost, alergeny)
VALUES ('rohlik', 'bile', '300', '1, 4, 8');

INSERT INTO pecivo (nazev, druh, hmotnost, alergeny)
VALUES ('bageta', 'bile', '300', '1, 3, 5');

INSERT INTO pecivo (nazev, druh, hmotnost, alergeny)
VALUES ('chleba', 'celozrnné', '700', '1, 3, 5');

INSERT INTO paserak (jmeno, rodne_cislo, pohlavi)
VALUES ('Jan Novak', '010101001', 'muž');

INSERT INTO paserak (jmeno, rodne_cislo, pohlavi)
VALUES ('Josef Novotny', '010101001', 'muž');

INSERT INTO objednavka (datum_objednani, stav, cena, doprava, termin_dodani)
VALUES (TO_DATE('2012-10-12', 'yyyy/mm/dd'), 'na cestě', '12 000', 'poštou',TO_DATE('2012-10-14', 'yyyy/mm/dd'));

INSERT INTO objednavka (datum_objednani, stav, cena, doprava, termin_dodani)
VALUES (TO_DATE('2012-11-12', 'yyyy/mm/dd'), 'na cestě', '15 000', 'poštou',TO_DATE('2012-10-18', 'yyyy/mm/dd'));

INSERT INTO mnozstvi (id_objednavka, id_pecivo, pocet, druh)
VALUES ('1','2','7', 'mouka');

INSERT INTO vezeni_smena (id_vezeni, id_smena)
VALUES ('1', '2');

INSERT INTO surovina_pecivo (id_surovina, id_pecivo)
VALUES ('1', '2');

INSERT INTO smena_zamestnanec (id_smena, id_zamestnanec)
VALUES ('1', '2');

INSERT INTO pecivo_objednavka (id_pecivo, id_objednavka)
VALUES ('1', '2');

INSERT INTO paserak_vezeni (id_paserak, id_vezeni)
VALUES ('1', '2');

INSERT INTO objednavka_vezen (id_objednavka, id_vezen)
VALUES ('1', '2');

INSERT INTO objednavka_vezen (id_objednavka, id_vezen)
VALUES ('2', '2');

INSERT INTO objednavka_paserak (id_objednavka, id_paserak)
VALUES ('1', '2');

-----------------------------------------------------------------
--                           3. ČÁST                           --
-----------------------------------------------------------------
--select příkazy

--propojení 2 tabulek
--vrátí informace o surovině a v jakém ID pečiva byla použita (šlo by zjistit i info o pečivu, ale momentálně to kvůli propojení pouze 2 tabulek není žádoucí)
SELECT * FROM surovina JOIN surovina_pecivo ON surovina.id_surovina = surovina_pecivo.id_surovina;
--vrátí informace o surovině a v jakém ID pečiva byla použita (šlo by zjistit i info o pečivu, ale momentálně to kvůli propojení pouze 2 tabulek není žádoucí)
SELECT * FROM objednavka JOIN objednavka_paserak ON objednavka.id_objednavka = objednavka_paserak.id_objednavka;

--propojení 3 tabulek
--vrátí všechny informace o objednávkách a vězni, které daný vězeň provedl
SELECT objednavka.*, vezen.* FROM objednavka JOIN objednavka_vezen ON objednavka.ID_objednavka = objednavka_vezen.ID_objednavka
                        JOIN vezen ON objednavka_vezen.ID_vezen = vezen.ID_vezen;


--GROUP BY agregační funkce
--vrátí počet pečiv v jednotlivých druzích
SELECT COUNT(id_pecivo), druh FROM pecivo GROUP BY druh;
--vrátí součet cen jednotlivých předmětů podle jejich druhu
SELECT SUM(cena), druh FROM predmet GROUP BY druh;


--EXISTS
--vrátí seznam zaměstnanců, kteří mají zaevidovanou směnu
SELECT jmeno FROM zamestnanec WHERE EXISTS(SELECT id_zamestnanec FROM smena_zamestnanec WHERE zamestnanec.id_zamestnanec = smena_zamestnanec.id_zamestnanec);


--IN
--vrátí zaměstnance, kteří bydlí ve stejném městě, jako existuje nějaké vězení
SELECT * FROM zamestnanec WHERE mesto IN (SELECT mesto FROM vezeni);


-----------------------------------------------------------------
--                           4. ČÁST                           --
-----------------------------------------------------------------
/*
--triggery
CREATE OR REPLACE TRIGGER custom
    AFTER INSERT ON paserak
    FOR EACH ROW
    BEGIN
        INSERT INTO paserak_vezeni (id_paserak, id_vezeni)
        VALUES ( '1', '1');
    END;

INSERT INTO paserak (jmeno, rodne_cislo, pohlavi)
VALUES ('Josef Pepa', '010101001', 'muž');

SELECT * FROM PASERAK_VEZENI;
*/


--procedura
/*
CREATE OR REPLACE PROCEDURE vypis
AS
    nazev varchar2(256);
BEGIN
    SELECT * FROM OBJEDNAVKA;
END;

BEGIN
    vypis;
END;
*/
--materializovaný pohled
DROP MATERIALIZED VIEW pohled;

CREATE MATERIALIZED VIEW list_paseraku_vezeni AS
    SELECT paserak.jmeno, vezeni.nazev FROM paserak_vezeni LEFT JOIN paserak on paserak_vezeni.id_paserak = paserak.id_paserak
        LEFT JOIN vezeni on paserak_vezeni.id_vezeni = vezeni.id_vezeni;


--získání dat z pohledu
SELECT * FROM list_paseraku_vezeni;

--explain plan
EXPLAIN PLAN FOR
    SELECT jmeno, rodne_cislo, zacatek, konec, misto, COUNT(*) FROM zamestnanec
    LEFT JOIN smena_zamestnanec on zamestnanec.id_zamestnanec = smena_zamestnanec.id_zamestnanec
    LEFT JOIN smena on smena_zamestnanec.id_smena = smena.id_smena
    GROUP BY jmeno, rodne_cislo, zacatek, konec, misto;

--index
--index pro zaměstnance pro rychlejší vyhledávání podle rodného čísla
CREATE INDEX idx ON zamestnanec (rodne_cislo);



--přístupová práva
GRANT ALL ON surovina TO xcolog00;
GRANT ALL ON pecivo  TO xcolog00;
GRANT ALL ON predmet TO xcolog00;
GRANT ALL ON objednavka TO xcolog00;
GRANT ALL ON vezen TO xcolog00;
GRANT ALL ON smena TO xcolog00;
GRANT ALL ON zamestnanec  TO xcolog00;
GRANT ALL ON paserak TO xcolog00;
GRANT ALL ON vezeni TO xcolog00;

GRANT ALL ON objednavka_paserak TO xcolog00;
GRANT ALL ON objednavka_predmet TO xcolog00;
GRANT ALL ON objednavka_vezen TO xcolog00;
GRANT ALL ON paserak_vezeni TO xcolog00;
GRANT ALL ON pecivo_objednavka TO xcolog00;
GRANT ALL ON smena_zamestnanec TO xcolog00;
GRANT ALL ON surovina_pecivo TO xcolog00;
GRANT ALL ON vezeni_smena TO xcolog00;
GRANT ALL ON mnozstvi TO xcolog00;

GRANT ALL ON list_paseraku_vezeni TO xcolog00;


