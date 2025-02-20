m = True
while m == True:
  try:
    x = float(input("Ingrese valor de x: "))
    if x % 2 == 0:
       if x > 0:
         print("Es positivo y par")
       else:
         print("Es negativo impar")
         m = False
    else:
       if x<0:
        print("Es impar y negativo")
       else:
         print("Es par y positivo")
       m = False
  except:
    print("Ingrese valor valido")
    x = 0