--EJERCICIO 1
CREATE TABLE departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE empleados (
    id_empleados SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    id_departamento INT NOT NULL,
    salario REAL NOT NULL,
	FOREIGN KEY (id_departamento) REFERENCES departamentos(id_departamento)
);



INSERT INTO departamentos (nombre) VALUES
('Recursos Humanos'),
('Tecnología'),
('Marketing');

INSERT INTO empleados (nombre, id_departamento, salario) VALUES
('Ana Pérez', 1, 50000),
('Carlos Gómez', 2, 65000),
('Lucía Martínez', 3, 55000);

SELECT E.nombre AS empleados, D.nombre AS departamento 
FROM empleados AS E 
INNER JOIN departamentos AS D
ON E.id_departamento = D.id_departamento;


--EJERCICIO 2

ALTER TABLE empleados 
ALTER COLUMN id_departamento DROP NOT NULL;

INSERT INTO empleados (nombre, id_departamento, salario) 
VALUES ('PEPITA', NULL, 48000);

SELECT E.nombre AS nombre_empleado,D.nombre AS nombre_departamento
FROM empleados AS E
LEFT JOIN departamentos AS D
ON  E.id_departamento = D.id_departamento;


--EJERCICIO 3
INSERT INTO departamentos (nombre) VALUES
('Aseo'),
('Administracion');

SELECT E.nombre AS nombre_empleado,D.nombre AS nombre_departamento
FROM empleados AS E
RIGHT JOIN departamentos AS D
ON  E.id_departamento = D.id_departamento;

--EJERCICIO 4

SELECT E.nombre AS nombre_empleado,D.nombre AS nombre_departamento
FROM empleados AS E
FULL JOIN departamentos AS D
ON  E.id_departamento = D.id_departamento;

--EJERCICIO 5

SELECT E.nombre AS empleados, D.nombre AS departamento 
FROM empleados AS E 
INNER JOIN departamentos AS D
ON E.id_departamento = D.id_departamento;

--EJERCICIO 6

SELECT E1.nombre AS nombre_empleado, E1.salario AS salario
FROM empleados AS E1
INNER JOIN empleados AS E2
ON E1.salario > E2.salario;


