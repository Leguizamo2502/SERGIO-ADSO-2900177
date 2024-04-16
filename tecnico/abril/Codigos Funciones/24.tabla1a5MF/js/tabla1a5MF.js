/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function calTabla(phasta){
    let hasta = phasta;
    let contar1=0;
    let contar2;
    let par = 0;
    let impar = 0;
    let resultado="";
    while(contar1<hasta){
        contar2=0
        contar1=contar1+1;

        while(contar2<hasta){
            contar2=contar2+1;
            multiplicacion=contar1*contar2;
            resultado+= contar1+" x "+contar2+" = "+multiplicacion+"\n";
        
            if(multiplicacion%2 == 0){
                par=par+1;
                resultado=resultado+"Buzz"+"\n";
            }else{
                impar=impar+1
                resultado=resultado+"Bass"+"\n";
            }
        }
    }
    
    return resultado+"hay "+par+" pares"+"\n"+"hay "+impar+" impares";
    

}



/**
 * constante 
 */
const calTabla2=function(phasta){
    let hasta = phasta;
    let contar1=0;
    let contar2;
    let par = 0;
    let impar = 0;
    let resultado="";
    while(contar1<hasta){
        contar2=0
        contar1=contar1+1;

        while(contar2<hasta){
            contar2=contar2+1;
            multiplicacion=contar1*contar2;
            resultado+= contar1+" x "+contar2+" = "+multiplicacion+"\n";
        
            if(multiplicacion%2 == 0){
                par=par+1;
                resultado=resultado+"Buzz"+"\n";
            }else{
                impar=impar+1
                resultado=resultado+"Bass"+"\n";
            }
        }
    }
    
    return resultado+"hay "+par+" pares"+"\n"+"hay "+impar+" impares";
}
