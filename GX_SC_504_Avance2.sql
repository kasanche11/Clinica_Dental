----Creación de la conexion
CREATE USER CLINICA_DENTAL IDENTIFIED BY CLINICADENTAL2024;
GRANT DBA TO CLINICA_DENTAL;
GRANT CONNECT TO CLINICA_DENTAL;

----Creación de tablas
-- Tabla Estado
CREATE TABLE CLINICA_DENTAL.Estado (
    id_estado INT PRIMARY KEY,
    descripcion_estado VARCHAR(255)
);

-- Tabla Especialidad
CREATE TABLE CLINICA_DENTAL.Especialidad (
    id_especialidad INT PRIMARY KEY,
    nombre_especialidad VARCHAR(255),
    descripcion_esp VARCHAR(255),
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES CLINICA_DENTAL.Estado(id_estado)
);

-- Tabla Dentista
CREATE TABLE CLINICA_DENTAL.Dentista (
    id_dentista INT PRIMARY KEY,
    nombre_dentista VARCHAR(255),
    telefono_dentista VARCHAR(50),
    email_dentista VARCHAR(255),
    id_especialidad INT,
    id_estado INT,
    FOREIGN KEY (id_especialidad) REFERENCES CLINICA_DENTAL.Especialidad(id_especialidad),
    FOREIGN KEY (id_estado) REFERENCES CLINICA_DENTAL.Estado(id_estado)
);

-- Tabla Paciente
CREATE TABLE CLINICA_DENTAL.Paciente (
    id_paciente INT PRIMARY KEY,
    nombre_paciente VARCHAR(255),
    fecha_nacimiento DATE,
    edad INT,
    telefono_pte VARCHAR(50),
    email_pte VARCHAR(255),
    fecha_registro DATE,
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES CLINICA_DENTAL.Estado(id_estado)
);

-- Tabla Tratamiento
CREATE TABLE CLINICA_DENTAL.Tratamiento (
    id_tratamiento INT PRIMARY KEY,
    nombre_tratamiento VARCHAR(255),
    descripcion_tratamiento VARCHAR(255),
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES CLINICA_DENTAL.Estado(id_estado)
);

-- Tabla Diagnóstico
CREATE TABLE CLINICA_DENTAL.Diagnostico (
    id_diagnostico INT PRIMARY KEY,
    descripcion_diagnostico VARCHAR(255)
);

-- Tabla Motivo visita
CREATE TABLE CLINICA_DENTAL.Motivo_visita (
    id_motivo INT PRIMARY KEY,
    descripcion_motivo VARCHAR(255)
);

-- Tabla Método de pago
CREATE TABLE CLINICA_DENTAL.Metodo_pago (
    id_metodo_pago INT PRIMARY KEY,
    descripcion_metodo_pago VARCHAR(255),
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES CLINICA_DENTAL.Estado(id_estado)
);


-- Tabla Cita
CREATE TABLE CLINICA_DENTAL.Cita (
    id_cita INT PRIMARY KEY,
    fecha_hora DATE,
    id_paciente INT,
    id_dentista INT,
    id_tratamiento INT,
	id_motivo INT,
    FOREIGN KEY (id_paciente) REFERENCES CLINICA_DENTAL.Paciente(id_paciente),
    FOREIGN KEY (id_dentista) REFERENCES CLINICA_DENTAL.Dentista(id_dentista),
    FOREIGN KEY (id_tratamiento) REFERENCES CLINICA_DENTAL.Tratamiento(id_tratamiento),
	FOREIGN KEY (id_motivo) REFERENCES CLINICA_DENTAL.Motivo_visita(id_motivo)
);

-- Tabla Pago
CREATE TABLE CLINICA_DENTAL.Pago(
    id_pago INT PRIMARY KEY,
    id_paciente INT,
    id_cita INT,
    id_metodo_pago INT,
    fecha DATE,
    monto DECIMAL(10, 2),
    FOREIGN KEY (id_paciente) REFERENCES CLINICA_DENTAL.Paciente(id_paciente),
    FOREIGN KEY (id_cita) REFERENCES CLINICA_DENTAL.Cita(id_cita),
    FOREIGN KEY (id_metodo_pago) REFERENCES CLINICA_DENTAL.Metodo_pago(id_metodo_pago)
);

-- Tabla Tratamiento del paciente
CREATE TABLE CLINICA_DENTAL.Tratamiento_paciente (
    id_trat_pte INT PRIMARY KEY,
    id_paciente INT,
    id_tratamiento INT,
    descripcion_trat_pte VARCHAR(255),
    FOREIGN KEY (id_paciente) REFERENCES CLINICA_DENTAL.Paciente(id_paciente),
    FOREIGN KEY (id_tratamiento) REFERENCES CLINICA_DENTAL.Tratamiento(id_tratamiento)
);

-- Tabla Historial clínico
CREATE TABLE CLINICA_DENTAL.Historial_clinico (
    id_historial INT PRIMARY KEY,
    id_paciente INT,
    id_dentista INT,
    fecha DATE,
    observaciones VARCHAR(255),
    id_trat_pte INT,
    id_diagnostico INT,
    FOREIGN KEY (id_paciente) REFERENCES CLINICA_DENTAL.Paciente(id_paciente),
    FOREIGN KEY (id_dentista) REFERENCES CLINICA_DENTAL.Dentista(id_dentista),
    FOREIGN KEY (id_trat_pte) REFERENCES CLINICA_DENTAL.Tratamiento_paciente(id_trat_pte),
    FOREIGN KEY (id_diagnostico) REFERENCES CLINICA_DENTAL.Diagnostico(id_diagnostico)
);

----Inserción de valores

----Tabla Estado
INSERT all
INTO CLINICA_DENTAL.Estado (id_estado,descripcion_estado)
VALUES 
(1,'Activo')
INTO CLINICA_DENTAL.Estado (id_estado,descripcion_estado)
VALUES 
(2, 'Inactivo')
select 1 from dual;
SELECT * FROM ESTADO;

----Tabla Especialidad
INSERT ALL 
INTO CLINICA_DENTAL.Especialidad (id_especialidad, nombre_especialidad, descripcion_esp, id_estado) 
VALUES
(1, 'Ortodoncia', 'Especialidad que se encarga de corregir la alineación de los dientes y la mordida', 1)
INTO CLINICA_DENTAL.Especialidad (id_especialidad, nombre_especialidad, descripcion_esp, id_estado) 
VALUES
(2, 'Endodoncia', 'Especialidad que trata las enfermedades del interior del diente', 1)
INTO CLINICA_DENTAL.Especialidad (id_especialidad, nombre_especialidad, descripcion_esp, id_estado) 
VALUES
(3, 'Periodoncia', 'Especialidad que se ocupa de las enfermedades de las encías y los tejidos de soporte de los dientes', 1)
INTO CLINICA_DENTAL.Especialidad (id_especialidad, nombre_especialidad, descripcion_esp, id_estado) 
VALUES
(4, 'Odontopediatría', 'Especialidad que se enfoca en el tratamiento dental de niños', 1)
INTO CLINICA_DENTAL.Especialidad (id_especialidad, nombre_especialidad, descripcion_esp, id_estado) 
VALUES
(5, 'Cirugía Oral', 'Especialidad que realiza procedimientos quirúrgicos en la boca y los dientes', 1)
INTO CLINICA_DENTAL.Especialidad (id_especialidad, nombre_especialidad, descripcion_esp, id_estado) 
VALUES
(6, 'Implantología', 'Especialidad que se dedica a la colocación de implantes dentales', 1)
INTO CLINICA_DENTAL.Especialidad (id_especialidad, nombre_especialidad, descripcion_esp, id_estado) 
VALUES
(7, 'Odontología Estética', 'Especialidad que mejora la apariencia de los dientes', 1)
INTO CLINICA_DENTAL.Especialidad (id_especialidad, nombre_especialidad, descripcion_esp, id_estado) 
VALUES
(8, 'Prostodoncia', 'Especialidad que reemplaza dientes perdidos con prótesis dentales', 1)
INTO CLINICA_DENTAL.Especialidad (id_especialidad, nombre_especialidad, descripcion_esp, id_estado) 
VALUES
(9, 'Odontología Preventiva', 'Especialidad que se enfoca en la prevención de enfermedades dentales', 1)
INTO CLINICA_DENTAL.Especialidad (id_especialidad, nombre_especialidad, descripcion_esp, id_estado) 
VALUES
(10, 'Odontología Restauradora', 'Especialidad que se dedica a la restauración de dientes dañados', 1)
INTO CLINICA_DENTAL.Especialidad (id_especialidad, nombre_especialidad, descripcion_esp, id_estado) 
VALUES
(11, 'Patología Oral', 'Especialidad que estudia las enfermedades de la boca y los dientes', 1)
INTO CLINICA_DENTAL.Especialidad (id_especialidad, nombre_especialidad, descripcion_esp, id_estado) 
VALUES
(12, 'Radiología Oral', 'Especialidad que utiliza radiografías para diagnosticar enfermedades dentales', 1)
INTO CLINICA_DENTAL.Especialidad (id_especialidad, nombre_especialidad, descripcion_esp, id_estado) 
VALUES
(13, 'Medicina Oral', 'Especialidad que trata enfermedades médicas que afectan la boca', 1)
INTO CLINICA_DENTAL.Especialidad (id_especialidad, nombre_especialidad, descripcion_esp, id_estado) 
VALUES
(14, 'Gerodontología', 'Especialidad que se enfoca en el tratamiento dental de adultos mayores', 1)
INTO CLINICA_DENTAL.Especialidad (id_especialidad, nombre_especialidad, descripcion_esp, id_estado) 
VALUES
(15, 'Odontología Deportiva', 'Especialidad que trata problemas dentales relacionados con la práctica deportiva', 1)
SELECT 1 FROM DUAL;
SELECT * FROM CLINICA_DENTAL.ESPECIALIDAD
;

----Tabla Dentista
INSERT ALL 
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(1, 'Dr. Ale-JAN-dro Paredes', '82465522', 'drale-JAN-droparedes@gmail.com', 6, 1) -- IMPLANTOLOGIA
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(2, 'Dr. Mariana Ramirez', '80546513', 'drmarianaramirez@gmail.com', 2, 1) -- ENDODONCIA
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(3, 'Dr. Gustavo Ortega', '80546514', 'drgustavoortega@gmail.com', 3, 1) -- PERIODONCIA
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(4, 'Dr. Elisa Mendoza', '80546515', 'drelisamendoza@gmail.com', 4, 1) -- ODONTOPEDIATRIA
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(5, 'Dr. Hector Castillo', '80546516', 'drhectorcastillo@gmail.com', 5, 1) -- CIRUGIA ORAL
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(6, 'Dr. Patricia Reyes', '80546517', 'drpatriciareyes@gmail.com', 6, 1) -- IMPLANTOLOGIA
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(7, 'Dr. Javier Correa', '80546518', 'drjaviercorrea@gmail.com', 7, 1) -- ODONTOLOGIA ESTETICA
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(8, 'Dr. Isabel Soto', '80546519', 'drisabelsoto@gmail.com', 8, 2) -- PROSTODONCIA
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(9, 'Dr. Rodrigo Silva', '80546520', 'drrodrigosilva@gmail.com', 9, 1) -- ODONTOLOGIA PREVENTIVA
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(10, 'Dr. Sofia Navarro', '80546521', 'drsofianavarro@gmail.com', 10, 1) -- ODONTOLOGIA RESTAURADORA
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(11, 'Dr. Mauricio Herrera', '80546522', 'drmauricioherrera@gmail.com', 11, 2) -- PATOLOGIA ORAL
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(12, 'Dr. Valeria Guzman', '80546523', 'drvaleriaguzman@gmail.com', 12, 1) -- RADIOLOGIA ORAL
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(13, 'Dr. Benjamin Vega', '80546524', 'drbenjaminvega@gmail.com', 13, 1) -- MEDICINA ORAL
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(14, 'Dr. Lorena Fuentes', '80546525', 'drlorenafuentes@gmail.com', 14, 1) -- GERODONTOLOGIA
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(15, 'Dr. Ignacio Mendez', '80546526', 'drignaciomendez@gmail.com', 15, 1) -- ODONTOLOGIA DEPORTIVA
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(16, 'Dr. Andrea Morales', '80546527', 'drandreamorales@gmail.com', 1, 1) -- ORTODONCIA
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(17, 'Dr. Ricardo Vargas', '80546528', 'drricardovargas@gmail.com', 2, 2) -- ENDODONCIA
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(18, 'Dr. Laura Acosta', '80546529', 'drlauraacosta@gmail.com', 3, 1) -- PERIODONCIA
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(19, 'Dr. Francisco Ponce', '80546530', 'drfranciscoponce@gmail.com', 4, 1) -- ODONTOPEDIATRIA
INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
VALUES
(20, 'Dr. Angela Luna', '80546531', 'drangelaluna@gmail.com', 5, 1) -- CIRUGIA ORAL
SELECT 1 FROM DUAL;
SELECT * FROM CLINICA_DENTAL.DENTISTA;

----Tabla Paciente
INSERT ALL
    INTO CLINICA_DENTAL.Paciente (id_paciente, nombre_paciente, fecha_nacimiento, edad, telefono_pte, email_pte, fecha_registro, id_estado)
    VALUES (1, 'Juan Perez', TO_DATE('1988-06-12', 'YYYY-MM-DD'), 36, '70048425', 'juanperez1@gmail.com', TO_DATE('2024-01-01', 'YYYY-MM-DD'), 1)
    INTO CLINICA_DENTAL.Paciente (id_paciente, nombre_paciente, fecha_nacimiento, edad, telefono_pte, email_pte, fecha_registro, id_estado)
    VALUES (2, 'Maria Gomez', TO_DATE('1990-04-25', 'YYYY-MM-DD'), 33, '70048426', 'mariagomez2@gmail.com', TO_DATE('2024-01-02', 'YYYY-MM-DD'), 1)
    INTO CLINICA_DENTAL.Paciente (id_paciente, nombre_paciente, fecha_nacimiento, edad, telefono_pte, email_pte, fecha_registro, id_estado)
    VALUES (3, 'Carlos Sanchez', TO_DATE('1991-11-10', 'YYYY-MM-DD'), 32, '70048427', 'carlossanchez3@gmail.com', TO_DATE('2024-01-03', 'YYYY-MM-DD'), 1)
    INTO CLINICA_DENTAL.Paciente (id_paciente, nombre_paciente, fecha_nacimiento, edad, telefono_pte, email_pte, fecha_registro, id_estado)
    VALUES (4, 'Ana Rodriguez', TO_DATE('1989-07-18', 'YYYY-MM-DD'), 35, '70048428', 'anarodriguez4@gmail.com', TO_DATE('2024-01-04', 'YYYY-MM-DD'), 1)
    INTO CLINICA_DENTAL.Paciente (id_paciente, nombre_paciente, fecha_nacimiento, edad, telefono_pte, email_pte, fecha_registro, id_estado)
    VALUES (5, 'Luis Martinez', TO_DATE('2012-05-20', 'YYYY-MM-DD'), 11, '70048429', 'luismartinez5@gmail.com', TO_DATE('2024-01-05', 'YYYY-MM-DD'), 1)
    INTO CLINICA_DENTAL.Paciente (id_paciente, nombre_paciente, fecha_nacimiento, edad, telefono_pte, email_pte, fecha_registro, id_estado)
    VALUES (6, 'Laura Fernandez', TO_DATE('1981-08-22', 'YYYY-MM-DD'), 42, '70048430', 'laurafernandez6@gmail.com', TO_DATE('2024-01-06', 'YYYY-MM-DD'), 1)
    INTO CLINICA_DENTAL.Paciente (id_paciente, nombre_paciente, fecha_nacimiento, edad, telefono_pte, email_pte, fecha_registro, id_estado)
    VALUES (7, 'Jose Ramirez', TO_DATE('1984-02-16', 'YYYY-MM-DD'), 39, '70048431', 'joseramirez7@gmail.com', TO_DATE('2024-01-07', 'YYYY-MM-DD'), 1)
    INTO CLINICA_DENTAL.Paciente (id_paciente, nombre_paciente, fecha_nacimiento, edad, telefono_pte, email_pte, fecha_registro, id_estado)
    VALUES (8, 'Marta Diaz', TO_DATE('1985-12-05', 'YYYY-MM-DD'), 38, '70048432', 'martadiaz8@gmail.com', TO_DATE('2024-01-08', 'YYYY-MM-DD'), 1)
    INTO CLINICA_DENTAL.Paciente (id_paciente, nombre_paciente, fecha_nacimiento, edad, telefono_pte, email_pte, fecha_registro, id_estado)
    VALUES (9, 'Pedro Lopez', TO_DATE('1986-09-30', 'YYYY-MM-DD'), 37, '70048433', 'pedrolopez9@gmail.com', TO_DATE('2024-01-09', 'YYYY-MM-DD'), 1)
    INTO CLINICA_DENTAL.Paciente (id_paciente, nombre_paciente, fecha_nacimiento, edad, telefono_pte, email_pte, fecha_registro, id_estado)
    VALUES (10, 'Sofia Gonzalez', TO_DATE('1988-03-20', 'YYYY-MM-DD'), 35, '70048434', 'sofiagonzalez10@gmail.com', TO_DATE('2024-01-10', 'YYYY-MM-DD'), 1)
    INTO CLINICA_DENTAL.Paciente (id_paciente, nombre_paciente, fecha_nacimiento, edad, telefono_pte, email_pte, fecha_registro, id_estado)
    VALUES (11, 'Diego Torres', TO_DATE('1989-07-15', 'YYYY-MM-DD'), 34, '70048435', 'diegotorres11@gmail.com', TO_DATE('2024-01-11', 'YYYY-MM-DD'), 1)
    INTO CLINICA_DENTAL.Paciente (id_paciente, nombre_paciente, fecha_nacimiento, edad, telefono_pte, email_pte, fecha_registro, id_estado)
    VALUES (12, 'Camila Vargas', TO_DATE('2009-12-10', 'YYYY-MM-DD'), 14, '70048436', 'camilavargas12@gmail.com', TO_DATE('2024-01-12', 'YYYY-MM-DD'), 1)
    INTO CLINICA_DENTAL.Paciente (id_paciente, nombre_paciente, fecha_nacimiento, edad, telefono_pte, email_pte, fecha_registro, id_estado)
    VALUES (13, 'Sebastian Rojas', TO_DATE('2010-01-15', 'YYYY-MM-DD'), 14, '70048437', 'sebastianrojas13@gmail.com', TO_DATE('2024-01-13', 'YYYY-MM-DD'), 1)
    INTO CLINICA_DENTAL.Paciente (id_paciente, nombre_paciente, fecha_nacimiento, edad, telefono_pte, email_pte, fecha_registro, id_estado)
    VALUES (14, 'Valentina Castillo', TO_DATE('1978-03-21', 'YYYY-MM-DD'), 46, '70048438', 'valentinacastillo14@gmail.com', TO_DATE('2024-01-14', 'YYYY-MM-DD'), 1)
    INTO CLINICA_DENTAL.Paciente (id_paciente, nombre_paciente, fecha_nacimiento, edad, telefono_pte, email_pte, fecha_registro, id_estado)
    VALUES (15, 'Javier Morales', TO_DATE('1985-11-05', 'YYYY-MM-DD'), 38, '70048439', 'javiermorales15@gmail.com', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 1)
SELECT * FROM dual;
SELECT * FROM PACIENTE;

----Tabla Tratamiento
INSERT ALL
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (1, 'Limpieza Dental', 'Procedimiento de limpieza dental profesional', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (2, 'Blanqueamiento Dental', 'Tratamiento para blanquear los dientes', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (3, 'Empaste Dental', 'Restauración de dientes cariados', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (4, 'Extracción Dental', 'Extracción de dientes dañados o innecesarios', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (5, 'Ortodoncia', 'Tratamiento para corregir la alineación de los dientes', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (6, 'Implante Dental', 'Reemplazo de dientes perdidos con implantes', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (7, 'Coronas Dentales', 'Colocación de coronas sobre dientes dañados', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (8, 'Puentes Dentales', 'Sustitución de dientes perdidos con puentes', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (9, 'Prótesis Dentales', 'Reemplazo de dientes con prótesis removibles', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (10, 'Tratamiento de Conducto', 'Tratamiento para eliminar infecciones en el interior del diente', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (11, 'Sellado de Fisuras', 'Aplicación de selladores en los dientes para prevenir caries', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (12, 'Tratamiento de Encías', 'Tratamiento para enfermedades de las encías', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (13, 'Restauración Estética', 'Restauración de la apariencia de los dientes', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (14, 'Invisalign', 'Alineadores transparentes para corregir la alineación dental', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (15, 'Carillas Dentales', 'Laminados que cubren la parte frontal de los dientes', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (16, 'Cirugía Oral', 'Procedimientos quirúrgicos en la boca y los dientes', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (17, 'Periodoncia', 'Tratamiento de las enfermedades periodontales', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (18, 'Endodoncia', 'Tratamiento de las enfermedades del interior del diente', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (19, 'Ortodoncia Infantil', 'Tratamiento ortodóntico para niños', 1)
    INTO CLINICA_DENTAL.Tratamiento (id_tratamiento, nombre_tratamiento, descripcion_tratamiento, id_estado) VALUES (20, 'Odontopediatría', 'Tratamiento dental para niños', 1)
SELECT 1 FROM DUAL;
SELECT * FROM TRATAMIENTO;

----Tabla Diagnostico
INSERT ALL 
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (1, 'Caries Dental')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (2, 'Enfermedad Periodontal')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (3, 'Sensibilidad Dental')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (4, 'Absceso Dental')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (5, 'Bruxismo')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (6, 'Maloclusión')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (7, 'Aftas o úlceras Orales')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (8, 'Enfermedades de la Mucosa Oral')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (9, 'Diente Impactado')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (10, 'Dientes Fracturados o Rotos')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (11, 'Higiene Oral Deficiente')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (12, 'Alteraciones en el Color del Diente')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (13, 'Problemas en la Articulación Temporomandibular (ATM)')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (14, 'Desarrollo Anómalo de los Dientes')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (15, 'Enfermedad Periapical')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (16, 'Cáncer Oral')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (17, 'Problemas en la Encía')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (18, 'Trastornos del Color y la Forma de los Dientes')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (19, 'Pérdida de Dientes')
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (20, 'Problemas en el Desarrollo Dental')
SELECT 1 FROM DUAL;
SELECT * FROM DIAGNOSTICO;

----Tabla Motivo visita
INSERT ALL
INTO CLINICA_DENTAL.Motivo_visita (id_motivo, descripcion_motivo) VALUES (1, 'Consulta general')
INTO CLINICA_DENTAL.Motivo_visita (id_motivo, descripcion_motivo) VALUES (2, 'Revisión de salud dental')
INTO CLINICA_DENTAL.Motivo_visita (id_motivo, descripcion_motivo) VALUES (3, 'Tratamiento de caries')
INTO CLINICA_DENTAL.Motivo_visita (id_motivo, descripcion_motivo) VALUES (4, 'Extracción de muela')
INTO CLINICA_DENTAL.Motivo_visita (id_motivo, descripcion_motivo) VALUES (5, 'Chequeo de ortodoncia')
INTO CLINICA_DENTAL.Motivo_visita (id_motivo, descripcion_motivo) VALUES (6, 'Perfil de limpieza')
INTO CLINICA_DENTAL.Motivo_visita (id_motivo, descripcion_motivo) VALUES (7, 'Reparación de corona')
INTO CLINICA_DENTAL.Motivo_visita (id_motivo, descripcion_motivo) VALUES (8, 'Blanqueamiento dental')
INTO CLINICA_DENTAL.Motivo_visita (id_motivo, descripcion_motivo) VALUES (9, 'Control de encías')
INTO CLINICA_DENTAL.Motivo_visita (id_motivo, descripcion_motivo) VALUES (10, 'Consulta de urgencia')
INTO CLINICA_DENTAL.Motivo_visita (id_motivo, descripcion_motivo) VALUES (11, 'Ajuste de prótesis')
INTO CLINICA_DENTAL.Motivo_visita (id_motivo, descripcion_motivo) VALUES (12, 'Tratamiento de conducto')
INTO CLINICA_DENTAL.Motivo_visita (id_motivo, descripcion_motivo) VALUES (13, 'Consulta de implantes dentales')
INTO CLINICA_DENTAL.Motivo_visita (id_motivo, descripcion_motivo) VALUES (14, 'Diagnóstico de dolor dental')
INTO CLINICA_DENTAL.Motivo_visita (id_motivo, descripcion_motivo) VALUES (15, 'Reparación de dentadura postiza')
SELECT 1 FROM DUAL;
SELECT * FROM MOTIVO_VISITA;

----Tabla Metodo de pago
INSERT ALL
INTO CLINICA_DENTAL.Metodo_pago (id_metodo_pago, descripcion_metodo_pago, id_estado) VALUES (1,'Tarjeta',1)
INTO CLINICA_DENTAL.Metodo_pago (id_metodo_pago, descripcion_metodo_pago, id_estado) VALUES (2,'Efectivo',1)
INTO CLINICA_DENTAL.Metodo_pago (id_metodo_pago, descripcion_metodo_pago, id_estado) VALUES (3,'Sinpe',2)
SELECT 1 FROM DUAL;
SELECT * FROM METODO_PAGO;

----Tabla Cita
INSERT ALL
    INTO CLINICA_DENTAL.Cita (id_cita, fecha_hora, id_paciente, id_dentista, id_tratamiento, id_motivo) VALUES (1, TO_DATE('15-12-2024 09:00:00', 'DD-MM-YYYY HH24:MI:SS'), 1, 5, 3, 2)
    INTO CLINICA_DENTAL.Cita (id_cita, fecha_hora, id_paciente, id_dentista, id_tratamiento, id_motivo) VALUES (2, TO_DATE('16-07-2024 10:30:00', 'DD-MM-YYYY HH24:MI:SS'), 2, 12, 7, 5)
    INTO CLINICA_DENTAL.Cita (id_cita, fecha_hora, id_paciente, id_dentista, id_tratamiento, id_motivo) VALUES (3, TO_DATE('17-10-2024 11:00:00', 'DD-MM-YYYY HH24:MI:SS'), 3, 3, 1, 1)
    INTO CLINICA_DENTAL.Cita (id_cita, fecha_hora, id_paciente, id_dentista, id_tratamiento, id_motivo) VALUES (4, TO_DATE('18-04-2024 15:00:00', 'DD-MM-YYYY HH24:MI:SS'), 4, 8, 9, 4)
    INTO CLINICA_DENTAL.Cita (id_cita, fecha_hora, id_paciente, id_dentista, id_tratamiento, id_motivo) VALUES (5, TO_DATE('19-05-2024 14:30:00', 'DD-MM-YYYY HH24:MI:SS'), 5, 15, 15, 6)
    INTO CLINICA_DENTAL.Cita (id_cita, fecha_hora, id_paciente, id_dentista, id_tratamiento, id_motivo) VALUES (6, TO_DATE('20-11-2024 16:00:00', 'DD-MM-YYYY HH24:MI:SS'), 6, 9, 11, 7)
    INTO CLINICA_DENTAL.Cita (id_cita, fecha_hora, id_paciente, id_dentista, id_tratamiento, id_motivo) VALUES (7, TO_DATE('21-11-2024 10:00:00', 'DD-MM-YYYY HH24:MI:SS'), 7, 6, 4, 3)
    INTO CLINICA_DENTAL.Cita (id_cita, fecha_hora, id_paciente, id_dentista, id_tratamiento, id_motivo) VALUES (8, TO_DATE('22-12-2024 09:30:00', 'DD-MM-YYYY HH24:MI:SS'), 8, 2, 18, 2)
    INTO CLINICA_DENTAL.Cita (id_cita, fecha_hora, id_paciente, id_dentista, id_tratamiento, id_motivo) VALUES (9, TO_DATE('23-08-2024 13:00:00', 'DD-MM-YYYY HH24:MI:SS'), 9, 4, 5, 8)
    INTO CLINICA_DENTAL.Cita (id_cita, fecha_hora, id_paciente, id_dentista, id_tratamiento, id_motivo) VALUES (10, TO_DATE('24-10-2024 11:30:00', 'DD-MM-YYYY HH24:MI:SS'), 10, 14, 2, 9)
    INTO CLINICA_DENTAL.Cita (id_cita, fecha_hora, id_paciente, id_dentista, id_tratamiento, id_motivo) VALUES (11, TO_DATE('25-11-2024 15:45:00', 'DD-MM-YYYY HH24:MI:SS'), 11, 16, 12, 3)
    INTO CLINICA_DENTAL.Cita (id_cita, fecha_hora, id_paciente, id_dentista, id_tratamiento, id_motivo) VALUES (12, TO_DATE('26-07-2024 13:15:00', 'DD-MM-YYYY HH24:MI:SS'), 12, 7, 17, 5)
    INTO CLINICA_DENTAL.Cita (id_cita, fecha_hora, id_paciente, id_dentista, id_tratamiento, id_motivo) VALUES (13, TO_DATE('27-11-2024 14:00:00', 'DD-MM-YYYY HH24:MI:SS'), 13, 10, 20, 4)
    INTO CLINICA_DENTAL.Cita (id_cita, fecha_hora, id_paciente, id_dentista, id_tratamiento, id_motivo) VALUES (14, TO_DATE('28-09-2024 16:15:00', 'DD-MM-YYYY HH24:MI:SS'), 14, 18, 14, 2)
    INTO CLINICA_DENTAL.Cita (id_cita, fecha_hora, id_paciente, id_dentista, id_tratamiento, id_motivo) VALUES (15, TO_DATE('29-02-2024 09:45:00', 'DD-MM-YYYY HH24:MI:SS'), 15, 20, 8, 1)
SELECT 1 FROM DUAL;
SELECT * FROM CITA;

----Tabla Pago
INSERT ALL
INTO CLINICA_DENTAL.Pago (id_pago, id_paciente, id_cita, id_metodo_pago, fecha, monto) VALUES (1, 1, 1, 1, TO_DATE('15-12-2024 09:00:00', 'DD-MM-YYYY HH24:MI:SS'), 30000.00)
INTO CLINICA_DENTAL.Pago (id_pago, id_paciente, id_cita, id_metodo_pago, fecha, monto) VALUES (2, 2, 2, 2, TO_DATE('16-07-2024 10:30:00', 'DD-MM-YYYY HH24:MI:SS'), 100000.00)
INTO CLINICA_DENTAL.Pago (id_pago, id_paciente, id_cita, id_metodo_pago, fecha, monto) VALUES (3, 3, 3, 2, TO_DATE('17-10-2024 11:00:00', 'DD-MM-YYYY HH24:MI:SS'), 20000.00)
INTO CLINICA_DENTAL.Pago (id_pago, id_paciente, id_cita, id_metodo_pago, fecha, monto) VALUES (4, 4, 4, 1, TO_DATE('18-04-2024 15:00:00', 'DD-MM-YYYY HH24:MI:SS'), 180000.00)
INTO CLINICA_DENTAL.Pago (id_pago, id_paciente, id_cita, id_metodo_pago, fecha, monto) VALUES (5, 5, 5, 2, TO_DATE('19-05-2024 14:30:00', 'DD-MM-YYYY HH24:MI:SS'), 22000.00)
INTO CLINICA_DENTAL.Pago (id_pago, id_paciente, id_cita, id_metodo_pago, fecha, monto) VALUES (6, 6, 6, 1, TO_DATE('20-11-2024 16:00:00', 'DD-MM-YYYY HH24:MI:SS'), 500000.00)
INTO CLINICA_DENTAL.Pago (id_pago, id_paciente, id_cita, id_metodo_pago, fecha, monto) VALUES (7, 7, 7, 1, TO_DATE('21-11-2024 10:00:00', 'DD-MM-YYYY HH24:MI:SS'), 300000.00)
INTO CLINICA_DENTAL.Pago (id_pago, id_paciente, id_cita, id_metodo_pago, fecha, monto) VALUES (8, 8, 8, 2, TO_DATE('22-12-2024 09:30:00', 'DD-MM-YYYY HH24:MI:SS'), 190000.00)
INTO CLINICA_DENTAL.Pago (id_pago, id_paciente, id_cita, id_metodo_pago, fecha, monto) VALUES (9, 9, 9, 1, TO_DATE('23-08-2024 13:00:00', 'DD-MM-YYYY HH24:MI:SS'), 210000.00)
INTO CLINICA_DENTAL.Pago (id_pago, id_paciente, id_cita, id_metodo_pago, fecha, monto) VALUES (10, 10, 10, 1, TO_DATE('24-10-2024 11:30:00', 'DD-MM-YYYY HH24:MI:SS'), 160000.00)
INTO CLINICA_DENTAL.Pago (id_pago, id_paciente, id_cita, id_metodo_pago, fecha, monto) VALUES (11, 11, 11, 2, TO_DATE('25-11-2024 15:45:00', 'DD-MM-YYYY HH24:MI:SS'), 240000.00)
INTO CLINICA_DENTAL.Pago (id_pago, id_paciente, id_cita, id_metodo_pago, fecha, monto) VALUES (12, 12, 12, 1, TO_DATE('26-07-2024 13:15:00', 'DD-MM-YYYY HH24:MI:SS'), 280000.00)
INTO CLINICA_DENTAL.Pago (id_pago, id_paciente, id_cita, id_metodo_pago, fecha, monto) VALUES (13, 13, 13, 1, TO_DATE('27-11-2024 14:00:00', 'DD-MM-YYYY HH24:MI:SS'), 150000.00)
INTO CLINICA_DENTAL.Pago (id_pago, id_paciente, id_cita, id_metodo_pago, fecha, monto) VALUES (14, 14, 14, 2, TO_DATE('28-09-2024 16:15:00', 'DD-MM-YYYY HH24:MI:SS'), 200000.00)
INTO CLINICA_DENTAL.Pago (id_pago, id_paciente, id_cita, id_metodo_pago, fecha, monto) VALUES(15, 15, 15, 1, TO_DATE('29-02-2024 09:45:00', 'DD-MM-YYYY HH24:MI:SS'), 250000.00)
SELECT 1 FROM DUAL;
SELECT * FROM PAGO;

-----Tabla Tratamiento del paciente
INSERT ALL
INTO CLINICA_DENTAL.Tratamiento_paciente(id_trat_pte, id_paciente, id_tratamiento, descripcion_trat_pte) VALUES (1, 1, 4, 'Extracción de dientes dañados o innecesarios')
INTO CLINICA_DENTAL.Tratamiento_paciente(id_trat_pte, id_paciente, id_tratamiento, descripcion_trat_pte) VALUES (2, 2, 1, 'Procedimiento de limpieza dental profesional')
INTO CLINICA_DENTAL.Tratamiento_paciente(id_trat_pte, id_paciente, id_tratamiento, descripcion_trat_pte) VALUES (3, 3, 6, 'Reemplazo de dientes perdidos con implantes')
INTO CLINICA_DENTAL.Tratamiento_paciente(id_trat_pte, id_paciente, id_tratamiento, descripcion_trat_pte) VALUES (4, 4, 7, 'Colocación de coronas sobre dientes dañados')
INTO CLINICA_DENTAL.Tratamiento_paciente(id_trat_pte, id_paciente, id_tratamiento, descripcion_trat_pte) VALUES (5, 5, 20, 'Tratamiento dental para niños')
INTO CLINICA_DENTAL.Tratamiento_paciente(id_trat_pte, id_paciente, id_tratamiento, descripcion_trat_pte) VALUES (6, 6, 13, 'Restauración de la apariencia de los dientes')
INTO CLINICA_DENTAL.Tratamiento_paciente(id_trat_pte, id_paciente, id_tratamiento, descripcion_trat_pte) VALUES (7, 7, 8, 'Sustitución de dientes perdidos con puentes')
INTO CLINICA_DENTAL.Tratamiento_paciente(id_trat_pte, id_paciente, id_tratamiento, descripcion_trat_pte) VALUES (8, 8, 5, 'Tratamiento para corregir la alineación de los dientes')
INTO CLINICA_DENTAL.Tratamiento_paciente(id_trat_pte, id_paciente, id_tratamiento, descripcion_trat_pte) VALUES (9, 9, 9, 'Reemplazo de dientes con prótesis removibles')
INTO CLINICA_DENTAL.Tratamiento_paciente(id_trat_pte, id_paciente, id_tratamiento, descripcion_trat_pte) VALUES (10, 10, 11, 'Aplicación de selladores en los dientes para prevenir caries')
INTO CLINICA_DENTAL.Tratamiento_paciente(id_trat_pte, id_paciente, id_tratamiento, descripcion_trat_pte) VALUES(11, 11, 18, 'Tratamiento de las enfermedades del interior del diente')
INTO CLINICA_DENTAL.Tratamiento_paciente(id_trat_pte, id_paciente, id_tratamiento, descripcion_trat_pte) VALUES (12, 12, 12, 'Tratamiento para enfermedades de las encías')
INTO CLINICA_DENTAL.Tratamiento_paciente(id_trat_pte, id_paciente, id_tratamiento, descripcion_trat_pte) VALUES (13, 13, 15, 'Laminados que cubren la parte frontal de los dientes')
INTO CLINICA_DENTAL.Tratamiento_paciente(id_trat_pte, id_paciente, id_tratamiento, descripcion_trat_pte) VALUES (14, 14, 14, 'Alineadores transparentes para corregir la alineación dental')
INTO CLINICA_DENTAL.Tratamiento_paciente(id_trat_pte, id_paciente, id_tratamiento, descripcion_trat_pte) VALUES (15, 15, 16, 'Procedimientos quirúrgicos en la boca y los dientes')
SELECT 1 FROM DUAL;
SELECT * FROM TRATAMIENTO_PACIENTE;

----Tabla HIstorial Clinico
INSERT ALL
INTO CLINICA_DENTAL.Historial_clinico (id_historial, id_paciente, id_dentista, fecha, observaciones, id_trat_pte, id_diagnostico) VALUES (1, 1, 12, TO_DATE('11-07-2010 07:00:00', 'DD-MM-YYYY HH24:MI:SS'), 'Sangrado leve en encías.', 1, 1)
INTO CLINICA_DENTAL.Historial_clinico (id_historial, id_paciente, id_dentista, fecha, observaciones, id_trat_pte, id_diagnostico) VALUES (2, 2, 11, TO_DATE('25-05-2022 07:45:00', 'DD-MM-YYYY HH24:MI:SS'), 'Requiere seguimiento por caries.', 2, 1) 
INTO CLINICA_DENTAL.Historial_clinico (id_historial, id_paciente, id_dentista, fecha, observaciones, id_trat_pte, id_diagnostico) VALUES (3, 3, 4, TO_DATE('15-11-2019 07:00:00', 'DD-MM-YYYY HH24:MI:SS'), 'Observación clínica', 3, 19)
INTO CLINICA_DENTAL.Historial_clinico (id_historial, id_paciente, id_dentista, fecha, observaciones, id_trat_pte, id_diagnostico) VALUES (4, 4, 1, TO_DATE('10-10-2010 13:30:00', 'DD-MM-YYYY HH24:MI:SS'), 'Observación normal.', 4, 10)
INTO CLINICA_DENTAL.Historial_clinico (id_historial, id_paciente, id_dentista, fecha, observaciones, id_trat_pte, id_diagnostico) VALUES (5, 5, 2, TO_DATE('09-12-2018 14:45:00', 'DD-MM-YYYY HH24:MI:SS'), 'Recomendar uso de hilo dental.', 5, 20)
INTO CLINICA_DENTAL.Historial_clinico (id_historial, id_paciente, id_dentista, fecha, observaciones, id_trat_pte, id_diagnostico) VALUES (6, 6, 20, TO_DATE('11-01-2022 09:00:00', 'DD-MM-YYYY HH24:MI:SS'), 'Seguimiento de tratamiento.', 6, 18)
INTO CLINICA_DENTAL.Historial_clinico (id_historial, id_paciente, id_dentista, fecha, observaciones, id_trat_pte, id_diagnostico) VALUES (7, 7, 7,TO_DATE('08-07-2021 09:30:00', 'DD-MM-YYYY HH24:MI:SS'), 'Buen progreso con el tratamiento.', 7, 19) 
INTO CLINICA_DENTAL.Historial_clinico (id_historial, id_paciente, id_dentista, fecha, observaciones, id_trat_pte, id_diagnostico) VALUES (8, 8, 2, TO_DATE('11-12-2011 08:00:00', 'DD-MM-YYYY HH24:MI:SS'), 'Sensibilidad en los molares.', 8, 6)
INTO CLINICA_DENTAL.Historial_clinico (id_historial, id_paciente, id_dentista, fecha, observaciones, id_trat_pte, id_diagnostico) VALUES (9, 9, 3, TO_DATE('03-10-2021 11:30:00', 'DD-MM-YYYY HH24:MI:SS'), 'Sin observaciones anormales.', 9, 19) 
INTO CLINICA_DENTAL.Historial_clinico (id_historial, id_paciente, id_dentista, fecha, observaciones, id_trat_pte, id_diagnostico) VALUES (10, 10, 15, TO_DATE('07-07-2023 14:15:00', 'DD-MM-YYYY HH24:MI:SS'), 'Observar desarrollo de caries.', 10, 1) 
INTO CLINICA_DENTAL.Historial_clinico (id_historial, id_paciente, id_dentista, fecha, observaciones, id_trat_pte, id_diagnostico) VALUES (11, 11, 12, TO_DATE('15-03-2021 15:30:00', 'DD-MM-YYYY HH24:MI:SS'), 'Recomendar uso de hilo dental.', 11, 15) 
INTO CLINICA_DENTAL.Historial_clinico (id_historial, id_paciente, id_dentista, fecha, observaciones, id_trat_pte, id_diagnostico) VALUES (12, 12, 2, TO_DATE('02-06-2023 17:00:00', 'DD-MM-YYYY HH24:MI:SS'), 'Inflamación en las encías.', 12, 2)
INTO CLINICA_DENTAL.Historial_clinico (id_historial, id_paciente, id_dentista, fecha, observaciones, id_trat_pte, id_diagnostico) VALUES (13, 13, 16, TO_DATE('11-04-2024 13:45:00', 'DD-MM-YYYY HH24:MI:SS'), 'Seguimiento de tratamiento.', 13, 12) 
INTO CLINICA_DENTAL.Historial_clinico (id_historial, id_paciente, id_dentista, fecha, observaciones, id_trat_pte, id_diagnostico) VALUES (14, 14, 9, TO_DATE('10-05-2022 16:30:00', 'DD-MM-YYYY HH24:MI:SS'), 'Requiere ajuste en la ortodoncia.', 14, 5) 
INTO CLINICA_DENTAL.Historial_clinico (id_historial, id_paciente, id_dentista, fecha, observaciones, id_trat_pte, id_diagnostico) VALUES (15, 15, 6, TO_DATE('07-06-2023 08:00:00', 'DD-MM-YYYY HH24:MI:SS'), 'Sin observaciones anormales.', 15, 19)
SELECT 1 FROM DUAL;
SELECT * FROM CLINICA_DENTAL.HISTORIAL_CLINICO;


----Procedimientos almacenados
--------------------------------------------------------------------------------
---- CRUD
--------------------------------------------------------------------------------
-- 1. Agregar un nuevo paciente
CREATE OR REPLACE PROCEDURE SP_agregar_paciente (
    id_paciente IN NUMBER, 
    nombre_paciente IN VARCHAR2, 
    fecha_nacimiento IN DATE, 
    edad IN NUMBER, 
    telefono IN VARCHAR2, 
    email IN VARCHAR2, 
    fecha_registro IN DATE, 
    id_estado IN NUMBER
)
AS
BEGIN
    INSERT INTO CLINICA_DENTAL.Paciente (id_paciente, nombre_paciente, fecha_nacimiento, edad, telefono_pte, email_pte, fecha_registro, id_estado)
    VALUES (id_paciente, nombre_paciente, fecha_nacimiento, edad, telefono, email, fecha_registro, id_estado);

    DBMS_OUTPUT.PUT_LINE('Paciente agregado: ' || id_paciente || ' - ' || nombre_paciente);
END;
/


--------------------------------------------------------------------------------
-- 2. Actualizar informacion paciente
CREATE OR REPLACE PROCEDURE SP_actualizar_paciente (
    idpaciente IN NUMBER,
    nombrepaciente IN VARCHAR2 DEFAULT NULL,
    fechanacimiento IN DATE DEFAULT NULL,
    edadp IN NUMBER DEFAULT NULL,
    telefonopte IN VARCHAR2 DEFAULT NULL,
    emailpte IN VARCHAR2 DEFAULT NULL,
    fecharegistro IN DATE DEFAULT NULL,
    idestado IN NUMBER DEFAULT NULL
)
AS
BEGIN
    UPDATE CLINICA_DENTAL.Paciente
    SET nombre_paciente = NVL(nombrepaciente, nombrepaciente),
        fecha_nacimiento = NVL(fechanacimiento, fechanacimiento),
        edad = NVL(edadp, edadp),
        telefono_pte = NVL(telefonopte, telefonopte),
        email_pte = NVL(emailpte, emailpte),
        fecha_registro = NVL(fecharegistro, fecharegistro),
        id_estado = NVL(idestado, idestado)
    WHERE id_paciente = idpaciente;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el paciente. Verifique el ID.');
    END IF;
END;
/

--------------------------------------------------------------------------------
-- 3. Cambiar estado paciente
CREATE OR REPLACE PROCEDURE SP_actualizar_estado_paciente (
    idpaciente IN NUMBER,
    idestado IN NUMBER
)
AS
BEGIN
    UPDATE CLINICA_DENTAL.Paciente
    SET id_estado = idestado
    WHERE id_paciente = idpaciente;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el paciente. Verifique el ID.');
    END IF;
END;
/

--------------------------------------------------------------------------------
-- 4. Agregar nuevo dentista
CREATE OR REPLACE PROCEDURE SP_agregar_dentista (
    iddentista IN NUMBER,
    nombredentista IN VARCHAR2,
    telefonodentista IN VARCHAR2,
    emaildentista IN VARCHAR2,
    idespecialidad IN NUMBER,
    idestado IN NUMBER
)
AS
BEGIN
    INSERT INTO CLINICA_DENTAL.Dentista (id_dentista, nombre_dentista, telefono_dentista, email_dentista, id_especialidad, id_estado)
    VALUES (iddentista, nombredentista, telefonodentista, emaildentista, idespecialidad, idestado);

    DBMS_OUTPUT.PUT_LINE('Dentista agregado: ' || id_dentista || ' - ' || nombre_dentista);
END;
/


--------------------------------------------------------------------------------
-- 5. Actualizar informacion dentista
create or replace PROCEDURE SP_actualizar_dentista (
    iddentista IN NUMBER,
    nombredentista IN VARCHAR2 DEFAULT NULL,
    telefonodentista IN VARCHAR2 DEFAULT NULL,
    emaildentista IN VARCHAR2 DEFAULT NULL,
    idespecialidad IN NUMBER DEFAULT NULL,
    idestado IN NUMBER DEFAULT NULL
)
AS
BEGIN
    UPDATE CLINICA_DENTAL.Dentista
    SET nombre_dentista = NVL(nombredentista, nombredentista),
        telefono_dentista = NVL(telefonodentista, telefonodentista),
        email_dentista = NVL(emaildentista, emaildentista),
        id_especialidad = NVL(idespecialidad, idespecialidad),
        id_estado = NVL(idestado, idestado)
    WHERE id_dentista = iddentista;

    IF SQL%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE('No se encontró el dentista. Verifique el ID.');
    END IF;
END;

/


--------------------------------------------------------------------------------
-- 6. Eliminar dentista
drop PROCEDURE SP_eliminar_dentista

CREATE OR REPLACE PROCEDURE SP_eliminar_dentista(IDden IN NUMBER)
AS
BEGIN
    DELETE FROM CLINICA_DENTAL.Pago WHERE id_cita = (select id_cita from Cita where id_dentista = IDden);
    DELETE FROM CLINICA_DENTAL.Cita WHERE id_dentista = IDden;
    DELETE FROM CLINICA_DENTAL.Historial_clinico WHERE id_dentista = IDden;
    DELETE FROM CLINICA_DENTAL.Dentista WHERE id_dentista = IDden;

    DBMS_OUTPUT.PUT_LINE('Dentista eliminado con ID: ' || IDden);

END;

set serveroutput on

EXECUTE SP_eliminar_dentista(12)


-- 7. Eliminar los registros del dentista
CREATE OR REPLACE PROCEDURE sp_eliminar_registros_dentistas (
    p_id_dentista IN NUMBER
) IS
BEGIN
    DELETE FROM historial_clinico
    WHERE
        id_dentista = p_id_dentista;

    DELETE FROM cita
    WHERE
        id_dentista = p_id_dentista;

    DELETE FROM dentista
    WHERE
        id_dentista = p_id_dentista;

    dbms_output.put_line('Registros eliminados con éxito para el ID del dentista: ' || p_id_dentista);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error al eliminar los registros del dentista: ' || sqlerrm);
END;
/

-- 8. Agregar nueva especialidad
CREATE OR REPLACE PROCEDURE SP_agregar_especialidad (
    p_id_especialidad IN NUMBER, 
    p_nombre_especialidad IN VARCHAR2,
    p_descripcion_esp IN VARCHAR2,
    p_id_estado IN NUMBER
)
IS
    v_count NUMBER; 
BEGIN
    SELECT COUNT(*) 
    INTO v_count
    FROM Especialidad
    WHERE nombre_especialidad = p_nombre_especialidad;

    IF v_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Especialidad ya existente en el sistema: ' || p_nombre_especialidad);
    ELSE
        INSERT INTO Especialidad (
            id_especialidad, 
            nombre_especialidad, 
            descripcion_esp, 
            id_estado
        ) 
        VALUES (
            p_id_especialidad, 
            p_nombre_especialidad, 
            p_descripcion_esp, 
            p_id_estado
        );

        DBMS_OUTPUT.PUT_LINE('Nueva especialidad agregada: ' || p_nombre_especialidad);
    END IF;
END;
/

-- 9. Actualizar información especialidad
CREATE OR REPLACE PROCEDURE sp_actualizar_especialidad (
    p_id_especialidad     IN NUMBER,
    p_nombre_especialidad IN VARCHAR2 DEFAULT NULL,
    p_descripcion_esp     IN VARCHAR2 DEFAULT NULL,
    p_id_estado           IN NUMBER DEFAULT NULL
) IS
    v_exists NUMBER := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO v_exists
    FROM
        especialidad
    WHERE
        id_especialidad = p_id_especialidad;

    IF v_exists = 0 THEN
        dbms_output.put_line('No se encontró especialidad, por favor indique el ID correcto.');
    ELSE
        UPDATE especialidad
        SET
            nombre_especialidad =
                CASE
                    WHEN p_nombre_especialidad IS NOT NULL THEN
                        p_nombre_especialidad
                    ELSE
                        nombre_especialidad
                END,
            descripcion_esp =
                CASE
                    WHEN p_descripcion_esp IS NOT NULL THEN
                        p_descripcion_esp
                    ELSE
                        descripcion_esp
                END,
            id_estado =
                CASE
                    WHEN p_id_estado IS NOT NULL THEN
                        p_id_estado
                    ELSE
                        id_estado
                END
        WHERE
            id_especialidad = p_id_especialidad;

        dbms_output.put_line('Especialidad actualizada correctamente para el ID: ' || p_id_especialidad);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error al intentar actualizar la especialidad. Verifique los datos proporcionados.');
END;
/

-- 10. Agregar nuevo historial clinico
CREATE OR REPLACE PROCEDURE sp_agregar_historial_clinico (
    p_id_historial   IN NUMBER,
    p_id_paciente    IN NUMBER,
    p_id_dentista    IN NUMBER,
    p_fecha          IN DATE,
    p_observaciones  IN VARCHAR2,
    p_id_trat_pte    IN NUMBER,
    p_id_diagnostico IN NUMBER
) IS
BEGIN
    INSERT INTO historial_clinico (
        id_historial,
        id_paciente,
        id_dentista,
        fecha,
        observaciones,
        id_trat_pte,
        id_diagnostico
    ) VALUES (
        p_id_historial,
        p_id_paciente,
        p_id_dentista,
        p_fecha,
        p_observaciones,
        p_id_trat_pte,
        p_id_diagnostico
    );

    dbms_output.put_line('Historial clínico creado para el ID: ' || p_id_historial);
END;
/

-- 11. Agregar una nueva cita
CREATE OR REPLACE PROCEDURE sp_agregar_cita (
    p_id_cita        IN NUMBER,
    p_fecha_hora     IN DATE,
    p_id_paciente    IN NUMBER,
    p_id_dentista    IN NUMBER,
    p_id_tratamiento IN NUMBER,
    p_id_motivo      IN NUMBER
) IS
BEGIN
    INSERT INTO cita (
        id_cita,
        fecha_hora,
        id_paciente,
        id_dentista,
        id_tratamiento,
        id_motivo
    ) VALUES (
        p_id_cita,
        p_fecha_hora,
        p_id_paciente,
        p_id_dentista,
        p_id_tratamiento,
        p_id_motivo
    );

    dbms_output.put_line('Cita agregada con éxito para el ID: ' || p_id_cita);
END;
/

-- 12. Actualizar información de una cita
CREATE OR REPLACE PROCEDURE sp_actualizar_cita (
    p_id_cita        IN NUMBER,
    p_fecha_hora     IN DATE DEFAULT NULL,
    p_id_paciente    IN NUMBER DEFAULT NULL,
    p_id_dentista    IN NUMBER DEFAULT NULL,
    p_id_tratamiento IN NUMBER DEFAULT NULL,
    p_id_motivo      IN NUMBER DEFAULT NULL
) IS
    v_exists NUMBER := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO v_exists
    FROM
        cita
    WHERE
        id_cita = p_id_cita;

    IF v_exists = 0 THEN
        dbms_output.put_line('No se encontró cita, verifique ID.');
    ELSE
        UPDATE cita
        SET
            fecha_hora =
                CASE
                    WHEN p_fecha_hora IS NOT NULL THEN
                        p_fecha_hora
                    ELSE
                        fecha_hora
                END,
            id_paciente =
                CASE
                    WHEN p_id_paciente IS NOT NULL THEN
                        p_id_paciente
                    ELSE
                        id_paciente
                END,
            id_dentista =
                CASE
                    WHEN p_id_dentista IS NOT NULL THEN
                        p_id_dentista
                    ELSE
                        id_dentista
                END,
            id_tratamiento =
                CASE
                    WHEN p_id_tratamiento IS NOT NULL THEN
                        p_id_tratamiento
                    ELSE
                        id_tratamiento
                END,
            id_motivo =
                CASE
                    WHEN p_id_motivo IS NOT NULL THEN
                        p_id_motivo
                    ELSE
                        id_motivo
                END
        WHERE
            id_cita = p_id_cita;

        dbms_output.put_line('Cita actualizada con éxito para el ID: ' || p_id_cita);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error al intentar actualizar la cita. Verifique los datos proporcionados.');
END;
/

-- 13. Agregar nuevo tratamiento
CREATE OR REPLACE PROCEDURE sp_agregar_tratamiento (
    p_id_tratamiento          IN NUMBER,
    p_nombre_tratamiento      IN VARCHAR2,
    p_descripcion_tratamiento IN VARCHAR2,
    p_id_estado               IN NUMBER
) IS
BEGIN
    INSERT INTO tratamiento (
        id_tratamiento,
        nombre_tratamiento,
        descripcion_tratamiento,
        id_estado
    ) VALUES (
        p_id_tratamiento,
        p_nombre_tratamiento,
        p_descripcion_tratamiento,
        p_id_estado
    );

    dbms_output.put_line('Nuevo tratamiento agregado con ID: ' || p_id_tratamiento);
END;
/

-- 14. Actualizar tratamiento
CREATE OR REPLACE PROCEDURE sp_actualizar_tratamiento (
    p_id_tratamiento          IN NUMBER,
    p_nombre_tratamiento      IN VARCHAR2 DEFAULT NULL,
    p_descripcion_tratamiento IN VARCHAR2 DEFAULT NULL,
    p_id_estado               IN NUMBER DEFAULT NULL
) IS
    v_exists NUMBER := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO v_exists
    FROM
        tratamiento
    WHERE
        id_tratamiento = p_id_tratamiento;

    IF v_exists = 0 THEN
        dbms_output.put_line('No se encontró el tratamiento. Verifique el ID.');
    ELSE
        UPDATE tratamiento
        SET
            nombre_tratamiento =
                CASE
                    WHEN p_nombre_tratamiento IS NOT NULL THEN
                        p_nombre_tratamiento
                    ELSE
                        nombre_tratamiento
                END,
            descripcion_tratamiento =
                CASE
                    WHEN p_descripcion_tratamiento IS NOT NULL THEN
                        p_descripcion_tratamiento
                    ELSE
                        descripcion_tratamiento
                END,
            id_estado =
                CASE
                    WHEN p_id_estado IS NOT NULL THEN
                        p_id_estado
                    ELSE
                        id_estado
                END
        WHERE
            id_tratamiento = p_id_tratamiento;

        dbms_output.put_line('Tratamiento actualizado.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Verifique los datos.');
END;
/

-- 14. Actualizar tratamiento del paciente
CREATE OR REPLACE PROCEDURE sp_actualizar_trat_pte (
    p_id_trat_pte          IN NUMBER,
    p_id_paciente          IN NUMBER DEFAULT NULL,
    p_id_tratamiento       IN NUMBER DEFAULT NULL,
    p_descripcion_trat_pte IN VARCHAR2 DEFAULT NULL
) IS
    v_exists NUMBER := 0;
BEGIN
    SELECT
        COUNT(*)
    INTO v_exists
    FROM
        tratamiento_paciente
    WHERE
        id_trat_pte = p_id_trat_pte;

    IF v_exists = 0 THEN
        dbms_output.put_line('No se encontró el tratamiento para el paciente. Verifique el ID.');
    ELSE
        UPDATE tratamiento_paciente
        SET
            id_paciente =
                CASE
                    WHEN p_id_paciente IS NOT NULL THEN
                        p_id_paciente
                    ELSE
                        id_paciente
                END,
            id_tratamiento =
                CASE
                    WHEN p_id_tratamiento IS NOT NULL THEN
                        p_id_tratamiento
                    ELSE
                        id_tratamiento
                END,
            descripcion_trat_pte =
                CASE
                    WHEN p_descripcion_trat_pte IS NOT NULL THEN
                        p_descripcion_trat_pte
                    ELSE
                        descripcion_trat_pte
                END
        WHERE
            id_trat_pte = p_id_trat_pte;

        dbms_output.put_line('Tratamiento actualizado.');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Verifique los datos.');
END;
/
	
--VISTAS
--------------------------------------------------------------------------------
---Vista 1: Vista de las citas programadas

CREATE OR REPLACE VIEW vista_citas_programadas AS
    SELECT
        c.id_cita,
        c.fecha_hora,
        p.nombre_paciente AS nombre_paciente,
        d.nombre_dentista AS nombre_dentista,
        t.descripcion_trat_pte,
        m.descripcion_motivo
    FROM
             clinica_dental.cita c
        INNER JOIN clinica_dental.paciente             p ON c.id_paciente = p.id_paciente
        INNER JOIN clinica_dental.dentista             d ON c.id_dentista = d.id_dentista
        INNER JOIN clinica_dental.tratamiento_paciente t ON c.id_tratamiento = t.id_trat_pte
        INNER JOIN clinica_dental.motivo_visita        m ON c.id_motivo = m.id_motivo;

--------------------------------------------------------------------------------
---Vista 2: Vista de la informacion del historial del paciente

CREATE VIEW vista_historial_paciente AS
    SELECT
        h.id_historial,
        p.id_paciente,
        p.nombre_paciente AS nombre_paciente,
        d.nombre_dentista AS nombre_dentista,
        h.fecha,
        h.observaciones,
        t.descripcion_trat_pte,
        diag.descripcion_diagnostico
    FROM
             clinica_dental.historial_clinico h
        INNER JOIN clinica_dental.paciente             p ON h.id_paciente = p.id_paciente
        INNER JOIN clinica_dental.dentista             d ON h.id_dentista = d.id_dentista
        INNER JOIN clinica_dental.tratamiento_paciente t ON h.id_trat_pte = t.id_trat_pte
        INNER JOIN clinica_dental.diagnostico          diag ON h.id_diagnostico = diag.id_diagnostico;

--------------------------------------------------------------------------------
---Vista 3: Vista de pacientes activos
CREATE OR REPLACE VIEW pacientes_activos AS
    SELECT
        id_paciente,
        nombre_paciente,
        email_pte,
        telefono_pte
    FROM
        paciente
    WHERE
        id_estado = 1;

--------------------------------------------------------------------------------
---Vista 4: Detalles de las citas
CREATE OR REPLACE VIEW detalles_citas AS
    SELECT
        c.id_cita,
        c.fecha_hora,
        p.nombre_paciente,
        d.nombre_dentista,
        t.descripcion_trat_pte,
        m.descripcion_motivo
    FROM
             cita c
        INNER JOIN paciente             p ON c.id_paciente = p.id_paciente
        INNER JOIN dentista             d ON c.id_dentista = d.id_dentista
        INNER JOIN tratamiento_paciente t ON c.id_tratamiento = t.id_trat_pte
        INNER JOIN motivo_visita        m ON c.id_motivo = m.id_motivo;

--------------------------------------------------------------------------------
---Vista 5: Tratamientos realizados
CREATE OR REPLACE VIEW detalles_tratamientos_completos AS
    SELECT
        tp.id_trat_pte,
        tp.descripcion_trat_pte AS descripcion_tratamiento,
        p.nombre_paciente       AS paciente,
        d.nombre_dentista       AS dentista,
        t.nombre_tratamiento    AS tratamiento,
        m.descripcion_motivo    AS motivo_visita,
        c.fecha_hora            AS fecha_cita
    FROM
             tratamiento_paciente tp
        INNER JOIN paciente      p ON tp.id_paciente = p.id_paciente
        INNER JOIN dentista      d ON tp.id_trat_pte = d.id_dentista
        INNER JOIN tratamiento   t ON tp.id_tratamiento = t.id_tratamiento
        INNER JOIN motivo_visita m ON tp.id_trat_pte = m.id_motivo
        INNER JOIN cita          c ON tp.id_tratamiento = c.id_tratamiento;

--------------------------------------------------------------------------------
---Vista 6: Resumen citas x dentista
CREATE OR REPLACE VIEW resumen_citas_dentista AS
    SELECT
        d.id_dentista,
        d.nombre_dentista,
        e.nombre_especialidad AS especialidad,
        COUNT(c.id_cita)      AS total_citas
    FROM
             dentista d
        INNER JOIN cita         c ON d.id_dentista = c.id_dentista
        INNER JOIN especialidad e ON d.id_especialidad = e.id_especialidad
    GROUP BY
        d.id_dentista,
        d.nombre_dentista,
        e.nombre_especialidad;

--------------------------------------------------------------------------------
---Vista 7: Pacientes y su ultima cita
CREATE OR REPLACE VIEW Pacientes_Ultima_Cita AS
SELECT 
    p.id_paciente,
    p.nombre_paciente,
    c.fecha_hora AS ultima_cita,
    d.nombre_dentista AS dentista
FROM 
    Paciente p
INNER JOIN Cita c ON p.id_paciente = c.id_paciente
INNER JOIN Dentista d ON c.id_dentista = d.id_dentista
WHERE 
    c.fecha_hora = (
        SELECT MAX(c2.fecha_hora)
        FROM Cita c2
        WHERE c2.id_paciente = p.id_paciente
    );

--------------------------------------------------------------------------------
---Vista 8: Pacientes frecuentes
CREATE OR REPLACE VIEW pacientes_frecuentes AS
    SELECT
        p.id_paciente,
        p.nombre_paciente,
        COUNT(c.id_cita) AS total_citas
    FROM
             paciente p
        INNER JOIN cita c ON p.id_paciente = c.id_paciente
    GROUP BY
        p.id_paciente,
        p.nombre_paciente
    HAVING
        COUNT(c.id_cita) > 3
    ORDER BY
        total_citas DESC;

--------------------------------------------------------------------------------
---Vista 9: Tratamientos mas solicitados
CREATE OR REPLACE VIEW tratamientos_populares AS
    SELECT
        t.id_tratamiento,
        t.nombre_tratamiento,
        COUNT(c.id_cita) AS total_citas
    FROM
             tratamiento t
        INNER JOIN tratamiento_paciente tp ON t.id_tratamiento = tp.id_tratamiento
        INNER JOIN cita                 c ON tp.id_trat_pte = c.id_tratamiento
    GROUP BY
        t.id_tratamiento,
        t.nombre_tratamiento
    ORDER BY
        total_citas DESC;

--------------------------------------------------------------------------------
---Vista 10: Lista de dentistas activos
CREATE OR REPLACE VIEW lista_dentistas AS
    SELECT
        d.id_dentista,
        d.nombre_dentista,
        e.nombre_especialidad
    FROM
             dentista d
        INNER JOIN especialidad e ON d.id_especialidad = e.id_especialidad
    ORDER BY
        d.nombre_dentista;

--------------------------------------------------------------------------------
--FUNCIONES
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
drop function EdadPromedioPacientes;
drop function IngresoTotalPorMetodoPago;
drop function ObtenerInfoDentista;
drop function ObtenerInfoPaciente;
drop function TotalCitasPorEspecialidad;
drop function TotalPagosPorPaciente;
drop function TratamientoMasComun;
--------------------------------------------------------------------------------
--FUNCION 1: Esta funcion contara las citas de un paciente por su ID, mostrando un mensaje con la cantidad de citas encontradas o indicando que no tiene citas.
CREATE OR REPLACE FUNCTION contar_citas_paciente(p_id_paciente IN NUMBER)
RETURN VARCHAR2 IS
    v_cantidad_citas NUMBER;
BEGIN
    -- Contar la cantidad de citas del paciente
    SELECT COUNT(*) INTO v_cantidad_citas
    FROM CITA
    WHERE id_paciente = p_id_paciente;

    -- Validar si el paciente tiene citas
    IF v_cantidad_citas = 0 THEN
        RETURN 'El paciente con ID ' || p_id_paciente || ' no tiene citas registradas.';
    ELSE
        RETURN 'El paciente con ID ' || p_id_paciente || ' tiene ' || v_cantidad_citas || ' citas.';
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Error: No se encontro informacion para el paciente con ID: ' || p_id_paciente;
    WHEN OTHERS THEN
        RETURN 'Error: Ha ocurrido un problema al contar las citas del paciente. Detalles: ' || SQLERRM;
END contar_citas_paciente;
/
--------------------------------------------------------------------------------
--FUNCION 2: Esta funcion cambiara el estado de un dentista por su ID_DENTISTA. Si el dentista no existe o si el estado no es valido, se lanzara una excepcion.
CREATE OR REPLACE FUNCTION actualizar_estado_dentista(p_id_dentista INT, p_id_estado INT)
    RETURN VARCHAR2
IS
BEGIN
    UPDATE CLINICA_DENTAL.Dentista
    SET id_estado = p_id_estado
    WHERE id_dentista = p_id_dentista;

    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Error: No se encontro el dentista con el ID proporcionado.');
    END IF;

    RETURN 'Modificacion realizada con exito.';
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20004, 'Error al modificar el estado del dentista: ' || SQLERRM);
END actualizar_estado_dentista;
/
--------------------------------------------------------------------------------
--FUNCION 3: Esta funcion devuelve el nombre del tratamiento asociado a un ID_TRATAMIENTO. Si no se encuentra el tratamiento, lanzara una excepcion.
CREATE OR REPLACE FUNCTION obtener_tratamiento_por_id(p_id_tratamiento INT)
    RETURN VARCHAR2
IS
    v_nombre_tratamiento VARCHAR2(255);
BEGIN
    SELECT nombre_tratamiento
    INTO v_nombre_tratamiento
    FROM CLINICA_DENTAL.Tratamiento
    WHERE id_tratamiento = p_id_tratamiento;

    RETURN v_nombre_tratamiento;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20005, 'Error: No se encontro un tratamiento con el ID proporcionado.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20006, 'Error inesperado: ' || SQLERRM);
END obtener_tratamiento_por_id;
/
--------------------------------------------------------------------------------
--FUNCION 4: Esta funcion verifica si un paciente tiene citas pendientes (citas cuya fecha es futura). Retorna un mensaje segun el resultado.
CREATE OR REPLACE FUNCTION tiene_citas_pendientes(p_id_paciente INT)
    RETURN VARCHAR2
IS
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM CLINICA_DENTAL.Cita
    WHERE id_paciente = p_id_paciente
    AND fecha_hora > SYSDATE;

    IF v_count > 0 THEN
        RETURN 'El paciente tiene citas pendientes.';
    ELSE
        RETURN 'El paciente no tiene citas pendientes.';
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20007, 'Error al verificar las citas: ' || SQLERRM);
END tiene_citas_pendientes;
/
--------------------------------------------------------------------------------
--FUNCION 5: Esta funcion cuenta la cantidad de tratamientos realizados a un paciente, basado en el ID_PACIENTE.
CREATE OR REPLACE FUNCTION contar_tratamientos_paciente(p_id_paciente INT)
    RETURN INT
IS
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM CLINICA_DENTAL.Tratamiento_paciente
    WHERE id_paciente = p_id_paciente;

    RETURN v_count;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20008, 'Error al contar los tratamientos del paciente: ' || SQLERRM);
END contar_tratamientos_paciente;
/
--------------------------------------------------------------------------------
--FUNCION 6: Esta funcion devuelve el diagnostico de un paciente para una fecha especifica, lanzando una excepcion si no se encuentra.
CREATE OR REPLACE FUNCTION obtener_diagnostico_paciente(p_id_paciente INT, p_fecha DATE)
    RETURN VARCHAR2
IS
    v_diagnostico VARCHAR2(255);
BEGIN
    SELECT d.descripcion_diagnostico
    INTO v_diagnostico
    FROM CLINICA_DENTAL.Historial_clinico h
    JOIN CLINICA_DENTAL.Diagnostico d ON h.id_diagnostico = d.id_diagnostico
    WHERE h.id_paciente = p_id_paciente
    AND h.fecha = p_fecha;

    RETURN v_diagnostico;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20009, 'Error: No se encontro un diagnostico para la fecha especificada.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20010, 'Error inesperado: ' || SQLERRM);
END obtener_diagnostico_paciente;
/
--------------------------------------------------------------------------------
--FUNCION 7: Esta funcion calcula el total de los pagos realizados por un paciente dado su ID_PACIENTE.
CREATE OR REPLACE FUNCTION obtener_monto_total_pago(p_id_paciente INT)
    RETURN DECIMAL
IS
    v_total DECIMAL(10, 2);
BEGIN
    SELECT SUM(monto) INTO v_total
    FROM CLINICA_DENTAL.Pago
    WHERE id_paciente = p_id_paciente;

    RETURN NVL(v_total, 0);
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20011, 'Error al calcular el total de pagos: ' || SQLERRM);
END obtener_monto_total_pago;
/
--------------------------------------------------------------------------------
--FUNCION 8: Esta funcion valida si el correo electronico de un paciente cumple con un formato adecuado. Si no es valido, lanza una excepcion.
CREATE OR REPLACE FUNCTION validar_email_paciente(p_email VARCHAR2)
    RETURN VARCHAR2
IS
BEGIN
    IF NOT REGEXP_LIKE(p_email, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') THEN
        RAISE_APPLICATION_ERROR(-20012, 'Error: El correo electronico no es valido.');
    END IF;

    RETURN 'Correo electrónico válido';
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20013, 'Error al validar el correo electronico: ' || SQLERRM);
END validar_email_paciente;
/
--------------------------------------------------------------------------------
--FUNCION 9: Esta funcion devuelve el nombre de la especialidad de un dentista basado en su ID_DENTISTA.
CREATE OR REPLACE FUNCTION obtener_especialidad_dentista(p_id_dentista INT)
    RETURN VARCHAR2
IS
    v_especialidad VARCHAR2(255);
BEGIN
    SELECT e.nombre_especialidad
    INTO v_especialidad
    FROM CLINICA_DENTAL.Dentista d
    JOIN CLINICA_DENTAL.Especialidad e ON d.id_especialidad = e.id_especialidad
    WHERE d.id_dentista = p_id_dentista;

    RETURN v_especialidad;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20014, 'Error: No se encontro especialidad para el dentista.');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20015, 'Error inesperado: ' || SQLERRM);
END obtener_especialidad_dentista;
/
--------------------------------------------------------------------------------
--FUNCION 10: Esta funcion cuenta cuantos pacientes estan asociados con un estado especifico.
CREATE OR REPLACE FUNCTION contar_pacientes_por_estado(p_id_estado INT)
    RETURN INT
IS
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM CLINICA_DENTAL.Paciente
    WHERE id_estado = p_id_estado;

    RETURN v_count;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20016, 'Error al contar pacientes por estado: ' || SQLERRM);
END contar_pacientes_por_estado;
/
--------------------------------------------------------------------------------
--FUNCION 11: Esta funcion busca al cliente por medio de su ID, utilizando SQL Dinamico.
CREATE OR REPLACE FUNCTION buscar_cliente(p_id_paciente IN NUMBER)
RETURN VARCHAR2 IS
    v_resultado VARCHAR2(1000);
BEGIN
    -- Construir el SQL dinamico para obtener la informacion del paciente
    EXECUTE IMMEDIATE
        'SELECT ''Nombre: '' || NOMBRE_PACIENTE || '', Fecha de Nacimiento: '' || TO_CHAR(FECHA_NACIMIENTO, ''YYYY-MM-DD'') ||
                '', Edad: '' || EDAD || '', Telefono: '' || TELEFONO_PTE || '', Email: '' || EMAIL_PTE
         FROM PACIENTE
         WHERE ID_PACIENTE = :ID'
    INTO v_resultado
    USING p_id_paciente;

    -- Retornar el resultado
    RETURN v_resultado;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Error: No se encontro un paciente con el ID: ' || p_id_paciente;
    WHEN OTHERS THEN
        RETURN 'Error: Ha ocurrido un problema al buscar el paciente. Detalles: ' || SQLERRM;
END buscar_cliente;
/
--------------------------------------------------------------------------------
--FUNCION 12: Esta funcion busca al dentista por medio de su ID, utilizando SQL Dinamico.
CREATE OR REPLACE FUNCTION buscar_dentista(p_id_dentista IN NUMBER)
RETURN VARCHAR2 IS
    v_sql VARCHAR2(500);
    v_resultado VARCHAR2(200);
BEGIN
    -- Construimos la consulta de manera dinamica
    v_sql := 'SELECT NOMBRE_DENTISTA || '', Teléfono: '' || TELEFONO_DENTISTA || '', Email: '' || EMAIL_DENTISTA 
              FROM CLINICA_DENTAL.DENTISTA 
              WHERE ID_DENTISTA = :1';

    -- Ejecutamos SQL dinamico
    EXECUTE IMMEDIATE v_sql INTO v_resultado USING p_id_dentista;

    -- Retornamos la informacion del dentista
    RETURN 'Información del Dentista: ' || v_resultado;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- Excepcion si no se encuentra el dentista
        RETURN 'Error: No se encontró un dentista con el ID: ' || p_id_dentista;
    WHEN OTHERS THEN
        -- Manejo de errores genericos
        RETURN 'Error: Ha ocurrido un problema al buscar el dentista. Detalles: ' || SQLERRM;
END buscar_dentista;
/
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


exec SP_ELIMINAR_DENTISTA(999)

SELECT c.table_name, c.column_name, cc.constraint_name
FROM all_cons_columns c
JOIN all_constraints cc 
ON c.constraint_name = cc.constraint_name
WHERE cc.constraint_name = 'SYS_C007553';

