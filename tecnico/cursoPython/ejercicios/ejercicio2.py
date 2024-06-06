#Definir una función max_de_tres(), que tome tres números
#como argumentos y devuelva el mayor de ellos.
n1 = float(input("Ingrese primer numero: "))
n2 = float(input("Ingrese segundo numero: "))
n3 = float(input("Ingrese tercer numero: "))
mayor = 0.0

if n1 > n2 and n1 > n3:
    mayor = n1
elif n2 > n3 and n2 > n1:
    mayor = n2
else:
    mayor = n3
    
print("El numero mayor de es "+ str(mayor))