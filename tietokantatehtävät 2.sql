Tehtävä 1:
DROP TABLE IF EXISTS PROJEKTI;
CREATE TABLE IF NOT EXISTS PROJEKTI (
	ProjektiID INT(4) NOT NULL,
   ProjektiNimi VARCHAR(40) NOT NULL,
	Budjetti INT(7) NOT NULL,
	PRIMARY KEY (ProjektiID)
);

DROP TABLE IF EXISTS SUHDE;
CREATE TABLE IF NOT EXISTS SUHDE (
	TyosuhdeID VARCHAR(7) NOT NULL,
	ProjektiID INT(4) NOT NULL,
	TekijaID INT NOT NULL,
	Aloituspaiva DATE NOT NULL,
   Lopetuspaiva DATE NOT NULL,
   Tunnit INT(3),
   PRIMARY KEY (TyosuhdeID),
   FOREIGN KEY (TekijaID) REFERENCES tyontekija(Numero),
   FOREIGN KEY (ProjektiID) REFERENCES projekti(ProjektiID)
);

Tehtävä 2:
INSERT INTO PROJEKTI (ProjektiID, ProjektiNimi, Budjetti) VALUES
(1,'Palvelinhallinta',12000),
(2,'Asiakastuen kehitys',19500);

Tehtävä 3: 
INSERT INTO Suhde (TekijaID,Tunnit,Aloituspaiva,Lopetuspaiva,TyosuhdeID,ProjektiID) VALUES
(96,40,'2021-08-24','2021-12-16',1,1),
(157,100,'2021-08-24','2021-12-16',2,1),
(157,50,'2022-01-01','2022-01-31',3,1),
(236,200,'2022-01-01','2022-12-31',4,1),
(236,80,'2021-12-01','2021-12-31',5,2);


Tehtävä 4:
SELECT  tyontekija.Numero, tyontekija.Etunimi
FROM suhde
INNER JOIN tyontekija
ON suhde.TekijaID = tyontekija.Numero
WHERE (CURDATE() BETWEEN  suhde.Aloituspaiva AND suhde.Lopetuspaiva);

Tehtävä 5:
UPDATE suhde
SET suhde.Tunnit = suhde.Tunnit * 1.2
WHERE suhde.Lopetuspaiva = 
(SELECT suhde.Lopetuspaiva WHERE Lopetuspaiva < '2022-01-01');