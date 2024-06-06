# def main():
    # palabra = input("Ingrese una palabra: ")
    # resultado = twttr (palabra)
    # print ("La palabra abrevida es: " + "join(resultado)")
# twttr(pal):
    # pal.lower()
    # sal=[]
        # for z in range(len(pal):
        # pal[z] not in ["a","e","i","o","u" "]:
        # sal.append(pal[z])
    # return sal
# if __name__ =="__main__":
# main();



def main():
    palabra = input("Ingrese una palabra: ")
    resultado = twttr(palabra)
    print ("La palabra abrevida es: "+"" .join(resultado)) #Corregir comillas y agragar un . al join
    
def twttr(pal): #alta agregar def
    pal=pal.lower() #falataba poner pal=
    sal=[]
    for z in range(len(pal)):
        if pal[z] not in ["a","e","i","o","u","A","E","I","O","U"]:#Falta agrgar el if
            sal.append(pal[z])      
    return sal
    
if __name__ =="__main__":#No repeta la sintaxis
    main()