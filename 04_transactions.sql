--Cancelar una Cita y Eliminar Recetas Asociadas--
START TRANSACTION;


DELETE FROM prescriptions_medicines WHERE prescription_id = (
	SELECT prescription_id FROM prescriptions WHERE appointment_id=13);

DELETE from prescriptions WHERE appointment_id=13;
DELETE from appointments WHERE appointment_id=13;


COMMIT;

