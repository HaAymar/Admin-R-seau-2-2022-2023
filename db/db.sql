CREATE USER 'WoodyToys'@'79.137.34.192' IDENTIFIED BY 'MESEPHEC';

CREATE DATABASE db_woody;

GRANT ALL PRIVILEGES ON db_woody.* to 'WoodyToys'@'79.137.34.192';

FLUSH PRIVILEGES;

USE db_woody;

create table woody(
    id INTEGER NOT NULL AUTO_INCREMENT,
    Name CHAR(50) NOT NULL,
    Price DECIMAL(8,2) NOT NULL,
    CONSTRAINT pk_woody PRIMARY KEY(id)
);

INSERT INTO woody (name,price)
VALUES ('toy en bois' , 15), ('Robot de l espace' , 16);