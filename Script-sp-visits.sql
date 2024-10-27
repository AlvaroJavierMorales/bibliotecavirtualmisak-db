-- visitas****************
-- Insertar
DELIMITER // 
CREATE PROCEDURE proInsertVisits(IN v_fecha_ingreso date, IN v_duracion time, IN v_usu_id INT)
 BEGIN 
 INSERT INTO tbl_visitas(vis_fecha_ingreso, vis_duracion, tbl_usuarios_usu_id)
 VALUES (v_fecha_ingreso, v_duracion, v_usu_id); 
 END //
DELIMITER ;

-- Mostrar
DELIMITER //
CREATE PROCEDURE procSelectVisits() 
BEGIN 
Select vis_id, vis_fecha_ingreso, vis_duracion, tbl_usuarios_usu_id
FROM tbl_visitas; 
END //

DELIMITER ;

-- Actualizar
DELIMITER // 
CREATE PROCEDURE procUpdateVisits( IN v_vis_id INT,  IN v_usu_id INT, IN vis_fecha_ingreso date, IN vis_duracion time) 
BEGIN UPDATE tbl_visitas 
SET  vis_fecha_ingreso = v_fecha_ingreso , vis_duracion = v_duracion
 WHERE en_id = v_en_id AND tbl_usuarios_usu_id = v_usu_id;
 END //
DELIMITER ;

-- Eliminar
DELIMITER // 
CREATE PROCEDURE procDeleteVisits( IN v_vis_id INT, IN v_us_id INT) 
BEGIN  DELETE FROM tbl_visitas
 WHERE vis_id = v_vis_id AND tbl_usuarios_usu_id = v_usu_id;
 END //
DELIMITER ;














