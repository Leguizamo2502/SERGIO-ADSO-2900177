inversion_persona1 = float(input("Ingrese la cantidad invertida por la primera persona: "))
inversion_persona2 = float(input("Ingrese la cantidad invertida por la segunda persona: "))
inversion_persona3 = float(input("Ingrese la cantidad invertida por la tercera persona: "))


cantidad_total_invertida = inversion_persona1 + inversion_persona2 + inversion_persona3


porcentaje_persona1 = (inversion_persona1 / cantidad_total_invertida) * 100
porcentaje_persona2 = (inversion_persona2 / cantidad_total_invertida) * 100
porcentaje_persona3 = (inversion_persona3 / cantidad_total_invertida) * 100


print("Porcentaje de inversión de la primera persona:"+str(porcentaje_persona1)+ "%")
print("Porcentaje de inversión de la segunda persona:"+str(porcentaje_persona2)+ "%")
print("Porcentaje de inversión de la tercera persona:"+str(porcentaje_persona3)+ "%")