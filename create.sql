-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema DB_2023_Term_Proj
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DB_2023_Term_Proj
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DB_2023_Term_Proj` DEFAULT CHARACTER SET utf8 ;
USE `DB_2023_Term_Proj` ;

-- -----------------------------------------------------
-- Table `DB_2023_Term_Proj`.`MedicalSpecialty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_2023_Term_Proj`.`MedicalSpecialty` (
  `deptid` INT NOT NULL,
  `deptname` VARCHAR(45) NOT NULL,
  `deptphonenum` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`deptid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_2023_Term_Proj`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_2023_Term_Proj`.`Doctor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `phonenum` VARCHAR(13) NOT NULL,
  `MedicalSpecialty_deptid` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Doctor_MedicalSpecialty1_idx` (`MedicalSpecialty_deptid` ASC) VISIBLE,
  CONSTRAINT `fk_Doctor_MedicalSpecialty1`
    FOREIGN KEY (`MedicalSpecialty_deptid`)
    REFERENCES `DB_2023_Term_Proj`.`MedicalSpecialty` (`deptid`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_2023_Term_Proj`.`Nurse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_2023_Term_Proj`.`Nurse` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `phonenum` VARCHAR(13) NOT NULL,
  `MedicalSpecialty_deptid` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Nurse_MedicalSpecialty1_idx` (`MedicalSpecialty_deptid` ASC) VISIBLE,
  CONSTRAINT `fk_Nurse_MedicalSpecialty1`
    FOREIGN KEY (`MedicalSpecialty_deptid`)
    REFERENCES `DB_2023_Term_Proj`.`MedicalSpecialty` (`deptid`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_2023_Term_Proj`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_2023_Term_Proj`.`Patient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `password` VARCHAR(45) NOT NULL,
  `ssn` VARCHAR(11) NULL,
  `gender` VARCHAR(1) NULL,
  `address` VARCHAR(100) NULL,
  `bloodtype` VARCHAR(6) NULL,
  `height` FLOAT NULL,
  `weight` FLOAT NULL,
  `phonenum` VARCHAR(13) NULL,
  `Doctor_id` INT NULL,
  `Nurse_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `ssn_UNIQUE` (`ssn` ASC) VISIBLE,
  INDEX `fk_Patient_Doctor1_idx` (`Doctor_id` ASC) VISIBLE,
  INDEX `fk_Patient_Nurse1_idx` (`Nurse_id` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_Doctor1`
    FOREIGN KEY (`Doctor_id`)
    REFERENCES `DB_2023_Term_Proj`.`Doctor` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Patient_Nurse1`
    FOREIGN KEY (`Nurse_id`)
    REFERENCES `DB_2023_Term_Proj`.`Nurse` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_2023_Term_Proj`.`Reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_2023_Term_Proj`.`Reservation` (
  `reservnum` INT NOT NULL AUTO_INCREMENT,
  `Patient_id` INT NOT NULL,
  `MedicalSpecialty_deptid` INT NOT NULL,
  `reservtime` DATETIME NOT NULL,
  PRIMARY KEY (`reservnum`, `Patient_id`, `MedicalSpecialty_deptid`),
  INDEX `fk_Reservation_Patient1_idx` (`Patient_id` ASC) VISIBLE,
  INDEX `fk_Reservation_MedicalSpecialty1_idx` (`MedicalSpecialty_deptid` ASC) VISIBLE,
  CONSTRAINT `fk_Reservation_Patient1`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `DB_2023_Term_Proj`.`Patient` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Reservation_MedicalSpecialty1`
    FOREIGN KEY (`MedicalSpecialty_deptid`)
    REFERENCES `DB_2023_Term_Proj`.`MedicalSpecialty` (`deptid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_2023_Term_Proj`.`Inpatient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_2023_Term_Proj`.`Inpatient` (
  `Patient_id` INT NOT NULL,
  `admissiontime` DATETIME NOT NULL,
  `dischargetime` DATETIME NULL,
  `roomnum` INT NOT NULL,
  PRIMARY KEY (`Patient_id`, `admissiontime`),
  INDEX `fk_Inpatient_Patient_idx` (`Patient_id` ASC) VISIBLE,
  CONSTRAINT `fk_Inpatient_Patient`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `DB_2023_Term_Proj`.`Patient` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_2023_Term_Proj`.`Examination`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_2023_Term_Proj`.`Examination` (
  `Patient_id` INT NOT NULL,
  `Doctor_id` INT NOT NULL,
  `examtime` DATETIME NOT NULL,
  `examdetails` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`Patient_id`, `Doctor_id`, `examtime`),
  INDEX `fk_Examination_Patient1_idx` (`Patient_id` ASC) VISIBLE,
  CONSTRAINT `fk_Examination_Doctor1`
    FOREIGN KEY (`Doctor_id`)
    REFERENCES `DB_2023_Term_Proj`.`Doctor` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Examination_Patient1`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `DB_2023_Term_Proj`.`Patient` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_2023_Term_Proj`.`Treatment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_2023_Term_Proj`.`Treatment` (
  `Patient_id` INT NOT NULL,
  `Nurse_id` INT NOT NULL,
  `treatmenttime` DATETIME NOT NULL,
  `treatmentdetails` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`Patient_id`, `Nurse_id`, `treatmenttime`),
  INDEX `fk_Treatment_Nurse1_idx` (`Nurse_id` ASC) VISIBLE,
  INDEX `fk_Treatment_Patient1_idx` (`Patient_id` ASC) VISIBLE,
  CONSTRAINT `fk_Treatment_Nurse1`
    FOREIGN KEY (`Nurse_id`)
    REFERENCES `DB_2023_Term_Proj`.`Nurse` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Treatment_Patient1`
    FOREIGN KEY (`Patient_id`)
    REFERENCES `DB_2023_Term_Proj`.`Patient` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DB_2023_Term_Proj`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DB_2023_Term_Proj`.`Admin` (
  `id` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
