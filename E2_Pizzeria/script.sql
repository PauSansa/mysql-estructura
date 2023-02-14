-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pizzeria_test
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pizzeria_test
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pizzeria_test` DEFAULT CHARACTER SET utf8 ;
USE `pizzeria_test` ;

-- -----------------------------------------------------
-- Table `pizzeria_test`.`Provincia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria_test`.`Provincia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria_test`.`Localitat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria_test`.`Localitat` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `Provincia_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Localitat_Provincia1_idx` (`Provincia_id` ASC) VISIBLE,
  CONSTRAINT `fk_Localitat_Provincia1`
    FOREIGN KEY (`Provincia_id`)
    REFERENCES `pizzeria_test`.`Provincia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria_test`.`adreça`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria_test`.`adreça` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `carrer` VARCHAR(45) NOT NULL,
  `codiPostal` INT NOT NULL,
  `Localitat_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_adreça_Localitat1_idx` (`Localitat_id` ASC) VISIBLE,
  CONSTRAINT `fk_adreça_Localitat1`
    FOREIGN KEY (`Localitat_id`)
    REFERENCES `pizzeria_test`.`Localitat` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria_test`.`tenda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria_test`.`tenda` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `adreça_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tenda_adreça1_idx` (`adreça_id` ASC) VISIBLE,
  CONSTRAINT `fk_tenda_adreça1`
    FOREIGN KEY (`adreça_id`)
    REFERENCES `pizzeria_test`.`adreça` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria_test`.`empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria_test`.`empleat` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `cognoms` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(9) NOT NULL,
  `telefon` VARCHAR(9) NOT NULL,
  `tipus` ENUM('botiga', 'domicili') NOT NULL,
  `tenda_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `nif_UNIQUE` (`nif` ASC) VISIBLE,
  INDEX `fk_empleat_tenda1_idx` (`tenda_id` ASC) VISIBLE,
  CONSTRAINT `fk_empleat_tenda1`
    FOREIGN KEY (`tenda_id`)
    REFERENCES `pizzeria_test`.`tenda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria_test`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria_test`.`venta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_venta` DATE NOT NULL,
  `tipus` ENUM('botiga', 'domicili') NOT NULL,
  `tenda_id` INT NOT NULL,
  `empleat_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_venta_tenda1_idx` (`tenda_id` ASC) VISIBLE,
  INDEX `fk_venta_empleat1_idx` (`empleat_id` ASC) VISIBLE,
  CONSTRAINT `fk_venta_tenda1`
    FOREIGN KEY (`tenda_id`)
    REFERENCES `pizzeria_test`.`tenda` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_empleat1`
    FOREIGN KEY (`empleat_id`)
    REFERENCES `pizzeria_test`.`empleat` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria_test`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria_test`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria_test`.`producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria_test`.`producte` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `tipus` ENUM('pizza', 'hamburgesa', 'beguda') NOT NULL,
  `descripcio` VARCHAR(90) NOT NULL,
  `imatge` LONGBLOB NULL,
  `preu` DECIMAL(10,2) NOT NULL,
  `categoria_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_producte_categoria1_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_producte_categoria1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `pizzeria_test`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria_test`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria_test`.`Client` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `cognoms` VARCHAR(45) NOT NULL,
  `adreça_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_Client_adreça1_idx` (`adreça_id` ASC) VISIBLE,
  CONSTRAINT `fk_Client_adreça1`
    FOREIGN KEY (`adreça_id`)
    REFERENCES `pizzeria_test`.`adreça` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pizzeria_test`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pizzeria_test`.`item` (
  `venta_id` INT NOT NULL,
  `producte_id` INT NOT NULL,
  PRIMARY KEY (`venta_id`, `producte_id`),
  INDEX `fk_venta_has_producte_producte1_idx` (`producte_id` ASC) VISIBLE,
  INDEX `fk_venta_has_producte_venta1_idx` (`venta_id` ASC) VISIBLE,
  CONSTRAINT `fk_venta_has_producte_venta1`
    FOREIGN KEY (`venta_id`)
    REFERENCES `pizzeria_test`.`venta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venta_has_producte_producte1`
    FOREIGN KEY (`producte_id`)
    REFERENCES `pizzeria_test`.`producte` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO Provincia (nom) VALUES 
('Barcelona'),
('Girona'),
('Lleida'),
('Tarragona');

INSERT INTO Localitat (nom, Provincia_id) VALUES 
('Argentona',1),
('Vilassar', 1),
('Vic',3),
('Gavarres', 4),
('Mataro',1);

INSERT INTO Adreça (carrer, codiPostal, Localitat_id) VALUES 
('Carrer de Tenda Mataro', 08020, 5),
('Carrer de Tenda Argentona',08310 ,1 ),
('Carrer de Tenda Vic ',07862 ,3 ),
('Carrer de Tenda Vilassar ',57489 ,2 ),
('Carrer de Client Mataro', 08020, 5) ,
('Carrer de Client Argentona',08310 ,1 ),
('Carrer de Client Vic ',07862 ,3 ),
('Carrer de Client Vilassar ',57489 ,2 );

INSERT INTO Client (nom, cognoms, adreça_id) VALUES 
('Client Mataro', 'Cognom', 5),
('Client Argentona', 'Cognom', 6),
('Client Vic', 'Cognom', 7),
('Client Vilassar', 'Cognom', 8);


INSERT INTO tenda (nom, adreça_id) VALUES 
('Tenda Mataro', 1),
('Tenda Argentona', 2),
('Tenda Vic',  3),
('Tenda Vilassar', 4);

-- Insertar empleados
INSERT INTO empleat (nom, cognoms, nif, telefon, tipus, tenda_id) VALUES 
('Anna', 'Garcia', '12345678A', '666123456', 'botiga', 1),
('Pere', 'Soler', '23456789B', '666234567', 'domicili', 2),
('Lluis', 'Alvarez', '34567890C', '666345678', 'botiga', 3),
('Marta', 'Perez', '45678901D', '666456789', 'domicili', 4);

-- Insertar categorías
INSERT INTO categoria (nom) VALUES 
('Hawaiana'),
('Carbonara'),
('4 quesos');

INSERT INTO producte(nom, tipus, descripcio, preu) VALUES
  ('Hamburgesa Deluxe', 'hamburgesa', 'Hamburgesa de ternera con pan tostado', 9.80),
  ('Hamburgesa Clàssica', 'hamburgesa', 'Hamburgesa de vedella amb enciam i tomàquet', 7.50),
  ('Hamburguesa Vegana', 'hamburgesa', 'Hamburguesa vegetal amb formatge vegà i salsa especial', 8.90),
  ('Cocacola', 'beguda', 'Refresco de la marca Cocacola', 2.10),
  ('Cervesa Estrella Damm', 'beguda', 'Cervesa de la marca Estrella Damm', 3.50);

INSERT INTO producte(nom, tipus, descripcio, preu) VALUES 
('Pizza Hawaiana', 'pizza', 'Es una pizza Hawaina',9.80),
('Pizza Carbonara', 'pizza', 'Es una pizza Carbonara',9.80),
('Pizza 4 quesos', 'pizza', 'Es una pizza 4 quesos',9.80);

INSERT INTO venta(data_venta, tipus, tenda_id, empleat_id) VALUES 
('2003-04-12', 'botiga', 1, 1),
('2003-05-20', 'domicili',1 , 1),
('2004-09-12', 'botiga', 2, 2),
('2004-10-20', 'domicili',2 , 2);

INSERT INTO item(venta_id, producte_id) VALUES
(1,1),
(1,2),
(1,4),
(2,1),
(2,5);



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
