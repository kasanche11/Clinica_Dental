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
    FOREIGN KEY (id_estado) REFERENCES Estado(id_estado)
);

-- Tabla Dentista
CREATE TABLE CLINICA_DENTAL.Dentista (
    id_dentista INT PRIMARY KEY,
    nombre_dentista VARCHAR(255),
    telefono_dentista VARCHAR(50),
    email_dentista VARCHAR(255),
    id_especialidad INT,
    id_estado INT,
    FOREIGN KEY (id_especialidad) REFERENCES Especialidad(id_especialidad),
    FOREIGN KEY (id_estado) REFERENCES Estado(id_estado)
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
    FOREIGN KEY (id_estado) REFERENCES Estado(id_estado)
);

-- Tabla Tratamiento
CREATE TABLE CLINICA_DENTAL.Tratamiento (
    id_tratamiento INT PRIMARY KEY,
    nombre_tratamiento VARCHAR(255),
    descripcion_tratamiento VARCHAR(255),
    id_estado INT,
    FOREIGN KEY (id_estado) REFERENCES Estado(id_estado)
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
    FOREIGN KEY (id_estado) REFERENCES Estado(id_estado)
);


-- Tabla Cita
CREATE TABLE CLINICA_DENTAL.Cita (
    id_cita INT PRIMARY KEY,
    fecha_hora DATE,
    id_paciente INT,
    id_dentista INT,
    id_tratamiento INT,
	id_motivo INT,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_dentista) REFERENCES Dentista(id_dentista),
    FOREIGN KEY (id_tratamiento) REFERENCES Tratamiento(id_tratamiento),
	FOREIGN KEY (id_motivo) REFERENCES Motivo_visita(id_motivo)
);

-- Tabla Pago
CREATE TABLE CLINICA_DENTAL.Pago(
    id_pago INT PRIMARY KEY,
    id_paciente INT,
    id_cita INT,
    id_metodo_pago INT,
    fecha DATE,
    monto DECIMAL(10, 2),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_cita) REFERENCES Cita(id_cita),
    FOREIGN KEY (id_metodo_pago) REFERENCES Metodo_pago(id_metodo_pago)
);

-- Tabla Tratamiento del paciente
CREATE TABLE CLINICA_DENTAL.Tratamiento_paciente (
    id_trat_pte INT PRIMARY KEY,
    id_paciente INT,
    id_tratamiento INT,
    descripcion_trat_pte VARCHAR(255),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_tratamiento) REFERENCES Tratamiento(id_tratamiento)
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
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_dentista) REFERENCES Dentista(id_dentista),
    FOREIGN KEY (id_trat_pte) REFERENCES Tratamiento_paciente(id_trat_pte),
    FOREIGN KEY (id_diagnostico) REFERENCES Diagnostico(id_diagnostico)
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
INTO CLINICA_DENTAL.Diagnostico (id_diagnostico, descripcion_diagnostico) VALUES (7, 'Aftas o Úlceras Orales')
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
SELECT * FROM HISTORIAL_CLINICO;

----Procedimientos almacenados
----Vistas
----Funciones
--------------------------------------------------------------------------------
--FUNCIONES
--------------------------------------------------------------------------------
--FUNCION 1: Ingreso total por metodo de pago
CREATE OR REPLACE FUNCTION IngresoTotalPorMetodoPago(metodo_pago_id NUMBER)
RETURN NUMBER
AS
    totalIngreso NUMBER;
BEGIN
    -- Calcula el ingreso total por el metodo de pago
    SELECT SUM(monto)
    INTO totalIngreso
    FROM Pago
    WHERE id_metodo_pago = metodo_pago_id;

    -- Devuelve el ingreso total calculado
    RETURN totalIngreso;
END;
/
SELECT IngresoTotalPorMetodoPago(1) AS TotalIngreso FROM DUAL;
--------------------------------------------------------------------------------
--FUNCION 2: Tratamiento mas comun
CREATE OR REPLACE FUNCTION TratamientoMasComun
RETURN NUMBER
IS
    tratamientoIdMasComun NUMBER;
BEGIN
    SELECT id_tratamiento
    INTO tratamientoIdMasComun
    FROM (
        SELECT id_tratamiento, COUNT(*) AS frecuencia
        FROM Tratamiento_paciente
        GROUP BY id_tratamiento
        ORDER BY frecuencia DESC
    )
    WHERE ROWNUM = 1;

    RETURN tratamientoIdMasComun;
END;
/
-- Llamada de prueba:
SELECT TratamientoMasComun() AS Tratamiento_mas_comun FROM DUAL;
--------------------------------------------------------------------------------
--FUNCION 3: Edad promedio de los pacientes
CREATE OR REPLACE FUNCTION EdadPromedioPacientes
RETURN NUMBER
IS
    edadPromedio NUMBER;
BEGIN
    SELECT AVG(ROUND(MONTHS_BETWEEN(SYSDATE, fecha_nacimiento) / 12, 2))
    INTO edadPromedio
    FROM Paciente;

    RETURN edadPromedio;
END;
/
-- Llamada de prueba:
SELECT EdadPromedioPacientes() AS Edad_promedio_pacientes FROM DUAL;
--------------------------------------------------------------------------------
--FUNCION 4: Informacion de un dentista por su ID
CREATE OR REPLACE FUNCTION ObtenerInfoDentista(dentista_id IN NUMBER)
RETURN VARCHAR2
IS
    resultado VARCHAR2(1000);
BEGIN
    SELECT 'Nombre: ' || nombre_dentista || 
           ', Telefono: ' || telefono_dentista || 
           ', Email: ' || email_dentista || 
           ', Especialidad: ' || nombre_especialidad || 
           ', Estado: ' || descripcion_estado
    INTO resultado
    FROM Dentista
    JOIN Especialidad ON Dentista.id_especialidad = Especialidad.id_especialidad
    JOIN Estado ON Dentista.id_estado = Estado.id_estado
    WHERE Dentista.id_dentista = dentista_id;

    RETURN resultado;
END;
/
-- Llamada de prueba:
SELECT ObtenerInfoDentista(4) AS Info_Dentista FROM DUAL;
--------------------------------------------------------------------------------
--FUNCION 5: Informacion de un paciente por su ID
CREATE OR REPLACE FUNCTION ObtenerInfoPaciente(paciente_id IN NUMBER)
RETURN VARCHAR2
IS
    resultado VARCHAR2(1000);
BEGIN
    SELECT 'Nombre: ' || nombre_paciente || 
           ', Fecha de Nacimiento: ' || TO_CHAR(fecha_nacimiento, 'DD/MM/YYYY') || 
           ', Edad: ' || edad || 
           ', Telefono: ' || telefono_pte || 
           ', Email: ' || email_pte || 
           ', Estado: ' || descripcion_estado
    INTO resultado
    FROM Paciente
    JOIN Estado ON Paciente.id_estado = Estado.id_estado
    WHERE Paciente.id_paciente = paciente_id;

    RETURN resultado;
END;
/
-- Llamada de prueba:
SELECT ObtenerInfoPaciente(4) AS Info_Paciente FROM DUAL;
--------------------------------------------------------------------------------
--FUNCION 6: Cantidad de pago por cliente
CREATE OR REPLACE FUNCTION TotalPagosPorPaciente(paciente_id NUMBER)
RETURN NUMBER
AS
    totalPagos NUMBER;
BEGIN
    -- Calcula la suma de los pagos por paciente
    SELECT SUM(monto)
    INTO totalPagos
    FROM Pago
    WHERE id_paciente = paciente_id;

    -- Si no hay pagos, retorna 0
    IF totalPagos IS NULL THEN
        RETURN 0;
    ELSE
        RETURN totalPagos;
    END IF;
END;
/
SELECT TotalPagosPorPaciente(1) AS TotalPagos FROM DUAL;
--------------------------------------------------------------------------------
--FUNCION 7: Citas ordenadas por especialidad
CREATE OR REPLACE FUNCTION TotalCitasPorEspecialidad(especialidad_id NUMBER)
RETURN NUMBER
AS
    totalCitas NUMBER;
BEGIN
    -- Cuenta las citas por especialidad
    SELECT COUNT(*)
    INTO totalCitas
    FROM Cita c
    JOIN Dentista d ON c.id_dentista = d.id_dentista
    WHERE d.id_especialidad = especialidad_id;

    -- Si no hay citas, retorna 0
    IF totalCitas IS NULL THEN
        RETURN 0;
    ELSE
        RETURN totalCitas;
    END IF;
END;
/
SELECT TotalCitasPorEspecialidad(3) AS TotalCitas FROM DUAL;
--------------------------------------------------------------------------------

