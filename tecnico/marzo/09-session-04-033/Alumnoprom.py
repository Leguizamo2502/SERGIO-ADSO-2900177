# Ingreso de datos para Matemáticas
examen_matematicas = float(input("Ingrese la calificación del examen de Matemáticas: "))
tarea1_matematicas = float(input("Ingrese la calificación de la tarea 1 de Matemáticas: "))
tarea2_matematicas = float(input("Ingrese la calificación de la tarea 2 de Matemáticas: "))
tarea3_matematicas = float(input("Ingrese la calificación de la tarea 3 de Matemáticas: "))

# Ingreso de datos para Física
examen_fisica = float(input("Ingrese la calificación del examen de Física: "))
tarea1_fisica = float(input("Ingrese la calificación de la tarea 1 de Física: "))
tarea2_fisica = float(input("Ingrese la calificación de la tarea 2 de Física: "))

# Ingreso de datos para Química
examen_quimica = float(input("Ingrese la calificación del examen de Química: "))
tarea1_quimica = float(input("Ingrese la calificación de la tarea 1 de Química: "))
tarea2_quimica = float(input("Ingrese la calificación de la tarea 2 de Química: "))
tarea3_quimica = float(input("Ingrese la calificación de la tarea 3 de Química: "))

# Cálculo de promedios
promedio_matematicas = examen_matematicas * 0.9 + ((tarea1_matematicas + tarea2_matematicas + tarea3_matematicas) / 3) * 0.1
promedio_fisica = examen_fisica * 0.8 + ((tarea1_fisica + tarea2_fisica) / 2) * 0.2
promedio_quimica = examen_quimica * 0.85 + ((tarea1_quimica + tarea2_quimica + 3) / 3) * 0.15

# Cálculo del promedio general
promedio_general = (promedio_matematicas + promedio_fisica + promedio_quimica) / 3

# Mostrar resultados
print("Promedio de Matemáticas:", promedio_matematicas)
print("Promedio de Física:", promedio_fisica)
print("Promedio de Química:", promedio_quimica)
print("Promedio General:", promedio_general)