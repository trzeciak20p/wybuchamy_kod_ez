-- 1. Wyświetl kierowców, ich wypłatę, autobusy którymi jeżdżą i ich rodzaj z marką, których wypłata jest wiksza niż 5500 pogrupowanych po kierowcach

SELECT Autobusy.ID_Autobusu, Autobusy.Rodzaj, Autobusy.Marka, concat(Kierowcy.Nazwisko_Kierowcy, " ", Kierowcy.Imie_Kierowcy) Kierowca, kierowcy.Wyplata
FROM Autobusy
INNER JOIN Kierowcy
ON Autobusy.ID_Kierowcy = Kierowcy.ID_Kierowcy
WHERE Kierowcy.Wyplata > 5500
GROUP BY Kierowcy.ID_Kierowcy;

-- 2. Wyśiwetl kierowców którzy mają kursy od XX:XX:XX do XX:XX:XX




-- 3. Wyświetl przyjazdy od XX:XX:XX do XX:XX:XX dla których cena ulgowa jest mniejsza niż 5 i dla tych gdzie cena normalna jest mniejsza od 8
SELECT Przyjazdy.ID_Przyjazdu, Cenniki.Cena_Ulgowa
FROM Przyjazdy
INNER JOIN Przyjazdy_Przystanki
ON Przyjazdy_Przystanki.ID_Przyjazdu = Przyjazdy.ID_Przyjazdu
INNER JOIN Przystanki
ON Przystanki.ID_Przystanku = Przyjazdy_Przystanki.ID_Przystanku
INNER JOIN Kursy_Przystanki
ON Przystanki.ID_Przystanku = Kursy_Przystanki.ID_Przystanku
INNER JOIN Kursy
ON Kursy.ID_Kursu = Kursy_Przystanki.ID_Kursu
INNER JOIN Cenniki
ON Cenniki.ID_Cennika = Kursy.ID_Cennika

-- 4. Wyświetl przystanki i ich ulice na które przyjeżdżają autobusy hybrydowe i elektryczne 

SELECT Przystanki.ID_Przystanku, Przystanki.Ulica, Autobusy.Rodzaj
FROM Przystanki
INNER JOIN Kursy_Przystanki
ON Przystanki.ID_Przystanku = Kursy_Przystanki.ID_Przystanku
INNER JOIN Kursy
ON Kursy.ID_Kursu = Kursy_Przystanki.ID_Kursu
INNER JOIN Linie
ON Linie.ID_Linii = Kursy.ID_Linii
INNER JOIN Autobusy_Linie
ON Linie.ID_Linii = Autobusy_Linie.ID_Linii
INNER JOIN Autobusy
ON Autobusy.ID_Autobusu = Autobusy_Linie.ID_Autobusu
WHERE Autobusy.rodzaj = "hybryda" 
UNION
SELECT Przystanki.ID_Przystanku, Przystanki.Ulica, Autobusy.Rodzaj
FROM Przystanki
INNER JOIN Kursy_Przystanki
ON Przystanki.ID_Przystanku = Kursy_Przystanki.ID_Przystanku
INNER JOIN Kursy
ON Kursy.ID_Kursu = Kursy_Przystanki.ID_Kursu
INNER JOIN Linie
ON Linie.ID_Linii = Kursy.ID_Linii
INNER JOIN Autobusy_Linie
ON Linie.ID_Linii = Autobusy_Linie.ID_Linii
INNER JOIN Autobusy
ON Autobusy.ID_Autobusu = Autobusy_Linie.ID_Autobusu
WHERE Autobusy.rodzaj = "elektryczny";

-- left join / avg / view / 
