-- RESPUESTAS****************
-- INSERTAR
DELIMITER //
CREATE PROCEDURE procInsertAnswer(
    IN v_respuesta VARCHAR(2), -- Respuesta: "si" o "no"
    IN v_en_id INT             -- ID de la encuesta
)
BEGIN
    -- Verifica que la respuesta sea válida
    IF v_respuesta IN ('si', 'no') THEN
        -- Verifica si ya existe una respuesta idéntica para la misma encuesta
        IF NOT EXISTS (
            SELECT 1 
            FROM tbl_respuestas
            WHERE res_respuesta = v_respuesta 
              AND tbl_encuesta_en_id = v_en_id
        ) THEN
            -- Inserta la respuesta si no existe un duplicado
            INSERT INTO tbl_respuestas (
                res_respuesta, 
                tbl_encuesta_en_id
            ) 
            VALUES (
                v_respuesta, 
                v_en_id
            );
        ELSE
            -- Maneja el caso de duplicados con un mensaje claro
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La respuesta ya existe para esta encuesta.';
        END IF;
    ELSE
        -- Maneja el caso de respuestas inválidas
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La respuesta debe ser "si" o "no".';
    END IF;
END//
DELIMITER ;

-- MOSTRAR
DELIMITER //
CREATE PROCEDURE procSelectAnswer()
BEGIN
    SELECT DISTINCT
        res_id, 
        tbl_encuesta_en_id,
        tbl_encuesta.en_descripcion_pregunta,
        res_respuesta
    FROM tbl_respuestas
    INNER JOIN tbl_encuesta
        ON tbl_respuestas.tbl_encuesta_en_id = tbl_encuesta.en_id
    ORDER BY tbl_encuesta.en_descripcion_pregunta, res_id ASC; -- Ordena por pregunta y luego por ID incremental
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
