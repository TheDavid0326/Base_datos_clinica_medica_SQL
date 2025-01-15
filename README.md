# Base de Datos de Clínica Médica

Este repositorio contiene scripts SQL para crear y gestionar una base de datos relacional diseñada para una clínica médica. La base de datos incluye tablas para almacenar información sobre médicos, pacientes, citas, recetas y medicamentos, así como procedimientos almacenados para realizar operaciones más complejas y consultas para extraer información relevante.

## Descripción

La sección de creation tables, contiene los script SQL que definen la estructura de una base de datos relacional para una clínica médica. Incluye tablas para gestionar información sobre médicos, pacientes, citas, recetas y medicamentos.

## Tablas

* **doctors:**
    * `doctor_id`: Identificador único del médico (clave primaria).
    * `name`: Nombre del médico.
* **patients:**
    * `patient_id`: Identificador único del paciente (clave primaria).
    * `name`: Nombre del paciente.
    * `fk_family_doctor_id`: Identificador del médico de cabecera (clave foránea que referencia a la tabla `doctors`).
* **appointments:**
    * `appointment_id`: Identificador único de la cita (clave primaria).
    * `date_time`: Fecha y hora de la cita.
    * `diagnosis`: Diagnóstico del paciente.
    * `patient_id`: Identificador del paciente (clave foránea que referencia a la tabla `patients`).
    * `doctor_id`: Identificador del médico (clave foránea que referencia a la tabla `doctors`).
* **prescriptions:**
    * `prescription_id`: Identificador único de la receta (clave primaria).
    * `name`: Nombre de la receta.
    * `appointment_id`: Identificador de la cita asociada a la receta (clave foránea que referencia a la tabla `appointments`).
* **categories:**
    * `category_id`: Identificador único de la categoría de medicamento (clave primaria).
    * `name`: Nombre de la categoría del medicamento.
* **medicines:**
    * `medicine_id`: Identificador único del medicamento (clave primaria).
    * `name`: Nombre del medicamento.
    * `category_id`: Identificador de la categoría del medicamento (clave foránea que referencia a la tabla `categories`).
* **prescriptions_medicines:**
    * `prescription_medicine_id`: Identificador único de la relación entre una receta y un medicamento (clave primaria).
    * `prescription_id`: Identificador de la receta (clave foránea que referencia a la tabla `prescriptions`).
    * `medicine_id`: Identificador del medicamento (clave foránea que referencia a la tabla `medicines`).

## Relaciones
* **Relación 1:1:**
    * Una cita puede tener una receta (tabla `prescriptions`).

* **Relación N:M:**
    * Una receta puede contener varios medicamentos (tabla `prescriptions_medicines`).
    * Un medicamento puede estar en varias recetas (tabla `prescriptions_medicines`).

* **Relación 1:N:**
    * Un médico puede tener muchos pacientes (tabla `patients`).
    * Un paciente puede tener muchas citas (tabla `appointments`).
    * Un médico puede tener muchas citas (tabla `appointments`).
    * Una categoría puede tener muchos medicamentos (tabla `medicines`).


## Restricciones
* **Claves primarias:** Se han definido claves primarias para todas las tablas para garantizar la unicidad de los registros.
* **Claves foráneas:** Se han definido claves foráneas para establecer las relaciones entre las tablas y asegurar la integridad referencial.
* **Unicidad:** Se ha aplicado la restricción `UNIQUE` para evitar que una receta esté asociada a un mismo medicamento más de una vez.

## Aprendizajes clave
* **Diseño de bases de datos relacionales:** Conceptos fundamentales como tablas, columnas, claves primarias, claves foráneas, restricciones (UNIQUE, NOT NULL).
* **Normalización de datos:** Diseño de tablas para evitar redundancia y mejorar la integridad de los datos.
* **SQL:** Uso de comandos SQL para crear tablas, definir restricciones y modificar la estructura de las tablas.
