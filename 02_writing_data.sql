-- Doctors
INSERT INTO doctors (name) VALUES ('Daniel');

--Patients
INSERT INTO appointments (datetime, fk_family_doctor_id) VALUES ('Marta', null);

--Appointments
INSERT INTO appointments (date_time, diagnosis, patient_id,doctor_id) VALUES ('2023-11-22 10:32:15', 'Gripe',8,4);

--Prescriptions
INSERT INTO prescriptions (name, appointment_id) VALUES ('RECETA#5',5);

--Categories
INSERT INTO categories (name) VALUES ('Analgésicos');

--Medicines
INSERT INTO medicines (name,category_id) VALUES ('Fenitoína',6);

--Prescriptions_mediciones
INSERT INTO prescriptions_medicines (prescription_id,medicine_id) VALUES (1,1);