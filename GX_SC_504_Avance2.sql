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



----Procedimientos almacenados
----Vistas
----Funciones
