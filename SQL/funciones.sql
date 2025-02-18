-- Función para Calcular la Edad de un Paciente.
CREATE OR REPLACE FUNCTION hospital_esquema.edad_paciente(fecha_nacimiento DATE)
RETURNS INT AS $$
BEGIN
    RETURN DATE_PART('year', AGE(fecha_nacimiento));
END;
$$ LANGUAGE plpgsql;

-- Función para Verficar Disponibilidad de Habitación.
CREATE OR REPLACE FUNCTION hospital_esquema.disponibilidad_habitacion(id_habitacion INT, id_hospital INT)
RETURNS BOOLEAN AS $$
DECLARE
    camas_disponibles INT;
BEGIN
    -- Obtener el número de camas de la habitación
    SELECT camas
    INTO camas_disponibles
    FROM hospital_esquema.habitacion
    WHERE idhabitacion = id_habitacion AND idhospital = id_hospital;

    -- Verificar si la habitación tiene camas disponibles
    IF camas_disponibles > 0 THEN
        RETURN TRUE; -- Habitación disponible
    ELSE
        RETURN FALSE; -- Habitación no disponible
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Función para Calcular el Costo Diario Total de Paciente.
CREATE OR REPLACE FUNCTION hospital_esquema.calcular_costo_diario_total(curp_paciente VARCHAR(18), fecha_consulta DATE)
RETURNS NUMERIC AS $$
DECLARE
    costo_habitacion NUMERIC := 0;
    costo_tratamientos NUMERIC := 0;
    costo_medicamentos NUMERIC := 0;
    costo_total NUMERIC := 0;
BEGIN
    -- Calcular el costo de la habitación
    SELECT SUM(habitacion.camas * 1000)
    INTO costo_habitacion
    FROM hospital_esquema.hospitalizacion AS hosp
    JOIN hospital_esquema.habitacion AS habitacion
    ON hosp.idhabitacion = habitacion.idhabitacion AND hosp.idhospital = habitacion.idhospital
    WHERE hosp.curppac = curp_paciente
      AND hosp.fechainicio <= fecha_consulta
      AND (hosp.fechafin IS NULL OR hosp.fechafin >= fecha_consulta);

    -- Calcular el costo de los tratamientos
    SELECT SUM(tratamiento.duracion * 2000)
    INTO costo_tratamientos
    FROM hospital_esquema.tratamiento AS tratamiento
    WHERE tratamiento.curppac = curp_paciente
      AND tratamiento.fechainicio <= fecha_consulta
      AND (tratamiento.fechainicio + tratamiento.duracion >= fecha_consulta);

    -- Calcular el costo de los medicamentos
    SELECT SUM(medicamento.dosis::NUMERIC * 500)
    INTO costo_medicamentos
    FROM hospital_esquema.receta AS receta
    JOIN hospital_esquema.medicamento AS medicamento
    ON receta.idmedicamento = medicamento.idmedicamento
    WHERE receta.curppac = curp_paciente
      AND receta.fechaemision = fecha_consulta;

    -- Sumar todos los costos
    costo_total := COALESCE(costo_habitacion, 0) + COALESCE(costo_tratamientos, 0) + COALESCE(costo_medicamentos, 0);

    RETURN costo_total;
END;
$$ LANGUAGE plpgsql;

-- Función para Obtener el Doctor de Guardia en una Área Específica.
CREATE OR REPLACE FUNCTION hospital_esquema.obtener_doctor_guardia(area VARCHAR(100), fecha DATE, turno VARCHAR(50))
RETURNS TABLE(
    nombre_doctor VARCHAR(150),
    especialidad VARCHAR(100)
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        CONCAT(medico.nombre, ' ', medico.apellidop, ' ', medico.apellidom) AS nombre_doctor,
        medico.especialidad
    FROM 
        hospital_esquema.medico
    JOIN 
        hospital_esquema.guardias
    ON 
        medico.curpdoc = guardias.curpdoc
    WHERE 
        guardias.area = area
        AND guardias.fecha = fecha
        AND guardias.turno = turno;
END;
$$ LANGUAGE plpgsql;

-- Función para Obtener el Historial de Diagnósticos de un Paciente.
CREATE OR REPLACE FUNCTION hospital_esquema.obtener_historial_diagnosticos(curp_paciente VARCHAR(18))
RETURNS TEXT AS $$
DECLARE
    historial TEXT := '';
BEGIN
    -- Concatenamos todos los diagnósticos del paciente
    SELECT STRING_AGG(diagnosticosprevios, '; ')
    INTO historial
    FROM hospital_esquema.paciente
    WHERE curppac = curp_paciente;

    -- Si no hay diagnósticos, retornar un mensaje predeterminado
    IF historial IS NULL THEN
        RETURN 'No hay diagnósticos previos para este paciente.';
    END IF;

    RETURN historial;
END;
$$ LANGUAGE plpgsql;