#Escribir una función que tome un carácter y 
# devuelva True si es una vocal, de lo contrario devuelve False.
letra= input("Digite la letra: ")
letra = letra.lower()
def vocales(letras):
    parvocales= ['a','e','i','o','u']
    if letras in parvocales:
        return True
    else:
        return False
    
print(vocales(letra))
