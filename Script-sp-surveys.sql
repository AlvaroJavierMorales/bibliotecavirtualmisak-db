-- encuesta ***
-- INSERTAR
DELIMITER //
CREATE PROCEDURE procInsertSurvey(
IN v_descripcion_pregunta VARCHAR(100),
IN v_usu_id INT)
BEGIN
INSERT INTO tbl_encuesta(
en_descripcion_pregunta, 
tbl_usuarios_usu_id) 
VALUES (
v_descripcion_pregunta, 
v_usu_id);
END//
DELIMITER ;

-- MOSTRAR
DELIMITER //
CREATE PROCEDURE procSelectSurvey()
BEGIN
    SELECT 
        en_id, 
        en_descripcion_pregunta, 
        tbl_usuarios_usu_id
    FROM tbl_encuesta;
END//
DELIMITER ;
-- MOSTRAR UNICAMENTE EL ID Y LA DESCRIPCIÓN DE LA PREGUNTA
DELIMITER //
CREATE PROCEDURE procSelectSurveyDDL()
BEGIN
    SELECT en_id, en_descripcion_pregunta FROM tbl_encuesta;
END//
DELIMITER ;
-- ACTUALIZAR
DELIMITER //
CREATE PROCEDURE procUpdateSurvey(
    IN v_en_id INT, 
    IN v_usu_id INT,
    IN v_descripcion_pregunta VARCHAR(100))
BEGIN
    UPDATE tbl_encuesta 
    SET 
        en_descripcion_pregunta = v_descripcion_pregunta
    WHERE en_id = v_en_id AND tbl_usuarios_usu_id = v_usu_id;
END//
DELIMITER ;

-- ELIMINAR
DELIMITER //
CREATE PROCEDURE procDeleteSurvey(
    IN v_en_id INT, 
    IN v_usu_id INT)
BEGIN 
    DELETE FROM tbl_encuesta 
    WHERE en_id = v_en_id AND tbl_usuarios_usu_id = v_usu_id;
END//
DELIMITER ;
