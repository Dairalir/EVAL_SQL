DROP DATABASE IF EXISTS jarditou;

CREATE DATABASE jarditou;

USE jarditou;

CREATE TABLE client (
    `cli_id`                    INT NOT NULL PRIMARY KEY,
    `cli_type`                  BIT(1),
    `cli_nom`                   VARCHAR(50),
    `cli_prenom`                VARCHAR(50),
    `cli_adresse`               VARCHAR(100),
    `cli_cp`                    CHAR(5),
    `cli_ville`                 VARCHAR(50),
    `cli_tel`                   VARCHAR(10),
    `cli_mail`                  VARCHAR(50)
    );

CREATE TABLE commande (
    `com_id`                    INT NOT NULL PRIMARY KEY,
    `com_date_commande`         DATE,
    `com_date_livraison`        DATE,
    `com_etat_commande`         VARCHAR(25),
    `com_edition_facture`       BIT(1),
    `com_cli_id`                INT NOT NULL,
    FOREIGN KEY (`com_cli_id`) REFERENCES client(`cli_id`)
);

CREATE TABLE fournisseur (
    `fou_id`                    INT NOT NULL PRIMARY KEY,
    `fou_nom`                   VARCHAR(50),
    `fou_adresse`               VARCHAR(100),
    `fou_cp`                    CHAR(5),
    `fou_ville`                 VARCHAR(50),
    `fou_tel`                   VARCHAR(10),
    `fou_mail`                  VARCHAR(50),
    `fou_type`                  BIT(1)
);

CREATE TABLE rubrique (
    `rub_id`                    INT NOT NULL PRIMARY KEY,
    `rub_libelle`               VARCHAR(50)
);

CREATE TABLE produit (
    `pro_code`                  CHAR(6) NOT NULL PRIMARY KEY,
    `pro_libelle`               VARCHAR(100),
    `pro_description`           VARCHAR(250),
    `pro_photo`                 VARCHAR(250),
    `pro_affichage`             BIT(1),
    `pro_prix_achat`            INT,
    `pro_stock_physique`        INT,
    `pro_stock_alerte`          INT,
    `pro_fou_id`                INT,
    `pro_rub_id`                INT,
    FOREIGN KEY (`pro_fou_id`) REFERENCES fournisseur(`fou_id`),
    FOREIGN Key (`pro_rub_id`) REFERENCES rubrique(`rub_id`)
);

CREATE TABLE panier (
    `pan_comp_quantite_prod`    INT,
    `pan_comp_prix_vente_par`   FLOAT,
    `pan_comp_prix_vente_pro`   FLOAT,
    `pan_pro_code`              CHAR(6),
    `pan_com_id`                INT,
    FOREIGN KEY (`pan_com_id`) REFERENCES commande(`com_id`),
    FOREIGN KEY (`pan_pro_code`) REFERENCES produit(`pro_code`),
    PRIMARY KEY (`pan_com_id`, `pan_pro_code`)
);

INSERT INTO client (`cli_id`, `cli_type`, `cli_nom`, `cli_prenom`, `cli_adresse`, `cli_cp`, `cli_ville`, `cli_tel`, `cli_mail`) VALUES
    (1, NULL, 'Elvera', 'Twycross', '808 Graedel Place', NULL, 'Talondang', '5104089348', 'etwycross0@arstechnica.com'),
    (2, NULL, 'Tailor', 'Apfler', '451 Morrow Circle', NULL, 'Vishow', '4275805728', 'tapfler1@marketwatch.com'),
    (3, NULL,'Nora', 'MacNulty', '7600 Fremont Parkway', NULL, 'Baitouli', '7408787289', 'nmacnulty2@microsoft.com'),
    (4, NULL,'Hamnet', 'Arboine', '41 Mayer Way', NULL, 'Jiangfeng', '8747482068', 'harboine3@lycos.com'),
    (5, NULL, 'Gaylene', 'Kerwood', '4553 Veith Drive', NULL, 'Manga', '9761261613', 'gkerwood4@alibaba.com'),
    (6, NULL, 'Rosabella', 'Furmenger', '2614 Shopko Road', '13270', 'Bang Sai', '8262815695', 'rfurmenger5@tinyurl.com'),
    (7, NULL, 'Lynne', 'McAulay', '9 Moulton Parkway', '398032', 'Selikhino', '6043732136', 'lmcaulay6@ucla.edu'),
    (8, NULL, 'Rossie', 'Mabbe', '19383 Forest Run Drive', NULL, 'Karangpeton', '9653717421', 'rmabbe7@soundcloud.com'),
    (9, NULL, 'Antons', 'Maxstead', '6354 Golden Leaf Pass', '507009', 'Acacías', '4826037985', 'amaxstead8@engadget.com'),
    (10, NULL, 'Crosby', 'Vanni', '5802 Pepper Wood Point', NULL, 'Karangtawar', '5036896314', 'cvanni9@alibaba.com'),
    (11, NULL, 'Phaidra', 'Noir', '45 Linden Street', '49200', 'Estância', '6146381169', 'pnoira@bing.com'),
    (12, NULL, 'Dougy', 'Gilburt', '64680 Eagle Crest Crossing', '15517', 'Kota Bharu', '4438234575', 'dgilburtb@prlog.org'),
    (13, NULL, 'Tamar', 'Skilling', '34589 Sycamore Circle', NULL, 'Akbarābād', '4064928227', 'tskillingc@bloomberg.com'),
    (14, NULL, 'Tades', 'Rait', '421 Burrows Place', '50701', 'Nazir Town', '7325230484', 'traitd@oaic.gov.au'),
    (15, NULL, 'Alexina', 'Jelks', '52 Karstens Road', NULL, 'T’aebaek', '2778490111', 'ajelkse@bloglovin.com'),
    (16, NULL, 'Sheree', 'Lewens', '0 Magdeline Street', '0403', 'Oslo', '7835634396', 'slewensf@forbes.com'),
    (17, NULL, 'Flory', 'Eck', '1 Riverside Crossing', NULL, 'Stepanovićevo', '7969961436', 'feckg@mapy.cz'),
    (18, NULL, 'Alphonso', 'Hingeley', '75989 Jay Drive', NULL, 'Jesús Menéndez', '3445693497', 'ahingeleyh@comcast.net'),
    (19, NULL, 'Dennis', 'Sacco', '32024 Magdeline Trail', NULL, 'Touba', '6621282051', 'dsaccoi@samsung.com'),
    (20, NULL, 'Justen', 'Thoumasson', '816 Rieder Point', NULL, 'San Diego', '2084178860', 'jthoumassonj@flickr.com');

INSERT INTO fournisseur (`fou_id`, `fou_nom`, `fou_adresse`, `fou_cp`, `fou_ville`, `fou_tel`, `fou_type`) VALUES
    (1, 'Boehm Group', '4016 Holmberg Hill', '36047', 'Lutoryż', '9495241840', NULL),
    (2, 'Erdman and Sons', '04 Meadow Ridge Alley', NULL, 'Hecun', '6707672982', NULL),
    (3, 'Smith-Wunsch', '3807 Hanover Terrace', NULL, 'Xinhua', '1164994152', NULL),
    (4, 'Satterfield Inc', '95 High Crossing Plaza', '43356', 'Novaya Mayna', '3519852578', NULL),
    (5, 'Kunde, O''Keefe and Rowe', '9994 Bartillon Park', '7945', 'Omurtag', '4398066041',NULL);

INSERT INTO produit (`pro_code`, `pro_libelle`, `pro_description`, `pro_photo`, `pro_affichage`, `pro_prix_achat`, `pro_stock_physique`, `pro_stock_alerte`, `pro_fou_id`, `pro_rub_id`) VALUES

INSERT INTO commande (`com_id`, `com_date_commande`, `com_date_livraison`, `com_edition_facture`, `com_cli_id`) VALUES

INSERT INTO panier (`pan_comp_quantite_prod`, `pan_comp_prix_vente_par`, `pan_comp_prix_vente_pro`, `pan_pro_code`, `pan_com_id`) VALUES

CREATE INDEX client_index
ON client (cli_nom)

CREATE INDEX date_commande_index
ON commande (com_date_commande)

CREATE USER 'gestionnaire'@'localhost' IDENTIFIED BY 'gestionnaire';
CREATE USER 'approvisionneur'@'localhost' IDENTIFIED BY 'approvisionneur';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';

GRANT SELECT
ON jarditou.produit, jarditou.commande, jarditou.client, jarditou.panier
TO 'gestionnaire'@'localhost';

GRANT SELECT, INSERT, UPDATE
ON jarditou.produit
GRANT SELECT
ON jarditou.fournisseur
TO 'approvisionneur'@'localhost';

GRANT ALL
ON jarditou.*
TO 'admin'@'localhost';
FLUSH PRIVILEGES;