CREATE TABLE doctors (
	doctor_id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    PRIMARY KEY (doctor_id)
)

CREATE TABLE patients (
	patient_id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    fk_family_doctor_id INT,
    FOREIGN KEY (fk_family_doctor_id ) REFERENCES doctors(doctor_id),
    PRIMARY KEY (patient_id)
);

CREATE TABLE appointments (
	appointment_id INT AUTO_INCREMENT,
    date_time DATETIME NOT NULL,
    diagnosis VARCHAR (100),
    patient_id INT,
    doctor_id INT,
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    PRIMARY KEY (appointment_id)
);

CREATE TABLE prescriptions (
	prescription_id INT AUTO_INCREMENT,
    appointment_id INT,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id),
    PRIMARY KEY (prescription_id)
);

--Añadiendo una columna a prescriptions
ALTER TABLE prescriptions
ADD COLUMN name VARCHAR (25) AFTER prescription_id;

--Modificando que ahora sea única la FOREIGN KEY
ALTER TABLE prescriptions
ADD UNIQUE (appointment_id);

CREATE TABLE categories (
	category_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    PRIMARY KEY (category_id)
);

CREATE TABLE medicines (
	medicine_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories (category_id),
    PRIMARY KEY (medicine_id)
);

CREATE TABLE prescriptions_medicines (
	prescription_medicine_id INT AUTO_INCREMENT,
    prescription_id INT,
    medicine_id INT,
    FOREIGN KEY (prescription_id) REFERENCES prescriptions (prescription_id),
    FOREIGN KEY (medicine_id) REFERENCES medicines (medicine_id),
    PRIMARY KEY (prescription_medicine_id),
    UNIQUE (prescription_id,medicine_id)
);

-- Por si hiciera falta modificar la anterior tabla
ALTER TABLE prescriptions_medicines
ADD UNIQUE(prescription_id,medicine_id);