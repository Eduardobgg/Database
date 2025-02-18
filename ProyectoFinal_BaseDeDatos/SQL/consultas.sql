--1. Consulta de Costo Total de Hospitalizacion.
-- Supongamos que el CURP del paciente es 'FMMR040429HDFMRC01' y la fecha es '2024-12-10'
WITH costos_desglosados AS (
    SELECT 
        SUM(habitacion.camas * 1000) AS costo_habitacion,
        SUM(tratamiento.duracion * 2000) AS costo_tratamientos,
        SUM(
            COALESCE(REGEXP_REPLACE(medicamento.dosis, '[^0-9]', '', 'g')::NUMERIC, 0) * 500
        ) AS costo_medicamentos
    FROM 
        hospital_esquema.hospitalizacion AS hosp
    LEFT JOIN 
        hospital_esquema.habitacion AS habitacion
        ON hosp.idhabitacion = habitacion.idhabitacion AND hosp.idhospital = habitacion.idhospital
    LEFT JOIN 
        hospital_esquema.tratamiento AS tratamiento
        ON tratamiento.curppac = hosp.curppac
    LEFT JOIN 
        hospital_esquema.receta AS receta
        ON receta.curppac = hosp.curppac
    LEFT JOIN 
        hospital_esquema.medicamento AS medicamento
        ON receta.idmedicamento = medicamento.idmedicamento
    WHERE 
        hosp.curppac = 'FMMR040429HDFMRC01' -- CURP del paciente
        AND hosp.fechainicio <= '2024-01-15' -- Fecha de consulta
        AND (hosp.fechafin IS NULL OR hosp.fechafin >= '2024-01-20')
)
SELECT 
    COALESCE(costo_habitacion, 0) AS costo_habitacion,
    COALESCE(costo_tratamientos, 0) AS costo_tratamientos,
    COALESCE(costo_medicamentos, 0) AS costo_medicamentos,
    COALESCE(costo_habitacion, 0) + COALESCE(costo_tratamientos, 0) + COALESCE(costo_medicamentos, 0) AS costo_total
FROM 
    costos_desglosados;




-- 2. Historial Completo de Diagnosticos y Tratamientos de un Paciente.
-- Ejemplo para un paciente con CURP 'FMMR040429HDFMRC01'
WITH historial_diagnosticos AS (
    SELECT 
        hospital_esquema.obtener_historial_diagnosticos('FMMR040429HDFMRC01') AS diagnosticos
),
historial_tratamientos AS (
    SELECT 
        tratamiento.descripcion AS tratamiento,
        tratamiento.duracion AS duracion_dias,
        CONCAT(medico.nombre, ' ', medico.apellidop, ' ', medico.apellidom) AS medico_responsable
    FROM 
        hospital_esquema.tratamiento
    JOIN 
        hospital_esquema.medico
    ON 
        tratamiento.curpdoc = medico.curpdoc
    WHERE 
        tratamiento.curppac = 'FMMR040429HDFMRC01' -- CURP del paciente
)
SELECT 
    diagnos.diagnosticos AS "Historial de Diagnósticos",
    trat.tratamiento AS "Tratamiento",
    trat.duracion_dias AS "Duración (Días)",
    trat.medico_responsable AS "Médico Responsable"
FROM 
    historial_diagnosticos diagnos
FULL OUTER JOIN 
    historial_tratamientos trat ON TRUE; -- Combina diagnósticos y tratamientos


-- 3. Pacientes Atendidos por un Doctor en un Periodo Especıfico .
WITH pacientes_atendidos AS (
    SELECT 
        paciente.curppac AS curp_paciente,
        CONCAT(paciente.nombre, ' ', paciente.apellidop, ' ', paciente.apellidom) AS nombre_completo,
        paciente.fechanacimiento AS fecha_nacimiento,
        cita.fecha AS fecha_atencion
    FROM 
        hospital_esquema.cita AS cita
    JOIN 
        hospital_esquema.paciente AS paciente
    ON 
        cita.curppac = paciente.curppac
    WHERE 
        cita.curpdoc = 'JPG800515HDFGRN062' -- CURP del doctor
        AND cita.fecha BETWEEN '2024-01-01' AND '2024-12-31' -- Rango de fechas
)
SELECT 
    curp_paciente AS "CURP del Paciente",
    nombre_completo AS "Nombre Completo",
    hospital_esquema.edad_paciente(fecha_nacimiento) AS "Edad",
    fecha_atencion AS "Fecha de Atención"
FROM 
    pacientes_atendidos
ORDER BY 
    fecha_atencion;


-- 4. Disponibilidad Actual de Camas en el Hospital.
WITH disponibilidad_camas AS (
    SELECT 
        habitacion.idhabitacion AS id_habitacion,
        habitacion.idhospital AS id_hospital,
        habitacion.camas AS total_camas,
        CASE 
            WHEN habitacion.disponibilidad THEN habitacion.camas
            ELSE 0
        END AS camas_disponibles
    FROM 
        hospital_esquema.habitacion
)
SELECT 
    id_hospital AS "ID del Hospital",
    id_habitacion AS "ID de la Habitación",
    total_camas AS "Total de Camas",
    camas_disponibles AS "Camas Disponibles"
FROM 
    disponibilidad_camas
ORDER BY 
    id_hospital, id_habitacion;


-- 5. Reporte de Costos Diarios de Hospitalizacion.
-- Supongamos que queremos el reporte para el día '2024-12-10'
WITH costos_diarios AS (
    SELECT 
        hosp.curppac AS curp_paciente,
        CONCAT(pac.nombre, ' ', pac.apellidop, ' ', pac.apellidom) AS nombre_paciente,
        hosp.idhospital AS id_hospital,
        COALESCE(SUM(habitacion.camas * 1000), 0) AS costo_habitacion,
        COALESCE(SUM(tratamiento.duracion * 2000), 0) AS costo_tratamientos,
        COALESCE(SUM(REGEXP_REPLACE(medicamento.dosis, '[^0-9]', '', 'g')::NUMERIC * 500), 0) AS costo_medicamentos
    FROM 
        hospital_esquema.hospitalizacion AS hosp
    LEFT JOIN 
        hospital_esquema.habitacion AS habitacion
        ON hosp.idhabitacion = habitacion.idhabitacion AND hosp.idhospital = habitacion.idhospital
    LEFT JOIN 
        hospital_esquema.paciente AS pac
        ON hosp.curppac = pac.curppac
    LEFT JOIN 
        hospital_esquema.tratamiento AS tratamiento
        ON tratamiento.curppac = hosp.curppac AND tratamiento.fechainicio <= '2024-02-05' AND (tratamiento.fechainicio + tratamiento.duracion >= '2024-02-10')
    LEFT JOIN 
        hospital_esquema.receta AS receta
        ON receta.curppac = hosp.curppac AND receta.fechaemision = '2024-01-10'
    LEFT JOIN 
        hospital_esquema.medicamento AS medicamento
        ON receta.idmedicamento = medicamento.idmedicamento
    WHERE 
        hosp.fechainicio <= '2024-02-10' AND (hosp.fechafin IS NULL OR hosp.fechafin >= '2024-02-10')
    GROUP BY 
        hosp.curppac, pac.nombre, pac.apellidop, pac.apellidom, hosp.idhospital
)
SELECT 
    curp_paciente AS "CURP del Paciente",
    nombre_paciente AS "Nombre del Paciente",
    id_hospital AS "ID del Hospital",
    costo_habitacion AS "Costo Habitación",
    costo_tratamientos AS "Costo Tratamientos",
    costo_medicamentos AS "Costo Medicamentos",
    (costo_habitacion + costo_tratamientos + costo_medicamentos) AS "Costo Total Diario"
FROM 
    costos_diarios
ORDER BY 
    id_hospital, nombre_paciente;


-- 6. Consulta de Doctores de Guardia por Area y Fecha.
-- Supongamos que queremos consultar doctores de guardia en "Urgencias" el "2024-01-01"
SELECT 
    CONCAT(medico.nombre, ' ', medico.apellidop, ' ', medico.apellidom) AS nombre_doctor,
    medico.especialidad AS especialidad,	
    guardias.turno AS turno,
    guardias.fecha AS fecha_guardia
FROM 
    hospital_esquema.guardias
JOIN 
    hospital_esquema.medico
ON 
    guardias.curpdoc = medico.curpdoc
WHERE 
    guardias.area = 'Urgencias'
    AND guardias.fecha = '2024-01-01'
ORDER BY 
    guardias.turno, nombre_doctor;


-- 7. Consulta de Diagnosticos Frecuentes.
   WITH diagnosticos_frecuentes AS (
    SELECT 
        UNNEST(STRING_TO_ARRAY(paciente.diagnosticosprevios, '; ')) AS diagnostico, -- Divide los diagnósticos concatenados
        COUNT(*) AS frecuencia
    FROM 
        hospital_esquema.paciente
    WHERE 
        EXISTS (
            SELECT 1
            FROM hospital_esquema.cita
            WHERE cita.curppac = paciente.curppac
              AND cita.fecha >= CURRENT_DATE - INTERVAL '1 year' -- Último año
        )
    GROUP BY 
        diagnostico
)
SELECT 
    diagnostico AS "Diagnóstico",
    frecuencia AS "Frecuencia"
FROM 
    diagnosticos_frecuentes
ORDER BY 
    frecuencia DESC, diagnostico;