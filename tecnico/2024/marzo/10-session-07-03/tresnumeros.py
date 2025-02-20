try:
    # Capturar tres números
    numero1 = int(input("Ingrese el primer número: "))
    numero2 = int(input("Ingrese el segundo número: "))
    numero3 = int(input("Ingrese el tercer número: "))

    # Verificar si hay números iguales
    if numero1 == numero2 or numero1 == numero3 or numero2 == numero3:
        print("Hay dos o más números iguales, no es posible determinar el mayor, el menor y el intermedio.")
    else:
        # Determinar el mayor
        mayor = numero1
        if numero2 > mayor:
            mayor = numero2
            if numero3 > mayor:
                mayor = numero3

        # Determinar el menor
        menor = numero1
        if numero2 < menor:
            menor = numero2
            if numero3 < menor:
                menor = numero3

        # Determinar el intermedio
        intermedio = (numero1 + numero2 + numero3) - mayor - menor

        # Imprimir los resultados
        print("El mayor número es:", mayor)
        print("El menor número es:", menor)
        print("El número intermedio es:", intermedio)
except:
    print("Valor no válido")
