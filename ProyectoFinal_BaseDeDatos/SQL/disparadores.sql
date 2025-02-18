-- 1. Actualizar Disponibilidad de Camas
CREATE OR REPLACE FUNCTION hospital_esquema.actualizar_disponibilidad_camas()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        -- Solo resta camas si el resultado es válido
        IF NEW.idhabitacion IS NOT NULL AND NEW.idhospital IS NOT NULL AND 
           (SELECT camas FROM hospital_esquema.habitacion 
            WHERE idhabitacion = NEW.idhabitacion AND idhospital = NEW.idhospital) > 0 THEN
            UPDATE hospital_esquema.habitacion 
            SET camas = camas - 1, 
                disponibilidad = (camas - 1 > 0)
            WHERE idhabitacion = NEW.idhabitacion 
            AND idhospital = NEW.idhospital;
        END IF;
    
    ELSIF TG_OP = 'UPDATE' AND NEW.fechafin IS NOT NULL THEN
        -- Solo suma camas si es válido
        IF NEW.idhabitacion IS NOT NULL AND NEW.idhospital IS NOT NULL THEN
            UPDATE hospital_esquema.habitacion 
            SET camas = camas + 1, 
                disponibilidad = TRUE
            WHERE idhabitacion = NEW.idhabitacion 
            AND idhospital = NEW.idhospital;
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



-- 2. Actualizar Última Fecha de Modificación de Expediente Médico
CREATE OR REPLACE FUNCTION hospital_esquema.actualizar_ultima_modificacion()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE hospital_esquema.paciente
    SET fecha_ultima_modificacion = CURRENT_TIMESTAMP
    WHERE curppac = NEW.curppac;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_modificacion_tratamiento
AFTER INSERT OR UPDATE ON hospital_esquema.tratamiento
FOR EACH ROW EXECUTE FUNCTION hospital_esquema.actualizar_ultima_modificacion();



-- 3. Evitar Citas Duplicadas
CREATE OR REPLACE FUNCTION hospital_esquema.validar_cita_medica()
RETURNS TRIGGER AS $$
DECLARE 
    v_conflicto_cita BOOLEAN;
BEGIN
    SELECT EXISTS (
        SELECT 1 FROM hospital_esquema.cita 
        WHERE curpdoc = NEW.curpdoc 
        AND fecha = NEW.fecha 
        AND (
            CAST(NEW.fecha || ' ' || NEW.hora AS timestamp) 
                BETWEEN CAST(NEW.fecha || ' ' || NEW.hora AS timestamp) 
                AND CAST(NEW.fecha || ' ' || (NEW.hora::time + NEW.duracion::interval) AS timestamp)
            OR 
            CAST(NEW.fecha || ' ' || (NEW.hora::time + NEW.duracion::interval) AS timestamp) 
                BETWEEN CAST(NEW.fecha || ' ' || NEW.hora AS timestamp) 
                AND CAST(NEW.fecha || ' ' || (NEW.hora::time + NEW.duracion::interval) AS timestamp)
        )
    ) INTO v_conflicto_cita;

    IF v_conflicto_cita THEN
        RAISE EXCEPTION 'El médico ya tiene una cita en ese horario';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_validar_cita
BEFORE INSERT OR UPDATE ON hospital_esquema.cita
FOR EACH ROW EXECUTE FUNCTION hospital_esquema.validar_cita_medica();




-- 4. Verificar Existencia de Paciente
CREATE OR REPLACE FUNCTION hospital_esquema.validar_existencia_paciente()
RETURNS TRIGGER AS $$
DECLARE 
    v_paciente_existe BOOLEAN;
BEGIN
    -- Validar que el paciente exista
    SELECT EXISTS (
        SELECT 1 FROM hospital_esquema.paciente WHERE curppac = NEW.curppac
    ) INTO v_paciente_existe;

    IF NOT v_paciente_existe THEN
        RAISE EXCEPTION 'El paciente con CURP % no existe en la base de datos.', NEW.curppac;
    END IF;

    -- Establecer valor predeterminado para fechafin si es NULL
    IF NEW.fechafin IS NULL THEN
        NEW.fechafin := '9999-12-31'; -- Marcador para hospitalización activa
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_validar_paciente_hospitalizacion
BEFORE INSERT ON hospital_esquema.hospitalizacion
FOR EACH ROW
EXECUTE FUNCTION hospital_esquema.validar_existencia_paciente();




-- 5. Actualizar Saldo de Cuenta de Paciente
CREATE OR REPLACE FUNCTION hospital_esquema.gestionar_saldo_facturas()
RETURNS TRIGGER AS $$
DECLARE
    v_total_facturas NUMERIC;
    v_total_pagos NUMERIC;
BEGIN
    -- Calcular el total de facturas para el paciente
    SELECT COALESCE(SUM(totalmonto), 0) INTO v_total_facturas
    FROM hospital_esquema.factura
    WHERE curppac = NEW.curppac AND estadopago != 'Pagada';

    -- Calcular el total de pagos realizados
    SELECT COALESCE(SUM(montopagado), 0) INTO v_total_pagos
    FROM hospital_esquema.pago p
    JOIN hospital_esquema.factura f ON p.idfactura = f.idfactura
    WHERE f.curppac = NEW.curppac;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_gestionar_saldo
AFTER INSERT ON hospital_esquema.factura
FOR EACH ROW EXECUTE FUNCTION hospital_esquema.gestionar_saldo_facturas();

-- Función para consultar saldo pendiente
CREATE OR REPLACE FUNCTION hospital_esquema.calcular_saldo_paciente(curp_input TEXT)
RETURNS NUMERIC AS $$
DECLARE
    saldo NUMERIC;
BEGIN
    SELECT COALESCE(SUM(f.totalmonto), 0)
    INTO saldo
    FROM hospital_esquema.factura f
    WHERE f.curppac = curp_input;

    RETURN saldo;
END;
$$ LANGUAGE plpgsql;