# INVERSIONES 
```
Algoritmo sin_titulo
	//Tres personas deciden invertir su dinero para fundar una empresa.
	//Cada una de ellas invierte una cantidad distinta.
	//Obtener el porcentaje que cada quien invierte con respecto a la cantidad total invertida.	
	Definir p1, p2, p3, in1, in2, in3, total Como Real
	p1 =0.0
	p2 =0.0
	p3 =0.0
	in1 =0.0
	in2 = 0.0
	in3 =0.0
	total = 0.0
	Escribir "Cantidad persona 1:";
	leer p1;
	Escribir "Cantidad persona2:";
	leer p2;
	Escribir "Cantidad persona 3:";
	leer p3;
	total<- p1+p2+p3
	in1<- (p1/total)*100
	in2<- (p2/total)*100
	in3<- (p3/total)*100
	Escribir " la persona 1 iniverte el ",in1,"% del total que es",total;
	Escribir " la persona 2 iniverte el ",in2," % del total que es ",total;
	Escribir " la persona 3 iniverte el ",in3," % del total que es ",total;
	
FinAlgoritmo
```
# Promedio alumno
```
Algoritmo 
   Definir exMat, exFi, exQui Como Real
   Definir ta1Mat, ta2Mat, ta3Mat Como Real
   Definir ta1Fi, ta2Fi Como Real
   Definir ta1Qui, ta2Qui, ta3Qui Como Real
   Definir proMat, proFi, proQui Como Real
   Definir proGen como Real

   Escribir "Ingrese la calificacion del examen de matematicas"
   Leer exMat
   Escribir "Ingrese la calificacion de la tarea 1 de matematicas"
   Leer ta1Mat
   Escribir "Ingrese la calificacion de la tarea 2 de matematicas"
   Leer ta2Mat
   Escribir "Ingrese la calificacion de la tarea 3 de matematicas"
   Leer ta3Mat

   Escribir "Ingrese la calificacion del examen de fisica"
   Leer  exFi
   Escribir "Ingresse la calificacion de la tarea 1 de fisica"
   Leer ta1Fi
   Escribir "Ingrese la calificacion de la tarea 2 de  fisica"
   Leer ta2Fi

   Escribir "Ingrese la calificacion del examen de quimica"
   Leer exQui
   Escribir "Ingrese la calificacion de la tarea 1 de quimica"
   Leer  ta1Qui
   Escribir "Ingrese la calificacion de la tarea 2 de quimica"
   Leer ta2Qui
   Escribir "Ingrese la calificacion de la tarea 3 de quimica"
   Leer ta3Qui

   proMat <- 0.9 * exMat + 0,1 * ((ta1Mat+ta2Mat+ta3Mat)/3)
   proFi <- 0.8 * exFi + 0.2 * ((ta1Fi+ta2Fi)/2)
   proQui <- 0.85  * exQui + 0.15 * ((ta1Qui+ta2Qui+ta3Qui)/3)
   proGen <- (proMat  + proFi + proQui) /  3
   
   Escribir "El promedio de matematicas es: ", proMat
   Escribir "El promedio de fisica es: ",proFi
   Escribir "El promedio de quimica es: ",proQui
   Escribir "El promedio general es: ",proGen
Fin
```
# Positivo y negativo
```
Inicio
    Definir n1 Como Real
	Escribir "Ingrese el numero real"
	Leer n1
	Si n1 > 0 o  n1 < 0 Entonces
	    Escribir "El numero ",n1," es positivo o negativo"
	SiNo
	   Escribir "No se imprime"
	Finsi
Fin
```
# Mayor o menor a 200
```
Inicio
    Definir n1 Como Real
	Escribir "Ingrese el numero real"
	Leer n1
	Si n1 < 200 o n1 > 200 Entonces
	    Escribir "El numero ",n1," es mayor o menor a 200"
	SiNo
	    Escrbir "No se imprime"
	Fin Si
Fin
```
# 50-100
```
Inicio 
    Definir n1 Como Real
	Escribir "Ingrese el numero real"
	Leer n1
	Si n1 >= 50 Y n1 <= 100 Entonces
	    Escribir "El numero ",n1," esta en el rango 50-100"
	SiNo
	    Escribir "El numero ",n1," no esta en el rango 50-100"
	FinSi
Fin
```


