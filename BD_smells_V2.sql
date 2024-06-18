-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ff_smells
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ff_smells
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ff_smells` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ff_smells` ;

-- -----------------------------------------------------
-- Table `ff_smells`.`Categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ff_smells`.`Categorias` (
  `id_Categorias` INT NOT NULL,
  `Categoria` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Categorias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ff_smells`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ff_smells`.`Menu` (
  `id_Menu` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Precio` FLOAT NULL,
  `id_Categoria` INT NOT NULL,
  PRIMARY KEY (`id_Menu`),
  INDEX `idCategoria_idx` (`id_Categoria` ASC) VISIBLE,
  CONSTRAINT `idCategoria`
    FOREIGN KEY (`id_Categoria`)
    REFERENCES `ff_smells`.`Categorias` (`id_Categorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ff_smells`.`Ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ff_smells`.`Ingredientes` (
  `id_Ingrediente` INT NOT NULL,
  `nombre_ingrediente` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Ingrediente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ff_smells`.`Menu_Ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ff_smells`.`Menu_Ingredientes` (
  `id_Menu_ingrediente` INT NOT NULL,
  `id_Menu` INT NOT NULL,
  `id_Ingredientes` INT NOT NULL,
  PRIMARY KEY (`id_Menu_ingrediente`),
  INDEX `id_Menu_idx` (`id_Menu` ASC) VISIBLE,
  INDEX `id_Ingredientes_idx` (`id_Ingredientes` ASC) VISIBLE,
  CONSTRAINT `fk_Menu1`
    FOREIGN KEY (`id_Menu`)
    REFERENCES `ff_smells`.`Menu` (`id_Menu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ingredientes1`
    FOREIGN KEY (`id_Ingredientes`)
    REFERENCES `ff_smells`.`Ingredientes` (`id_Ingrediente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ff_smells`.`Estatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ff_smells`.`Estatus` (
  `id_Estatus` INT NOT NULL,
  `Estado_orden` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Estatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ff_smells`.`Ordenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ff_smells`.`Ordenes` (
  `id_Orden` INT NOT NULL,
  `Fecha_Orden` DATE NULL,
  `Referencia_Orden` INT NULL,
  `id_Estatus` INT NOT NULL,
  PRIMARY KEY (`id_Orden`),
  INDEX `id_Estatus_idx` (`id_Estatus` ASC) VISIBLE,
  CONSTRAINT `id_Estatus`
    FOREIGN KEY (`id_Estatus`)
    REFERENCES `ff_smells`.`Estatus` (`id_Estatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ff_smells`.`Detalles_ordenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ff_smells`.`Detalles_ordenes` (
  `id_Detalle_orden` INT NOT NULL,
  `Cantidad_Orden` INT NULL,
  `id_Menu` INT NOT NULL,
  `id_Orden` INT NOT NULL,
  INDEX `id_Orden_idx` (`id_Orden` ASC) VISIBLE,
  INDEX `id_Menu_idx` (`id_Menu` ASC) VISIBLE,
  CONSTRAINT `id_Orden`
    FOREIGN KEY (`id_Orden`)
    REFERENCES `ff_smells`.`Ordenes` (`id_Orden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_Menu`
    FOREIGN KEY (`id_Menu`)
    REFERENCES `ff_smells`.`Menu` (`id_Menu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ff_smells`.`Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ff_smells`.`Ventas` (
  `id_venta` INT NOT NULL,
  `Fecha_venta` DATE NULL,
  `Subtotal_venta` FLOAT NULL,
  `IVA_venta` FLOAT NULL,
  `Total` FLOAT NULL,
  `id_Orden` INT NOT NULL,
  PRIMARY KEY (`id_venta`),
  INDEX `fk_Ventas_Ordenes1_idx` (`id_Orden` ASC) VISIBLE,
  CONSTRAINT `fk_Ventas_Ordenes1`
    FOREIGN KEY (`id_Orden`)
    REFERENCES `ff_smells`.`Ordenes` (`id_Orden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
