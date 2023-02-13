-- Creació BBDD

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cul_de_ampolla
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cul_de_ampolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cul_de_ampolla` DEFAULT CHARACTER SET utf8 ;
USE `cul_de_ampolla` ;

-- -----------------------------------------------------
-- Table `cul_de_ampolla`.`proveïdors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_de_ampolla`.`proveïdors` (
  `idproveïdor` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `adreça` VARCHAR(90) NOT NULL,
  `telefon` VARCHAR(9) NOT NULL,
  `fax` VARCHAR(9) NOT NULL,
  `NIF` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`idproveïdor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cul_de_ampolla`.`marques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_de_ampolla`.`marques` (
  `idmarca` INT NOT NULL AUTO_INCREMENT,
  `proveidorId_fk` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idmarca`),
  INDEX `proveidorId_fk_idx` (`proveidorId_fk` ASC) VISIBLE,
  CONSTRAINT `proveidorId_fk`
    FOREIGN KEY (`proveidorId_fk`)
    REFERENCES `cul_de_ampolla`.`proveïdors` (`idproveïdor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cul_de_ampolla`.`ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_de_ampolla`.`ulleres` (
  `idUllera` INT NOT NULL AUTO_INCREMENT,
  `marcaId_fk` INT NOT NULL,
  `preu` FLOAT NOT NULL,
  `color_montura` VARCHAR(45) NOT NULL,
  `tipus_montura` ENUM('flotant', 'pasta', 'metalica') NOT NULL,
  `color_vidre1` VARCHAR(45) NOT NULL,
  `color_vidre2` VARCHAR(45) NOT NULL,
  `grad_vidre1` FLOAT NOT NULL,
  `grad_vidre2` FLOAT NOT NULL,
  PRIMARY KEY (`idUllera`),
  INDEX `fkMarca_idx` (`marcaId_fk` ASC) VISIBLE,
  CONSTRAINT `fkMarca`
    FOREIGN KEY (`marcaId_fk`)
    REFERENCES `cul_de_ampolla`.`marques` (`idmarca`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cul_de_ampolla`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cul_de_ampolla`.`clients` (
  `idclients` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(60) NOT NULL,
  `adreça` VARCHAR(90) NOT NULL,
  `telefon` VARCHAR(9) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `data_registre` DATE NOT NULL,
  `recomanador_fk` INT NULL,
  `empleat_venda` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idclients`),
  INDEX `recomanador_fk_idx` (`recomanador_fk` ASC) VISIBLE,
  CONSTRAINT `recomanador_fk`
    FOREIGN KEY (`recomanador_fk`)
    REFERENCES `cul_de_ampolla`.`clients` (`idclients`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;





INSERT INTO cul_de_ampolla.proveïdors (nom, adreça, telefon, fax, NIF)
VALUES
    ('Proveedor 1', 'Calle 1, 123', '123456789', '987654321', 'A12345678'),
    ('Proveedor 2', 'Calle 2, 456', '234567890', '198765432', 'B23456789'),
    ('Proveedor 3', 'Calle 3, 789', '345678901', '298765432', 'C34567890');

INSERT INTO cul_de_ampolla.marques (proveidorId_fk, nom)
VALUES
    (1, 'Marca 1 del proveedor 1'),
    (1, 'Marca 2 del proveedor 1'),
    (2, 'Marca 1 del proveedor 2'),
    (3, 'Marca 1 del proveedor 3');
    
INSERT INTO cul_de_ampolla.ulleres (marcaId_fk, preu, color_montura, tipus_montura, color_vidre1, color_vidre2, grad_vidre1, grad_vidre2) 
VALUES
(1, 80.5, 'Vermell', 'flotant', 'Verd', 'Blau', 1.5, 2.5),
(2, 120.0, 'Groc', 'pasta', 'Taronja', 'Groc', 2.8, 3.2),
(3, 140.0, 'Blau', 'Metalica', 'Blanc', 'Verd', 3.5, 4.5),
(4, 99.99, 'Negre', 'flotant', 'Groc', 'Vermell', 4.2, 5.0),
(1, 150.0, 'Violeta', 'pasta', 'Verd', 'Blau', 5.0, 6.0),
(2, 200.0, 'Groc', 'Metalica', 'Taronja', 'Groc', 6.0, 7.0),
(3, 300.0, 'Blanc', 'flotant', 'Blanc', 'Verd', 7.0, 8.0),
(4, 400.0, 'Verd', 'pasta', 'Groc', 'Vermell', 8.0, 9.0),
(1, 50.0, 'Vermell', 'flotant', 'Verd', 'Blau', 1.0, 2.0),
(2, 75.0, 'Groc', 'pasta', 'Taronja', 'Groc', 2.0, 3.0),
(3, 200.0, 'Blau', 'Metalica', 'Blanc', 'Verd', 3.0, 4.0),
(4, 300.0, 'Negre', 'flotant', 'Groc', 'Vermell', 4.0, 5.0),
(1, 100.0, 'Violeta', 'pasta', 'Verd', 'Blau', 5.0, 6.0),
(2, 200.0, 'Groc', 'Metalica', 'Taronja', 'Groc', 6.0, 7.0),
(3, 300.0, 'Blanc', 'flotant', 'Blanc', 'Verd', 7.0, 8.0);

INSERT INTO cul_de_ampolla.clients (nom,adreça, telefon, email, data_registre, recomanador_fk, empleat_venda) 
VALUES
('Juan Pérez', 'Calle Falsa 123', '555123456', 'juan.perez@email.com', '2022-01-01', NULL, 'Marta Sales'),
('Ana Martínez', 'Avenida Real 456', '555654321', 'ana.martinez@email.com', '2022-02-01', 1, 'Marta Sales'),
('Paco García', 'Calle Mayor 789', '555987655', 'paco.garcia@email.com', '2022-03-01', 2, 'Jordi Manager'),
('Isabel Sánchez', 'Rua falsa 123', '555111111', 'isabel.sanchez@email.com', '2022-04-01', 3, 'Marta Sales'),
('Luis Rodríguez', 'Avenida Nueva 456', '555222222', 'luis.rodriguez@email.com', '2022-05-01', 4, 'Jordi Manager'),
('María Díaz', 'Calle Principal 789', '555333333', 'maria.diaz@email.com', '2022-06-01', 1, 'Marta Sales'),
('Pedro López', 'Rua Falsa 123', '555444444', 'pedro.lopez@email.com', '2022-07-01', 2, 'Jordi Manager'),
('Javier Fernández', 'Avenida Real 456', '555555555', 'javier.fernandez@email.com', '2022-08-01', 3, 'Marta Sales'),
('Carla Suárez', 'Calle Falsa 123', '555666666', 'carla.suarez@email.com', '2022-09-01', 4, 'Jordi Manager'),
('David González', 'Avenida Principal 456', '555777777', 'david.gonzalez@email.com', '2022-10-01', 1, 'Marta Sales'),
('Sandra Romero', 'Calle Nueva 123', '555888888', 'sandra.romero@email.com', '2022-11-01', 2, 'Jordi Manager'),
('Elena Ortiz', 'Avenida Mayor 789', '555999999', 'elena.ortiz@email.com', '2022-12-01', 3, 'Marta Sales'),
('Rafael Fernández', 'Calle Principal 123', '555100000', 'rafael.fernandez@email.com', '2023-01-01', 4, 'Jordi Manager'),
('Adrián Sánchez', 'Avenida Nueva 456', '555111000', 'adrian.sanchez@email.com', '2023-02-01', 1, 'Marta Sales');


