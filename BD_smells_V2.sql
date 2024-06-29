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
  `id_Categorias` INT NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Categorias`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_smells2`.`estatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_smells2`.`estatus` (
  `id_Estatus` INT NOT NULL,
  `Estado_orden` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Estatus`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_smells2`.`ordenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_smells2`.`ordenes` (
  `id_Orden` INT NOT NULL,
  `Fecha_Orden` DATE NOT NULL,
  `Referencia_Orden` INT NOT NULL,
  `id_Estatus` INT NOT NULL,
  PRIMARY KEY (`id_Orden`),
  INDEX `id_Estatus_idx` (`id_Estatus`),
  CONSTRAINT `id_Estatus`
    FOREIGN KEY (`id_Estatus`)
    REFERENCES `bd_smells2`.`estatus` (`id_Estatus`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_smells2`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_smells2`.`productos` (
  `id_Producto` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Precio` FLOAT NOT NULL,
  `id_Categoria` INT NOT NULL,
  PRIMARY KEY (`id_Producto`),
  INDEX `idCategoria_idx` (`id_Categoria`),
  CONSTRAINT `idCategoria`
    FOREIGN KEY (`id_Categoria`)
    REFERENCES `bd_smells2`.`categorias` (`id_Categorias`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_smells2`.`detalles_ordenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_smells2`.`detalles_ordenes` (
  `id_Detalle_orden` INT NOT NULL,
  `Cantidad_Orden` INT NOT NULL,
  `id_Producto` INT NOT NULL,
  `id_Orden` INT NOT NULL,
  PRIMARY KEY (`id_Detalle_orden`),
  INDEX `id_Orden_idx` (`id_Orden`),
  INDEX `id_Menu_idx` (`id_Producto`),
  CONSTRAINT `id_Orden`
    FOREIGN KEY (`id_Orden`)
    REFERENCES `bd_smells2`.`ordenes` (`id_Orden`),
  CONSTRAINT `id_Producto`
    FOREIGN KEY (`id_Producto`)
    REFERENCES `bd_smells2`.`productos` (`id_Producto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_smells2`.`ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_smells2`.`ingredientes` (
  `id_Ingrediente` INT NOT NULL,
  `nombre_ingrediente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Ingrediente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_smells2`.`productos_ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_smells2`.`productos_ingredientes` (
  `id_Producto` INT NULL,
  `id_Ingrediente` INT NULL,
  INDEX `id_Menu_idx` (`id_Producto`),
  INDEX `id_Ingredientes_idx` (`id_Ingrediente`),
  PRIMARY KEY (`id_Producto`, `id_Ingrediente`),
  CONSTRAINT `fk_productos_ingredientes_ingredientes`
    FOREIGN KEY (`id_Ingrediente`)
    REFERENCES `bd_smells2`.`ingredientes` (`id_Ingrediente`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_productos_ingredientes_productos`
    FOREIGN KEY (`id_Producto`)
    REFERENCES `bd_smells2`.`productos` (`id_Producto`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `bd_smells2`.`ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bd_smells2`.`ventas` (
  `id_venta` INT NOT NULL,
  `Fecha_venta` DATE NOT NULL,
  `Subtotal_venta` FLOAT NOT NULL,
  `IVA_venta` FLOAT NOT NULL,
  `Total` FLOAT NOT NULL,
  `id_Orden` INT NOT NULL,
  PRIMARY KEY (`id_venta`),
  INDEX `fk_Ventas_Ordenes1_idx` (`id_Orden`),
  CONSTRAINT `fk_Ventas_Ordenes1`
    FOREIGN KEY (`id_Orden`)
    REFERENCES `bd_smells2`.`ordenes` (`id_Orden`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



---Insertar categorias----
INSERT INTO categorias (id_Categorias, Categoria) VALUES (01,'Hamburguesa');
INSERT INTO categorias (id_Categorias, Categoria) VALUES (02,'Pizza');
INSERT INTO categorias (id_Categorias, Categoria) VALUES (03,'Bebida');
INSERT INTO categorias (id_Categorias, Categoria) VALUES (04,'Postre');

---Insertar productos----
INSERT INTO Productos (id_Producto, Nombre, Precio, id_Categoria) 
VALUES (01,'Hamburguesa Doble Carne', 12000, 01 );
INSERT INTO Productos (id_Producto, Nombre, Precio, id_Categoria) 
VALUES (02,'Hamburguesa Doble Queso', 10000, 01 );
INSERT INTO Productos (id_Producto, Nombre, Precio, id_Categoria) 
VALUES (03,'Hamburguesa X2', 21000, 01 );
INSERT INTO Productos (id_Producto, Nombre, Precio, id_Categoria) 
VALUES (04,'Lata Coca-Cola 354ml', 2350, 03 );
INSERT INTO Productos (id_Producto, Nombre, Precio, id_Categoria) 
VALUES (05,'Cerveza Patagonia 730 ml', 6500, 03 );
INSERT INTO Productos (id_Producto, Nombre, Precio, id_Categoria) 
VALUES (06,'Bonaqua Sin Gas 500 ml', 2100, 03 );
INSERT INTO Productos (id_Producto, Nombre, Precio, id_Categoria) 
VALUES (07,'Helado de Vainilla y Oreo', 3850, 04 );
INSERT INTO Productos (id_Producto, Nombre, Precio, id_Categoria) 
VALUES (08,'Chocotorta', 3700, 04 );
INSERT INTO Productos (id_Producto, Nombre, Precio, id_Categoria) 
VALUES (09,'Pizza Napolitana', 7150, 02 );
INSERT INTO Productos (id_Producto, Nombre, Precio, id_Categoria) 
VALUES (10,'Pizza de Champiñores', 9150, 02 );

---Insertar ingredientes----
INSERT INTO ingredientes (id_Ingrediente, nombre_ingrediente) 
VALUES (01,'Salsa de tomate');
INSERT INTO ingredientes (id_Ingrediente, nombre_ingrediente) 
VALUES (02,'muzzarella');
INSERT INTO ingredientes (id_Ingrediente, nombre_ingrediente) 
VALUES (03,'Rodajas de tomate');
INSERT INTO ingredientes (id_Ingrediente, nombre_ingrediente) 
VALUES (04,'Cebolla');
INSERT INTO ingredientes (id_Ingrediente, nombre_ingrediente) 
VALUES (05,'Champignones');
INSERT INTO ingredientes (id_Ingrediente, nombre_ingrediente) 
VALUES (06,'Jamón');
INSERT INTO ingredientes (id_Ingrediente, nombre_ingrediente) 
VALUES (07,'Chocolate');
INSERT INTO ingredientes (id_Ingrediente, nombre_ingrediente) 
VALUES (08,'Huevo');
INSERT INTO ingredientes (id_Ingrediente, nombre_ingrediente) 
VALUES (09,'Leche');
INSERT INTO ingredientes (id_Ingrediente, nombre_ingrediente) 
VALUES (10,'Vainilla');
INSERT INTO ingredientes (id_Ingrediente, nombre_ingrediente) 
VALUES (11,'Agua');
INSERT INTO ingredientes (id_Ingrediente, nombre_ingrediente) 
VALUES (12,'Carne');
INSERT INTO ingredientes (id_Ingrediente, nombre_ingrediente) 
VALUES (13,'Queso');
INSERT INTO ingredientes (id_Ingrediente, nombre_ingrediente) 
VALUES (14,'Pan');

---Insertar id de productos_ingredientes----
INSERT INTO productos_ingredientes (id_Producto, id_Ingrediente) 
VALUES (01, 01);
INSERT INTO productos_ingredientes (id_Producto, id_Ingrediente) 
VALUES (02, 02);
INSERT INTO productos_ingredientes (id_Producto, id_Ingrediente) 
VALUES (03, 03);
INSERT INTO productos_ingredientes (id_Producto, id_Ingrediente) 
VALUES (04, 04);
INSERT INTO productos_ingredientes (id_Producto, id_Ingrediente) 
VALUES (05, 05);
INSERT INTO productos_ingredientes (id_Producto, id_Ingrediente) 
VALUES (06, 06);
INSERT INTO productos_ingredientes (id_Producto, id_Ingrediente) 
VALUES (07, 07);
INSERT INTO productos_ingredientes (id_Producto, id_Ingrediente) 
VALUES (08, 08);
INSERT INTO productos_ingredientes (id_Producto, id_Ingrediente) 
VALUES (09, 09);
INSERT INTO productos_ingredientes (id_Producto, id_Ingrediente) 
VALUES (10, 10);
INSERT INTO productos_ingredientes (id_Producto, id_Ingrediente) 
VALUES (11, 11);
INSERT INTO productos_ingredientes (id_Producto, id_Ingrediente) 
VALUES (12, 12);
INSERT INTO productos_ingredientes (id_Producto, id_Ingrediente) 
VALUES (13, 13);
INSERT INTO productos_ingredientes (id_Producto, id_Ingrediente) 
VALUES (14, 14);
