# Procedimientos Almacenados para la Base de Datos de Clínica Médica

Este documento contiene ejemplos de procedimientos almacenados que implementan funcionalidades más avanzadas en la base de datos de la clínica médica.

## Procedimiento: Cancelar Cita y Eliminar Recetas Asociadas

* **Descripción:** Este procedimiento cancela una cita y elimina todas las recetas asociadas a esa cita.
* **Implementación:**
    * Utiliza una transacción (`START TRANSACTION;`) para garantizar la integridad de los datos.
    * Elimina las entradas correspondientes en las tablas `prescriptions_medicines` y `prescriptions`.
    * Finalmente, elimina la cita de la tabla `appointments`.
    * Si ocurre algún error durante la ejecución de las sentencias, la transacción se aborta (`ROLLBACK;`) para evitar inconsistencias en la base de datos.

## Procedimiento: Transferencia de Pacientes entre Doctores

* **Descripción:** Este procedimiento transfiere un paciente de un doctor a otro, verificando que el nuevo doctor no supere el número máximo de pacientes asignados.
* **Implementación:**
    * Utiliza variables declaradas (`DECLARE`) para almacenar valores intermedios.
    * Verifica el número actual de pacientes asignados al nuevo doctor.
    * Si el número de pacientes no supera el límite, actualiza el campo `fk_family_doctor_id` en la tabla `patients` para asignar el nuevo doctor al paciente.
    * Si se excede el límite, muestra un mensaje de error.

## Procedimiento: Nueva Receta con Validación

* **Descripción:** Este procedimiento crea una nueva receta para un paciente, pero solo si cumple las siguientes condiciones:
    * El paciente tiene una cita programada.
    * Hay stock disponible del medicamento.
* **Implementación:**
    * Verifica si el paciente tiene una cita programada consultando la tabla `appointments`.
    * Verifica el stock del medicamento consultando las tablas `appointments`, `prescriptions`, `prescriptions_medicines` y `medicines`.
    * Si se cumplen ambas condiciones, crea la nueva receta y actualiza el stock del medicamento.
    * Si alguna de las condiciones no se cumple, muestra un mensaje de error.

## Aprendizajes clave

* **Procedimientos almacenados:** Uso de procedimientos almacenados para encapsular lógica de negocio y mejorar la modularidad.
* **Transacciones:** Utilización de transacciones para garantizar la integridad de los datos y evitar inconsistencias.
* **Control de flujo:** Uso de estructuras de control como `IF` y `ELSE` para tomar decisiones dentro del procedimiento.
* **Variables declaradas:** Declaración y uso de variables para almacenar valores intermedios.
* **Manejo de errores:** Implementación de mecanismos para detectar y manejar errores, como la verificación de condiciones y la presentación de mensajes de error.
