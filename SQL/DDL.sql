-- Creamos el esquema de Hospital
CREATE SCHEMA hospital_esquema;

-- Tabla hospital
CREATE TABLE hospital_esquema.hospital(
	idhospital SERIAL,
	nombre varchar(100),
	ubicacion varchar(255),
	trabajadores int
);

-- Llave primaria
ALTER TABLE hospital_esquema.hospital
	ADD CONSTRAINT hospital_pk PRIMARY KEY (idhospital);


-- Tabla habitacion
CREATE TABLE hospital_esquema.habitacion (
	idhabitacion SERIAL,
	disponibilidad bool,
	camas int,
	idhospital int
);

-- Llave primaria
ALTER TABLE hospital_esquema.habitacion
	ADD CONSTRAINT habitacion_pk PRIMARY KEY (idhabitacion, idhospital);


-- Tabla cita
CREATE TABLE hospital_esquema.cita (
	idcita SERIAL,
	estado varchar(50),
	fecha date,
	hora time,
	curpdoc varchar(18),
	curppac varchar(18),
	idhospital int,
	duracion time
);

-- Llave primaria
ALTER TABLE hospital_esquema.cita
	ADD CONSTRAINT cita_pk PRIMARY KEY (idcita);


-- Tabla detallescontacto
CREATE TABLE hospital_esquema.detallescontacto (
	idcontacto SERIAL,
	telefono varchar(20),
	email varchar(100),
	curpdoc varchar(18)
);

-- Llave primaria
ALTER TABLE hospital_esquema.detallescontacto
	ADD CONSTRAINT contacto_pk PRIMARY KEY (idcontacto);


-- Tabla factura
CREATE TABLE hospital_esquema.factura (
	idfactura SERIAL,
	fechaemision date,
	totalmonto numeric,
	detallesservicio text,
	estadopago varchar(50),
	curppac varchar(18)
);

-- Llave primaria
ALTER TABLE hospital_esquema.factura
	ADD CONSTRAINT factura_pk PRIMARY KEY (idfactura); 


-- Tabla medicamento
CREATE TABLE hospital_esquema.medicamento (
	idmedicamento SERIAL,
	medicamentos varchar(100),
	dosis varchar(50)
);

-- Llave primaria
ALTER TABLE hospital_esquema.medicamento
	ADD CONSTRAINT medicamento_pk PRIMARY KEY (idmedicamento);


-- Tabla medico
CREATE TABLE hospital_esquema.medico (
	curpdoc varchar(18),
	nombre varchar(150),
	nombrep varchar(50),
	apellidop varchar(50),
	apellidom varchar(50),
	fechanacimiento date,
	horario time,
	idcontacto int,
	especialidad varchar(100),
	capacidad_diaria int
);

-- Llave primaria
ALTER TABLE hospital_esquema.medico
	ADD CONSTRAINT curpdoc_pk PRIMARY KEY (curpdoc);


-- Tabla paciente
CREATE TABLE hospital_esquema.paciente (
	curppac varchar(18),
	fechanacimiento date,
	nombre varchar(150),
	nombrep varchar(50),
	apellidop varchar(50),
	apellidom varchar(50),
	historialmedico text,
	tratamientosprevios text,
	diagnosticosprevios text,
	alergias text,
	antecedentes text,
	visitasambulatorias text,
	fecha_ultima_modificacion date
);

-- Llave primaria
ALTER TABLE hospital_esquema.paciente
	ADD CONSTRAINT curppac_pk PRIMARY KEY (curppac);

-- Tabla atender
CREATE TABLE hospital_esquema.atender (
	curppac varchar(18),
	curpdoc varchar(18)
);

-- Llave primaria
ALTER TABLE hospital_esquema.atender
	ADD CONSTRAINT curppacdoc_pk PRIMARY KEY (curppac, curpdoc);

-- Tabla pago
CREATE TABLE hospital_esquema.pago (
	idpago SERIAL,
	idfactura int,
	fechapago date,
	montopagado numeric
);

-- Llave primaria
ALTER TABLE hospital_esquema.pago
	ADD CONSTRAINT pago_pk PRIMARY KEY (idpago);


-- Tabla receta
CREATE TABLE hospital_esquema.receta (
	idreceta SERIAL,
	idmedicamento int,
	curpdoc varchar(18),
	curppac varchar(18),
	fechaemision date
);

-- Llave primaria
ALTER TABLE hospital_esquema.receta
	ADD CONSTRAINT receta_pk PRIMARY KEY (idreceta);
	

-- Tabla tratamiento
CREATE TABLE hospital_esquema.tratamiento (
	idtratamiento SERIAL,
	fechainicio date,
	descripcion text,
	duracion int,
	curpdoc varchar(18),
	curppac varchar(18)
);

-- Llave primaria
ALTER TABLE hospital_esquema.tratamiento
	ADD CONSTRAINT tratamiento_pk PRIMARY KEY (idtratamiento);


-- Tabla hospitalizacion
CREATE TABLE hospital_esquema.hospitalizacion (
	idhospitalizacion SERIAL,
	curppac varchar(18),
	idhabitacion int,
	fechainicio date,
	fechafin date,
	idhospital int
);

-- Llave primaria
ALTER TABLE hospital_esquema.hospitalizacion
	ADD CONSTRAINT hospitalizacion_pk PRIMARY KEY (idhospitalizacion);


-- Tabla forma_pago
CREATE TABLE hospital_esquema.forma_pago (
	idpago int,
	forma_pago varchar(50)
);

-- Llave primaria
ALTER TABLE hospital_esquema.forma_pago
	ADD CONSTRAINT forma_pago_pk PRIMARY KEY (idpago);

-- Tabla guardias
CREATE TABLE hospital_esquema.guardias (
    idguardia SERIAL,
    curpdoc VARCHAR(18),
    area VARCHAR(100),
    fecha DATE,
    turno VARCHAR(50)
);

-- Llave primaria
ALTER TABLE hospital_esquema.guardias
    ADD CONSTRAINT guardias_pk PRIMARY KEY (idguardia);


-- Comentarios de la tabla hospital y sus columnas
COMMENT ON TABLE hospital_esquema.hospital IS 'La tabla almancena datos del Hospital';
COMMENT ON COLUMN hospital_esquema.hospital.idhospital IS 'ID del hospital';
COMMENT ON COLUMN hospital_esquema.hospital.nombre IS 'Nombre del hospital';
COMMENT ON COLUMN hospital_esquema.hospital.ubicacion IS 'Ubicacion del hospital';
COMMENT ON COLUMN hospital_esquema.hospital.trabajadores IS '# de trabajadores del hospital';


-- Restricción de la tabla habitacion
ALTER TABLE hospital_esquema.habitacion
	ADD CONSTRAINT habitacion_hospital_fk FOREIGN KEY (idhospital) REFERENCES hospital_esquema.hospital(idhospital) ON DELETE CASCADE;

-- Comentarios de la tabla habitacion y sus columnas
COMMENT ON TABLE hospital_esquema.habitacion IS 'Información sobre las habitaciones';
COMMENT ON COLUMN hospital_esquema.habitacion.idhabitacion IS 'Identificador de la habitación';
COMMENT ON COLUMN hospital_esquema.habitacion.disponibilidad IS 'Estado de disponibilidad de la habitación';
COMMENT ON COLUMN hospital_esquema.habitacion.camas IS 'Número de camas en la habitación';
COMMENT ON COLUMN hospital_esquema.habitacion.idhospital IS 'Identificador del hospital asociado a la habitación';


-- Restricciones de la tabla cita
ALTER TABLE hospital_esquema.cita
	ADD CONSTRAINT cita_hospital_fk FOREIGN KEY (idhospital) REFERENCES hospital_esquema.hospital(idhospital) ON DELETE CASCADE;

ALTER TABLE hospital_esquema.cita
	ADD CONSTRAINT cita_medico_fk FOREIGN KEY (curpdoc) REFERENCES hospital_esquema.medico(curpdoc) ON DELETE CASCADE;

ALTER TABLE hospital_esquema.cita
	ADD CONSTRAINT cita_paciente_fk FOREIGN KEY (curppac) REFERENCES hospital_esquema.paciente(curppac) ON DELETE CASCADE;

-- Comentarios de la tabla cita y sus columnas
COMMENT ON TABLE hospital_esquema.cita IS 'Información sobre las citas medicas';
COMMENT ON COLUMN hospital_esquema.cita.idcita IS 'Identificador de la cita';
COMMENT ON COLUMN hospital_esquema.cita.estado IS 'Estado de la cita';
COMMENT ON COLUMN hospital_esquema.cita.fecha IS 'Fecha de la cita';
COMMENT ON COLUMN hospital_esquema.cita.hora IS 'Hora de la cita';
COMMENT ON COLUMN hospital_esquema.cita.curpdoc IS 'CURP del médico que atiende la cita';
COMMENT ON COLUMN hospital_esquema.cita.curppac IS 'CURP del paciente que asiste a la cita';
COMMENT ON COLUMN hospital_esquema.cita.idhospital IS 'Identificador del hospital donde se realiza la cita';
COMMENT ON COLUMN hospital_esquema.cita.estado IS 'Estado de la cita (programada, realizada, cancelada)';
COMMENT ON COLUMN hospital_esquema.cita.duracion IS 'Duración que va a tener la cita';

-- Restricción de la tabla detallescontacto
ALTER TABLE hospital_esquema.detallescontacto
	ADD CONSTRAINT detallescontacto_medico_fk FOREIGN KEY (curpdoc) REFERENCES hospital_esquema.medico(curpdoc) ON DELETE CASCADE;

-- Comentarios de la tabla detallescontacto y sus columnas
COMMENT ON TABLE hospital_esquema.detallescontacto IS 'Detalles de contacto de los médicos';
COMMENT ON COLUMN hospital_esquema.detallescontacto.idcontacto IS 'Identificador de contacto';
COMMENT ON COLUMN hospital_esquema.detallescontacto.telefono IS 'Teléfono del contacto';
COMMENT ON COLUMN hospital_esquema.detallescontacto.email IS 'Correo electrónico del contacto';
COMMENT ON COLUMN hospital_esquema.detallescontacto.curpdoc IS 'CURP del médico asociado al contacto';


-- Restricción de la tabla factura
ALTER TABLE hospital_esquema.factura
	ADD CONSTRAINT factura_paciente_fk FOREIGN KEY (curppac) REFERENCES hospital_esquema.paciente(curppac) ON DELETE CASCADE;

-- Comentarios de la tabla factura y sus columnas
COMMENT ON TABLE hospital_esquema.factura IS 'Información sobre las facturas emitidas';
COMMENT ON COLUMN hospital_esquema.factura.idfactura IS 'Identificador de la factura';
COMMENT ON COLUMN hospital_esquema.factura.fechaemision IS 'Fecha de emisión de la factura';
COMMENT ON COLUMN hospital_esquema.factura.totalmonto IS 'Monto total de la factura';
COMMENT ON COLUMN hospital_esquema.factura.detallesservicio IS 'Detalles del servicio facturado';
COMMENT ON COLUMN hospital_esquema.factura.estadopago IS 'Estado del pago de la factura';
COMMENT ON COLUMN hospital_esquema.factura.curppac IS 'CURP del paciente al que se factura';


-- Comentarios de la tabla medicamento y sus columnas
COMMENT ON TABLE hospital_esquema.medicamento IS 'Información sobre los medicamentos prescritos';
COMMENT ON COLUMN hospital_esquema.medicamento.idmedicamento IS 'Identificador del medicamento';
COMMENT ON COLUMN hospital_esquema.medicamento.medicamentos IS 'Nombre del medicamento';
COMMENT ON COLUMN hospital_esquema.medicamento.dosis IS 'Dosis prescrita del medicamento';


-- Comentarios de la tabla medico y sus columnas
COMMENT ON TABLE hospital_esquema.medico IS 'Información sobre los médicos';
COMMENT ON COLUMN hospital_esquema.medico.curpdoc IS 'CURP del médico';
COMMENT ON COLUMN hospital_esquema.medico.nombre IS 'Nombre del médico';
COMMENT ON COLUMN hospital_esquema.medico.nombrep IS 'Primer nombre del médico';
COMMENT ON COLUMN hospital_esquema.medico.apellidop IS 'Apellido paterno del médico';
COMMENT ON COLUMN hospital_esquema.medico.apellidom IS 'Apellido materno del médico';
COMMENT ON COLUMN hospital_esquema.medico.fechanacimiento IS 'Fecha de nacimiento del médico';
COMMENT ON COLUMN hospital_esquema.medico.horario IS 'Horario laboral del médico';
COMMENT ON COLUMN hospital_esquema.medico.idcontacto IS 'Identificador de contacto asociado al médico';
COMMENT ON COLUMN hospital_esquema.medico.especialidad IS 'Especialidad médica del doctor';
COMMENT ON COLUMN hospital_esquema.medico.capacidad_diaria IS 'Capacidad al día de atender pacientes';


-- Comentarios de la tabla paciente y sus columnas
COMMENT ON TABLE hospital_esquema.paciente IS 'Información sobre los pacientes';
COMMENT ON COLUMN hospital_esquema.paciente.curppac IS 'CURP del paciente';
COMMENT ON COLUMN hospital_esquema.paciente.fechanacimiento IS 'Fecha de nacimiento del paciente';
COMMENT ON COLUMN hospital_esquema.paciente.nombre IS 'Nombre completo del paciente';
COMMENT ON COLUMN hospital_esquema.paciente.nombrep IS 'Primer nombre del paciente';
COMMENT ON COLUMN hospital_esquema.paciente.apellidop IS 'Apellido paterno del paciente';
COMMENT ON COLUMN hospital_esquema.paciente.apellidom IS 'Apellido materno del paciente';
COMMENT ON COLUMN hospital_esquema.paciente.historialmedico IS 'Historial médico del paciente';
COMMENT ON COLUMN hospital_esquema.paciente.tratamientosprevios IS 'Tratamientos previos del paciente';
COMMENT ON COLUMN hospital_esquema.paciente.diagnosticosprevios IS 'Diagnósticos previos del paciente';
COMMENT ON COLUMN hospital_esquema.paciente.alergias IS 'Alergias del paciente';
COMMENT ON COLUMN hospital_esquema.paciente.antecedentes IS 'Antecedentes médicos del paciente';
COMMENT ON COLUMN hospital_esquema.paciente.visitasambulatorias IS 'Visitas ambulatorias del paciente';
COMMENT ON COLUMN hospital_esquema.paciente.fecha_ultima_modificacion IS 'Fecha de la última modificación del historial médico';


-- Restricciones de la tabla atender
ALTER TABLE hospital_esquema.atender
    ADD CONSTRAINT atender_paciente_fk FOREIGN KEY (curppac) REFERENCES hospital_esquema.paciente(curppac) ON DELETE CASCADE;
    
ALTER TABLE hospital_esquema.atender
    ADD CONSTRAINT atender_medico_fk FOREIGN KEY (curpdoc) REFERENCES hospital_esquema.medico(curpdoc) ON DELETE CASCADE;
	
-- Comentarios de la tabla atender y sus columnas
COMMENT ON TABLE hospital_esquema.atender IS 'Información sobre que doctor atiende a que paciente';
COMMENT ON COLUMN hospital_esquema.atender.curppac IS 'CURP del paciente';
COMMENT ON COLUMN hospital_esquema.atender.curpdoc IS 'CURP del médico';


-- Restricción de la tabla pago
ALTER TABLE hospital_esquema.pago
	ADD CONSTRAINT pago_factura_fk FOREIGN KEY (idfactura) REFERENCES hospital_esquema.factura(idfactura) ON DELETE CASCADE;

-- Comentarios de la tabla pago y sus columnas
COMMENT ON TABLE hospital_esquema.pago IS 'Información sobre los pagos realizados';
COMMENT ON COLUMN hospital_esquema.pago.idpago IS 'Identificador del pago';
COMMENT ON COLUMN hospital_esquema.pago.idfactura IS 'Identificador de la factura asociada al pago';
COMMENT ON COLUMN hospital_esquema.pago.fechapago IS 'Fecha en la que se realizó el pago';
COMMENT ON COLUMN hospital_esquema.pago.montopagado IS 'Monto total pagado';


-- Restricciones de la tabla receta
ALTER TABLE hospital_esquema.receta
	ADD CONSTRAINT receta_medicamento_fk FOREIGN KEY (idmedicamento) REFERENCES hospital_esquema.medicamento(idmedicamento) ON DELETE CASCADE;

ALTER TABLE hospital_esquema.receta
	ADD CONSTRAINT receta_medico_fk FOREIGN KEY (curpdoc) REFERENCES hospital_esquema.medico(curpdoc) ON DELETE CASCADE;

ALTER TABLE hospital_esquema.receta
	ADD CONSTRAINT receta_paciente_fk FOREIGN KEY (curppac) REFERENCES hospital_esquema.paciente(curppac) ON DELETE CASCADE;

-- Comentarios de la tabla receta y sus columnas
COMMENT ON TABLE hospital_esquema.receta IS 'Información sobre las recetas médicas';
COMMENT ON COLUMN hospital_esquema.receta.idreceta IS 'Identificador de la receta';
COMMENT ON COLUMN hospital_esquema.receta.idmedicamento IS 'Identificador del medicamento en la receta';
COMMENT ON COLUMN hospital_esquema.receta.curpdoc IS 'CURP del médico que emitió la receta';
COMMENT ON COLUMN hospital_esquema.receta.curppac IS 'CURP del paciente que recibe la receta';
COMMENT ON COLUMN hospital_esquema.receta.fechaemision IS 'Fecha de emisión de la receta';


-- Restricciones de la tabla tratamiento
ALTER TABLE hospital_esquema.tratamiento
	ADD CONSTRAINT tratamiento_medico_fk FOREIGN KEY (curpdoc) REFERENCES hospital_esquema.medico(curpdoc) ON DELETE CASCADE;

ALTER TABLE hospital_esquema.tratamiento
	ADD CONSTRAINT tratamiento_paciente_fk FOREIGN KEY (curppac) REFERENCES hospital_esquema.paciente(curppac) ON DELETE CASCADE;

-- Comentarios de la tabla tratamiento y sus columnas
COMMENT ON TABLE hospital_esquema.tratamiento IS 'Información sobre los tratamientos realizados';
COMMENT ON COLUMN hospital_esquema.tratamiento.idtratamiento IS 'Identificador del tratamiento';
COMMENT ON COLUMN hospital_esquema.tratamiento.fechainicio IS 'Fecha de inicio del tratamiento';
COMMENT ON COLUMN hospital_esquema.tratamiento.descripcion IS 'Descripción del tratamiento';
COMMENT ON COLUMN hospital_esquema.tratamiento.duracion IS 'Duración del tratamiento en días';
COMMENT ON COLUMN hospital_esquema.tratamiento.curpdoc IS 'CURP del médico responsable del tratamiento';
COMMENT ON COLUMN hospital_esquema.tratamiento.curppac IS 'CURP del paciente sometido al tratamiento';


-- Restricciones de la tabla hospitalización
ALTER TABLE hospital_esquema.hospitalizacion
	ADD CONSTRAINT hospitalizacion_paciente_fk FOREIGN KEY (curppac) REFERENCES hospital_esquema.paciente(curppac) ON DELETE CASCADE;

ALTER TABLE hospital_esquema.hospitalizacion
	ADD CONSTRAINT hospitalizacion_habitacion_fk FOREIGN KEY (idhabitacion, idhospital) REFERENCES hospital_esquema.habitacion(idhabitacion, idhospital) ON DELETE CASCADE;

-- Comentarios en la tabla hospitalizacion y sus columnas
COMMENT ON TABLE hospital_esquema.hospitalizacion IS 'Información sobre las hospitalizaciones de los pacientes';
COMMENT ON COLUMN hospital_esquema.hospitalizacion.idhospitalizacion IS 'Identificador de la hospitalización';
COMMENT ON COLUMN hospital_esquema.hospitalizacion.curppac IS 'CURP del paciente hospitalizado';
COMMENT ON COLUMN hospital_esquema.hospitalizacion.idhabitacion IS 'Identificador de la habitación';
COMMENT ON COLUMN hospital_esquema.hospitalizacion.fechainicio IS 'Fecha de inicio de la hospitalización';
COMMENT ON COLUMN hospital_esquema.hospitalizacion.fechafin IS 'Fecha de fin de la hospitalización';
COMMENT ON COLUMN hospital_esquema.hospitalizacion.idhospital IS 'Identificador del hospital';


-- Restricciones de la tabla forma_pago
ALTER TABLE hospital_esquema.forma_pago
	ADD CONSTRAINT forma_pago_fk FOREIGN KEY (idpago) REFERENCES hospital_esquema.pago(idpago) ON DELETE CASCADE;

-- Comentarios de la tabla forma_pago y sus columnas
COMMENT ON TABLE hospital_esquema.forma_pago IS 'Información sobre la forma de pago utilizada en cada factura';
COMMENT ON COLUMN hospital_esquema.forma_pago.idpago IS 'Identificador de la forma de pago';
COMMENT ON COLUMN hospital_esquema.forma_pago.forma_pago IS 'Tipo de forma de pago (tarjeta, efectivo, transferencia, etc.)';


-- Restricción a la tabla guardias
ALTER TABLE hospital_esquema.guardias
    ADD CONSTRAINT guardias_curpdoc_fk FOREIGN KEY (curpdoc) REFERENCES hospital_esquema.medico(curpdoc) ON DELETE CASCADE;

-- Comentarios de la tabla guardias y sus columnas
COMMENT ON TABLE hospital_esquema.guardias IS 'Tabla que almacena la información de las guardias de los médicos en las diferentes áreas del hospital';
COMMENT ON COLUMN hospital_esquema.guardias.idguardia IS 'Identificador único de la guardia';
COMMENT ON COLUMN hospital_esquema.guardias.curpdoc IS 'CURP del médico asignado a la guardia';
COMMENT ON COLUMN hospital_esquema.guardias.area IS 'Área hospitalaria asignada a la guardia (ejemplo: Urgencias, Pediatría)';
COMMENT ON COLUMN hospital_esquema.guardias.fecha IS 'Fecha en la que el médico debe realizar la guardia';
COMMENT ON COLUMN hospital_esquema.guardias.turno IS 'Turno de la guardia (ejemplo: Mañana, Tarde, Noche)';



-- INTEGRIDAD

-- Tabla hospital
ALTER TABLE hospital_esquema.hospital
    ALTER COLUMN idhospital SET NOT NULL,
    ALTER COLUMN nombre SET NOT NULL,
    ALTER COLUMN ubicacion SET NOT NULL,
    ALTER COLUMN trabajadores SET NOT NULL,
    ADD CONSTRAINT trabajadores_check CHECK (trabajadores >= 0),
    ADD CONSTRAINT nombre_unique UNIQUE (nombre);

-- Tabla habitacion
ALTER TABLE hospital_esquema.habitacion
    ALTER COLUMN idhabitacion SET NOT NULL,
    ALTER COLUMN disponibilidad SET NOT NULL,
    ALTER COLUMN camas SET NOT NULL,
    ALTER COLUMN idhospital SET NOT NULL,
    ADD CONSTRAINT camas_check CHECK (camas > 0);

-- Tabla cita
ALTER TABLE hospital_esquema.cita
    ALTER COLUMN idcita SET NOT NULL,
    ALTER COLUMN estado SET NOT NULL,
    ALTER COLUMN fecha SET NOT NULL,
    ALTER COLUMN hora SET NOT NULL,
    ALTER COLUMN curpdoc SET NOT NULL,
    ALTER COLUMN curppac SET NOT NULL,
    ALTER COLUMN idhospital SET NOT NULL,
    ALTER COLUMN duracion SET NOT NULL,
    ADD CONSTRAINT estado_check CHECK (estado IN ('Programada', 'Completada', 'Cancelada', 'Reprogramada', 'No Asistida')),
    ADD CONSTRAINT duracion_check CHECK (duracion > '00:00:00');

-- Tabla detallescontacto
ALTER TABLE hospital_esquema.detallescontacto
    ALTER COLUMN idcontacto SET NOT NULL,
    ALTER COLUMN telefono SET NOT NULL,
    ALTER COLUMN email SET NOT NULL,
    ALTER COLUMN curpdoc SET NOT NULL,
    ADD CONSTRAINT email_unique UNIQUE (email),
    ADD CONSTRAINT telefono_unique UNIQUE (telefono);

-- Tabla factura
ALTER TABLE hospital_esquema.factura
    ALTER COLUMN idfactura SET NOT NULL,
    ALTER COLUMN fechaemision SET NOT NULL,
    ALTER COLUMN totalmonto SET NOT NULL,
    ALTER COLUMN estadopago SET NOT NULL,
    ALTER COLUMN curppac SET NOT NULL,
    ADD CONSTRAINT totalmonto_check CHECK (totalmonto > 0),
    ADD CONSTRAINT estadopago_check CHECK (estadopago IN ('Pagada', 'Pendiente', 'Cancelada'));

-- Tabla medicamento
ALTER TABLE hospital_esquema.medicamento
    ALTER COLUMN idmedicamento SET NOT NULL,
    ALTER COLUMN medicamentos SET NOT NULL,
    ALTER COLUMN dosis SET NOT NULL,
    ADD CONSTRAINT medicamentos_unique UNIQUE (medicamentos);

-- Tabla medico
ALTER TABLE hospital_esquema.medico
    ALTER COLUMN curpdoc SET NOT NULL,
    ALTER COLUMN nombre SET NOT NULL,
    ALTER COLUMN especialidad SET NOT NULL,
    ALTER COLUMN horario SET NOT NULL,
    ALTER COLUMN capacidad_diaria SET NOT NULL,
    ALTER COLUMN idcontacto SET NOT NULL,
    ADD CONSTRAINT capacidad_diaria_check CHECK (capacidad_diaria > 0);

-- Tabla paciente
ALTER TABLE hospital_esquema.paciente
    ALTER COLUMN curppac SET NOT NULL,
    ALTER COLUMN fechanacimiento SET NOT NULL,
    ALTER COLUMN nombre SET NOT NULL,
    ALTER COLUMN historialmedico SET NOT NULL,
    ADD CONSTRAINT fecha_ultima_modificacion_check CHECK (fecha_ultima_modificacion <= CURRENT_DATE),
    ADD CONSTRAINT fechanacimiento_check CHECK (fechanacimiento < CURRENT_DATE);

-- Tabla atender
ALTER TABLE hospital_esquema.atender
    ALTER COLUMN curppac SET NOT NULL,
    ALTER COLUMN curpdoc SET NOT NULL,
   ADD CONSTRAINT atender_unique UNIQUE (curppac, curpdoc);

-- Tabla pago
ALTER TABLE hospital_esquema.pago
    ALTER COLUMN idpago SET NOT NULL,
    ALTER COLUMN idfactura SET NOT NULL,
    ALTER COLUMN fechapago SET NOT NULL,
    ALTER COLUMN montopagado SET NOT NULL,
    ADD CONSTRAINT montopagado_check CHECK (montopagado > 0);

-- Tabla receta
ALTER TABLE hospital_esquema.receta
    ALTER COLUMN idreceta SET NOT NULL,
    ALTER COLUMN idmedicamento SET NOT NULL,
    ALTER COLUMN curpdoc SET NOT NULL,
    ALTER COLUMN curppac SET NOT NULL,
    ALTER COLUMN fechaemision SET NOT NULL,
    ADD CONSTRAINT fechaemision_check CHECK (fechaemision <= CURRENT_DATE);

-- Tabla tratamiento
ALTER TABLE hospital_esquema.tratamiento
    ALTER COLUMN idtratamiento SET NOT NULL,
    ALTER COLUMN fechainicio SET NOT NULL,
    ALTER COLUMN descripcion SET NOT NULL,
    ALTER COLUMN duracion SET NOT NULL,
    ALTER COLUMN curpdoc SET NOT NULL,
    ALTER COLUMN curppac SET NOT NULL,
    ADD CONSTRAINT duracion_check CHECK (duracion > 0),
    ADD CONSTRAINT fechainicio_check CHECK (fechainicio <= CURRENT_DATE);

-- Tabla hospitalizacion
ALTER TABLE hospital_esquema.hospitalizacion
    ALTER COLUMN idhospitalizacion SET NOT NULL,
    ALTER COLUMN curppac SET NOT NULL,
    ALTER COLUMN idhabitacion SET NOT NULL,
    ALTER COLUMN fechainicio SET NOT NULL,
    ALTER COLUMN fechafin SET NOT NULL,
    ALTER COLUMN idhospital SET NOT NULL,
    ADD CONSTRAINT hospitalizacion_check CHECK (fechafin >= fechainicio);

-- Tabla forma_pago
ALTER TABLE hospital_esquema.forma_pago
    ALTER COLUMN idpago SET NOT NULL,
    ALTER COLUMN forma_pago SET NOT NULL,
    ADD CONSTRAINT forma_pago_check CHECK (forma_pago IN ('Tarjeta de crédito', 'Tarjeta de débito', 'Efectivo', 'Transferencia bancaria', 'Cheque', 'PayPal'));
 
-- Tabla guardias
ALTER TABLE hospital_esquema.guardias
    ALTER COLUMN curpdoc SET NOT NULL, 
    ALTER COLUMN area SET NOT NULL, 
    ALTER COLUMN fecha SET NOT NULL, 
    ALTER COLUMN turno SET NOT NULL;