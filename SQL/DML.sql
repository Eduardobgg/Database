-- Insert de la tabla hospital
INSERT INTO hospital_esquema.hospital (nombre, ubicacion, trabajadores) VALUES
('Hospital General de México', 'Avenida Principal 123, Ciudad Central', 100),
('Centro Médico Nacional Siglo XXI', 'Calle Secundaria 456, Ciudad Regional', 150),
('Hospital Ángeles del Pedregal', 'Calle del Norte 789, Ciudad Norte', 50),
('Hospital ABC', 'Avenida del Sur 321 Ciudad Sur', 25),
('Hospital Español', 'Calle Sol 123, Ciudad Sol', 30),
('Hospital Juárez de México', 'Calle Luna 456, Ciudad Luna', 45),
('Hospital Infantil de México Federico Gómez', 'Avenida General 789, Ciudad General', 200),
('Hospital Médica Sur', 'Calle Niños 321, Ciudad Niños', 220),
('Hospital Zambrano Hellion', 'Calle San José 456, Ciudad José', 180),
('Hospital Central Militar', 'Avenida María 123, Ciudad Santa', 270),
('Hospital de la Mujer', 'Calle Ángeles 456, Ciudad Ángeles', 130),
('Hospital General de Tijuana', 'Calle Este 789, Ciudad Este', 190),
('Hospital General de Ciudad Juárez', 'Avenida Oeste 321, Ciudad Oeste', 160),
('Hospital Regional de Alta Especialidad de Yucatán', 'Calle Esperanza 456, Ciudad Esperanza', 140),
('Hospital General Regional No. 25 IMSS', 'Avenida Privada 789, Ciudad Privada', 210),
('Hospital San Juan', 'Av. Siempre Viva 742, Ciudad B', 85),
('Clínica La Esperanza', 'Calle Futura, Ciudad C', 50),
('Hospital Universitario', 'Av. Reforma, Ciudad D', 200),
('Hospital de Especialidades Médicas', 'Calle Salud, Ciudad E', 150),
('Centro Médico Integral', 'Av. Central, Ciudad F', 75),
('Clínica Bienestar', 'Av. Azul, Ciudad U', 45),
('Hospital de Rehabilitación', 'Calle Avance, Ciudad V', 65),
('Hospital Central', 'Av. Grande, Ciudad W', 250),
('Clínica Familiar San José', 'Calle Unión, Ciudad X', 35),
('Hospital del Sol', 'Calle Calor, Ciudad Y', 140);


-- Insert de la tabla medico
INSERT INTO hospital_esquema.medico (curpdoc, nombre, nombrep, apellidop, apellidom, fechanacimiento, horario, idcontacto, capacidad_diaria, especialidad) VALUES
('JPG800515HDFGRN062', 'Juan Perez Garcia', 'Juan', 'Perez', 'Garcia', '1980-05-15', '08:00:00', 1, 3, 'Cardiología'),
('MLM750822MDFZRB072', 'Maria Lopez Martinez', 'Maria', 'Lopez', 'Martinez', '1975-08-22', '09:00:00', 2, 3, 'Pediatría'),
('CSH821130HDFNRL082', 'Carlos Sanchez Hernandez', 'Carlos', 'Sanchez', 'Hernandez', '1982-11-30', '10:00:00', 3, 3, 'Dermatología'),
('ARD880312HDFDRL052', 'Ana Ramirez Diaz', 'Ana', 'Ramirez', 'Diaz', '1988-03-12', '11:00:00', 4, 3, 'Ginecología'),
('PGV900704HDFRZR092', 'Pedro Gomez Vazquez', 'Pedro', 'Gomez', 'Vazquez', '1990-07-04', '12:00:00', 5, 3, 'Neurología'),
('LMS790218HDFGRS012', 'Laura Martinez Soto', 'Laura', 'Martinez', 'Soto', '1979-02-18', '13:00:00', 6, 3, 'Psiquiatría'),
('JFM850921HDFNRL052', 'Jose Fernandez Morales', 'Jose', 'Fernandez', 'Morales', '1985-09-21', '14:00:00', 7, 3, 'Oncología'),
('LTN830617HDFNRZ032', 'Lucia Torres Navarro', 'Lucia', 'Torres', 'Navarro', '1983-06-17', '15:00:00', 8, 3, 'Endocrinología'),
('FRM920108HDFRZR172', 'Fernando Ruiz Mendoza', 'Fernando', 'Ruiz', 'Mendoza', '1992-01-08', '16:00:00', 9, 2, 'Reumatología'),
('CCO871210HDFGRN052', 'Carmen Castro Ortiz', 'Carmen', 'Castro', 'Ortiz', '1987-12-10', '17:00:00', 10, 1, 'Cirugía General'),
('JMP800705HDFRLR012', 'Jose Manuel Perez', 'Jose Manuel', 'Perez', 'Ramirez', '1980-07-05', '08:30:00', 11, 1, 'Otorrinolaringología'),
('MTR770707HDFZLR062', 'Maria Teresa Ramirez', 'Maria Teresa', 'Ramirez', 'Lopez', '1977-07-07', '09:30:00', 12, 2, 'Oftalmología'),
('SCH821130HDFRRL092', 'Sofia Cruz Hernandez', 'Sofia', 'Cruz', 'Hernandez', '1982-11-30', '10:30:00', 13, 3, 'Nefrología'),
('ARP880312HDFDRL052', 'Arturo Ramirez Perez', 'Arturo', 'Ramirez', 'Perez', '1988-03-12', '11:30:00', 14, 1, 'Urología'),
('PGV900704HDFLRS092', 'Patricia Gomez Vazquez', 'Patricia', 'Gomez', 'Vazquez', '1990-07-04', '12:30:00', 15, 4, 'Geriatría'),
('CRZ890125HDFNRZ052', 'Cristina Rodriguez Zamora', 'Cristina', 'Rodriguez', 'Zamora', '1989-01-25', '08:00:00', 16, 2, 'Gastroenterología'),
('JLS940616HDFRRL072', 'Julio Lopez Sanchez', 'Julio', 'Lopez', 'Sanchez', '1994-06-16', '09:00:00', 17, 3, 'Traumatología'),
('MLA810915HDFNRL082', 'Marta Leon Alvarez', 'Marta', 'Leon', 'Alvarez', '1981-09-15', '10:00:00', 18, 3, 'Neurocirugía'),
('FRA870421HDFGRS062', 'Francisco Ramirez Arreola', 'Francisco', 'Ramirez', 'Arreola', '1987-04-21', '11:00:00', 19, 3, 'Hematología'),
('SRM930303HDFDRL092', 'Sandra Reyes Morales', 'Sandra', 'Reyes', 'Morales', '1993-03-03', '12:00:00', 20, 3, 'Alergología'),
('RLS760412HDFGRN053', 'Raul Lopez Sanchez', 'Raul', 'Lopez', 'Sanchez', '1976-04-12', '08:00:00', 16, 3, 'Gastroenterología'),
('ALR830223HDFPRZ093', 'Adriana Lopez Ramirez', 'Adriana', 'Lopez', 'Ramirez', '1983-02-23', '09:00:00', 17, 4, 'Neumología'),
('MVR851015HDFNRL072', 'Mario Vargas Ruiz', 'Mario', 'Vargas', 'Ruiz', '1985-10-15', '10:00:00', 18, 3, 'Ortopedia'),
('CLH920409HDFRNR032', 'Claudia Herrera Hernandez', 'Claudia', 'Herrera', 'Hernandez', '1992-04-09', '11:00:00', 19, 2, 'Hematología'),
('TRG810530HDFZRL062', 'Teresa Ramirez Garcia', 'Teresa', 'Ramirez', 'Garcia', '1981-05-30', '12:00:00', 20, 3, 'Medicina Interna');


-- Insert de la tabla paciente usando el procedimiento almacenado
CALL hospital_esquema.registrar_nuevo_paciente('FMMR040429HDFMRC01', 'Mauricio Flores Muñoz', 'Mauricio', 'Flores', 'Muñoz', '2004-04-29', 'Diabetes Tipo 2', 'Insulina', 'Hiperglucemia', 'Penicilina', 'Antecedentes familiares de diabetes', '5');
CALL hospital_esquema.registrar_nuevo_paciente('FRAN040510MDFLPL02', 'Alondra Navila Felipe Ramirez', 'Alondra Navila', 'Felipe', 'Ramirez', '2004-05-10', 'Hipertensión', 'Beta-bloqueantes', 'Presión arterial alta', 'Ninguna', 'Antecedentes familiares de hipertensión', '7');
CALL hospital_esquema.registrar_nuevo_paciente('GGHE021013HDFBLA03', 'Eduardo Biali Garcia Gomez', 'Eduardo Biali', 'Garcia', 'Gomez', '2002-10-13', 'Asma', 'Inhaladores', 'Ataques de asma', 'Polen', 'No hay antecedentes', '1');
CALL hospital_esquema.registrar_nuevo_paciente('SAGA000310MDFNNC04', 'Ana Sanchez Garcia', 'Ana', 'Sanchez', 'Garcia', '2000-03-10', 'Alergia al polvo', 'Antihistamínicos', 'Rinitis alérgica', 'Polvo', 'Padre con alergias', '2');
CALL hospital_esquema.registrar_nuevo_paciente('HAAP040805HDFJAB05', 'Joshua Abel Hurtado Aponte', 'Joshua Abel', 'Hurtado', 'Aponte', '2004-08-05', 'Artritis', 'Antiinflamatorios', 'Dolor articular', 'Aspirina', 'Madre con artritis', '4');
CALL hospital_esquema.registrar_nuevo_paciente('LGP041218HDFMZR081', 'Lucia Gomez Perez', 'Lucia', 'Gomez', 'Perez', '2004-12-18', 'Migraña crónica', 'Analgesicos', 'Dolor de cabeza', 'Ninguna', 'Abuelo con migraña', '6');
CALL hospital_esquema.registrar_nuevo_paciente('JHL030105HDFTRL061', 'Jose Hernandez Lopez', 'Jose', 'Hernandez', 'Lopez', '2003-01-05', 'Hipertiroidismo', 'Antitiroideos', 'Hormonas tiroideas altas', 'Yodo', 'Hermana con hipotiroidismo', '7');
CALL hospital_esquema.registrar_nuevo_paciente('LDS020614HDFGRL021', 'Laura Diaz Sanchez', 'Laura', 'Diaz', 'Sanchez', '2002-06-14', 'Alergia a los mariscos', 'Antihistamínicos', 'Anafilaxia', 'Mariscos', 'Padre con alergias alimentarias', '1');
CALL hospital_esquema.registrar_nuevo_paciente('FMT000921HDFRZN031', 'Fernando Morales Torres', 'Fernando', 'Morales', 'Torres', '2000-09-21', 'Colesterol alto', 'Estatinas', 'Hipercolesterolemia', 'Ninguna', 'Madre con colesterol alto', '8');
CALL hospital_esquema.registrar_nuevo_paciente('CVR040402HDFGRN071', 'Carmen Vazquez Ramirez', 'Carmen', 'Vazquez', 'Ramirez', '2004-04-02', 'Hipoglucemia', 'Suplementos de glucosa', 'Bajo nivel de azúcar en sangre', 'Ninguna', 'Hermano con diabetes', '9');
CALL hospital_esquema.registrar_nuevo_paciente('DAMR40429HDFLRM058', 'Daniela Morales Rivera', 'Daniela', 'Morales', 'Rivera', '2003-11-22', 'Epilepsia', 'Antiepilépticos', 'Crisis epilépticas', 'Ninguna', 'Padre con epilepsia', '3');
CALL hospital_esquema.registrar_nuevo_paciente('ANF040510HDFRZR061', 'Ricardo Mendoza Fuentes', 'Ricardo', 'Mendoza', 'Fuentes', '2001-12-30', 'Riesgo de infarto', 'Anticoagulantes', 'Dolor en el pecho', 'Ninguna', 'Antecedentes familiares de infarto', '5');
CALL hospital_esquema.registrar_nuevo_paciente('EBG021013HDFGRR071', 'Paola Castillo Martinez', 'Paola', 'Castillo', 'Martinez', '1999-08-17', 'Trastorno de ansiedad', 'Ansiolíticos', 'Ataques de pánico', 'Ninguna', 'No hay antecedentes', '6');
CALL hospital_esquema.registrar_nuevo_paciente('ASG000310HDFSRN015', 'Luis Enrique Vargas Solis', 'Luis Enrique', 'Vargas', 'Solis', '2002-04-22', 'Hipoglucemia', 'Suplementos de glucosa', 'Niveles bajos de azúcar', 'Aspirina', 'Hermano con diabetes', '2');
CALL hospital_esquema.registrar_nuevo_paciente('JAH040801HDFG1RL02', 'Isabel Castillo Morales', 'Isabel', 'Castillo', 'Morales', '2000-10-05', 'Hipertensión', 'Beta-bloqueantes', 'Presión arterial alta', 'Ninguna', 'Antecedentes familiares de hipertensión', '4');
CALL hospital_esquema.registrar_nuevo_paciente('LCR050616HDFPLR081', 'Luis Carlos Ramirez Perez', 'Luis Carlos', 'Ramirez', 'Perez', '2005-06-16', 'Anemia', 'Suplementos de hierro', 'Fatiga crónica', 'Ninguna', 'Padre con anemia', '3');
CALL hospital_esquema.registrar_nuevo_paciente('JPA030305HDFNGR092', 'Jorge Pedro Alvarado Nieto', 'Jorge Pedro', 'Alvarado', 'Nieto', '2003-03-05', 'Bronquitis', 'Broncodilatadores', 'Tos crónica', 'Polvo', 'Madre con problemas respiratorios', '5');
CALL hospital_esquema.registrar_nuevo_paciente('MTC041110HDFRZR013', 'Maria Teresa Contreras', 'Maria Teresa', 'Contreras', 'Zarate', '2004-11-10', 'Hipotiroidismo', 'Levotiroxina', 'Hormonas tiroideas bajas', 'Ninguna', 'Abuela con hipotiroidismo', '2');
CALL hospital_esquema.registrar_nuevo_paciente('CAR000725HDFBLP034', 'Carlos Alberto Ramirez Lopez', 'Carlos Alberto', 'Ramirez', 'Lopez', '2000-07-25', 'Hiperglucemia', 'Insulina', 'Nivel alto de azúcar en sangre', 'Ninguna', 'Antecedentes de diabetes en la familia', '6');
CALL hospital_esquema.registrar_nuevo_paciente('MLP041203HDFGRL015', 'Miguel Angel Lopez Perez', 'Miguel Angel', 'Lopez', 'Perez', '2004-12-03', 'Insuficiencia renal', 'Diálisis', 'Daño renal crónico', 'Antibióticos', 'Padre con insuficiencia renal', '4');
CALL hospital_esquema.registrar_nuevo_paciente('NRL020812HDFSRZ027', 'Nora Ramos Lopez', 'Nora', 'Ramos', 'Lopez', '2002-08-12', 'Ansiedad', 'Terapia psicológica', 'Nerviosismo constante', 'Ninguna', 'No hay antecedentes', '8');
CALL hospital_esquema.registrar_nuevo_paciente('VGM001105HDFCLL044', 'Victor Gerardo Martinez', 'Victor Gerardo', 'Martinez', 'Lopez', '2000-11-05', 'Arritmia', 'Beta-bloqueantes', 'Latidos irregulares', 'Ninguna', 'Padre con problemas cardíacos', '7');
CALL hospital_esquema.registrar_nuevo_paciente('LHM040225HDFGRA051', 'Liliana Hernandez Muñoz', 'Liliana', 'Hernandez', 'Muñoz', '2004-02-25', 'Alergia al gluten', 'Dieta libre de gluten', 'Diarrea crónica', 'Gluten', 'Padre con celiaquía', '3');
CALL hospital_esquema.registrar_nuevo_paciente('RCL031207HDFNRZ032', 'Rosa Castillo Lopez', 'Rosa', 'Castillo', 'Lopez', '2003-12-07', 'Problemas de visión', 'Lentes correctivos', 'Miopía severa', 'Ninguna', 'Abuelo con problemas de visión', '2');
CALL hospital_esquema.registrar_nuevo_paciente('AJR050512HDFMRT063', 'Ana Patricia Ramos', 'Ana Patricia', 'Ramos', 'Lopez', '2004-09-20', 'Deficiencia de vitamina D', 'Suplementos de vitamina D', 'Fatiga y debilidad', 'Ninguna', 'No hay antecedentes', '3');


-- Insert de la tabla atender
INSERT INTO hospital_esquema.atender (curpdoc, curppac) VALUES 
('JPG800515HDFGRN062', 'FMMR040429HDFMRC01'),
('MLM750822MDFZRB072', 'FRAN040510MDFLPL02'),
('CSH821130HDFNRL082', 'GGHE021013HDFBLA03'),
('ARD880312HDFDRL052', 'SAGA000310MDFNNC04'),
('PGV900704HDFRZR092', 'HAAP040805HDFJAB05'),
('LMS790218HDFGRS012', 'LGP041218HDFMZR081'),
('JFM850921HDFNRL052', 'JHL030105HDFTRL061'),
('LTN830617HDFNRZ032', 'LDS020614HDFGRL021'),
('FRM920108HDFRZR172', 'FMT000921HDFRZN031'),
('CCO871210HDFGRN052', 'CVR040402HDFGRN071'),
('JMP800705HDFRLR012', 'DAMR40429HDFLRM058'),
('MTR770707HDFZLR062', 'ANF040510HDFRZR061'),
('SCH821130HDFRRL092', 'EBG021013HDFGRR071'),
('ARP880312HDFDRL052', 'ASG000310HDFSRN015'),
('PGV900704HDFLRS092', 'JAH040801HDFG1RL02'),
('MLM750822MDFZRB072', 'LCR050616HDFPLR081'),
('JPG800515HDFGRN062', 'JPA030305HDFNGR092'),
('CSH821130HDFNRL082', 'MTC041110HDFRZR013'),
('ARD880312HDFDRL052', 'CAR000725HDFBLP034'),
('PGV900704HDFRZR092', 'MLP041203HDFGRL015'),
('LMS790218HDFGRS012', 'NRL020812HDFSRZ027'),
('JFM850921HDFNRL052', 'VGM001105HDFCLL044'),
('LTN830617HDFNRZ032', 'LHM040225HDFGRA051'),
('FRM920108HDFRZR172', 'RCL031207HDFNRZ032'),
('CCO871210HDFGRN052', 'AJR050512HDFMRT063');


-- Insert de la tabla detallescontacto
INSERT INTO hospital_esquema.detallescontacto (telefono, email, curpdoc) VALUES
('555-1234', 'juanperez@hospital.com', 'JPG800515HDFGRN062'),
('555-5678', 'marialopez@hospital.com', 'MLM750822MDFZRB072'),
('555-8765', 'carlossanchez@hospital.com', 'CSH821130HDFNRL082'),
('555-4321', 'anaramirez@hospital.com', 'ARD880312HDFDRL052'),
('555-3456', 'pedrogomez@hospital.com', 'PGV900704HDFRZR092'),
('555-6789', 'lauramartinez@hospital.com', 'LMS790218HDFGRS012'),
('555-2345', 'josefernandez@hospital.com', 'JFM850921HDFNRL052'),
('555-9876', 'luciatorres@hospital.com', 'LTN830617HDFNRZ032'),
('555-6543', 'fernandoruiz@hospital.com', 'FRM920108HDFRZR172'),
('555-4327', 'carmencastro@hospital.com', 'CCO871210HDFGRN052'),
('555-3457', 'josemanuel@hospital.com', 'JMP800705HDFRLR012'),
('555-7890', 'mariateresa@hospital.com', 'MTR770707HDFZLR062'),
('555-0987', 'sofiacruz@hospital.com', 'SCH821130HDFRRL092'),
('555-5679', 'arturoramirez@hospital.com', 'ARP880312HDFDRL052'),
('555-8764', 'patriciagomez@hospital.com', 'PGV900704HDFLRS092'),
('555-6781', 'raulperez@hospital.com', 'JPG800515HDFGRN062'),
('555-7891', 'analopez@hospital.com', 'MLM750822MDFZRB072'),
('555-1235', 'carlagarcia@hospital.com', 'CSH821130HDFNRL082'),
('555-5671', 'marcoantonio@hospital.com', 'ARD880312HDFDRL052'),
('555-8762', 'paulagomez@hospital.com', 'PGV900704HDFRZR092'),
('555-4322', 'fernandoramirez@hospital.com', 'LMS790218HDFGRS012'),
('555-3458', 'lorenadiaz@hospital.com', 'JFM850921HDFNRL052'),
('555-6783', 'andresrojas@hospital.com', 'LTN830617HDFNRZ032'),
('555-2346', 'dianacastro@hospital.com', 'FRM920108HDFRZR172'),
('555-9877', 'miguelochoa@hospital.com', 'CCO871210HDFGRN052');


-- Insert de la tabla habitacion
INSERT INTO hospital_esquema.habitacion (disponibilidad, camas, idhospital) VALUES
(true, 2, 1),
(false, 3, 2),
(true, 2, 3),
(true, 4, 4),
(false, 2, 5),
(true, 2, 6),
(true, 3, 7),
(false, 2, 8),
(true, 2, 9),
(false, 3, 10),
(true, 2, 11),
(false, 3, 12),
(true, 2, 13),
(true, 4, 14),
(true, 3, 15),
(true, 3, 16),
(false, 2, 17),
(true, 4, 18),
(true, 1, 19),
(false, 3, 20),
(true, 2, 21),
(false, 1, 22),
(true, 3, 23),
(true, 2, 24),
(false, 4, 25);


-- Insert de la tabla cita usando el procedimiento almacenado
CALL hospital_esquema.registrar_cita_medica('FMMR040429HDFMRC01', 'JPG800515HDFGRN062', '2024-12-03', '09:00:00', '00:30:00', 1, 'Programada');
CALL hospital_esquema.registrar_cita_medica('FRAN040510MDFLPL02', 'MLM750822MDFZRB072', '2024-12-04', '10:00:00', '00:45:00', 2, 'Completada');
CALL hospital_esquema.registrar_cita_medica('GGHE021013HDFBLA03', 'CSH821130HDFNRL082', '2024-12-02', '11:00:00', '00:30:00', 3, 'Cancelada');
CALL hospital_esquema.registrar_cita_medica('SAGA000310MDFNNC04', 'ARD880312HDFDRL052', '2024-12-01', '08:30:00', '01:00:00', 4, 'Reprogramada');
CALL hospital_esquema.registrar_cita_medica('HAAP040805HDFJAB05', 'PGV900704HDFRZR092', '2024-12-04', '10:30:00', '00:45:00', 5, 'No Asistida');
CALL hospital_esquema.registrar_cita_medica('LGP041218HDFMZR081', 'LMS790218HDFGRS012', '2024-12-03', '14:00:00', '00:30:00', 6, 'Programada');
CALL hospital_esquema.registrar_cita_medica('JHL030105HDFTRL061', 'JFM850921HDFNRL052', '2024-12-02', '09:30:00', '00:30:00', 7, 'Completada');
CALL hospital_esquema.registrar_cita_medica('LDS020614HDFGRL021', 'LTN830617HDFNRZ032', '2024-12-03', '13:00:00', '01:00:00', 8, 'Cancelada');
CALL hospital_esquema.registrar_cita_medica('FMT000921HDFRZN031', 'FRM920108HDFRZR172', '2024-12-01', '11:30:00', '00:45:00', 9, 'Reprogramada');
CALL hospital_esquema.registrar_cita_medica('CVR040402HDFGRN071', 'CCO871210HDFGRN052', '2024-12-02', '08:00:00', '00:30:00', 10, 'No Asistida');
CALL hospital_esquema.registrar_cita_medica('DAMR40429HDFLRM058', 'JMP800705HDFRLR012', '2024-12-03', '10:00:00', '00:30:00', 11, 'Programada');
CALL hospital_esquema.registrar_cita_medica('ANF040510HDFRZR061', 'MTR770707HDFZLR062', '2024-12-04', '14:30:00', '00:45:00', 12, 'Completada');
CALL hospital_esquema.registrar_cita_medica('EBG021013HDFGRR071', 'SCH821130HDFRRL092', '2024-12-01', '12:00:00', '00:30:00', 13, 'Cancelada');
CALL hospital_esquema.registrar_cita_medica('ASG000310HDFSRN015', 'ARP880312HDFDRL052', '2024-12-02', '10:00:00', '00:30:00', 14, 'Reprogramada');
CALL hospital_esquema.registrar_cita_medica('JAH040801HDFG1RL02', 'PGV900704HDFLRS092', '2024-12-04', '08:30:00', '00:30:00', 15, 'No Asistida');
CALL hospital_esquema.registrar_cita_medica('LGP041218HDFMZR081', 'JPG800515HDFGRN062', '2024-12-05', '09:00:00', '01:00:00', 16, 'Programada');
CALL hospital_esquema.registrar_cita_medica('GGHE021013HDFBLA03', 'MLM750822MDFZRB072', '2024-12-05', '10:30:00', '00:30:00', 17, 'Completada');
CALL hospital_esquema.registrar_cita_medica('DAMR40429HDFLRM058', 'CSH821130HDFNRL082', '2024-12-01', '13:30:00', '01:00:00', 18, 'Cancelada');
CALL hospital_esquema.registrar_cita_medica('ANF040510HDFRZR061', 'ARD880312HDFDRL052', '2024-12-02', '11:00:00', '00:30:00', 19, 'Reprogramada');
CALL hospital_esquema.registrar_cita_medica('EBG021013HDFGRR071', 'PGV900704HDFRZR092', '2024-12-03', '10:00:00', '00:30:00', 20, 'No Asistida');
CALL hospital_esquema.registrar_cita_medica('JHL030105HDFTRL061', 'LMS790218HDFGRS012', '2024-12-04', '08:30:00', '01:00:00', 21, 'Completada');
CALL hospital_esquema.registrar_cita_medica('SAGA000310MDFNNC04', 'JFM850921HDFNRL052', '2024-12-05', '10:00:00', '00:30:00', 22, 'Cancelada');
CALL hospital_esquema.registrar_cita_medica('HAAP040805HDFJAB05', 'LTN830617HDFNRZ032', '2024-12-02', '13:00:00', '01:00:00', 23, 'Reprogramada');
CALL hospital_esquema.registrar_cita_medica('LGP041218HDFMZR081', 'FRM920108HDFRZR172', '2024-12-04', '12:30:00', '00:30:00', 24, 'No Asistida');
CALL hospital_esquema.registrar_cita_medica('JAH040801HDFG1RL02', 'CCO871210HDFGRN052', '2024-12-03', '14:00:00', '00:30:00', 25, 'Programada');


-- Insert de la tabla factura
INSERT INTO hospital_esquema.factura (fechaemision, totalmonto, detallesservicio, estadopago, curppac) VALUES
('2024-01-15', 1500.00, 'Consulta general y análisis de sangre', 'Pagada', 'FMMR040429HDFMRC01'),
('2024-01-20', 2000.00, 'Cirugía menor y atención postoperatoria', 'Pendiente', 'FRAN040510MDFLPL02'),
('2024-02-10', 500.00, 'Examen de laboratorio', 'Pagada', 'GGHE021013HDFBLA03'),
('2024-03-05', 750.00, 'Consulta especializada y radiografía', 'Cancelada', 'SAGA000310MDFNNC04'),
('2024-03-15', 1200.00, 'Chequeo preventivo y vacunas', 'Pagada', 'HAAP040805HDFJAB05'),
('2024-04-01', 3000.00, 'Cirugía mayor y estancia hospitalaria', 'Pendiente', 'LGP041218HDFMZR081'),
('2024-04-10', 400.00, 'Consulta de emergencia', 'Pagada', 'JHL030105HDFTRL061'),
('2024-05-01', 850.00, 'Tratamiento de fisioterapia', 'Pagada', 'LDS020614HDFGRL021'),
('2024-05-15', 600.00, 'Consulta y revisión de resultados', 'Pendiente', 'FMT000921HDFRZN031'),
('2024-06-01', 1500.00, 'Cirugía ortopédica', 'Pagada', 'CVR040402HDFGRN071'),
('2024-06-15', 750.00, 'Consulta especializada', 'Pendiente', 'DAMR40429HDFLRM058'),
('2024-07-01', 1300.00, 'Chequeo anual y pruebas adicionales', 'Pagada', 'ANF040510HDFRZR061'),
('2024-07-15', 950.00, 'Tratamiento dental completo', 'Cancelada', 'EBG021013HDFGRR071'),
('2024-08-01', 2000.00, 'Cirugía estética y seguimiento', 'Pagada', 'ASG000310HDFSRN015'),
('2024-08-15', 1200.00, 'Consulta y tratamiento para alergias', 'Pendiente', 'JAH040801HDFG1RL02'),
('2024-09-01', 1700.00, 'Chequeo cardiovascular completo', 'Pagada', 'FMMR040429HDFMRC01'),
('2024-09-15', 2500.00, 'Cirugía de cataratas y recuperación', 'Pendiente', 'FRAN040510MDFLPL02'),
('2024-10-10', 800.00, 'Estudio de imagenología avanzado', 'Pagada', 'GGHE021013HDFBLA03'),
('2024-10-20', 1000.00, 'Consulta de nutrición y análisis', 'Cancelada', 'SAGA000310MDFNNC04'),
('2024-11-05', 1100.00, 'Chequeo preventivo para hipertensión', 'Pagada', 'HAAP040805HDFJAB05'),
('2024-11-15', 3200.00, 'Intervención quirúrgica y hospitalización', 'Pendiente', 'LGP041218HDFMZR081'),
('2024-12-01', 700.00, 'Consulta de seguimiento de control', 'Pagada', 'JHL030105HDFTRL061'),
('2024-12-10', 900.00, 'Fisioterapia y rehabilitación postoperatoria', 'Pagada', 'LDS020614HDFGRL021'),
('2024-12-20', 1300.00, 'Revisión y ajuste de tratamientos médicos', 'Pendiente', 'FMT000921HDFRZN031'),
('2024-12-25', 1550.00, 'Cirugía ortopédica avanzada', 'Pagada', 'CVR040402HDFGRN071');


-- Insert de la tabla medicamento
INSERT INTO hospital_esquema.medicamento (medicamentos, dosis) VALUES
('Paracetamol', '500mg'),
('Ibuprofeno', '200mg'),
('Amoxicilina', '500mg'),
('Loratadina', '10mg'),
('Metformina', '850mg'),
('Omeprazol', '20mg'),
('Salbutamol', 'Inalador'),
('Insulina', '100mg'),
('Losartán', '50mg'),
('Prednisona', '5mg'),
('Azitromicina', '500mg'),
('Clopidogrel', '75mg'),
('Lansoprazol', '30mg'),
('Dextrometorfano', '30mg'),
('Hidrocortisona', '20mg'),
('Cetirizina', '10mg'),
('Ranitidina', '150mg'),
('Codeína', '15mg'),
('Fexofenadina', '180mg'),
('Enalapril', '10mg'),
('Atorvastatina', '20mg'),
('Fluoxetina', '20mg'),
('Amiodarona', '200mg'),
('Ciprofloxacina', '500mg'),
('Tramadol', '50mg');


-- Insert de la tabla pago
INSERT INTO hospital_esquema.pago (idfactura, fechapago, montopagado) VALUES
(1, '2024-01-20', 1500.00),
(2, '2024-02-01', 2000.00),
(3, '2024-02-15', 500.00),
(4, '2024-03-10', 750.00),
(5, '2024-03-20', 1200.00),
(6, '2024-04-15', 400.00),
(7, '2024-05-05', 850.00),
(8, '2024-06-05', 1500.00),
(9, '2024-06-20', 750.00),
(10, '2024-07-10', 1300.00),
(11, '2024-08-10', 2000.00),
(12, '2024-08-20', 1200.00),
(13, '2024-05-20', 600.00),
(14, '2024-07-20', 950.00),
(15, '2024-04-05', 3000.00),
(16, '2024-08-25', 1100.00),
(17, '2024-09-01', 800.00),
(18, '2024-09-10', 1000.00),
(19, '2024-10-01', 1200.00),
(20, '2024-10-15', 500.00),
(21, '2024-11-01', 1400.00),
(22, '2024-11-10', 900.00),
(23, '2024-11-20', 1100.00),
(24, '2024-12-01', 750.00),
(25, '2024-12-10', 1300.00);


-- Insert de la tabla receta
INSERT INTO hospital_esquema.receta (idmedicamento, curpdoc, curppac, fechaemision) VALUES
(1, 'JPG800515HDFGRN062', 'FMMR040429HDFMRC01', '2024-01-01'),
(2, 'MLM750822MDFZRB072', 'FRAN040510MDFLPL02', '2024-01-05'),
(3, 'CSH821130HDFNRL082', 'GGHE021013HDFBLA03', '2024-01-10'),
(4, 'ARD880312HDFDRL052', 'SAGA000310MDFNNC04', '2024-01-15'),
(5, 'PGV900704HDFRZR092', 'HAAP040805HDFJAB05', '2024-01-20'),
(6, 'LMS790218HDFGRS012', 'LGP041218HDFMZR081', '2024-01-25'),
(7, 'JFM850921HDFNRL052', 'JHL030105HDFTRL061', '2024-02-01'),
(8, 'LTN830617HDFNRZ032', 'LDS020614HDFGRL021', '2024-02-05'),
(9, 'FRM920108HDFRZR172', 'FMT000921HDFRZN031', '2024-02-10'),
(10, 'CCO871210HDFGRN052', 'CVR040402HDFGRN071', '2024-02-15'),
(11, 'JMP800705HDFRLR012', 'DAMR40429HDFLRM058', '2024-03-01'),
(12, 'MTR770707HDFZLR062', 'ANF040510HDFRZR061', '2024-03-10'),
(13, 'SCH821130HDFRRL092', 'EBG021013HDFGRR071', '2024-03-15'),
(14, 'ARP880312HDFDRL052', 'ASG000310HDFSRN015', '2024-04-01'),
(15, 'PGV900704HDFLRS092', 'JAH040801HDFG1RL02', '2024-04-05'),
(1, 'JPG800515HDFGRN062', 'FMMR040429HDFMRC01', '2024-04-10'),
(2, 'MLM750822MDFZRB072', 'FRAN040510MDFLPL02', '2024-04-12'),
(3, 'CSH821130HDFNRL082', 'GGHE021013HDFBLA03', '2024-04-15'),
(4, 'ARD880312HDFDRL052', 'SAGA000310MDFNNC04', '2024-04-20'),
(5, 'PGV900704HDFRZR092', 'HAAP040805HDFJAB05', '2024-04-22'),
(6, 'LMS790218HDFGRS012', 'LGP041218HDFMZR081', '2024-05-01'),
(7, 'JFM850921HDFNRL052', 'JHL030105HDFTRL061', '2024-05-05'),
(8, 'LTN830617HDFNRZ032', 'LDS020614HDFGRL021', '2024-05-10'),
(9, 'FRM920108HDFRZR172', 'FMT000921HDFRZN031', '2024-05-12'),
(10, 'CCO871210HDFGRN052', 'CVR040402HDFGRN071', '2024-05-15');


-- Insert de la tabla tratamiento
INSERT INTO hospital_esquema.tratamiento (fechainicio, descripcion, duracion, curpdoc, curppac) VALUES
('2024-01-01', 'Tratamiento para la diabetes', 30, 'JPG800515HDFGRN062', 'FMMR040429HDFMRC01'),
('2024-01-05', 'Control de hipertensión arterial', 60, 'MLM750822MDFZRB072', 'FRAN040510MDFLPL02'),
('2024-01-10', 'Terapia respiratoria para asma', 20, 'CSH821130HDFNRL082', 'GGHE021013HDFBLA03'),
('2024-01-15', 'Tratamiento de alergia al polvo', 15, 'ARD880312HDFDRL052', 'SAGA000310MDFNNC04'),
('2024-01-20', 'Fisioterapia para artritis', 45, 'PGV900704HDFRZR092', 'HAAP040805HDFJAB05'),
('2024-01-25', 'Tratamiento para migraña crónica', 10, 'LMS790218HDFGRS012', 'LGP041218HDFMZR081'),
('2024-02-01', 'Terapia para hipertiroidismo', 30, 'JFM850921HDFNRL052', 'JHL030105HDFTRL061'),
('2024-02-05', 'Tratamiento para alergia a mariscos', 14, 'LTN830617HDFNRZ032', 'LDS020614HDFGRL021'),
('2024-02-10', 'Control de colesterol alto', 90, 'FRM920108HDFRZR172', 'FMT000921HDFRZN031'),
('2024-02-15', 'Tratamiento de hipoglucemia', 7, 'CCO871210HDFGRN052', 'CVR040402HDFGRN071'),
('2024-01-15', 'Tratamiento de alergia a perros', 15, 'JMP800705HDFRLR012', 'DAMR40429HDFLRM058'),
('2024-01-20', 'Fisioterapia para artritis', 45, 'MTR770707HDFZLR062', 'ANF040510HDFRZR061'),
('2024-01-25', 'Tratamiento para dolor abdominal', 10, 'SCH821130HDFRRL092', 'EBG021013HDFGRR071'),
('2024-02-01', 'Terapia para hipertiroidismo', 30, 'ARP880312HDFDRL052', 'ASG000310HDFSRN015'),
('2024-02-05', 'Tratamiento para alergia a gatos', 14, 'PGV900704HDFLRS092', 'JAH040801HDFG1RL02'),
('2024-03-01', 'Rehabilitación para lesiones deportivas', 30, 'MLM750822MDFZRB072', 'LGP041218HDFMZR081'),
('2024-03-05', 'Terapia para problemas de sueño', 20, 'JPG800515HDFGRN062', 'GGHE021013HDFBLA03'),
('2024-03-10', 'Tratamiento para hipertrofia prostática', 15, 'CSH821130HDFNRL082', 'HAAP040805HDFJAB05'),
('2024-03-15', 'Fisioterapia para rehabilitación de rodilla', 30, 'ARD880312HDFDRL052', 'FRAN040510MDFLPL02'),
('2024-03-20', 'Tratamiento para estrés crónico', 10, 'PGV900704HDFRZR092', 'MLP041203HDFGRL015'),
('2024-03-25', 'Terapia para osteoporosis', 45, 'LMS790218HDFGRS012', 'NRL020812HDFSRZ027'),
('2024-04-01', 'Tratamiento para ansiedad severa', 30, 'JFM850921HDFNRL052', 'VGM001105HDFCLL044'),
('2024-04-05', 'Rehabilitación para cirugía de hombro', 60, 'LTN830617HDFNRZ032', 'LHM040225HDFGRA051'),
('2024-04-10', 'Terapia para problemas de tiroides', 20, 'FRM920108HDFRZR172', 'RCL031207HDFNRZ032'),
('2024-04-15', 'Tratamiento para hipertensión pulmonar', 30, 'CCO871210HDFGRN052', 'AJR050512HDFMRT063');

-- Insert de la tabla hospitalizacion
CALL hospital_esquema.registrar_hospitalizacion('FMMR040429HDFMRC01', 1, 1, 'INGRESO');
CALL hospital_esquema.registrar_hospitalizacion('FMMR040429HDFMRC01', 1, 1, 'ALTA');
CALL hospital_esquema.registrar_hospitalizacion('JPA030305HDFNGR092', 17, 17, 'INGRESO');
CALL hospital_esquema.registrar_hospitalizacion('JPA030305HDFNGR092', 17, 17, 'ALTA');
CALL hospital_esquema.registrar_hospitalizacion('MTC041110HDFRZR013', 18, 18, 'INGRESO');
CALL hospital_esquema.registrar_hospitalizacion('MTC041110HDFRZR013', 18, 18, 'ALTA');
CALL hospital_esquema.registrar_hospitalizacion('CAR000725HDFBLP034', 19, 19, 'INGRESO');
CALL hospital_esquema.registrar_hospitalizacion('CAR000725HDFBLP034', 19, 19, 'ALTA');
CALL hospital_esquema.registrar_hospitalizacion('MLP041203HDFGRL015', 20, 20, 'INGRESO');
CALL hospital_esquema.registrar_hospitalizacion('MLP041203HDFGRL015', 20, 20, 'ALTA');
INSERT INTO hospital_esquema.hospitalizacion (curppac, idhabitacion, fechainicio, fechafin, idhospital) VALUES
('FRAN040510MDFLPL02', 2, '2024-01-25', '2024-01-30', 2),
('GGHE021013HDFBLA03', 3, '2024-02-05', '2024-02-10', 3),
('SAGA000310MDFNNC04', 4, '2024-02-15', '2024-02-20', 4),
('HAAP040805HDFJAB05', 5, '2024-02-25', '2024-03-01', 5),
('LGP041218HDFMZR081', 6, '2024-03-05', '2024-03-10', 6),
('JHL030105HDFTRL061', 7, '2024-03-15', '2024-03-20', 7),
('LDS020614HDFGRL021', 8, '2024-03-25', '2024-03-30', 8),
('FMT000921HDFRZN031', 9, '2024-04-01', '2024-04-06', 9),
('CVR040402HDFGRN071', 10, '2024-04-10', '2024-04-15', 10),
('DAMR40429HDFLRM058', 11, '2024-04-20', '2024-04-25', 11),
('ANF040510HDFRZR061', 12, '2024-05-01', '2024-05-06', 12),
('EBG021013HDFGRR071', 13, '2024-05-10', '2024-05-15', 13),
('ASG000310HDFSRN015', 14, '2024-05-20', '2024-05-25', 14),
('JAH040801HDFG1RL02', 15, '2024-06-01', '2024-06-06', 15),
('LCR050616HDFPLR081', 16, '2024-06-08', '2024-06-10', 16);

-- Insert de la tabla forma_pago
INSERT INTO hospital_esquema.forma_pago (idpago, forma_pago) VALUES
(1, 'Tarjeta de crédito'),
(2, 'Efectivo'),
(3, 'Transferencia bancaria'),
(4, 'Tarjeta de débito'),
(5, 'Cheque'),
(6, 'Efectivo'),
(7, 'Transferencia bancaria'),
(8, 'Tarjeta de crédito'),
(9, 'Tarjeta de débito'),
(10, 'Efectivo'),
(11, 'Cheque'),
(12, 'Transferencia bancaria'),
(13, 'Tarjeta de crédito'),
(14, 'Efectivo'),
(15, 'Tarjeta de débito'),
(16, 'Efectivo'),
(17, 'Transferencia bancaria'),
(18, 'Tarjeta de crédito'),
(19, 'Tarjeta de débito'),
(20, 'Efectivo'),
(21, 'Cheque'),
(22, 'Transferencia bancaria'),
(23, 'Tarjeta de crédito'),
(24, 'Efectivo'),
(25, 'Tarjeta de débito');

-- Insert de la tabla guardias
CALL hospital_esquema.asignar_doctor_guardia('JPG800515HDFGRN062', 'Urgencias', 'Matutino', '2024-01-01');
CALL hospital_esquema.asignar_doctor_guardia('MLM750822MDFZRB072', 'Pediatría', 'Vespertino', '2024-01-02');
CALL hospital_esquema.asignar_doctor_guardia('CSH821130HDFNRL082', 'Dermatología', 'Nocturno', '2024-01-03');
CALL hospital_esquema.asignar_doctor_guardia('ARD880312HDFDRL052', 'Ginecología', 'Matutino', '2024-01-04');
CALL hospital_esquema.asignar_doctor_guardia('PGV900704HDFRZR092', 'Neurología', 'Vespertino', '2024-01-05');
CALL hospital_esquema.asignar_doctor_guardia('LMS790218HDFGRS012', 'Psiquiatría', 'Nocturno', '2024-01-06');
CALL hospital_esquema.asignar_doctor_guardia('JFM850921HDFNRL052', 'Oncología', 'Matutino', '2024-01-07');
CALL hospital_esquema.asignar_doctor_guardia('LTN830617HDFNRZ032', 'Endocrinología', 'Vespertino', '2024-01-08');
CALL hospital_esquema.asignar_doctor_guardia('FRM920108HDFRZR172', 'Reumatología', 'Nocturno', '2024-01-09');
CALL hospital_esquema.asignar_doctor_guardia('CCO871210HDFGRN052', 'Cirugía General', 'Matutino', '2024-01-10');
CALL hospital_esquema.asignar_doctor_guardia('JMP800705HDFRLR012', 'Otorrinolaringología', 'Vespertino', '2024-01-11');
CALL hospital_esquema.asignar_doctor_guardia('MTR770707HDFZLR062', 'Oftalmología', 'Nocturno', '2024-01-12');
CALL hospital_esquema.asignar_doctor_guardia('SCH821130HDFRRL092', 'Nefrología', 'Matutino', '2024-01-13');
CALL hospital_esquema.asignar_doctor_guardia('ARP880312HDFDRL052', 'Urología', 'Vespertino', '2024-01-14');
CALL hospital_esquema.asignar_doctor_guardia('PGV900704HDFLRS092', 'Geriatría', 'Nocturno', '2024-01-15');
CALL hospital_esquema.asignar_doctor_guardia('CRZ890125HDFNRZ052', 'Gastroenterología', 'Matutino', '2024-01-16');
CALL hospital_esquema.asignar_doctor_guardia('JLS940616HDFRRL072', 'Traumatología', 'Vespertino', '2024-01-17');
CALL hospital_esquema.asignar_doctor_guardia('MLA810915HDFNRL082', 'Neurocirugía', 'Nocturno', '2024-01-18');
CALL hospital_esquema.asignar_doctor_guardia('FRA870421HDFGRS062', 'Hematología', 'Matutino', '2024-01-19');
CALL hospital_esquema.asignar_doctor_guardia('SRM930303HDFDRL092', 'Alergología', 'Vespertino', '2024-01-20');
CALL hospital_esquema.asignar_doctor_guardia('RLS760412HDFGRN053', 'Gastroenterología', 'Nocturno', '2024-01-21');
CALL hospital_esquema.asignar_doctor_guardia('ALR830223HDFPRZ093', 'Neumología', 'Matutino', '2024-01-22');
CALL hospital_esquema.asignar_doctor_guardia('MVR851015HDFNRL072', 'Ortopedia', 'Vespertino', '2024-01-23');
CALL hospital_esquema.asignar_doctor_guardia('CLH920409HDFRNR032', 'Hematología', 'Nocturno', '2024-01-24');
CALL hospital_esquema.asignar_doctor_guardia('TRG810530HDFZRL062', 'Medicina Interna', 'Matutino', '2024-01-25');
