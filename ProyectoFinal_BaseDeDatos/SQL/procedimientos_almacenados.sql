-- 1. Registrar Cita Médica
CREATE OR REPLACE PROCEDURE hospital_esquema.registrar_cita_medica(
    p_curppac VARCHAR(18),
    p_curpdoc VARCHAR(18),
    p_fecha DATE,
    p_hora TIME,
    p_duracion TIME,
    p_idhospital INT,
    p_estado VARCHAR(50) DEFAULT 'Programada'
)
LANGUAGE plpgsql AS $$
DECLARE
    v_conflicto_cita BOOLEAN;
BEGIN
    -- Verificamos disponibilidad del doctor
    SELECT EXISTS (
        SELECT 1 FROM hospital_esquema.cita 
        WHERE curpdoc = p_curpdoc 
        AND fecha = p_fecha 
        AND (
            (hora BETWEEN p_hora AND (p_hora + p_duracion::INTERVAL)) OR 
            ((hora + duracion::INTERVAL) BETWEEN p_hora AND (p_hora + p_duracion::INTERVAL))
        )
    ) INTO v_conflicto_cita;

    IF v_conflicto_cita THEN
        RAISE EXCEPTION 'El médico ya tiene una cita en ese horario';
    END IF;

    -- Insertamos o actualizamos cita
    INSERT INTO hospital_esquema.cita (
        curppac, curpdoc, fecha, hora, duracion, 
        idhospital, estado
    ) VALUES (
        p_curppac, p_curpdoc, p_fecha, p_hora, p_duracion, 
        p_idhospital, p_estado
    ) ON CONFLICT (idcita) DO UPDATE 
    SET 
        fecha = EXCLUDED.fecha,
        hora = EXCLUDED.hora,
        duracion = EXCLUDED.duracion,
        estado = EXCLUDED.estado;
END $$;


-- 2. Registrar Ingreso y Alta de Paciente Internado 
CREATE OR REPLACE PROCEDURE hospital_esquema.registrar_hospitalizacion(
    p_curppac VARCHAR(18),
    p_idhabitacion INT,
    p_idhospital INT,
    p_accion VARCHAR(10) -- 'INGRESO' o 'ALTA'
)
LANGUAGE plpgsql AS $$
DECLARE
    v_camas_disponibles INT;
    v_fecha_actual DATE := CURRENT_DATE;
BEGIN
    IF p_accion = 'INGRESO' THEN
        -- Verificamos disponibilidad de camas
        SELECT camas INTO v_camas_disponibles 
        FROM hospital_esquema.habitacion 
        WHERE idhabitacion = p_idhabitacion 
        AND idhospital = p_idhospital;

        IF v_camas_disponibles <= 0 THEN
            RAISE EXCEPTION 'No hay camas disponibles en esta habitación';
        END IF;

        -- Registramos hospitalización con valor predeterminado para "fechafin"
        INSERT INTO hospital_esquema.hospitalizacion (
            curppac, idhabitacion, idhospital, 
            fechainicio, fechafin
        ) VALUES (
            p_curppac, p_idhabitacion, p_idhospital, 
            v_fecha_actual, '9999-12-31'
        );

        -- Actualizamos disponibilidad de habitación
        UPDATE hospital_esquema.habitacion 
        SET disponibilidad = FALSE 
        WHERE idhabitacion = p_idhabitacion 
        AND idhospital = p_idhospital;

    ELSIF p_accion = 'ALTA' THEN
        -- Actualizamos fecha de alta para hospitalización en curso
        UPDATE hospital_esquema.hospitalizacion 
        SET fechafin = v_fecha_actual
        WHERE curppac = p_curppac 
        AND idhabitacion = p_idhabitacion 
        AND idhospital = p_idhospital
        AND fechafin = '9999-12-31';

        IF NOT FOUND THEN
            RAISE EXCEPTION 'No se encontró una hospitalización activa para este paciente.';
        END IF;

        -- Restauramos disponibilidad de habitación
        UPDATE hospital_esquema.habitacion 
        SET disponibilidad = TRUE 
        WHERE idhabitacion = p_idhabitacion 
        AND idhospital = p_idhospital;
    ELSE
        RAISE EXCEPTION 'Acción desconocida: %. Use INGRESO o ALTA.', p_accion;
    END IF;
END $$;


-- 3. Asignar Doctor de Guardia
CREATE OR REPLACE PROCEDURE hospital_esquema.asignar_doctor_guardia(
    IN curp_doctor VARCHAR(18),
    IN area_guardia VARCHAR(100),
    IN turno_guardia VARCHAR(50),
    IN fecha_guardia DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    conflicto INT;
BEGIN
    -- Verificamos si el doctor ya tiene una guardia en el mismo horario
    SELECT COUNT(*)
    INTO conflicto
    FROM hospital_esquema.guardias
    WHERE curpdoc = curp_doctor
      AND fecha = fecha_guardia
      AND turno = turno_guardia;

    IF conflicto > 0 THEN
        RAISE EXCEPTION 'El doctor ya tiene una guardia asignada en este turno.';
    END IF;

    -- Insertamos una nueva guardia
    INSERT INTO hospital_esquema.guardias (
        curpdoc, area, turno, fecha
    )
    VALUES (
        curp_doctor, area_guardia, turno_guardia, fecha_guardia
    );
END;
$$;


-- 4. Generar Reporte de Pacientes Atendidos por Doctor en un Rango de Fechas
CREATE OR REPLACE PROCEDURE hospital_esquema.generar_reporte_pacientes_por_doctor(
    IN curp_doctor VARCHAR(18),
    IN fecha_inicio DATE,
    IN fecha_fin DATE
)
LANGUAGE plpgsql
AS $$
DECLARE
    report_row RECORD; -- Definición de la variable como RECORD
BEGIN
    -- Verificar que las fechas sean válidas
    IF fecha_inicio > fecha_fin THEN
        RAISE EXCEPTION 'La fecha de inicio no puede ser posterior a la fecha de fin.';
    END IF;

    -- Verificar que existan citas del doctor en el rango de fechas
    PERFORM 1
    FROM hospital_esquema.cita
    WHERE curpdoc = curp_doctor
      AND fecha BETWEEN fecha_inicio AND fecha_fin;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'El doctor con CURP % no tiene pacientes atendidos en el rango especificado.', curp_doctor;
    END IF;

    -- Iterar sobre las filas y mostrar el reporte
    FOR report_row IN
        SELECT 
            p.curppac AS "CURP del Paciente",
            p.nombre || ' ' || p.apellidop || ' ' || p.apellidom AS "Nombre del Paciente",
            p.diagnosticosprevios AS "Diagnósticos Previos",
            t.descripcion AS "Tratamiento",
            c.fecha AS "Fecha de Cita",
            c.estado AS "Estado de la Cita"
        FROM hospital_esquema.atender a
        JOIN hospital_esquema.paciente p ON a.curppac = p.curppac
        JOIN hospital_esquema.cita c ON c.curppac = p.curppac AND c.curpdoc = a.curpdoc
        LEFT JOIN hospital_esquema.tratamiento t ON t.curppac = p.curppac AND t.curpdoc = a.curpdoc
        WHERE c.curpdoc = curp_doctor
          AND c.fecha BETWEEN fecha_inicio AND fecha_fin
        ORDER BY c.fecha
    LOOP
        RAISE NOTICE 'CURP: %, Nombre: %, Diagnósticos: %, Tratamiento: %, Fecha Cita: %, Estado: %',
            report_row."CURP del Paciente",
            report_row."Nombre del Paciente",
            report_row."Diagnósticos Previos",
            report_row."Tratamiento",
            report_row."Fecha de Cita",
            report_row."Estado de la Cita";
    END LOOP;

    RAISE NOTICE 'Reporte generado exitosamente.';
END;
$$;


-- 5. Registrar Nuevo Paciente 
CREATE OR REPLACE PROCEDURE hospital_esquema.registrar_nuevo_paciente(
    p_curppac VARCHAR(18),
    p_nombre VARCHAR(150),
    p_nombrep VARCHAR(50),
    p_apellidop VARCHAR(50),
    p_apellidom VARCHAR(50),
    p_fechanacimiento DATE,
    p_historial TEXT DEFAULT NULL,
    p_tratamientosprevios TEXT DEFAULT NULL,
    p_diagnosticosprevios TEXT DEFAULT NULL,
    p_alergias TEXT DEFAULT NULL,
    p_antecedentes TEXT DEFAULT NULL,
    p_visitasambulatorias TEXT DEFAULT NULL,
    p_fecha_ultima_modificacion DATE DEFAULT CURRENT_DATE,
    p_curpdoc VARCHAR(18) DEFAULT NULL
)
LANGUAGE plpgsql AS $$
BEGIN
    -- Insertar paciente con la información en la tabla paciente
    INSERT INTO hospital_esquema.paciente (
        curppac, nombre, nombrep, apellidop, apellidom,
        fechanacimiento, historialmedico, 
        tratamientosprevios, diagnosticosprevios, 
        alergias, antecedentes, visitasambulatorias, fecha_ultima_modificacion
    ) VALUES (
        p_curppac, p_nombre, p_nombrep, p_apellidop, p_apellidom,
        p_fechanacimiento, COALESCE(p_historial, 'Sin historial médico'),
        COALESCE(p_tratamientosprevios, 'Sin tratamientos previos'),
        COALESCE(p_diagnosticosprevios, 'Sin diagnósticos previos'),
        COALESCE(p_alergias, 'Sin alergias'),
        COALESCE(p_antecedentes, 'Sin antecedentes'),
        COALESCE(p_visitasambulatorias, '0'),
        COALESCE(p_fecha_ultima_modificacion, CURRENT_DATE)
    );

    -- Asignar médico de cabecera si se proporciona
    IF p_curpdoc IS NOT NULL THEN
        INSERT INTO hospital_esquema.atender (curppac, curpdoc)
        VALUES (p_curppac, p_curpdoc);
    END IF;
END $$;
