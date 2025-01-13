# Consultas SQL para la Base de Datos de Clínica Médica

Este documento describe un conjunto de consultas SQL para la base de datos de clínica médica definida anteriormente. Las consultas se han organizado en tres niveles de dificultad: básico, medio y avanzado.

## Consultas Fáciles (Nivel Básico)

Estas consultas recuperan información básica de las tablas de la clínica.

* **Pacientes atendidos por un doctor específico:**
  * La primera consulta selecciona todos los pacientes de un doctor en particular utilizando su identificador en la tabla `patients`.
  * La segunda consulta selecciona el nombre del paciente y el nombre del doctor utilizando un JOIN entre las tablas `patients` y `doctors`.

* **Medicamentos recetados para una enfermedad específica:**
  * Esta consulta recupera el diagnóstico, el nombre de la receta y el nombre del medicamento para una enfermedad específica utilizando JOINs entre cuatro tablas: `appointments`, `prescriptions`, `prescriptions_medicines`, y `medicines`.

* **Pacientes con citas programadas para un año determinado:**
  * La primera consulta selecciona todas las citas programadas para un año determinado.
  * La segunda consulta cuenta el número de citas programadas para ese año.

## Consultas Intermedias (Nivel Medio)

Estas consultas involucran agregaciones y condiciones más complejas.

* **Doctor más ocupado en los dos últimos años:**
  * Esta consulta utiliza un JOIN entre `appointments` y `doctors` para contar el número de citas por doctor y luego ordena los resultados de forma descendente para encontrar al doctor con más citas. Se limita el resultado al primer registro utilizando `LIMIT 1`.

* **Medicamento más recetado para pacientes con una enfermedad específica:**
  * La primera consulta incorrecta intenta agrupar por `appointments.diagnosis` y `medicines.name`, lo cual no está permitido porque `appointments.diagnosis` no está dentro de una función de agregación (como `COUNT`).
  * La segunda consulta corrige este error agrupando solo por `medicines.name` para obtener el conteo de medicamentos recetados para cada diagnóstico.

## Consultas Avanzadas (Nivel Difícil)

Estas consultas combinan varias tablas y funciones para obtener información más específica.

* **Doctores más eficientes en recetar analgésicos:**
  * Esta consulta utiliza JOINs entre seis tablas para relacionar citas, doctores, recetas, medicamentos, categorías de medicamentos y finalmente contar el número de analgésicos recetados por cada doctor. 
  * Se filtra por la categoría de medicamentos (analgésicos) y se ordena el resultado por el número de medicamentos recetados de forma descendente. Se limita el resultado a los 5 primeros doctores utilizando `LIMIT 5`.
