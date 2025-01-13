------------Consultas Fáciles (Nivel Básico)-----------
--¿Qué pacientes ha atendido un doctor en particular?
SELECT * FROM patients WHERE fk_family_doctor_id=1;

SELECT patients.name AS patient_name, doctors.name AS doctor_name FROM patients 
INNER JOIN doctors on patients.fk_family_doctor_id=doctors.doctor_id
WHERE fk_family_doctor_id=1;

SELECT appointments.date_time, patients.name AS patient_name,doctors.name AS doctor_name FROM appointments
INNER JOIN patients ON appointments.patient_id=patients.patient_id
INNER JOIN doctors ON appointments.doctor_id=doctors.doctor_id
WHERE appointments.doctor_id=2;

--¿Qué medicamentos se han recetado para una enfermedad específica?
SELECT appointments.diagnosis,prescriptions.name, medicines.name AS medicine_name FROM prescriptions_medicines
INNER JOIN prescriptions ON prescriptions.prescription_id=prescriptions_medicines.prescription_id
INNER JOIN appointments ON appointments.appointment_id=prescriptions.appointment_id
INNER JOIN medicines ON prescriptions_medicines.medicine_id=medicines.medicine_id
WHERE appointments.diagnosis='Gripe';

--¿Cuántos pacientes tienen una cita programada para 2024?
SELECT * FROM appointments
WHERE YEAR(date_time)=2024;

SELECT COUNT(appointment_id) FROM appointments
WHERE YEAR(date_time)=2024;

--------------------Consultas Intermedias (Nivel Medio)-----------------
--¿Cuál es el doctor más ocupado en los dos últimos años?
SELECT doctors.name, COUNT(*) FROM appointments
INNER JOIN doctors ON doctors.doctor_id = appointments.doctor_id
GROUP BY appointments.doctor_id
ORDER BY COUNT(*) DESC
LIMIT 1;

--¿Cuál es el medicamento más recetado para pacientes diabéticos?
/*si usas una función de agregación como COUNT, todas las demás columnas en el SELECT que no están en funciones agregadas 
deben estar en el GROUP BY.*/
SELECT appointments.diagnosis, medicines.name, COUNT(medicines.name) FROM appointments
INNER JOIN prescriptions ON appointments.appointment_id = prescriptions.appointment_id
INNER JOIN prescriptions_medicines ON prescriptions.prescription_id= prescriptions_medicines.prescription_id
INNER JOIN medicines ON medicines.medicine_id=prescriptions_medicines.medicine_id
WHERE appointments.diagnosis='Enfermedad cardíaca'
GROUP BY medicines.name;

SELECT appointments.diagnosis, medicines.name, COUNT(medicines.name) FROM appointments
INNER JOIN prescriptions ON appointments.appointment_id = prescriptions.appointment_id
INNER JOIN prescriptions_medicines ON prescriptions.prescription_id= prescriptions_medicines.prescription_id
INNER JOIN medicines ON medicines.medicine_id=prescriptions_medicines.medicine_id
GROUP BY appointments.diagnosis, medicines.name;

--------------------------Consultas Avanzadas (Nivel Difícil)----------------------
--¿Cuáles son los 3 doctores más eficientes en recetar analgésicos?--
SELECT doctors.name AS doctor_name, COUNT(medicines.medicine_id) FROM appointments
INNER JOIN prescriptions ON appointments.appointment_id = prescriptions.appointment_id
INNER JOIN doctors ON doctors.doctor_id=appointments.doctor_id
INNER JOIN prescriptions_medicines ON prescriptions.prescription_id= prescriptions_medicines.prescription_id
INNER JOIN medicines ON medicines.medicine_id=prescriptions_medicines.medicine_id
INNER JOIN categories ON medicines.category_id=categories.category_id
WHERE categories.category_id=1
GROUP BY doctors.name
ORDER BY COUNT(medicines.medicine_id) DESC
LIMIT 5;



