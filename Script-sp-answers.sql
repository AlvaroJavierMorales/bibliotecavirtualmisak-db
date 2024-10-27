-- RESPUESTAS****************
-- INSERTAR
DELIMITER //
CREATE PROCEDURE procInsertAnswer(
    IN v_respuesta VARCHAR(2),
    IN v_en_id INT)
BEGIN
    INSERT INTO tbl_respuestas(
        res_respuesta, 
        tbl_encuesta_en_id) 
    VALUES (
        v_respuesta, 
        v_en_id);
END//
DELIMITER ;

-- MOSTRAR
DELIMITER //
CREATE PROCEDURE procSelectAnswer()
BEGIN
    SELECT 
        res_id, 
        res_respuesta, 
        tbl_encuesta_en_id
    FROM tbl_respuestas;
END//
DELIMITER ;

-- ACTUALIZAR
DELIMITER //
CREATE PROCEDURE procUpdateAnswer(
    IN v_res_id INT, 
    IN v_en_id INT,
    IN v_res_respuesta VARCHAR(2))
BEGIN
    UPDATE tbl_respuestas 
    SET 
        res_respuesta = v_res_respuesta
    WHERE res_id = v_res_id AND tbl_encuesta_en_id = v_en_id;
END//
DELIMITER ;

-- ELIMINAR
DELIMITER //
CREATE PROCEDURE procDeleteAnswer(
    IN v_res_id INT, 
    IN v_en_id INT)
BEGIN 
    DELETE FROM tbl_respuestas 
    WHERE res_id = v_res_id AND tbl_encuesta_en_id = v_en_id;
END//
DELIMITER ;
