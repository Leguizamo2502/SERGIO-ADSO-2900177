/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function calTabla(pnumero){
    let numero = pnumero;
    let multiplicacion = 1;
    let resultado = "";
    for(contar=1;contar<=5;contar++){
        multiplicacion = numero * contar;
        if (multiplicacion%2 == 0){
            resultado+=multiplicacion+" es par"+"\n";
        }else{
            resultado+=multiplicacion+" es impar"+"\n";
        }
    }
    return resultado;
}
/**
 * constante 
 */
const calTabla2=function(pnumero){
    let numero = pnumero;
    let multiplicacion = 1;
    let resultado = "";
    for(contar=1;contar<=5;contar++){
        multiplicacion = numero * contar;
        if (multiplicacion%2 == 0){
            resultado+=multiplicacion+" es par"+"\n";
        }else{
            resultado+=multiplicacion+" es impar"+"\n";
        }
    }
    return resultado;
}