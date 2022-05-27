-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema agendamentos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema agendamentos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `agendamentos` DEFAULT CHARACTER SET utf8 ;
USE `agendamentos` ;

-- -----------------------------------------------------
-- Table `agendamentos`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agendamentos`.`clientes` (
  `id_cliente` INT NOT NULL,
  `ds_cliente` VARCHAR(100) NULL,
  `dt_nascimento` DATE NULL,
  `nr_cpf` VARCHAR(11) NULL,
  `nr_rg` VARCHAR(11) NULL,
  `nr_cep` VARCHAR(7) NULL,
  `ds_endereco` VARCHAR(100) NULL,
  `nr_numero` VARCHAR(10) NULL,
  `ds_complemento` VARCHAR(45) NULL,
  `ds_bairro` VARCHAR(60) NULL,
  `ds_cidade` VARCHAR(70) NULL,
  `ds_uf` CHAR(2) NULL,
  `nr_telefone` VARCHAR(12) NULL,
  `nr_telefone2` VARCHAR(12) NULL,
  `ds_obs` VARCHAR(255) NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agendamentos`.`profissionais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agendamentos`.`profissionais` (
  `id_profissional` INT NOT NULL,
  `ds_profissional` VARCHAR(100) NULL,
  `nr_contato` VARCHAR(12) NULL,
  PRIMARY KEY (`id_profissional`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agendamentos`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agendamentos`.`usuarios` (
  `id_usuarios` INT NOT NULL,
  `ds_usuario` VARCHAR(100) NULL,
  `ds_login` VARCHAR(45) NULL,
  `ds_senha` VARCHAR(10) NULL,
  PRIMARY KEY (`id_usuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agendamentos`.`agendamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agendamentos`.`agendamento` (
  `id_agendamento` INT NOT NULL,
  `cli_id_cliente` INT NOT NULL,
  `pro_id_profissional` INT NOT NULL,
  `usu_id_usuarios` INT NOT NULL,
  `dt_data` DATE NULL,
  `hr_hora` VARCHAR(5) NULL,
  `ds_obs` VARCHAR(255) NULL,
  PRIMARY KEY (`id_agendamento`),
  INDEX `fk_agendamento_clientes_idx` (`cli_id_cliente` ASC) VISIBLE,
  INDEX `fk_agendamento_profissionais1_idx` (`pro_id_profissional` ASC) VISIBLE,
  INDEX `fk_agendamento_usuarios1_idx` (`usu_id_usuarios` ASC) VISIBLE,
  CONSTRAINT `fk_agendamento_clientes`
    FOREIGN KEY (`cli_id_cliente`)
    REFERENCES `agendamentos`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agendamento_profissionais1`
    FOREIGN KEY (`pro_id_profissional`)
    REFERENCES `agendamentos`.`profissionais` (`id_profissional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agendamento_usuarios1`
    FOREIGN KEY (`usu_id_usuarios`)
    REFERENCES `agendamentos`.`usuarios` (`id_usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
