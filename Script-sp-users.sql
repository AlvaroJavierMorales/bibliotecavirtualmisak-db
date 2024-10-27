-- usuarios ****************
-- Insertar
DELIMITER //
CREATE PROCEDURE procInsertUsers(
    IN v_nombre VARCHAR(15),
    IN v_apellido VARCHAR(15),
    IN v_correo VARCHAR(80),
    IN v_contrasena TEXT, 
    IN v_salt TEXT,
    IN v_rol ENUM('Administrador', 'Docente', 'Estudiante'),
    IN v_nivel_estudios ENUM('Primaria', 'Secundaria', 'Bachillerato', 'Técnico', 'Tecnólogo', 'Pregrado', 'Especialización', 'Maestría', 'Doctorado', 'Postdoctorado'))
BEGIN
    INSERT INTO tbl_usuarios(
        usu_nombre, 
        usu_apellido, 
        usu_correo, 
        usu_contrasena, 
        usu_salt, 
        usu_rol, 
        usu_nivel_estudios) 
    VALUES (
        v_nombre, 
        v_apellido, 
        v_correo, 
        v_contrasena, 
        v_salt, 
        v_rol, 
        v_nivel_estudios);
END//
DELIMITER ;
-- Mostrar
DELIMITER //
CREATE PROCEDURE procSelectUsers()
BEGIN
    SELECT 
        usu_id, 
        usu_nombre, 
        usu_apellido, 
        usu_correo, 
        usu_rol, 
        usu_nivel_estudios
    FROM tbl_usuarios;
END//
DELIMITER ;

-- ACTUALIZAR 
DELIMITER //
CREATE PROCEDURE procUpdateUsers(
    IN v_id INT, 
    IN v_nombre VARCHAR(15),
    IN v_apellido VARCHAR(15),
    IN v_correo VARCHAR(80),
    IN v_contrasena TEXT, 
    IN v_salt TEXT,
    IN v_rol ENUM('Administrador', 'Docente', 'Estudiante'),
    IN v_nivel_estudios ENUM('Primaria', 'Secundaria', 'Bachillerato', 'Técnico', 'Tecnólogo', 'Pregrado', 'Especialización', 'Maestría', 'Doctorado', 'Postdoctorado'))
BEGIN
    UPDATE tbl_usuarios 
    SET 
        usu_nombre = v_nombre,
        usu_apellido = v_apellido,
        usu_correo = v_correo,
        usu_contrasena = v_contrasena,
        usu_salt = v_salt,
        usu_rol = v_rol,
        usu_nivel_estudios = v_nivel_estudios
    WHERE usu_id = v_id;
END//
DELIMITER ;

-- ELIMINAR
DELIMITER //
CREATE PROCEDURE procDeleteUsers(IN v_id INT)
BEGIN 
    DELETE FROM tbl_usuarios 
    WHERE usu_id = v_id;
END//
DELIMITER ;








