x = 0.0
while x == True:
 try:
   x = float(input("Ingrese valor de x: "))
   if x % 2 == 0:
      print("el numero es par")
   else:
      print("El numero se impar")
 except:
   print("Ingrese valor valido")
x = 0