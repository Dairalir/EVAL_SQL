DROP DATABASE IF EXISTS jarditou;

CREATE DATABASE jarditou;

USE jarditou;

CREATE TABLE client (
    `CliID`            INT NOT NULL PRIMARY KEY,
    `Type`              BIT(1),
    `Nom`               VARCHAR(50),
    `Prenom`            VARCHAR(50),
    `Adresse`           VARCHAR(100),
    `CP`                CHAR(5),
    `Ville`             VARCHAR(50),
    `Tel`               VARCHAR(10),
    `Mail`              VARCHAR(50)
    );

CREATE TABLE commande (
    `ComID`            INT NOT NULL PRIMARY KEY,
    `DateCommande`      DATE,
    `DateLivraison`     DATE,
    `EtatCommande`      VARCHAR(25),
    `EditionFacture`    BIT(1),
    `CliID`             INT NOT NULL,
    FOREIGN KEY (`CliID`) REFERENCES client(`CliID`)
);

CREATE TABLE fournisseur (
    `FouID`             INT NOT NULL PRIMARY KEY,
    `Nom`               VARCHAR(50),
    `Adresse`           VARCHAR(100),
    `CP`                CHAR(5),
    `Ville`             VARCHAR(50),
    `Tel`               VARCHAR(10),
    `Mail`              VARCHAR(50),
    `Type`              BIT(1)
);

CREATE TABLE rubrique (
    `RubID`             INT NOT NULL PRIMARY KEY,
    `Libelle`           VARCHAR(50)
);

CREATE TABLE produit (
    `ProCode`           CHAR(6) NOT NULL PRIMARY KEY,
    `Libelle`           VARCHAR(100),
    `Description`       VARCHAR(250),
    `Photo`             VARCHAR(250),
    `Affichage`         BIT(1),
    `PrixAchat`         INT,
    `StockPhysique`     INT,
    `StockAlerte`       INT,
    `FouID`             INT,
    `RubID`             INT,
    FOREIGN KEY (`FouID`) REFERENCES fournisseur(`FouID`),
    FOREIGN Key (`RubID`) REFERENCES rubrique(`RubID`)
);


CREATE TABLE panier (
    `CompQuantiteProd`  INT,
    `CompPrixVentePar`  FLOAT,
    `CompPrixVentePro`  FLOAT,
    `ProCode`           CHAR(6),
    `ComID`             INT,
    FOREIGN KEY (`ComID`) REFERENCES commande(`ComID`),
    FOREIGN KEY (`ProCode`) REFERENCES produit(`Procode`),
    PRIMARY KEY (`ComID`, `ProCode`)
);


