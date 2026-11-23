-- ============================================================================
-- SISTEMA DE GESTIÓN BIBLIOTECARIA "BIBLIOVG" - IP VIRGINIO GÓMEZ
-- Script DDL Modelo Relacional Lógico (3FN) - PostgreSQL / SQLite
-- ============================================================================

CREATE TABLE carrera_depto (
    id_carrera_depto SERIAL PRIMARY KEY,
    nombre_carrera_depto VARCHAR(100) NOT NULL,
    tipo_estructura VARCHAR(30) NOT NULL,
    sede_ubicacion VARCHAR(50) NOT NULL DEFAULT 'Concepción'
);

CREATE TABLE usuario (
    rut_usuario VARCHAR(12) PRIMARY KEY,
    id_carrera_depto INTEGER NOT NULL REFERENCES carrera_depto(id_carrera_depto),
    nombre_completo VARCHAR(120) NOT NULL,
    perfil_rol VARCHAR(25) NOT NULL CHECK (perfil_rol IN ('ESTUDIANTE', 'DOCENTE', 'BIBLIOTECARIA', 'AYUDANTE')),
    correo_institucional VARCHAR(100) NOT NULL UNIQUE,
    hash_credencial VARCHAR(255) NOT NULL,
    estado_usuario VARCHAR(20) NOT NULL DEFAULT 'HABILITADO'
);

CREATE TABLE recurso (
    codigo_recurso VARCHAR(30) PRIMARY KEY,
    tipo_recurso VARCHAR(20) NOT NULL CHECK (tipo_recurso IN ('LIBRO', 'CALCULADORA', 'TABLET')),
    titulo_descripcion VARCHAR(150) NOT NULL,
    marca_autor_serie VARCHAR(100) NOT NULL,
    requiere_checklist BOOLEAN NOT NULL DEFAULT FALSE,
    estado_fisico VARCHAR(30) NOT NULL DEFAULT 'BUENO',
    estado_disponibilidad VARCHAR(20) NOT NULL DEFAULT 'DISPONIBLE'
);

CREATE TABLE prestamo (
    id_prestamo SERIAL PRIMARY KEY,
    rut_usuario VARCHAR(12) NOT NULL REFERENCES usuario(rut_usuario),
    codigo_recurso VARCHAR(30) NOT NULL REFERENCES recurso(codigo_recurso),
    fecha_hora_prestamo TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fecha_vencimiento DATE NOT NULL,
    fecha_devolucion_real DATE NULL,
    estado_fisico_entrega VARCHAR(50) NOT NULL,
    estado_fisico_devolucion VARCHAR(50) NULL,
    estado_sincronizacion VARCHAR(20) NOT NULL DEFAULT 'SINCRONIZADO',
    estado_prestamo VARCHAR(20) NOT NULL DEFAULT 'VIGENTE'
);

CREATE TABLE checklist_privacidad_tablet (
    id_checklist SERIAL PRIMARY KEY,
    id_prestamo INTEGER NOT NULL UNIQUE REFERENCES prestamo(id_prestamo),
    fecha_hora_revision TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    sesion_cerrada_verificada BOOLEAN NOT NULL,
    datos_borrados_ley_19628 BOOLEAN NOT NULL,
    observaciones VARCHAR(255) NULL
);

CREATE TABLE notificacion_correo (
    id_notificacion SERIAL PRIMARY KEY,
    id_prestamo INTEGER NOT NULL REFERENCES prestamo(id_prestamo),
    tipo_aviso VARCHAR(30) NOT NULL,
    fecha_hora_envio TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estado_envio_smtp VARCHAR(20) NOT NULL
);

CREATE TABLE parametros_sistema (
    clave_parametro VARCHAR(50) PRIMARY KEY,
    valor_parametro VARCHAR(50) NOT NULL,
    descripcion VARCHAR(200) NOT NULL
);

INSERT INTO parametros_sistema VALUES
('DIAS_PLAZO_PRESTAMO', '15', 'Plazo reglamentario estándar en días corridos (RNF-09)'),
('DIAS_AVISO_PREVENTIVO', '3', 'Días previos al vencimiento para envío de recordatorio SMTP (RF-14)'),
('DIAS_CASTIGO_POR_DIA_MORA', '4', 'Días de suspensión por cada día de atraso en devolución');
