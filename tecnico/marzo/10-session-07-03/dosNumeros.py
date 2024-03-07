try:
    n1 = float(input("Ingrese el primer número: "))
    n2 = float(input("Ingrese el segundo número: ")) 

    if n2 < 0 and n1 % 2 != 0:
        if n1 > n2:
            print(n1,",",n2)
        else:
            print(n2,",",n1)
       
    else:
        if n1 > n1:
            print(n2,",",n1)
 
except:
    print("Valor No valido")