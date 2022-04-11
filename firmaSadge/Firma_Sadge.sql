DROP DATABASE IF EXISTS Firma_Sadge;

CREATE DATABASE Firma_Sadge;

USE Firma_Sadge;

CREATE TABLE Kierowcy
(
    ID_Kierowcy INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nazwisko_Kierowcy varchar(50),
    Imie_Kierowcy varchar(50),
    Wyplata INT,
    Data_Zatrudnienia DATE
);

CREATE TABLE Autobusy
(
    ID_Autobusu INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_Kierowcy INT,
    Rodzaj varchar(50),
    Marka varchar(50),
    Kolor varchar(50),
    Ilosc_Miejsc INT,

    FOREIGN KEY (ID_Kierowcy) REFERENCES Kierowcy(ID_Kierowcy)
);

CREATE TABLE Linie
(
    ID_Linii INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Numer INT,

);

CREATE TABLE Autobusy_Linie
(
    ID_Autobusu INT,
    ID_Linii INT,

    FOREIGN KEY (ID_Autobusu) REFERENCES Autobusy(ID_Autobusu),
    FOREIGN KEY (ID_Linii) REFERENCES Linie(ID_Linii)
);

CREATE TABLE Cenniki
(
    ID_Cennika INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Cena_Ulgowa FLOAT,
    Cena_Normalna FLOAT
);

CREATE TABLE Kursy
(
    ID_Kursu INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_Cennika INT,
    ID_Linii INT,

    FOREIGN KEY (ID_Cennika) REFERENCES Cenniki(ID_Cennika),
    FOREIGN KEY (ID_Linii) REFERENCES Linie(ID_Linii)

);


CREATE TABLE Przystanki
(
    ID_Przystanku INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Ulica varchar(50),
    Nazwa varchar(50)
);

CREATE TABLE Kursy_Przystanki
(
    ID_Kursu INT,
    ID_Przystanku INT,

    FOREIGN KEY (ID_Przystanku) REFERENCES Przystanki(ID_Przystanku),
    FOREIGN KEY (ID_Kursu) REFERENCES Kursy(ID_Kursu)
);

CREATE TABLE Przyjazdy
(
    ID_Przyjazdu INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Godzina_Przyjazdu varchar(5)
);

CREATE TABLE Przyjazdy_Przystanki
(
    ID_Przystanku INT,
    ID_Przyjazdu INT,
    
    FOREIGN KEY (ID_Przystanku) REFERENCES Przystanki(ID_Przystanku),
    FOREIGN KEY (ID_Przyjazdu) REFERENCES Przyjazdy(ID_Przyjazdu)
);
