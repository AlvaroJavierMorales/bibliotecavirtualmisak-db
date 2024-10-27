-- autores_has_tmaterial_edu****************
-- Insertar
DELIMITER // 
CREATE PROCEDURE proInsertAuthors_has_education_mat(
 IN v_tbl_autores_autor_id INT, IN v_tbl_material_edu_mat_id INT)
 BEGIN 
 INSERT INTO tbl_material_edu_has_tbl_autores
 (tbl_autores_autor_id, tbl_material_edu_mat_id) VALUES ( v_tbl_autores_autor_id, v_tbl_material_edu_mat_id); 
 END //
DELIMITER ;

-- Mostrar
DELIMITER //
CREATE PROCEDURE procSelectAuthors_has_education_mat() 
BEGIN 
Select v_tbl_autores_au_id, v_tbl_material_edu_mat_id
FROM tbl_material_edu_has_tbl_autores; 
END //

DELIMITER ;

-- Actualizar
DELIMITER // 
CREATE PROCEDURE procUpdateAuthors_has_education_mat( IN v_tbl_autores_au_id INT, IN v_tbl_material_edu_mat_id INT) 
BEGIN UPDATE tbl_material_edu_has_tbl_autores
SET  tbl_autores_au_id = v_tbl_autores_au_id , tbl_material_edu_mat_id = v_tbl_material_edu_mat_id
 WHERE tbl_material_edu_mat_id = v_tbl_material_edu_mat_id  AND tbl_autores_au_id = v_tbl_autores_au_id;
 END //
DELIMITER ;

-- Eliminar
DELIMITER // 
CREATE PROCEDURE procDeleteAuthors_has_education_mat( IN v_tbl_autores_au_id INT, IN v_tbl_material_edu_mat_id INT) 
BEGIN  DELETE FROM tbl_material_edu_has_tbl_autores
 WHERE tbl_autores_au_id = v_tbl_autores_au_id AND tbl_material_edu_mat_id = v_tbl_material_edu_mat_id;
 END //
DELIMITER ;















