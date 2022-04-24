-- 1. Wyświetl kierowców, ich wypłatę, autobusy którymi jeżdżą i ich rodzaj z marką, których wypłata jest wiksza niż średnia wypłata kierowców

SELECT Autobusy.ID_Autobusu, Autobusy.Rodzaj, Autobusy.Marka, concat(Kierowcy.Nazwisko_Kierowcy, " ", Kierowcy.Imie_Kierowcy) Kierowca, kierowcy.Wyplata
FROM Autobusy
INNER JOIN Kierowcy
ON Autobusy.ID_Kierowcy = Kierowcy.ID_Kierowcy
where Kierowcy.Wyplata > (select avg(Kierowcy.Wyplata) from Kierowcy)
GROUP BY Kierowcy.ID_Kierowcy;

-- 2. Wyśiwetl kierowców którzy mają kursy od XX:XX:XX do XX:XX:XX
create view Kierowcy_godzinach_6_16 as 
SELECT Kierowcy.Imie_Kierowcy, Kierowcy.Nazwisko_Kierowcy 
from Kierowcy
inner JOIN Autobusy 
on Autobusy.ID_Kierowcy = Kierowcy.ID_Kierowcy
inner JOIN Autobusy_Linie
ON Autobusy_Linie.ID_Autobusu = Autobusy.ID_Autobusu
inner JOIN Linie
ON Linie.ID_Linii = Autobusy_Linie.ID_Linii
inner JOIN Kursy
ON Kursy.ID_Linii = Linie.ID_Linii
INNER JOIN Kursy_Przystanki
ON Kursy_Przystanki.ID_Kursu = Kursy.ID_Kursu
INNER JOIN Przystanki
ON Przystanki.ID_Przystanku = Kursy_Przystanki.ID_Przystanku
INNER JOIN Przyjazdy_Przystanki
ON Przystanki.ID_Przystanku = Przyjazdy_Przystanki.ID_Przystanku
inner JOIN Przyjazdy
ON Przyjazdy_Przystanki.ID_Przyjazdu = Przyjazdy.ID_Przyjazdu
where Przyjazdy.Godzina_Przyjazdu between "06:00:00" and "16:00:00" group by Kierowcy.ID_Kierowcy;



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
where Cenniki.Cena_Ulgowa < 5 and Przyjazdy.Godzina_Przyjazdu between "13:00:00" and "22:00:00"
intersect
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
where Cenniki.Cena_Normalna < 8 and Przyjazdy.Godzina_Przyjazdu between "13:00:00" and "22:00:00"

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
