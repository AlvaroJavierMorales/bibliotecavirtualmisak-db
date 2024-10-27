
-- MATERIAL EDUCATIVO

-- INSERTAR
DELIMITER //
CREATE PROCEDURE procInsertEducation_mat(
    IN v_mat_titulo VARCHAR(200),
    IN v_mat_ano_publicacion DATE,
    IN v_mat_url_descarga TEXT,
    IN v_mat_precio decimal,
    IN v_mat_cantidad smallint,
    IN v_tbl_editorial_edi_id INT, 
	IN v_tbl_categorias_cat_id INT, 
	IN v_tbl_solicitud_compra_solic_id INT, 
	IN v_tbl_visitas_vis_id INT)
    
    
BEGIN
    INSERT INTO tbl_material_edu (
        mat_titulo, 
        mat_ano_publicacion, 
		mat_url_descarga, 
	    mat_precio, 
        mat_cantidad,
        tbl_editorial_edi_id, 
        tbl_categorias_cat_id, 
        tbl_solicitud_compra_solic_id, 
        tbl_visitas_vis_id) 
    VALUES (
        v_mat_titulo, 
        v_mat_ano_publicacion, 
        v_mat_url_descarga, 
        v_mat_precio, 
		v_mat_cantidad,
        v_tbl_editorial_edi_id, 
        v_tbl_categorias_cat_id, 
        v_tbl_solicitud_compra_solic_id, 
        v_tbl_visitas_vis_id );
END//
DELIMITER ;

-- MOSTRAR
DELIMITER //
CREATE PROCEDURE procSelectEducation_mat()
BEGIN
    SELECT 
        mat_id, 
        mat_titulo, 
        mat_ano_publicacion, 
        mat_url_descarga, 
		mat_precio, 
		mat_cantidad,
        tbl_editorial_edi_id, 
        tbl_categorias_cat_id, 
        tbl_solicitud_compra_solic_id, 
        tbl_visitas_vis_id
    FROM tbl_material_edu;
END//
DELIMITER ;

-- ACTUALIZAR
DELIMITER //
CREATE PROCEDURE procUpdateEducation_mat(
    IN v_mat_id INT,
    IN v_mat_titulo VARCHAR(200),
    IN v_mat_ano_publicacion DATE,
    IN v_mat_url_descarga TEXT,
    IN v_mat_precio DECIMAL, 
	IN	v_mat_cantidad SMALLINT,
    IN v_tbl_editorial_edi_id INT,
    IN v_tbl_categorias_cat_id INT,
    IN v_tbl_solicitud_compra_solic_id INT, 
    IN v_tbl_visitas_vis_id INT)
BEGIN
    UPDATE tbl_material_edu 
    SET 
        mat_titulo = v_mat_titulo,
        mat_ano_publicacion = v_mat_ano_publicacion,
        mat_url_descarga = v_mat_url_descarga,
        mat_precio = v_mat_precio,
		mat_cantidad = v_mat_cantidad
    WHERE mat_id = v_mat_id
      AND tbl_editorial_edi_id = v_tbl_editorial_edi_id
      AND tbl_categorias_cat_id = v_tbl_categorias_cat_id
      AND tbl_solicitud_compra_solic_id = v_tbl_solicitud_compra_solic_id
      AND tbl_visitas_vis_id = v_tbl_visitas_vis_id;
END//
DELIMITER ;

-- ELIMINAR
DELIMITER //
CREATE PROCEDURE procDeleteEducation_mat(
    IN v_mat_id INT,
    IN v_tbl_editorial_edi_id INT,
    IN v_tbl_categorias_cat_id INT,
    IN v_tbl_solicitud_compra_solic_id INT,
    IN v_tbl_visitas_vis_id INT)
BEGIN 
    DELETE FROM tbl_material_edu 
    WHERE mat_id = v_mat_id
      AND tbl_editorial_edi_id = v_tbl_editorial_edi_id
      AND tbl_categorias_cat_id = v_tbl_categorias_cat_id
      AND tbl_solicitud_compra_solic_id = v_tbl_solicitud_compra_solic_id
      AND tbl_visitas_vis_id = v_tbl_visitas_vis_id;
END//
DELIMITER ;
