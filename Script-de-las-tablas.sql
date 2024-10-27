-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BIBLIOTECA-VIRTUAL-MISAK
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BIBLIOTECA-VIRTUAL-MISAK
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BIBLIOTECA-VIRTUAL-MISAK` DEFAULT CHARACTER SET utf8 ;
USE `BIBLIOTECA-VIRTUAL-MISAK` ;

-- -----------------------------------------------------
-- Table `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_autores` (
  `au_id` INT NOT NULL AUTO_INCREMENT,
  `au_nombre` VARCHAR(15) NOT NULL,
  `au_apellido` VARCHAR(15) NOT NULL,
  `au_municipio` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`au_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_editorial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_editorial` (
  `edi_id` INT NOT NULL AUTO_INCREMENT,
  `edi_nombre` VARCHAR(45) NOT NULL,
  `edi_ciudad` VARCHAR(25) NOT NULL,
  `edi_telefono` INT NOT NULL,
  `edi_correo` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`edi_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_categorias` (
  `cat_id` INT NOT NULL AUTO_INCREMENT,
  `cat_nombre` ENUM('Libro', 'Cartilla', 'Folleto', 'Guía Didactica', 'Juego Lúdico', 'Pendón', 'Multimedia') NOT NULL,
  `cat_descripcion` TEXT NOT NULL,
  PRIMARY KEY (`cat_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_usuarios` (
  `usu_id` INT NOT NULL AUTO_INCREMENT,
  `usu_nombre` VARCHAR(15) NOT NULL,
  `usu_apellido` VARCHAR(15) NOT NULL,
  `usu_correo` VARCHAR(80) NOT NULL,
  `usu_contrasena` TEXT NOT NULL,
  `usu_salt` TEXT NOT NULL,
  `usu_rol` ENUM('Administrador', 'Docente', 'Estudiante') NOT NULL,
  `usu_nivel_estudios` ENUM('Sin educativo', 'Básica Primaria', 'Básica Secundaria', 'Bachillerato', 'Formación Profesional', 'Posgrado') NOT NULL,
  PRIMARY KEY (`usu_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_solicitud_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_solicitud_compra` (
  `solic_id` INT NOT NULL AUTO_INCREMENT,
  `solic_ticket` VARCHAR(45) NOT NULL,
  `solic_fecha` DATE NOT NULL,
  `tbl_usuarios_usu_id` INT NOT NULL,
  PRIMARY KEY (`solic_id`, `tbl_usuarios_usu_id`),
  INDEX `fk_tbl_solicitud_compra_tbl_usuarios1_idx` (`tbl_usuarios_usu_id` ASC) ,
  CONSTRAINT `fk_tbl_solicitud_compra_tbl_usuarios1`
    FOREIGN KEY (`tbl_usuarios_usu_id`)
    REFERENCES `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_usuarios` (`usu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_visitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_visitas` (
  `vis_id` INT NOT NULL AUTO_INCREMENT,
  `vis_fecha_ingreso` DATE NOT NULL,
  `vis_duracion` TIME NOT NULL,
  `tbl_usuarios_usu_id` INT NOT NULL,
  PRIMARY KEY (`vis_id`, `tbl_usuarios_usu_id`),
  INDEX `fk_tbl_visitas_tbl_usuarios1_idx` (`tbl_usuarios_usu_id` ASC) ,
  CONSTRAINT `fk_tbl_visitas_tbl_usuarios1`
    FOREIGN KEY (`tbl_usuarios_usu_id`)
    REFERENCES `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_usuarios` (`usu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_material_edu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_material_edu` (
  `mat_id` INT NOT NULL AUTO_INCREMENT,
  `mat_titulo` VARCHAR(200) NOT NULL,
  `mat_ano_publicacion` DATE NOT NULL,
  `mat_url_descarga` TEXT NOT NULL,
  `mat_precio` DECIMAL NOT NULL,
  `mat_cantidad` SMALLINT NOT NULL,
  `tbl_editorial_edi_id` INT NOT NULL,
  `tbl_categorias_cat_id` INT NOT NULL,
  `tbl_solicitud_compra_solic_id` INT NOT NULL,
  `tbl_visitas_vis_id` INT NOT NULL,
  PRIMARY KEY (`mat_id`, `tbl_editorial_edi_id`, `tbl_categorias_cat_id`, `tbl_solicitud_compra_solic_id`, `tbl_visitas_vis_id`),
  INDEX `fk_tbl_material_edu_tbl_editorial1_idx` (`tbl_editorial_edi_id` ASC) ,
  INDEX `fk_tbl_material_edu_tbl_categorias1_idx` (`tbl_categorias_cat_id` ASC) ,
  INDEX `fk_tbl_material_edu_tbl_solicitud_compra1_idx` (`tbl_solicitud_compra_solic_id` ASC) ,
  INDEX `fk_tbl_material_edu_tbl_visitas1_idx` (`tbl_visitas_vis_id` ASC) ,
  CONSTRAINT `fk_tbl_material_edu_tbl_editorial1`
    FOREIGN KEY (`tbl_editorial_edi_id`)
    REFERENCES `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_editorial` (`edi_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_material_edu_tbl_categorias1`
    FOREIGN KEY (`tbl_categorias_cat_id`)
    REFERENCES `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_categorias` (`cat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_material_edu_tbl_solicitud_compra1`
    FOREIGN KEY (`tbl_solicitud_compra_solic_id`)
    REFERENCES `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_solicitud_compra` (`solic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_material_edu_tbl_visitas1`
    FOREIGN KEY (`tbl_visitas_vis_id`)
    REFERENCES `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_visitas` (`vis_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_encuesta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_encuesta` (
  `en_id` INT NOT NULL,
  `en_descripcion_pregunta` VARCHAR(100) NULL,
  `tbl_usuarios_usu_id` INT NOT NULL,
  PRIMARY KEY (`en_id`, `tbl_usuarios_usu_id`),
  INDEX `fk_tbl_encuesta_tbl_usuarios1_idx` (`tbl_usuarios_usu_id` ASC) ,
  CONSTRAINT `fk_tbl_encuesta_tbl_usuarios1`
    FOREIGN KEY (`tbl_usuarios_usu_id`)
    REFERENCES `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_usuarios` (`usu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_respuestas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_respuestas` (
  `res_id` INT NOT NULL,
  `res_respuesta` VARCHAR(2) NULL,
  `tbl_encuesta_en_id` INT NOT NULL,
  PRIMARY KEY (`res_id`, `tbl_encuesta_en_id`),
  INDEX `fk_tbl_respuestas_tbl_encuesta1_idx` (`tbl_encuesta_en_id` ASC) ,
  CONSTRAINT `fk_tbl_respuestas_tbl_encuesta1`
    FOREIGN KEY (`tbl_encuesta_en_id`)
    REFERENCES `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_encuesta` (`en_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_material_edu_has_tbl_autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_material_edu_has_tbl_autores` (
  `tbl_material_edu_mat_id` INT NOT NULL,
  `tbl_autores_au_id` INT NOT NULL,
  PRIMARY KEY (`tbl_material_edu_mat_id`, `tbl_autores_au_id`),
  INDEX `fk_tbl_material_edu_has_tbl_autores_tbl_autores1_idx` (`tbl_autores_au_id` ASC) ,
  INDEX `fk_tbl_material_edu_has_tbl_autores_tbl_material_edu1_idx` (`tbl_material_edu_mat_id` ASC) ,
  CONSTRAINT `fk_tbl_material_edu_has_tbl_autores_tbl_material_edu1`
    FOREIGN KEY (`tbl_material_edu_mat_id`)
    REFERENCES `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_material_edu` (`mat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_material_edu_has_tbl_autores_tbl_autores1`
    FOREIGN KEY (`tbl_autores_au_id`)
    REFERENCES `BIBLIOTECA-VIRTUAL-MISAK`.`tbl_autores` (`au_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

USE `BIBLIOTECA-VIRTUAL-MISAK` ;

-- -----------------------------------------------------
-- procedure procInsertMaterialeducativo
-- -----------------------------------------------------

DELIMITER $$
USE `BIBLIOTECA-VIRTUAL-MISAK`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `procInsertMaterialeducativo`(IN v_Nombrematerial VARCHAR(45) , IN v_description VARCHAR(45) , IN v_idioma VARCHAR(45) , IN v_nivelescolar VARCHAR(45) , IN v_area VARCHAR(45))
begin 
 insert into material_edu(Nombre_material, Mat_description, Mat_idioma, Mat_nivel_escolar, Mat_area) values (v_Nombrematerial, v_description, v_idioma, v_nivelescolar, v_area);
end$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
