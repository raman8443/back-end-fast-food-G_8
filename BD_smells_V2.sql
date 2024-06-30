-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema bd_smells2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bd_smells2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bd_smells2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `bd_smells2` ;

-- -----------------------------------------------------
-- Table `bd_smells2`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_smells2`.`categorias` (
  `id_Categorias` INT NOT NULL AUTO_INCREMENT,
  `Categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Categorias`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_smells2`.`estatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_smells2`.`estatus` (
  `id_Estatus` INT NOT NULL AUTO_INCREMENT,
  `Estado_orden` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Estatus`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_smells2`.`ordenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_smells2`.`ordenes` (
  `id_Orden` INT NOT NULL AUTO_INCREMENT,
  `Fecha_Orden` DATE NOT NULL,
  `Referencia_Orden` INT NOT NULL,
  `id_estatus` INT NOT NULL,
  PRIMARY KEY (`id_Orden`),
  INDEX `id_Estatus_idx` (`id_estatus` ASC) VISIBLE,
  CONSTRAINT `id_estatus`
    FOREIGN KEY (`id_estatus`)
    REFERENCES `bd_smells2`.`estatus` (`id_Estatus`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_smells2`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_smells2`.`productos` (
  `id_Producto` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Precio` FLOAT NOT NULL,
  `id_Categoria` INT NOT NULL,
  PRIMARY KEY (`id_Producto`),
  INDEX `idCategoria_idx` (`id_Categoria` ASC) VISIBLE,
  CONSTRAINT `idCategoria`
    FOREIGN KEY (`id_Categoria`)
    REFERENCES `bd_smells2`.`categorias` (`id_Categorias`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_smells2`.`detalles_ordenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_smells2`.`detalles_ordenes` (
  `id_Detalle_orden` INT NOT NULL AUTO_INCREMENT,
  `Cantidad_Orden` INT NOT NULL,
  `id_Producto` INT NOT NULL,
  `id_Orden` INT NOT NULL,
  PRIMARY KEY (`id_Detalle_orden`),
  INDEX `id_Orden_idx` (`id_Orden` ASC) VISIBLE,
  INDEX `id_Menu_idx` (`id_Producto` ASC) VISIBLE,
  CONSTRAINT `id_Orden`
    FOREIGN KEY (`id_Orden`)
    REFERENCES `bd_smells2`.`ordenes` (`id_Orden`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_Producto`
    FOREIGN KEY (`id_Producto`)
    REFERENCES `bd_smells2`.`productos` (`id_Producto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_smells2`.`ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_smells2`.`ingredientes` (
  `id_Ingrediente` INT NOT NULL AUTO_INCREMENT,
  `nombre_ingrediente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Ingrediente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_smells2`.`productos_ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_smells2`.`productos_ingredientes` (
  `id_Producto` INT NOT NULL AUTO_INCREMENT,
  `id_Ingrediente` INT NOT NULL,
  PRIMARY KEY (`id_Producto`, `id_Ingrediente`),
  INDEX `id_Menu_idx` (`id_Producto` ASC) VISIBLE,
  INDEX `id_Ingredientes_idx` (`id_Ingrediente` ASC) VISIBLE,
  CONSTRAINT `fk_productos_ingredientes_ingredientes`
    FOREIGN KEY (`id_Ingrediente`)
    REFERENCES `bd_smells2`.`ingredientes` (`id_Ingrediente`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_productos_ingredientes_productos`
    FOREIGN KEY (`id_Producto`)
    REFERENCES `bd_smells2`.`productos` (`id_Producto`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_smells2`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_smells2`.`ventas` (
  `id_venta` INT NOT NULL AUTO_INCREMENT,
  `Fecha_venta` DATE NOT NULL,
  `Subtotal_venta` FLOAT NOT NULL,
  `IVA_venta` FLOAT NOT NULL,
  `Total` FLOAT NOT NULL,
  `id_Orden` INT NOT NULL,
  PRIMARY KEY (`id_venta`),
  INDEX `fk_Ventas_Ordenes1_idx` (`id_Orden` ASC) VISIBLE,
  CONSTRAINT `fk_Ventas_Ordenes1`
    FOREIGN KEY (`id_Orden`)
    REFERENCES `bd_smells2`.`ordenes` (`id_Orden`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

