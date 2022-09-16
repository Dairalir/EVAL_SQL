DROP DATABASE IF EXISTS clicom;

CREATE DATABASE clicom;

USE clicom;

CREATE TABLE client (
    cli_num         INT NOT NULL PRIMARY KEY,
    cli_nom         VARCHAR(50) NOT NULL,
    cli_adresse     VARCHAR(50),
    cli_tel         VARCHAR(50)
);

CREATE TABLE commande (
    com_num         INT PRIMARY KEY NOT NULL,
    com_cli_num     INT NOT NULL,
    com_date        DATETIME,
    com_obs         VARCHAR(50),
    FOREIGN KEY (com_cli_num) REFERENCES client(cli_num)
);

CREATE TABLE produit (
    pro_num         INT NOT NULL PRIMARY KEY,
    pro_libelle     VARCHAR(50),
    pro_description VARCHAR(50)
);

CREATE TABLE est_compose (
    est_com_num     INT NOT NULL,
    est_pro_num     INT NOT NULL,
    est_qte         INT NOT NULL,
    FOREIGN KEY (est_com_num) REFERENCES commande(com_num),
    FOREIGN KEY (est_pro_num) REFERENCES produit(pro_num),
    PRIMARY KEY (est_com_num, est_pro_num)
);