------------Transferencia de Pacientes entre Doctores------------

DELIMITER //

CREATE PROCEDURE change_doctor (IN patient INT, IN new_doctor INT)

BEGIN
	-- Verificamos el número de pacientes del nuevo doctor --
	DECLARE number_patients INT;
	DECLARE max_number_patients INT DEFAULT 2;
	SELECT COUNT(*) INTO number_patients FROM patients WHERE fk_family_doctor_id=new_doctor;

	-- Lógica de verificación si puede con más pacientes
	IF number_patients >= max_number_patients THEN
		SELECT 'El número de pacientes ha alcanzado o superado el límite máximo.';
	ELSE
		UPDATE patients SET fk_family_doctor_id=new_doctor WHERE patient_id=patient;
	END IF;

END //

--------Nueva Receta con Validación. Crear una nueva receta, pero solo si el paciente tiene cita programada y hay stock.--------
DELIMITER //

CREATE PROCEDURE new_prescription (
	IN patient INT)

BEGIN
	-- Revisamos si ya tiene una receta creada
	DECLARE number_appointments INT;
    DECLARE stock_medicine INT;
    DECLARE var_appointment_id INT;
    DECLARE var_medicine_id INT;
	SELECT COUNT(*) INTO number_appointments FROM appointments WHERE patient_id=patient;
	
    IF number_appointments =0 THEN
		SELECT 'El paciente no tiene cita';
	END IF;
    
    -- Revisamos si hay stoc: appointment -> prescription -> medicine -> stock
    SELECT appointment_id INTO var_appointment_id FROM appointments WHERE patient_id=patient;
    SELECT medicine_id INTO var_medicine_id FROM prescriptions_medicines WHERE prescription_id=var_appointment_id;
    SELECT stock INTO stock_medicine FROM medicines where medicine_id=var_medicine_id;
    
    IF stock_medicine=0 THEN
		SELECT 'No hay stock de esa medicina';
    END IF;
    
    -- Creamos la receta si hay stock y tiene cita
    
    UPDATE medicines SET stock=(stock_medicine-1) WHERE medicine_id=var_medicine_id;
    SELECT var_appointment_id, var_medicine_id;
    
END;

//