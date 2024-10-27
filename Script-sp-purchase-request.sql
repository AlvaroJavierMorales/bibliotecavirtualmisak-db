-- INSERTAR -------------------------------------------

DELIMITER //
CREATE PROCEDURE procInsertPurchase_request(
    IN v_solic_ticket VARCHAR(45),
    IN v_solic_fecha DATE,
    IN v_tbl_usuarios_usu_id INT)
BEGIN
    INSERT INTO tbl_solicitud_compra(solic_ticket, solic_fecha, tbl_usuarios_usu_id)
    VALUES(v_solic_ticket, v_solic_fecha, v_tbl_usuarios_usu_id);
END//
DELIMITER ;


-- MOSTRAR -------------------------------------------

DELIMITER //
CREATE PROCEDURE procSelectPurchase_request()
BEGIN
    SELECT solic_id, solic_ticket, solic_fecha, tbl_usuarios_usu_id FROM tbl_solicitud_compra;
END //
DELIMITER ;

-- ACTUALIZAR -------------------------------------------

DELIMITER //
CREATE PROCEDURE procUpdatePurchase_request(
    IN v_solic_id INT,
    IN v_solic_ticket VARCHAR(45),
    IN v_solic_fecha DATE,
    IN v_tbl_usuarios_usu_id INT
)
BEGIN
    UPDATE tbl_solicitud_compra 
    SET solic_ticket = v_solic_ticket,
        solic_fecha = v_solic_fecha,
        tbl_usuarios_usu_id = v_tbl_usuarios_usu_id
    WHERE solic_id = v_solic_id;
END //
DELIMITER ;

-- ELIMINAR -------------------------------------------

DELIMITER //
CREATE PROCEDURE procDeletePurchase_request(IN v_solic_id INT)
BEGIN
    DELETE FROM tbl_solicitud_compra WHERE solic_id = v_solic_id;
END //
DELIMITER ;



