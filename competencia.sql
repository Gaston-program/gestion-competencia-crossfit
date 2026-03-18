/* PROYECTO: Gestión de Atletas y Resultados - Competencia "The Crown" 2026
   DESCRIPCIÓN: Modelo de base de datos para administrar inscripciones y categorías.
   NIVEL: Junior Backend / Data Analyst
*/

--1. PREPARACION DEL ENTORNO
-- Creamos la base de datos si no existe y la ponemos en uso.

CREATE DATABASE IF NOT EXISTS CompetenciaCrossfit;
USE CompetenciaCrossfit;


--2 DFINICION DE ESTRUCTURAS (Tablas)
-- Creamos primero las tablas que no dependen de nadie (Tablas Maestras).

--Tabla de Categorias: Para separar Avanzados, RX y Scaled.

CREATE TABLE Categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE
);

--Tabla de atletas: Aca vamos aplicar una LLAVE FORANEA para vincular con Categorias.
CREATE TABLE Atletas (
    id_atleta INT PRIMARY KEY AUTO_INCREMENT,
    nombre_completo VARCHAR(100) NOT NULL,
    sexo ENUM('M','F') NOT NULL,
    id_categoria INT,
    fecha_inscripcion DATE DEFAULT (CURRENT_DATE),
    --Relacionamos al atleta con su categoria correspondiente
    CONSTRAINT fk_atleta_categoria FOREIGN KEY (id_categoria)
    REFERENCES Categorias(id_categoria)
);

--3. CARGA DE DATOS INICIALES (Data Seeding)
-- Esto demuestra que el sistema funciona con datos reales.

--Insertamos la categoria donde compite tu equipo 
INSERT INTO Categorias (nombre_categoria) 
VALUES ('Avanzado');

-- Insertamos a los integrantes del equipo (Podés cambiar los nombres aquí)
-- El ID de categoría es 1 porque es el primero que insertamos arriba.
INSERT INTO Atletas (nombre_completo, sexo, id_categoria) VALUES 
('Tu Nombre', 'M', 1), 
('Compañero 1', 'M', 1), 
('Compañera 2', 'F', 1);

-- 4. CONSULTA DE VERIFICACIÓN (Query de Reporte)
-- Un Junior debe saber unir tablas para mostrar información legible.
SELECT 
    a.nombre_completo AS 'Atleta',
    c.nombre_categoria AS 'Categoría',
    a.fecha_inscripcion AS 'Fecha de Alta'
FROM Atletas a
JOIN Categorias c ON a.id_categoria = c.id_categoria
ORDER BY a.nombre_completo ASC;