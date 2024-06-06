#Escribir una función sum() y una función multip() que sumen y multipliquen respectivamente
# todos los números de una lista. 
# Por ejemplo: sum([1,2,3,4]) debería devolver 10 y multip([1,2,3,4]) debería devolver 24.

def sum(lista):
    suma= 0
    for i in lista:
        suma += i
    return suma

def multip(lista):
    multiplicacion= 1
    for i in lista:
        multiplicacion *= i
    return multiplicacion

lista=[1,2,3,4]
print("La suma de la lista es: ",sum(lista))  
print("El producto de la lista es: ",multip(lista))  
    