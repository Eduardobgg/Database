Flores Muñoz Mauricio Num. Cuenta: 320236589
Garcia Gomez Eduardo Biali Num. Cuenta: 320113987

------------------------------------------------------

Primero, nos conectamos a mi base de datos en DBeaver y primero ejecuto mi archivo DDL.sql para crear las tablas de mi base de Datos, una vez creado arrastro el archivo disparadores.sql, selecciono todo el codigo y le doy en el boton ejecutar comando sql, repito este proceso con el resto de archivos, primero con procedimientos_almacenados.sql, funciones.sql, consultas.sql y por ultimo el archivo DML.sql

-------------------------------------------------------

Probar los "procedimientos almacenados"

Primero selecciona el procedimiento que quieras probar, una vez seleccionado, presionas el boton de "ejecutar comando sql"
ahora aqui dejamos los comando que usamos para asegurarnos de que los procedimientos funcionen correctamente, para probarlos, solo copia y pega al final o ya sea al terminar el codigo del procedimiento que elijas dentro del script "procedimientos_almacenados.sql"

1. Registrar Cita Médica
Prueba registrando una nueva cita médica para un paciente:

CALL hospital_esquema.registrar_cita_medica(
    'FMMR040429HDFMRC01',  -- CURP del paciente
    'JPG800515HDFGRN062',  -- CURP del doctor
    '2024-12-17',          -- Fecha de la cita
    '09:00:00',            -- Hora de la cita
    '01:00:00',            -- Duración de la cita
    1,                     -- ID del hospital
    'Programada'           -- Estado de la cita
);
-- Verificar citas
SELECT * FROM hospital_esquema.cita WHERE curppac = 'FMMR040429HDFMRC01';


2. Registrar Ingreso de Paciente Internado, YA QUE LOS PACIENTES QUE TENEMOS EN NUESTRA BASE DE DATOS YA CUENTAN CON SU INGRESO Y SU ALTA PROCEDEMOS A CREAR UN PACIENTE NUEVO EN EL EJERCICIO 5

Prueba registrando un ingreso para un paciente:
CALL hospital_esquema.registrar_hospitalizacion(
    'CURP12345TEST01', -- CURP del paciente
    1,                    -- ID de la habitación
    1,                    -- ID del hospital
    'INGRESO'             -- Acción (Ingreso)
);


-- Verificar hospitalizaciones
SELECT * FROM hospital_esquema.hospitalizacion WHERE curppac = 'CURP12345TEST01';

Registrar el alta del mismo paciente:

CALL hospital_esquema.registrar_hospitalizacion(
    'CURP12345TEST01', -- CURP del paciente
    1,                    -- ID de la habitación
    1,                    -- ID del hospital
    'ALTA'                -- Acción (Alta)
);


-- Verificar hospitalizaciones
SELECT * FROM hospital_esquema.hospitalizacion WHERE curppac = 'CURP12345TEST01';


3. Asignar Doctor de Guardia
Prueba asignando un doctor de guardia a un área específica:

CALL hospital_esquema.asignar_doctor_guardia(
    'JPG800515HDFGRN062',  -- CURP del doctor
    'Urgencias',           -- Área de guardia
    'Matutino',              -- Turno de guardia
    '2024-12-16'           -- Fecha de guardia
);

-- Verificar guardias
SELECT * FROM hospital_esquema.guardias WHERE curpdoc = 'JPG800515HDFGRN062';


4. Generar Reporte de Pacientes Atendidos por un Doctor
Genera un reporte de pacientes atendidos por un doctor en un rango de fechas:

CALL hospital_esquema.generar_reporte_pacientes_por_doctor(
    'JPG800515HDFGRN062',  -- CURP del doctor
    '2024-01-01',          -- Fecha de inicio
    '2024-12-31'           -- Fecha de fin
);

-- Verificar relación con médico
SELECT * FROM hospital_esquema.atender WHERE curppac = 'FMMR040429HDFMRC01';

5. Registrar Nuevo Paciente, CREAMOS EL NUEVO PACIENTE EN CASO DE NO TENER UN PACIENTE SIN INGRESO Y ALTA EN EL EJERCICIO 2
Prueba registrando un nuevo paciente y asignándole un médico de cabecera:

CALL hospital_esquema.registrar_nuevo_paciente(
    'CURP12345TEST01',  -- CURP del paciente
    'Joshi Perez',      -- Nombre completo
    'Joshi',            -- Primer nombre
    'Perez',            -- Apellido paterno
    'Gomez',            -- Apellido materno
    '1990-01-01',       -- Fecha de nacimiento
    'Sin historial médico',      -- Historial médico
    'Sin tratamientos previos', -- Tratamientos previos
    'Sin diagnósticos previos', -- Diagnósticos previos
    'Sin alergias',             -- Alergias
    'Sin antecedentes',         -- Antecedentes
    '0',                        -- Visitas ambulatorias
    CURRENT_DATE,               -- Fecha de última modificación
    'JPG800515HDFGRN062'        -- CURP del médico de cabecera
);


-- Verificar nuevo paciente
SELECT * FROM hospital_esquema.paciente WHERE curppac = 'CURP12345TEST01';



------------------------------------------------------------------------

Disparadores


Para probar los disparadores, seguimos la misma tecnica, ejecutamos todo el script 

1. Probar Actualizar Disponibilidad de Camas

INSERT INTO hospital_esquema.hospitalizacion (
    curppac, idhabitacion, idhospital, fechainicio, fechafin
) VALUES (
    'GGHE021013HDFBLA03', 1, 1, CURRENT_DATE, '9999-12-31'
);

-- Verificar actualización de camas
SELECT * FROM hospital_esquema.habitacion WHERE idhabitacion = 1 AND idhospital = 1;

-- Prueba 2: Registrar alta
UPDATE hospital_esquema.hospitalizacion
SET fechafin = CURRENT_DATE
WHERE curppac = 'FMMR040429HDFMRC01' AND idhabitacion = 1 AND idhospital = 1 AND fechafin IS NULL;

-- Verificar actualización de camas
SELECT * FROM hospital_esquema.habitacion WHERE idhabitacion = 1 AND idhospital = 1;



2. Probar Actualizar Última Fecha de Modificación
Inserta o actualiza un tratamiento para verificar la actualización de la columna fecha_ultima_modificacion:

-- Prueba 1: Insertar tratamiento
INSERT INTO hospital_esquema.tratamiento (fechainicio, descripcion, duracion, curpdoc, curppac)
VALUES ('2024-12-01', 'Terapia respiratoria', 30, 'JPG800515HDFGRN062', 'FMMR040429HDFMRC01');

-- Verificar fecha de modificación
SELECT fecha_ultima_modificacion FROM hospital_esquema.paciente WHERE curppac = 'FMMR040429HDFMRC01';

-- Prueba 2: Actualizar tratamiento
UPDATE hospital_esquema.tratamiento
SET descripcion = 'Terapia respiratoria intensiva'
WHERE curpdoc = 'JPG800515HDFGRN062' AND curppac = 'FMMR040429HDFMRC01';

-- Verificar fecha de modificación
SELECT fecha_ultima_modificacion FROM hospital_esquema.paciente WHERE curppac = 'FMMR040429HDFMRC01';




3. Probar Evitar Citas Duplicadas
Intenta insertar una cita en un horario ya ocupado por el mismo doctor:

-- Prueba 1: Insertar cita válida
INSERT INTO hospital_esquema.cita (curppac, curpdoc, fecha, hora, duracion, idhospital, estado)
VALUES ('FMMR040429HDFMRC01', 'JPG800515HDFGRN062', '2024-12-15', '09:00:00', '01:00:00', 1, 'Programada');

-- Verificar citas
SELECT * FROM hospital_esquema.cita WHERE curpdoc = 'JPG800515HDFGRN062' AND fecha = '2024-12-15';

-- Prueba 2: Insertar cita en conflicto
INSERT INTO hospital_esquema.cita (curppac, curpdoc, fecha, hora, duracion, idhospital, estado)
VALUES ('FRAN040510MDFLPL02', 'JPG800515HDFGRN062', '2024-12-15', '09:30:00', '01:00:00', 1, 'Programada');

-- Verificar citas
SELECT * FROM hospital_esquema.cita WHERE curpdoc = 'JPG800515HDFGRN062' AND fecha = '2024-12-15';





4. Probar Verificar Existencia de Paciente
Intenta registrar una hospitalización para un paciente inexistente:

INSERT INTO hospital_esquema.hospitalizacion (
    curppac, idhabitacion, idhospital, fechainicio, fechafin
) VALUES (
    'GGHE021013HDFBLA03', 1, 1, CURRENT_DATE, '9999-12-31'
);


-- Prueba 2: Insertar hospitalización para un paciente inexistente
INSERT INTO hospital_esquema.hospitalizacion (curppac, idhabitacion, idhospital, fechainicio, fechafin)
VALUES ('CURP_NO_EXISTE', 1, 1, CURRENT_DATE, NULL);

SELECT * FROM hospital_esquema.hospitalizacion WHERE curppac = 'GGHE021013HDFBLA03';





5. Probar Actualizar Saldo de Cuenta de Paciente
- Consulta el saldo de un paciente:
SELECT hospital_esquema.calcular_saldo_paciente('FMMR040429HDFMRC01') AS saldo_pendiente;

- Inserta una factura para probar el cálculo dinámico:
INSERT INTO hospital_esquema.factura (fechaemision, totalmonto, detallesservicio, estadopago, curppac)
VALUES ('2024-12-01', 2000.00, 'Consulta médica', 'Pendiente', 'FMMR040429HDFMRC01');

- Registra un pago asociado a esa factura:
INSERT INTO hospital_esquema.pago (idfactura, montopagado, fechapago)
VALUES (1, 500.00, '2024-12-02');

- Consulta nuevamente el saldo:
SELECT hospital_esquema.calcular_saldo_paciente('FMMR040429HDFMRC01') AS saldo_pendiente;

-------------------------------------------------------------------

Consultas


para las consultas, solo selecciona la consulta que deseas realizar, seleccionala y presiona el boton ejecutar comando sql.
