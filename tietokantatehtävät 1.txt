Tehtävä 1.
SELECT DISTINCT Merkki
FROM auto

Tehtävä 2.
SELECT Etunimi, Sukunimi, Palkka
FROM tyontekija
WHERE Palkka >= 2000 AND Palkka < 2010
ORDER BY Sukunimi, Etunimi

Tehtävä 3.
SELECT Etunimi, Sukunimi
FROM tyontekija
WHERE Sukunimi LIKE '%öö%'

Tehtävä 4.
SELECT Sukunimi, Merkki
FROM tyontekija
INNER JOIN auto
ON tyontekija.Numero = Haltija
WHERE Etunimi = 'Hannu'

Tehtävä 5.
SELECT DISTINCT Etunimi, Sukunimi, Merkki
FROM tyontekija
INNER JOIN auto
ON tyontekija.Numero = auto.Haltija
INNER JOIN postitus
ON tyontekija.Postino = postitus.Postinumero
WHERE postitus.Postitoimipaikka = 'Espoo' AND tyontekija.Palkka > 5400

Tehtävä 6.
SELECT DISTINCT Etunimi, Merkki
FROM tyontekija
LEFT JOIN auto
ON auto.Haltija = tyontekija.Numero
WHERE Sukunimi = "Romppala"

Tehtävä 7.
SELECT COUNT(*)
FROM tyontekija
WHERE Etunimi = 'Urpo'
GROUP BY Etunimi

Tehtävä 8.
SELECT MIN(postitus.Postinumero), MAX(postitus.Postinumero)
FROM postitus
WHERE Postitoimipaikka = 'Vantaa'

Tehtävä 9.
SELECT Etunimi, Sukunimi
FROM tyontekija
INNER JOIN auto
ON auto.Haltija = tyontekija.Numero
GROUP BY tyontekija.numero
HAVING COUNT(*) >= 2

Tehtävä 10.
(((SELECT tyontekija.Etunimi, tyontekija.Sukunimi
FROM tyontekija
ORDER BY tyontekija.Palkka DESC
LIMIT 1;)))

SELECT tyontekija.Etunimi, tyontekija.Sukunimi, tyontekija.Palkka
FROM tyontekija
WHERE Palkka = (
    SELECT MAX(Palkka)
    FROM tyontekija
)

Tehtävä 11.
SELECT osasto.Nimi
FROM osasto
INNER JOIN tyontekija
ON tyontekija.Osasto = osasto.Numero
WHERE tyontekija.Etunimi = 'Lassi'
INTERSECT
SELECT osasto.Nimi
FROM osasto
INNER JOIN tyontekija
ON tyontekija.Osasto = osasto.Numero
WHERE tyontekija.Etunimi = 'Leevi'

Tehtävä 12.
SELECT Numero, Etunimi, Sukunimi, osasto, COUNT(*)
FROM (
SELECT Numero, Etunimi, Sukunimi, osasto
FROM tyontekija
WHERE Etunimi = 'Lempi'
UNION ALL
SELECT DISTINCT Numero, Etunimi, Sukunimi, osasto
FROM tyontekija INNER JOIN auto
ON tyontekija.Numero = auto.Haltija
UNION ALL 
SELECT tyontekija.numero, Etunimi, Sukunimi, osasto
FROM tyontekija INNER JOIN osasto
ON tyontekija.Osasto = osasto.Numero
WHERE osasto.Nimi = 'Laskutus'
) AS t
GROUP BY numero
ORDER BY COUNT(*) DESC;