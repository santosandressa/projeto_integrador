-- MySQL Script generated by MySQL Workbench
-- Mon Mar 15 10:33:29 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_localixo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_localixo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_localixo` DEFAULT CHARACTER SET utf8 ;
USE `db_localixo` ;

-- -----------------------------------------------------
-- Table `db_localixo`.`tb_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_localixo`.`tb_categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NULL,
  `descarte` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_localixo`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_localixo`.`tb_usuario` (
  `id` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `cnpj` VARCHAR(45) NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(13) NOT NULL,
  `senha` VARCHAR(12) NOT NULL,
  `cep` VARCHAR(10) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_localixo`.`tb_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_localixo`.`tb_produto` (
  `id` INT NOT NULL,
  `fk_categoria_id` INT NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  `quantidade` DECIMAL(10,2) NOT NULL,
  `peso` DECIMAL(10,2) NULL,
  `tipo_prod` VARCHAR(45) NOT NULL,
  `fk_usuario_id` INT NOT NULL,
  PRIMARY KEY (`id`, `fk_categoria_id`, `fk_usuario_id`),
  INDEX `fk_tb_produto_tb_categoria_idx` (`fk_categoria_id` ASC) VISIBLE,
  INDEX `fk_tb_produto_tb_usuario1_idx` (`fk_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_produto_tb_categoria`
    FOREIGN KEY (`fk_categoria_id`)
    REFERENCES `db_localixo`.`tb_categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_produto_tb_usuario1`
    FOREIGN KEY (`fk_usuario_id`)
    REFERENCES `db_localixo`.`tb_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_localixo`.`tb_avaliacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_localixo`.`tb_avaliacao` (
  `id` INT NOT NULL,
  `fk_usuario_id` INT NOT NULL,
  `avaliacao` INT NULL,
  `comentario` VARCHAR(255) NULL,
  PRIMARY KEY (`id`, `fk_usuario_id`),
  INDEX `fk_tb_avaliacao_tb_usuario1_idx` (`fk_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_avaliacao_tb_usuario1`
    FOREIGN KEY (`fk_usuario_id`)
    REFERENCES `db_localixo`.`tb_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;