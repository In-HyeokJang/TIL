-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Schema rent_car
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema rent_car
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rent_car` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `rent_car` ;
-- -----------------------------------------------------
-- Table `mydb`.`store`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rent_car`.`store` (
  `no` VARCHAR(45) NOT NULL,
  `store_name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `x` INT NOT NULL,
  `y` VARCHAR(45) NOT NULL,
  `accumulate_point` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rent_car`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rent_car`.`user` (
  `id` VARCHAR(10) NOT NULL,
  `passwd` VARCHAR(24) NOT NULL,
  `mname` VARCHAR(20) NOT NULL,
  `phone` VARCHAR(14) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `license` VARCHAR(20) NOT NULL,
  `grade` VARCHAR(10) NOT NULL DEFAULT 'H',
  `pnt` VARCHAR(10000) NOT NULL DEFAULT '0',
  `fname` VARCHAR(50) NOT NULL,
  `zipcode` VARCHAR(7) NULL DEFAULT NULL,
  `address1` VARCHAR(150) NULL DEFAULT NULL,
  `address2` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rent_car`.`carinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rent_car`.`carinfo` (
  `carnumber` VARCHAR(8) NOT NULL,
  `carname` VARCHAR(100) NOT NULL,
  `carimage` VARCHAR(100) NULL DEFAULT NULL,
  `carseate` VARCHAR(4) NOT NULL,
  `carpoint` VARCHAR(8) NOT NULL,
  `rdate` DATE NOT NULL,
  `category` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`carnumber`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rent_car`.`booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rent_car`.`booking` (
  `booking_no` INT NOT NULL AUTO_INCREMENT,
  `rent_day` DATE NOT NULL,
  `rent_time` TIME NOT NULL,
  `return_day` DATE NOT NULL,
  `return_time` TIME NOT NULL,
  `user_id` VARCHAR(10) NULL DEFAULT NULL,
  `reserved_car` VARCHAR(8) NULL DEFAULT NULL,
  `insurance` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`booking_no`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `reserved_car` (`reserved_car` ASC) VISIBLE,
  CONSTRAINT `booking_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `rent_car`.`user` (`id`),
  CONSTRAINT `booking_ibfk_2`
    FOREIGN KEY (`reserved_car`)
    REFERENCES `rent_car`.`carinfo` (`carnumber`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rent_car`.`caroption`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rent_car`.`caroption` (
  `bluetooth` CHAR(4) NULL DEFAULT NULL,
  `rear_sensor` CHAR(4) NULL DEFAULT NULL,
  `rear_camera` CHAR(5) NULL DEFAULT NULL,
  `black_box` CHAR(4) NULL DEFAULT NULL,
  `heated_seat` CHAR(4) NULL DEFAULT NULL,
  `heated_handle` CHAR(4) NULL DEFAULT NULL,
  `ventilated_seat` CHAR(4) NULL DEFAULT NULL,
  `navigation` CHAR(5) NULL DEFAULT NULL,
  `non_smoking_vehicle` CHAR(4) NULL DEFAULT NULL,
  `smart_key` CHAR(4) NULL DEFAULT NULL,
  `sunroof` CHAR(3) NULL DEFAULT NULL,
  `rear_warning_light` CHAR(5) NULL DEFAULT NULL,
  `Lane_Departure_Prevention` CHAR(6) NULL DEFAULT NULL,
  `carnumber` VARCHAR(8) NULL DEFAULT NULL,
  INDEX `carnumber` (`carnumber` ASC) VISIBLE,
  CONSTRAINT `caroption_ibfk_1`
    FOREIGN KEY (`carnumber`)
    REFERENCES `rent_car`.`carinfo` (`carnumber`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rent_car`.`supporter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rent_car`.`supporter` (
  `carnum` VARCHAR(10) NOT NULL,
  `registed` DATE NOT NULL,
  `production` VARCHAR(45) NULL DEFAULT NULL,
  `state` VARCHAR(10) NULL DEFAULT NULL,
  `brand` VARCHAR(45) NULL DEFAULT NULL,
  `model` VARCHAR(45) NULL DEFAULT NULL,
  `dccombo` VARCHAR(45) NULL DEFAULT NULL,
  `dcdemo` VARCHAR(45) NULL DEFAULT NULL,
  `ac` VARCHAR(45) NULL DEFAULT NULL,
  `fullcharge` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`carnum`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rent_car`.`help`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rent_car`.`help` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `carinfo_carnum` VARCHAR(45) NOT NULL,
  `rx` VARCHAR(20) NOT NULL,
  `ry` VARCHAR(20) NOT NULL,
  `reason` VARCHAR(1000) NOT NULL,
  `state` VARCHAR(20) NOT NULL DEFAULT 'request',
  `supporter_carnum` VARCHAR(10) NULL DEFAULT NULL,
  `request_time` DATETIME NULL DEFAULT NULL,
  `accepted_time` DATETIME NULL DEFAULT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`no`),
  INDEX `carinfo_carnum` (`carinfo_carnum` ASC) VISIBLE,
  INDEX `fk_help_supporter1_idx` (`supporter_carnum` ASC) VISIBLE,
  CONSTRAINT `help_ibfk_1`
    FOREIGN KEY (`carinfo_carnum`)
    REFERENCES `rent_car`.`carinfo` (`carnumber`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_help_supporter1`
    FOREIGN KEY (`supporter_carnum`)
    REFERENCES `rent_car`.`supporter` (`carnum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rent_car`.`list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rent_car`.`list` (
  `listno` INT NOT NULL AUTO_INCREMENT COMMENT '글 번호',
  `title` VARCHAR(300) NOT NULL COMMENT '제목',
  `content` TEXT NOT NULL COMMENT '내용',
  `wname` VARCHAR(20) NOT NULL COMMENT '작성자',
  `cnt` SMALLINT NOT NULL DEFAULT '0' COMMENT '조회수',
  `rdate` DATETIME NOT NULL COMMENT '등록일',
  PRIMARY KEY (`listno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rent_car`.`notice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rent_car`.`notice` (
  `noticeno` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(300) NOT NULL,
  `wname` VARCHAR(30) NOT NULL,
  `content` VARCHAR(1000) NOT NULL,
  `passwd` VARCHAR(20) NULL DEFAULT NULL,
  `wdate` DATE NOT NULL,
  `fname` VARCHAR(100) NULL DEFAULT '파일이 없습니다.',
  PRIMARY KEY (`noticeno`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rent_car`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rent_car`.`review` (
  `rnum` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(500) NOT NULL,
  `regdate` DATE NOT NULL,
  `id` VARCHAR(15) NOT NULL,
  `listno` INT NOT NULL,
  PRIMARY KEY (`rnum`),
  INDEX `listno` (`listno` ASC) VISIBLE,
  CONSTRAINT `review_ibfk_1`
    FOREIGN KEY (`listno`)
    REFERENCES `rent_car`.`list` (`listno`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `rent_car`.`support_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rent_car`.`support_log` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `rx` VARCHAR(20) NULL DEFAULT NULL,
  `ry` VARCHAR(20) NULL DEFAULT NULL,
  `reason` VARCHAR(1000) NULL DEFAULT NULL,
  `request_time` DATETIME NULL DEFAULT NULL,
  `accepted_time` DATETIME NULL DEFAULT NULL,
  `complete_time` DATETIME NULL DEFAULT NULL,
  `carnum` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`no`),
  INDEX `carnum` (`carnum` ASC) VISIBLE,
  CONSTRAINT `support_log_ibfk_1`
    FOREIGN KEY (`carnum`)
    REFERENCES `rent_car`.`carinfo` (`carnumber`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
